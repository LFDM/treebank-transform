module Treebank
  require "treebank/nokogiri_helper"

  class EllipticWord
    include NokogiriHelper

    def initialize(word)
      @word = word
    end
  end
end
