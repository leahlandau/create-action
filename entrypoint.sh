#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
# previous_release_created_at=$(curl -s -H "Authorization: Bearer ${{ secrets.GITHUB_TOKEN }}" "https://api.github.com/repos/${{ github.repository }}/releases/latest" | jq -r '.created_at')
# echo "previous_release_created_at=$previous_release_created" >> $GITHUB_OUTPUT
# latest_tag=$(git describe --tags)

# previous_tag=$(git describe --tags $(git rev-list --tags --skip=1 --max-count=1))

# issues=$(curl -s -H "Authorization: Bearer ${{ secrets.GITHUB_TOKEN }}" "https://api.github.com/repos/${{ github.repository }}/issues?state=closed&per_page=100&since=$previous_release_created_at")

# issues_list=""

# while IFS= read -r row; do

#     number=$(echo "$row" | jq -r '.number')

#     title=$(echo "$row" | jq -r '.title')

#     assignees=$(curl -s -H "Authorization: Bearer ${{ secrets.GITHUB_TOKEN }}" "https://api.github.com/repos/${{ github.repository }}/issues/$number" | jq -r '.assignees[].login' | xargs)

#     url=$(echo "$row" | jq -r '.html_url')


#     assignee_links=""

#     for assignee in $assignees; do

#         assignee_links="$assignee_links[@$assignee](https://github.com/$assignee) "

#     done

#     issues_list="${issues_list}- $title in [#$number]($url) by $assignee_links\n"

# done < <(echo "$issues" | jq -c '.[]')

# release_id=$(curl -s -H "Authorization: Bearer ${{ secrets.GITHUB_TOKEN }}" "https://api.github.com/repos/${{ github.repository }}/releases/tags/$latest_tag" | jq -r '.id')

# curl -X PATCH -H "Authorization: token ${{ secrets.GITHUB_TOKEN }}" -d '{"body": "Whats Changed:\n\n'"$issues_list"'"}' "https://api.github.com/repos/${{ github.repository }}/releases/$release_id"
