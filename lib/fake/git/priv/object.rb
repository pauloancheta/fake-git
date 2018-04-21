module Fake::Git::Priv
  class Object
    ALLOWED_TYPES = ["blob", "tree", "commit", "tag", nil]
    attr_reader :type, :content, :index, :path

    def initialize(type: nil, content: nil, index: nil, path: nil)
      @type = type
      @content = content
      @index = index
      @path = path

      raise TypeError.new("#{type} must be one of #{ALLOWED_TYPES}") if !ALLOWED_TYPES.include?(@type)
    end

    class TypeError < StandardError; end
  end
end
