require_relative "list_objects"

class Fake::Git::Log
  def call(*args)
    commit_objects.each do |obj|
      logger(obj)
    end
  end

  private
  def commit_objects
    Fake::Git::ListObjects.new.call.select do |obj|
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
