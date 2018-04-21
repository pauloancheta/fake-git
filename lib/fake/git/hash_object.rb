require 'digest'
class Fake::Git::HashObject
  OBJ_PATH = ".fakegit/objects"

  def call(*args)
    hex = Digest::SHA1.hexdigest args.first
    write(hex)
    hex
  end

  private
  def write(hex)
    write_top_index(hex)
    write_new_index(hex)
  end

  def write_top_index(hex)
    `mkdir #{OBJ_PATH}/#{hex[0..1]}`
  end

  def write_new_index(hex)
    `echo #{args.first} > #{OBJ_PATH}/#{hex[0..1]}/#{hex[2..-1]}`
  end
end
