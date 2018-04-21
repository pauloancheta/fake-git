require_relative 'priv/object'
require_relative 'fetch_object'

class Fake::Git::CatFile
  def call(*args)
    obj = Fake::Git::FetchObject.new.call(args.first)

    return file_size(obj) if $OPTIONS[:cat_file_size]
    return file_print(obj) if $OPTIONS[:cat_file_print]
    return file_type(obj) if $OPTIONS[:cat_file_type]
  end

  private
  def file_size(obj)
    result = `du -h #{obj.path}`
    puts result.split.first
  end

  def file_print(obj)
    puts obj.content
  end

  def file_type(obj)
    puts obj.type
  end

end
