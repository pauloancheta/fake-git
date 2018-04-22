require "fake/git/version"

require_relative "git/cat_file"
require_relative "git/commit_tree"
require_relative "git/fetch_object"
require_relative "git/hash_object"
require_relative "git/init"
require_relative "git/list_objects"
require_relative "git/log"
require_relative "git/update_index"
require_relative "git/update_ref"
require_relative "git/write_tree"

require_relative "git/priv/object"

HELP = """
WELCOME TO FAKEGIT

usage:
$> echo 'hello world' | fakegit hash-object
"""

module Fake::Git
  def self.call(*args)
    cmds = args.flatten

    if cmds.empty?
      puts HELP
      return
    end

    klass = cmds.first.split("-").map(&:capitalize).join
    sub_cmd = cmds[1..-1].join(" ")

    const_get("#{klass}").new.call(sub_cmd)
  end
end
