require 'YAML'

class FileRepository

    def initialize(root:, folder_name:, file_extension:)
        @root, @folder_name, @file_extension = root, folder_name, file_extension
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

        file_name = build_file_name(object.id)
        File.open file_name, "w" do |file|             
            file.puts serialize(object)
        end

        file_name
    end

    def find(id)
        file_name = build_file_name(id)
        file_data = File.open file_name, "r"
        deserialize file_data
    end

    def next_id
        all_files_path = build_file_name("*")
        last_file = Dir.glob( all_files_path ).sort.last
        file_data = File.open last_file, "r"
        object = deserialize file_data
        object.id + 1
    end

    private 

    def build_file_name(name)
        "#{repo_path}/#{name}.#{@file_extension}"
    end

    def serialize(object)
        YAML.dump object
    end

    def deserialize(file_data)
        YAML.load file_data
    end
end