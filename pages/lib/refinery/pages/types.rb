module Refinery
  module Pages
    class Types < Array

      def register(name, &block)
        self.class.register(name, &block)
      end

      def unregister(name)
        self.class.unregister(name)
      end

      def find_by_name(name)
        detect { |type| type.named? name }
      end

      class << self
        def register(name, &block)
          raise "A page already with with the name: #{name}" if find_by_name(name)

          type = Type.new
          type.name = name

          yield type if block_given?

          raise "A page type must have a name: #{self.inspect}" if type.name.blank?

          registered << type
        end

        def unregister(name)
          registered.delete_if {|type| type.named? name }
        end

        def registered
          @registered_types ||= new
        end
      end

    end
  end
end
