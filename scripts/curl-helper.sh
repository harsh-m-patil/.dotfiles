#!/usr/bin/env bash

method=$(gum choose GET POST PUT PATCH DELETE)
api_url=$(gum input --placeholder="API URL")
header_json="Content-Type: application/json"

case $method in
  "POST" | "PUT" | "PATCH")
    body=$(gum input --placeholder="Body(JSON)")
    query="curl -sS -H \"$header_json\" -d '{ $body }'  -X $method $api_url"
    ;;
  "GET" | "DELETE")
    query="curl -X $method $api_url"
    ;;
  *)
    echo "Invalid method"
    exit 1
    ;;
esac

echo $query 
echo $query | xsel --input --clipboard

if gum confirm "Do you want to execute the query"; then 
  eval $query
else 
  echo "query execution cancelled"
fi
