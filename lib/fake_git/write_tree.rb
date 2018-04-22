require 'digest'

class FakeGit::WriteTree
  OBJ_PATH = ".fakegit/objects"
  def call(*args)
    obj = FakeGit::Priv::Object.new(
      type: "tree",
      content: tree,
      index: Digest::SHA1.hexdigest(tree)
    )
    puts obj.index
    write(obj)
    obj.index
  end

  private
  def tree
    `find .fakegit -type f`
  end

  def write(obj)
    write_top_index(obj)
    write_new_index(obj)
  end

  def write_top_index(obj)
    `mkdir -p #{OBJ_PATH}/#{obj.index[0..1]}`
  end

  def write_new_index(obj)
    path = "#{OBJ_PATH}/#{obj.index[0..1]}/#{obj.index[2..-1]}"
    File.open(path, 'w') do |file|
      file.write("index=#{obj.index},")
      file.write("type=#{obj.type},")
      file.write("content=#{obj.content}")
    end
  end
end
