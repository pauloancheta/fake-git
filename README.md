# FakeGit

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/fake/git`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fake-git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fake-git

## Usage

Create a manual fakegit commit by following these steps:

1. hash-object
```
echo "hello world [or your fancy string to commit]" | fakegit hash-object -w --stdin
```

1. write-tree
```
$ fakegit write-tree
# output is a sha1 (index) of the tree object
```

1. update-ref
```
$ fakegit update-ref
```

1. commit-tree
```
fakegit <tree object sha to commit> -m "your message"
```

1. log
```
fakegit log
```

Verify your objects by using cat-file
```
fakegit cat-file -s <OBJECT SHA (INDEX)> # to see the filesize
fakegit cat-file -t <OBJECT SHA (INDEX)> # to see the object type
fakegit cat-file -p <OBJECT SHA (INDEX)> # to see the print the content
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `make install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pauloancheta/fake-git.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
