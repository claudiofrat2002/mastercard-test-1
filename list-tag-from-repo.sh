LOCAL_REG=localhost:5000

LIST_TAG=$(curl -s http://$LOCAL_REG/v2/_catalog | \
    jq -r '.["repositories"][]' | \
    xargs -I @REPO@ curl -s http://$LOCAL_REG/v2/@REPO@/tags/list | \
    jq -M '.["name"] + ":" + .["tags"][]'|grep latest)

echo $LIST_TAG