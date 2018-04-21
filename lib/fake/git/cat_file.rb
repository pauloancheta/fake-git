class Fake::Git::CatFile
  def call(*args)
    puts ARGV
  end
end
