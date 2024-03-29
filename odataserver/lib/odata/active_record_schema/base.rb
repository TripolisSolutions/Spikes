module OData
  module ActiveRecordSchema
    class Base < OData::AbstractSchema::Base
      def find_entity_type(options = {})
        if options[:active_record]
          self.entity_types.find { |et| et.name == EntityType.name_for(options[:active_record]) }
        else
          super(options)
        end
      end
      
      def initialize(*args)
        super(*args)
        p "INITIALIZING AR MODELS FOR ODATA"
        Dir.glob(Rails.root + '../../app/models/*.rb').each { |file| require file }   #TODO: FIXME needs to be dynamic
        ActiveRecord::Base.descendants.collect { |active_record|
          p active_record
          self.EntityType(active_record, :reflect_on_associations => false)
        }.collect { |entity_type| 
          entity_type.active_record.reflect_on_all_associations.each do |reflection|
            entity_type.NavigationProperty(reflection)
          end
        }
        #TODO this is where initialization and model scans occur
        #p "INITIALIZING MONGOID MODELS FOR ODATA"
        #Mongoid.models.collect { |mongoid|
        #  p mongoid
        #  self.MongoidEntityType(mongoid, :reflect_on_associations => false)
        #}
        #.collect { |entity_type|
        #  entity_type.active_record.reflect_on_all_associations.each do |reflection|
        #    entity_type.NavigationProperty(reflection)
        #  end
        #}
      end
      
      def Association(*args)
        Association.new(self, *args)
      end

      def EntityType(*args)
        entity_type = EntityType.new(self, *args)
        self.entity_types << entity_type
        entity_type
      end

      #def MongoidEntityType(*args)
      #  entity_type = OData::Mongoid::EntityType.new(self, *args)
      #  self.entity_types << entity_type
      #  entity_type
      #end
    end
  end
end
