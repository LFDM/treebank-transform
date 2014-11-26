module Treebank
  class Sentence
    require "treebank/alphabet"

    attr_reader :elliptic_nodes

    def initialize(sentence)
      @sentence = sentence
      @last_id  = next_id
      @elliptic_nodes = {}
    end

    def next_id
      @last_id ? update_last_id : find_last_id
    end

    def last_id
      return @last_id if @last_id
      last_word = @sentence.xpath('//word').last
      @last_id = last_word.attributes['id'].value.to_i
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

      @sentence.add_child(indent)
      @sentence.add_child(new_node)
      @sentence.add_child(new_line)
      new_node
    end

    def suffix
      if @suffix
        @suffix = Alphabet.next_letter(@suffix)
      else
        @suffix = 'e'
      end
    end

    def get_insertion_id
      "#{last_id.to_s.rjust(4, '0')}#{suffix}"
    end

    private

    def new_word(attrs)
      word = Nokogiri::XML::Node.new('word', @sentence)
      attrs.each { |k, v| word[k] = v }
      word
    end

    def indent
      Nokogiri::XML::Text.new("  ", @sentence)
    end

    def new_line
      Nokogiri::XML::Text.new("\n  ", @sentence)
    end

    def update_last_id
      @next_id += 1
    end

    def find_last_id
      @next_id = last_id
    end
  end
end

