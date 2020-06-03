#!/bin/sh

DEFAULT_TAG="release-v0.0.1-rc1"
NEW_TAG="${1:-$DEFAULT_TAG}"
COMMIT_MSG="${2:-release-notes.txt}"
git tag -a -F ${COMMIT_MSG} ${NEW_TAG}
git push --tags
