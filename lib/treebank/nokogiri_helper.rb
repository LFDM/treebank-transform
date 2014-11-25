module Treebank
  module NokogiriHelper
    def get_attr(node, attr)
      attribute = node.attributes[attr]
      attribute.value if attribute
    end

    def set_attr(node, attr, val)
      node.attributes[attr] = val
    end
  end
end
