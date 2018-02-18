require 'YAML'

class FileRepository

    def initialize(root, folder_name)
        @root, @folder_name = root, folder_name
    end

    def repo_path
        "#{@root}/#{@folder_name}"
    end

    def save(object) 
        unless object.respond_to? :id
            raise StandardError.new "Object class invalid"
        end

        unless object.id
            raise StandardError.new "Object id is null."
        end

        file_name = "#{repo_path}/#{object.id}.yml"
        File.open file_name, "w" do |file| 
            yaml_data = YAML.dump object
            file.puts yaml_data
        end

        file_name
    end

end