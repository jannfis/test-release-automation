#!/bin/sh

remote_tags=""
for tag in $(git tag); do
	git tag -d $tag
	remote_tags="${remote_tags} ${tag}"
done
if ! test -z "${remote_tags}"; then 
	echo "Going to delete remote tags: ${remote_tags}"
	git push --delete origin ${remote_tags}
fi

