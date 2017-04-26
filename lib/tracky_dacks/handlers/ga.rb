
module TrackyDacks
  module Handlers
    class GA
      attr_reader :tracker

      def initialize(tracker)
        @tracker = tracker
      end

      def call(params = {})
        raise NotImplementedError
      end
    end
  end
end
