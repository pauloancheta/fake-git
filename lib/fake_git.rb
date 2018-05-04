require "fake_git/version"

require_relative "fake_git/cat_file"
require_relative "fake_git/commit_tree"
require_relative "fake_git/fetch_object"
require_relative "fake_git/hash_object"
require_relative "fake_git/init"
require_relative "fake_git/list_objects"
require_relative "fake_git/log"
require_relative "fake_git/update_index"
require_relative "fake_git/update_ref"
require_relative "fake_git/write_tree"

require_relative "fake_git/priv/object"

HELP = """
WELCOME TO FAKEGIT

usage:
$> echo 'hello world' | fakegit hash-object
"""

module FakeGit
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
