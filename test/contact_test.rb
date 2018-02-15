require 'minitest/autorun'
require 'contact'

class ContactTest < MiniTest::Test

    def test_new_contact
        contact = Contact.new
        assert(contact, "contact is nil")
        assert_respond_to(contact, :name)
        refute_respond_to(contact, :name=)
        assert_respond_to(contact, :phone)
        assert_respond_to(contact, :phone=)
        assert_respond_to(contact, :email)
        assert_respond_to(contact, :email=)
    end

    def test_id_field_accessor
        contact = Contact.new
        assert_respond_to(contact, :id)
        assert_respond_to(contact, :id=)
    end

end