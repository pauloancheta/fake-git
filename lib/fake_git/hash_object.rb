require 'digest'
require_relative 'priv/object'

class FakeGit::HashObject
  def call(*args)
    obj = FakeGit::Priv::Object.new(
      type: "blob",
      content: args.first,
      index: Digest::SHA1.hexdigest(args.first)
    )

    obj.write!
    obj
  end
end
