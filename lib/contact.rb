require 'active_file'

class Contact
    include ActiveFile

    field :name, required: true
    field :phone
    field :email

    def eql?(other)
        self.name == other.name
    end

    def ==(other)
        self.eql? other
    end
    
    #fields name required, phone, email
end