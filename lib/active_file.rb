module ActiveFile

    def self.included(base)
        base.extend ClassMethods
    end


    module ClassMethods
        def field(name, required: false)
            puts "the field '#{name}' is #{required ? '' : 'not'} required"
        end
    end

end