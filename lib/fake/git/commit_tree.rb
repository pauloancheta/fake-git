require_relative 'fetch_object'

class Fake::Git::CommitTree
  def call(*args)
    # make sure that the object exists
    obj = Fake::Git::FetchObject.new.call(args.first)

    raise TypeError.new("#{args.first} is not a tree") if obj.type != "tree"

    path = ".fakegit/refs/heads/master"
    File.open(path, 'w') do |file|
      file.write(obj.index)
    end
  end

  class TypeError < StandardError; end
end
