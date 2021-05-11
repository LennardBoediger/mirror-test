#!/bin/bash
set -euxo pipefail

mkdir git-magic
cd git-magic
git clone --mirror https://github.com/LennardBoediger/mirror-test.git
cd mirror-test.git
git remote add --mirror=fetch secondary https://git.dotplex.com/lennard.boediger/mirror-test.git
git remote set-url secondary https://oauth2:$GITLAB_REPO_KEY@git.dotplex.com/lennard.boediger/mirror-test.git
git fetch origin
git push secondary --tags
git push secondary --all