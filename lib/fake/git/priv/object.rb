module Fake::Git::Priv
  class Object
    ALLOWED_TYPES = ["blob", "tree", "commit", "tag", nil]
    attr_reader :type, :content, :index, :path, :file_name

    def initialize(type: nil, content: nil, index: nil, path: nil, file_name: nil)
      @type = type
      @content = content
      @index = index
      @path = path
      @file_name = file_name

      raise TypeError.new("#{type} must be one of #{ALLOWED_TYPES}") if !ALLOWED_TYPES.include?(@type)
    end

    class TypeError < StandardError; end
  end
end
