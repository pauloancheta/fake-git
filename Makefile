install:
	gem build fake_git.gemspec && \
	gem install fake_git-0.1.0.gem

clean:
	gem uninstall fake_git && \
	rm fake_git-0.1.0.gem

reset: clean install
