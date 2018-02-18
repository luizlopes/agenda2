require 'minitest/autorun'
require 'file_repository'
require 'contact'

class FileRepositoryTest < MiniTest::Test

    ROOT_PATH = "db_test"
    FOLDER_PATH = "repository_tests"
    REPO_PATH = "#{ROOT_PATH}/#{FOLDER_PATH}"

    def setup
        FileUtils.mkdir_p REPO_PATH
        @file_repository = FileRepository.new ROOT_PATH, FOLDER_PATH
    end

    def teardown
        FileUtils.rm Dir.glob("#{REPO_PATH}/*.yml")
        FileUtils.rmdir REPO_PATH
        FileUtils.rmdir ROOT_PATH
    end

    def test_repo_path
        assert_equal(REPO_PATH, @file_repository.repo_path)
    end

    def test_save_object_without_id_attribute
        assert_raises StandardError do
            @file_repository.save "some object"
        end
    end

    def test_save_object_with_nil_id
        assert_raises StandardError do
            object = Contact.new name: "some object with nil id"
            @file_repository.save object
        end
    end

    def test_save
        object = Contact.new name: "some object with id"
        object.id = 1000
        file_path = @file_repository.save object
        assert_equal("#{REPO_PATH}/#{object.id}.yml", file_path)
        assert(File.exists? file_path)
    end
end