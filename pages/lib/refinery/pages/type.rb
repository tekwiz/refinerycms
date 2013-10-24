module Refinery
  module Pages
    class Type

      attr_accessor :name, :parts, :template

      def named?(name_)
        name.to_s.downcase == name_.to_s.downcase
      end

      def parts
        @parts ||= []
      end

      def template
        @template ||= "refinery/pages/#{name}"
      end

      def titleize
        @name.to_s.titleize
      end

    end
  end
end
