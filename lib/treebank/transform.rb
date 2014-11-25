require "treebank/transform/version"

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
