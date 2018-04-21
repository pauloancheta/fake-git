# git update-index --add --cache-info 100644 3b18e512dba79e4c8300dd08aeb37f8e728b8dad hello.txt

require_relative 'priv/object'
require_relative 'fetch_object'

class Fake::Git::UpdateIndex
  OBJ_PATH = ".fakegit/objects"
  def call(*args)
    get_obj_type $OPTIONS[:update_index_cache_info]
    index, file_name = args.first.split(" ")

    obj = Fake::Git::FetchObject.new.call(index)
    update_filename(obj, file_name)
  end

  private
  def get_obj_type(cache_info)
    case cache_info.to_i
    when 100644
      "blob"
    else
      nil
    end
  end

  def update_filename(obj, file_name)
    path = "#{OBJ_PATH}/#{obj.index[0..1]}/#{obj.index[2..-1]}"
    File.open(path, 'w') do |file|
      file.write("index=#{obj.index},")
      file.write("type=#{obj.type},")
      file.write("file_name=#{file_name},")
      file.write("content=#{obj.content},")
    end
  end
end
