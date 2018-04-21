module Fake::Git::Priv
  class Object
    ALLOWED_TYPES = ["blob", "tree", "commit", "tag", nil]
    attr_reader :type, :size, :content, :index

    def initialize(type:, size:, content:, index:)
      @type = type
      @size = size
      @content = content
      @index = index

      raise TypeError.new("#{type} must be one of #{ALLOWED_TYPES}") if !ALLOWED_TYPES.include?(@type)
    end

    class TypeError < StandardError; end
  end
end
