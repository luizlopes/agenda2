require 'minitest/autorun'
require 'repository_factory'

class RepositoryFactoryTest < MiniTest::Test

    def test_create_repository_with_folder_name
        repository = RepositoryFactory.createRepository "folder"
        assert(repository)
    end

    def test_create_repository_with_no_folder_name
        assert_raises StandardError do
            repository = RepositoryFactory.createRepository
        end
    end

end