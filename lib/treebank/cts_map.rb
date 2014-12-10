require 'json'

module Treebank
  class CtsMap
    class << self
      def map
        @map ||= JSON.parse(File.read(map_path))
      end

      def doc_id_to_cts_urn(id)
        map[id]
      end

      private

      def map_path
        File.join(RESOURCES, 'cts_map.json')
      end

    end
  end
end
