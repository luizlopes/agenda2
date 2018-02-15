require 'minitest/autorun'
require 'contact'

class ContactTest < MiniTest::Test

    def test_new_contact
        contact = Contact.new
        assert(contact, "contact is nil")
    end


end