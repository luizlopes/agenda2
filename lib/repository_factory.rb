require 'file_repository'

class RepositoryFactory

    def self.createRepository(root_name, folder_name)
        FileRepository.new root_name, folder_name
    end
end