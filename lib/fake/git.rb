require "fake/git/version"

require_relative "git/hash_object"
require_relative "git/init"

HELP = """
WELCOME TO FAKEGIT

usage:
$> echo 'hello world' | fakegit hash-object
"""

module Fake::Git
  def self.call(*args)
    cmd, sub_cmd = args.flatten

    if cmd.nil?
      puts HELP
      return
    end

    klass = if cmd.is_a? Array
              cmd.first.split("-").map(&:capitalize).join
            else
              cmd.capitalize
            end

    const_get("#{klass}").call(sub_cmd)
  end
end
