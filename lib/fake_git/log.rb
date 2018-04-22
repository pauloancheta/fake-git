require_relative "list_objects"

class FakeGit::Log
  def call(*args)
    commit_objects.each do |obj|
      logger(obj)
    end
  end

  private
  def commit_objects
    FakeGit::ListObjects.new.call.select do |obj|
      obj.type == "commit"
    end.sort { |a, b| a.date <=> b.date }
  end

  def logger(obj)
    puts """
commit #{obj.index}
Date: #{obj.date}

    #{obj.message}
    """
  end
end
