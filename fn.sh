function del_merged {
  git branch --merged \
    | grep -v "\*" \
    | grep -v master \
    | grep -v develop \
    | grep -v development \
    | xargs -n 1 git branch -d
}
