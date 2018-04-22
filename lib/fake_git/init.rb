class Init
  def call(*args)
    new_folder = "#{args.first}/" if args.nil? || args.empty?

    `mkdir -p #{new_folder}.fakegit/objects/`
    `mkdir -p #{new_folder}.fakegit/refs/heads/`
    `touch #{new_folder}.fakegit/refs/heads/master`

    base_folder = !!new_folder ? new_folder : "fakegit"
    puts "#{base_folder} has been initialized"
  end
end
