#!/usr/bin/env bash

SRVPORT=4499
RSPFILE=response

rm -f $RSPFILE
mkfifo $RSPFILE

get_api() {
read line
echo $line
}

handleRequest() {
# Process the request
get_api
mod=fortune

cat <<EOF > $RSPFILE
HTTP/1.1 200 OK

<pre>cowsay $mod</pre>
EOF
}

prerequisites() {
command -v cowsay >/dev/null 2>&1 &&
command -v fortune >/dev/null 2>&1 ||
{
echo "Install prerequisites."
exit 1
}
}

main() {
prerequisites
echo "Wisdom served on port=$SRVPORT..."

while [ 1 ]; do
# Remove the -N option from netcat
cat $RSPFILE | nc -l $SRVPORT | handleRequest
sleep 0.01
done
}

main
