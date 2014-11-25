require "treebank/transform/version"
require "nokogiri"

module Treebank
  class Transform
    def initialize(doc)
      @doc = doc
    end

    def transform
      @doc
    end
  end
end
