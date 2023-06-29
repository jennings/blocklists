SHELL := /bin/bash

REPO := https://github.com/jmdugan/blocklists/archive/master.tar.gz
OUTDIR := jmdugan-blocklists

.PHONY: all
all:
	mkdir -p $(OUTDIR)
	curl -L $(REPO) | tar xzv -C $(OUTDIR) \
			--files-from <(echo "blocklists-master/corporations/*\0blocklists-master/LICENSE") \
			--strip-components 1

	find $(OUTDIR) -type f -not -path '*.md' -exec ./replace.sh {} \;
