require 'digest'
require_relative 'priv/object'

class Fake::Git::HashObject

  def call(*args)
    obj = Fake::Git::Priv::Object.new(
      type: "blob",
      content: args.first,
      index: Digest::SHA1.hexdigest(args.first)
    )

    obj.write!
    obj
  end
end
