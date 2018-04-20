install:
	gem build fake-git.gemspec && \
	gem install fake-git-0.1.0.gem

clean:
	gem uninstall fake-git && \
	rm fake-git-0.1.0.gem

reset: clean install
