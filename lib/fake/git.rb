require "fake/git/version"

require_relative "git/hash_object"

HELP = """
WELCOME TO FAKEGIT

usage:
$> echo 'hello world' | fakegit hash-object
"""

module Fake::Git
  def self.call(*args)
    cmd, sub_cmd = args

    if cmd.nil?
      puts HELP
      return
    end

    classified_cmd = cmd.first.split("-").map(&:capitalize).join
    const_get("#{classified_cmd}").call(sub_cmd)
  end
end
