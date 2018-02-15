module ActiveFile

    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def field(name, required: false)
            puts "the field '#{name}' is #{required ? '' : 'not'} required"

            self.class_eval do
                if required
                    attr_reader name
                else
                    attr_accessor name
                end
            end
        end
    end

end