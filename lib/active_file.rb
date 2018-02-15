module ActiveFile

    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        attr_accessor :fields

        def field(name, required: false)
            puts "the field '#{name}' is #{required ? '' : 'not'} required"
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

end