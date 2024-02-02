# Elasticsearch Commands Log

## Start Elasticsearch Server

```bash
❯ ./bin/elasticsearch
```

## Create Document

```bash
❯ curl -X POST "http://localhost:9200/my_index/_doc/1" -H 'Content-Type: application/json' -d '{
  "title": "Sample Document",
  "content": "This is the content of the document."
}'

{"_index":"my_index","_id":"1","_version":1,"result":"created","_shards":{"total":2,"successful":1,"failed":0},"_seq_no":0,"_primary_term":1}
```

Document with ID "1" created.

## Read Document

```bash
❯ curl -X GET "http://localhost:9200/my_index/_doc/1"

{"_index":"my_index","_id":"1","_version":1,"_seq_no":0,"_primary_term":1,"found":true,"_source":{
  "title": "Sample Document",
  "content": "This is the content of the document."
}}
```

Document with ID "1" retrieved.

## Delete Document

```bash
❯ curl -X DELETE "http://localhost:9200/my_index/_doc/1"

{"_index":"my_index","_id":"1","_version":2,"result":"deleted","_shards":{"total":2,"successful":1,"failed":0},"_seq_no":1,"_primary_term":1}
```

Document with ID "1" deleted.

## Recreate Document

```bash
❯ curl -X POST "http://localhost:9200/my_index/_doc/1" -H 'Content-Type: application/json' -d '{
  "title": "Sample Document",
  "content": "This is the content of the document."
}'

{"_index":"my_index","_id":"1","_version":3,"result":"created","_shards":{"total":2,"successful":1,"failed":0},"_seq_no":2,"_primary_term":1}
```

Document with ID "1" recreated.

## Update Document (Corrected)

```bash
❯ curl -X POST "http://localhost:9200/my_index/_update/1" -H 'Content-Type: application/json' -d '{
  "script": {
    "source": "ctx._source.content = params.content",
    "lang": "painless",
    "params": {
      "content": "Updated content."
    }
  },
  "upsert": {
    "content": "Updated content."
  }
}'

{"_index":"my_index","_id":"1","_version":4,"result":"updated","_shards":{"total":2,"successful":1,"failed":0},"_seq_no":3,"_primary_term":1}
```
