#!/bin/sh

DEFAULT_TAG="release-v0.0.1-rc1"
NEW_TAG="${1:-$DEFAULT_TAG}"
git tag ${NEW_TAG}
git push --tags
