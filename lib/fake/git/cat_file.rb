require_relative 'priv/object'

class Fake::Git::CatFile
  OBJ_PATH = ".fakegit/objects"
  def call(*args)
    path = file_path(args.first)
    obj = file_content(path)

    return file_size(path) if $OPTIONS[:cat_file_size]
    return file_print(obj) if $OPTIONS[:cat_file_print]
    return file_type(obj) if $OPTIONS[:cat_file_type]
  end

  private
  def file_size(path)
    result = `du -h #{file}`
    puts result.split.first
  end

  def file_print(obj)
    puts obj.content
  end

  def file_type(obj)
    puts obj.type
  end

  def file_content(path)
    content = File.read(path)
    attributes = Hash.new

    content.split("\n").each do |c|
      key, val = c.split("=")
      attributes[key.to_sym] = val
    end

    Fake::Git::Priv::Object.new(
      type: attributes.fetch(:type),
      content: attributes.fetch(:content),
      index: attributes.fetch(:index),
    )
  end

  def file_path(arg)
    "#{OBJ_PATH}/#{arg[0..1]}/#{arg[2..-1]}"
  end
end
