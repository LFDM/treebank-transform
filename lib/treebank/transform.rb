require "treebank/transform/version"
require "nokogiri"

module Treebank
  require "treebank/nokogiri_helper"
  require "treebank/sentence"
  require "treebank/elliptic_word"

  class Transform
    include NokogiriHelper

    def initialize(doc)
      @doc = Nokogiri::XML(doc);
    end

    def transform
      transform_elliptic_nodes
      @doc.to_xml
    end

    private

    def transform_elliptic_nodes
      @doc.xpath('//treebank/sentence').each do |sentence_node|
        sentence = Sentence.new(sentence_node)
        sentence_node.xpath('//word').each do |word_node|
          if has_elliptic_head(get_attr(word_node, 'relation'))
            word = EllipticWord.new(word_node)
            extract_elliptic_head(sentence, word)
          end
        end
      end
    end

    def has_elliptic_head(label)
      label.match(/ExD\d+/)
    end

    def extract_elliptic_head(sentence, word)
      # TODO
    end
  end
end
