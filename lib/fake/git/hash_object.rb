require 'digest'
class Fake::Git::HashObject
  OBJ_PATH = ".fakegit/objects"

  def call(*args)
    hex = Digest::SHA1.hexdigest args.first
    write(hex, args)
    puts hex
  end

  private
  def write(hex, blob)
    write_top_index(hex)
    write_new_index(hex, blob)
  end

  def write_top_index(hex)
    `mkdir -p #{OBJ_PATH}/#{hex[0..1]}`
  end

  def write_new_index(hex, blob)
    path = "#{OBJ_PATH}/#{hex[0..1]}/#{hex[2..-1]}"
    File.open(path, 'w') { |file| file.write(blob.join) }
  end
end
