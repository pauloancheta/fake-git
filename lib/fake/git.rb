require "fake/git/version"

require_relative "git/hash_object"
require_relative "git/cat_file"
require_relative "git/init"
require_relative "git/fetch_object"

require_relative "git/priv/object"

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

    klass = cmd.split("-").map(&:capitalize).join
    const_get("#{klass}").new.call(sub_cmd)
  end
end
