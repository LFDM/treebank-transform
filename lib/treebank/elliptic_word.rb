module Treebank
  class EllipticWord
    def initialize(word, sentence)
      @word = word
      @sentence = sentence
    end

    def regexp
      /(\w+?)_ExD(\d+)_(.+)/
    end

    def parse_elliptic_head
      match = @word['relation'].match(regexp)
      return unless match

      label, elliptic_string, elliptic_label = match.captures
      elliptic_head = @word['head']



      if cached_head = @sentence.elliptic_nodes[elliptic_string]
        head = cached_head
      else
        new_node = @sentence.add_ellipsis({
          artificial: 'elliptic',
          head: elliptic_head,
          relation: elliptic_label
        }, elliptic_string)

        head = new_node['id']
        new_word = EllipticWord.new(new_node, @sentence)
        new_word.parse_elliptic_head
      end

      @word['relation'] = label
      @word['head'] = head
    end
  end
end
