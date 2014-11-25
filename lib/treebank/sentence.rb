module Treebank
  require "treebank/nokogiri_helper"

  class Sentence
    include NokogiriHelper

    def initialize(sentence)
      @sentence = sentence
      @next_id  = find_next_id
    end

    def suffix
      "e"
    end

    private

    def update_next_id
      @next_id += 1
    end

    def find_next_id
      last_word = @sentence.xpath('//word').last
      last_word.attributes['id'].value.to_i + 1
    end
  end
end

