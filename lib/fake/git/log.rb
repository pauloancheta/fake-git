require_relative "list_objects"

class Fake::Git::Log
  def call(*args)
  end

  private
  def commit_objects
    Fake::Git::ListObjects.new.call.select do |obj|
      obj.type == "commit"
    end.sort_by!(:date)
  end
end
