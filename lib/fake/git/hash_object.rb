require 'digest'
require_relative 'priv/object'

class Fake::Git::HashObject
  OBJ_PATH = ".fakegit/objects"

  def call(*args)
    obj = Fake::Git::Priv::Object.new(
      type: "blob",
      content: args.first,
      index: Digest::SHA1.hexdigest(args.first)
    )

    write(obj)
    puts obj.index
    obj
  end

  private
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
      file.write("index=#{obj.index}\n")
      file.write("type=#{obj.type}\n")
      file.write("content=#{obj.content}")
    end
  end
end
