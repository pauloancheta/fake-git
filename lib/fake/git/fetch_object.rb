require_relative 'priv/object'

class Fake::Git::FetchObject
  OBJ_PATH = ".fakegit/objects"

  def call(*args)
    path = file_path(args.first)
    build_obj(path)
  end

  private
  def build_obj(path)
    content = File.read(path)
    attributes = Hash.new

    content.split(",").each do |c|
      key, val = c.split("=")
      attributes[key.to_sym] = val
    end

    Fake::Git::Priv::Object.new(
      type: attributes.fetch(:type),
      content: attributes.fetch(:content),
      index: attributes.fetch(:index),
      file_name: attributes[:file_name],
      path: path
    )
  end

  def file_path(arg)
    "#{OBJ_PATH}/#{arg[0..1]}/#{arg[2..-1]}"
  end
end
