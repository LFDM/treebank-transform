require 'treebank/transform'
require 'thor'

module Treebank
  class Transform
    class CLI < Thor

      desc 'do FILE', 'transforms 1.5 Treebanks to the interim Arethusa format'
      def do(file)
        transformer = Transform.new(File.read(file))
        puts transformer.transform
      end
    end
  end
end
