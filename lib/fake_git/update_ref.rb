class FakeGit::UpdateRef
  def call(*args)
    path = ".fakegit/refs/heads/master"
    File.open(path, 'w') do |file|
      file.write(args.first)
    end
  end
end
