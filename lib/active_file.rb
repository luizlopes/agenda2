require 'repository_factory'

module ActiveFile

    def self.included(base)
        base.extend ClassMethods

        base.class_eval do
            attr_accessor :id

            def initialize(parameters = {})
                parameters.each { |key, value| instance_variable_set "@#{key}", value }

                fields = self.class.fields
                required_fields = fields.select { |f| f.required }.map { |f| f.name }

                empty_required_fields = required_fields.select { |field_name| instance_variable_get("@#{field_name}") == nil }

                unless empty_required_fields.empty?
                   raise StandartError.new "Required fields are empty: #{empty_required_fields.join(', ')}"
                end
            end
        end
    end

    module ClassMethods
        attr_accessor :fields

        def field(name, required: false)
            # puts "the field '#{name}' is #{required ? '' : 'not'} required"
            @fields ||= []
            @fields << Field.new(name, required)

            self.class_eval do
                if required
                    attr_reader name
                else
                    attr_accessor name
                end
            end
        end
    end

    class Field
        attr_reader :name, :required
        def initialize(name, required) 
            @name, @required = name, required
        end
    end

    def save
        folder_name = self.class.to_s.downcase
        repository = RepositoryFactory.createRepository folder_name
        repository.save self
    end

end