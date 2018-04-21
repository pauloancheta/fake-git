class Init
  def call(*args)
    new_folder = "#{args.first}/" if !!args
    `mkdir -p #{new_folder}.fakegit/objects/`

    base_folder = !!new_folder ? new_folder : "fakegit"
    puts "#{base_folder} has been initialized"
  end
end
