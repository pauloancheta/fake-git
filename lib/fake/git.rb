require "fake/git/version"
# require "fake/git/hash_object"

HELP = """
something here
"""

module Fake::Git
  def self.call(*args)
    cmd, sub_cmd = args
    return HELP if cmd.nil?

    classified_cmd = cmd.split("_").map(&:capitalize).join

    send "Fake::Git::#{classified_cmd}.call(#{sub_cmd})"
  end
end
