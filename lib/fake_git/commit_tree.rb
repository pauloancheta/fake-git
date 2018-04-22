require_relative 'fetch_object'
require_relative 'update_ref'
require 'digest'

class FakeGit::CommitTree
  def call(*args)
    # make sure that the object exists
    obj = FakeGit::FetchObject.new.call(args.first)

    raise TypeError.new("#{args.first} is not a tree") if obj.type != "tree"

    commit = FakeGit::Priv::Object.new(
      type: "commit",
      message: $OPTIONS[:commit_message],
      tree: obj.index,
      index: Digest::SHA1.hexdigest(obj.index), # just hash the index of the tree
    )

    commit.write!
    FakeGit::UpdateRef.new.call(commit.index)
  end

  class TypeError < StandardError; end
end
