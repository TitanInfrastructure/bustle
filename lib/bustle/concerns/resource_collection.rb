module Bustle::Concern
  module ResourceCollection
    extend ActiveSupport::Concern

    module ClassMethods
      def add(resource)
        add!(resource)
      rescue
        get(resource)
      end

      def add!(resource)
        self::RESOURCE_NAME.constantize.to_adapter.create!(
          :resource_class => resource.class.name,
          :resource_id    => resource.id
        )
      end

      def get(resource)
        self::RESOURCE_NAME.constantize.to_adapter.find_first(
          :resource_class => resource.class.name,
          :resource_id    => resource.id
        )
      end

      def remove(resource)
        get(resource).destroy
      end
    end
  end
end
