require "treebank/transform/version"
require "nokogiri"

module Treebank
  class Transform
    def initialize(doc)
      @doc = Nokogiri::XML(doc);
    end

    def transform
      @doc.to_xml
    end
  end
end
