require 'digest'

class Fake::Git::WriteTree
  def call(*args)
    obj = Fake::Git::Priv::Object.new(
      type: "tree",
      content: tree,
      index: Digest::SHA1.hexdigest(tree)
    )
    obj.index
  end

  private
  def tree
    `find .fakegit -type f`
  end
end
