require "fake/git/version"

require_relative "git/cat_file"
require_relative "git/commit_tree"
require_relative "git/fetch_object"
require_relative "git/hash_object"
require_relative "git/init"
require_relative "git/list_objects"
require_relative "git/log"
require_relative "git/update_index"
require_relative "git/write_tree"

require_relative "git/priv/object"

HELP = """
WELCOME TO FAKEGIT

usage:
$> echo 'hello world' | fakegit hash-object
"""

module Fake::Git
  def self.call(*args)
    cmd, _ = args.flatten

    if cmd.nil?
      puts HELP
      return
    end

    sub_cmd = args.flatten[1..-1].join(" ")

    klass = cmd.split("-").map(&:capitalize).join
    const_get("#{klass}").new.call(sub_cmd)
  end
end
