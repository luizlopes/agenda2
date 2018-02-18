require 'file_repository'

class RepositoryFactory

    YAML_EXTENSION = "yml"

    def self.createRepository(root_name="db", folder_name)
        FileRepository.new root: root_name, folder_name: folder_name, file_extension: YAML_EXTENSION
    end
end