class Fake::Git::CatFile
  OBJ_PATH = ".fakegit/objects"
  def call(*args)
    file = file_path(args.first)
    return file_size(file) if $OPTIONS[:cat_file_size]
    return file_print(file) if $OPTIONS[:cat_file_print]
    return file_type(file) if $OPTIONS[:cat_file_type]
  end

  private
  def file_size(file)
    result = `du -h #{file}`
    puts result.split.first
  end

  def file_print(file)
    content = File.read(file)
    puts content
  end

  def file_type(file)
    puts "blob"
  end

  def file_path(file)
    "#{OBJ_PATH}/#{file[0..1]}/#{file[2..-1]}"
  end
end
