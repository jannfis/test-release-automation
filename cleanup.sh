#!/bin/sh

echo "Delete local tags"
for tag in $(git tag); do
	git tag -d $tag
done
echo "Delete remote tags..."
for tag in $(git ls-remote --tags 2>/dev/null | awk '/refs\/tags/ { print $2; }' | grep -v '{}'); do 
	git push --delete origin "$tag"; 
done
if ! test -z "${remote_tags}"; then 
	echo "Going to delete remote tags: ${remote_tags}"
	git push --delete origin ${remote_tags}
fi
git branch -D release-0.0
git push --delete origin release-0.0
git branch release-0.0
git push origin release-0.0
