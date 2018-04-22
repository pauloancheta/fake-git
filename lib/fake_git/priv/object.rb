module FakeGit::Priv
  class Object
    ALLOWED_TYPES = ["blob", "tree", "commit", "tag", nil]
    OBJ_PATH = ".fakegit/objects"

    attr_accessor :type, :content, :index, :path, :file_name, :message, :tree, :date

    def initialize(type: nil,
                   content: nil,
                   index: nil,
                   path: nil,
                   file_name: nil,
                   message: nil,
                   tree: nil,
                   date: nil)
      @type = type
      @content = content
      @index = index
      @path = path
      @file_name = file_name
      @message = message
      @tree = tree
      @date = Time.now

      raise TypeError.new("#{type} must be one of #{ALLOWED_TYPES}") if !ALLOWED_TYPES.include?(@type)
    end

    def write!
      write_top_index
      write_new_index
      puts index
    end

    private
    def write_top_index
      `mkdir -p #{OBJ_PATH}/#{index[0..1]}`
    end

    def write_new_index
      path = "#{OBJ_PATH}/#{index[0..1]}/#{index[2..-1]}"

      File.open(path, 'w') do |file|
        file.write("type=#{type},")
        file.write("index=#{index},")
        file.write("file_name=#{file_name},")
        file.write("path=#{path},")
        file.write("content=#{content},")
        file.write("message=#{message},")
        file.write("tree=#{tree},")
      end
    end

    class TypeError < StandardError; end
  end
end
