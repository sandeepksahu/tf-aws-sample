BODY_PAYLOAD="\`\`\`$@"
jq -n --arg plan "$BODY_PAYLOAD" '{body: $plan}' > plan.txt
PR_NO=${CODEBUILD_WEBHOOK_TRIGGER:3}
curl -X POST \
  https://api.github.com/repos/sandeepksahu/$REPO/issues/$PR_NO/comments \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d @plan.txt