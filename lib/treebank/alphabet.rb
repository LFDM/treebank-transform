module Treebank
  module Alphabet
    ALPHABET = ("a".."z").to_a

    def self.next_letter(letter)
      i = ALPHABET.find_index(letter)
      ALPHABET[i + 1]
      # do more here when we run out of letters
    end
  end
end
