require 'minitest/autorun'
require 'contact'

class ContactTest < MiniTest::Test

    def setup
        @contact = Contact.new
    end

    def test_name_field_reader
        assert_respond_to(@contact, :name)
        refute_respond_to(@contact, :name=)
    end

    def test_phone_field_accessor
        assert_respond_to(@contact, :phone)
        assert_respond_to(@contact, :phone=)
    end

    def test_email_field_accessor
        assert_respond_to(@contact, :email)
        assert_respond_to(@contact, :email=)
    end

    def test_id_field_accessor
        assert_respond_to(@contact, :id)
        assert_respond_to(@contact, :id=)
    end

    def test_initialize_with_required_fields
        contact = Contact.new name: "Gabs"
        assert_equal(contact.name, "Gabs")
    end

end