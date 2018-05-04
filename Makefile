install:
	gem build fake_git.gemspec && \
	gem install fake_git-0.1.2.gem

clean:
	gem uninstall fake_git && \
	rm fake_git-0.1.2.gem

reset: clean install
