class Fake::Git::HashObject
  def self.call(*args)
    puts args
    args
  end
end
