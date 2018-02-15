require 'minitest/autorun'
require 'contact'

class ContactTest < MiniTest::Test

    def test_new_contact
        contact = Contact.new
        assert(contact, "contact is nil")
        assert_respond_to(contact, :name)
        assert_respond_to(contact, :phone)
        assert_respond_to(contact, :email)
    end


end