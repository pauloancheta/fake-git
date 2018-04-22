require_relative "fetch_object"

class Fake::Git::ListObjects
  def call(*args)
    collection = []
    file_names.each do |file|
      pruned = file.gsub(".fakegit/objects/", "")
      index = pruned.split("/").join
      collection << Fake::Git::FetchObject.new.call(index)
    end

    collection
  end

  private
  def file_names
    `find .fakegit/objects -type f`.split("\n")
  end
end
