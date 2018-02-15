require 'active_file'

class Contact
    include ActiveFile

    field :name, required: true
    field :phone
    field :email
    
    #fields name required, phone, email
end