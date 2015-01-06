module Treebank
  class Sentence
    require "treebank/alphabet"
    require 'treebank/cts_map'

    attr_reader :elliptic_nodes

    def initialize(sentence_node)
      @node = sentence_node
      @last_id = @next_id = last_id
      @elliptic_nodes = {}
    end

    def add_ellipsis(attrs, string)
      id = next_id
      all_attrs = {
        id: id,
        insertion_id: get_insertion_id,
        form: "[#{string}]"
      }.merge(attrs)

      new_node = new_word(all_attrs)
      @elliptic_nodes[string] = id

      @node.add_child(indent)
      @node.add_child(new_node)
      @node.add_child(new_line)
      new_node
    end

    def ctsify
      doc_id  = @node['document_id']
      cts_urn = CtsMap.doc_id_to_cts_urn(doc_id)
      return unless cts_urn

      @node['document_id'] = cts_urn
      subdoc = @node['subdoc']
      if (subdoc.match(/urn:cts:/)) 
         cites = subdoc.gsub(/urn:cts:.*?Lit:[^\s]*?:/,'').split(/\s+/)
         if (cites.length > 1) 
           @node['subdoc'] = "#{cites[0]}-#{cites[cites.length-1]}"
         else
           @node['subdoc'] = cites[0]
         end
      else
        @node['subdoc'] = subdoc.gsub(/\D/, ' ').split.join('.')
      end 
    end

    private

    def next_id
      update_last_id
    end

    def last_id
      return @last_id if @last_id
      last_word = @node.xpath('word').last
      @last_id = last_word['id'].to_i
    end

    def update_last_id
      @next_id += 1
    end

    def suffix
      @suffix = @suffix ? Alphabet.next_letter(@suffix) : 'e'
    end

    def get_insertion_id
      "#{last_id.to_s.rjust(4, '0')}#{suffix}"
    end

    def new_word(attrs)
      word = Nokogiri::XML::Node.new('word', @node)
      attrs.each { |k, v| word[k] = v }
      word
    end

    def indent
      Nokogiri::XML::Text.new("  ", @node)
    end

    def new_line
      Nokogiri::XML::Text.new("\n  ", @node)
    end
  end
end

