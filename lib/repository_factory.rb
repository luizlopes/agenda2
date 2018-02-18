require 'file_repository'

class RepositoryFactory

    def self.createRepository(folder_name)
        FileRepository.new folder_name
    end
end