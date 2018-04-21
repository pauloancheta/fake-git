class Fake::Git::HashObject
  def call(*args)
    hex = args
    write(hex)
    hex
  end

  private
  def write(hex)
    write_top_index(hex)
    write_new_index(hex)
  end

  def write_top_index(hex)
    `mkdir .fakegit/objects/#{hex[0..1]}`
  end

  def write_new_index(hex)
    `touch .fakegit/objects/#{hex[2..-1]}`
  end
end
