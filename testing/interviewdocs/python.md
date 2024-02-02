## Run Solr in Docker Container

```bash
docker run -d -p 8983:8983 -v /Users/stask/workspace/solrdir:/var/solr/data --name solr_container solr
```

This command starts a Solr container, exposing port 8983, and mounting a local directory for data persistence.

## Create a Solr Core

```bash
docker exec -it solr_container bin/solr create_core -c solr_test
```

This command creates a new Solr core named `solr_test` in the running Solr container.

## Python Code for Inserting, Updating, and Deleting Documents

Install the `solrpy` library:

```bash
pip install solrpy
```

### Insert Documents

```python
import solr

solr_url = 'http://localhost:8983/solr/'
core_name = 'solr_test'

s = solr.Solr(solr_url + core_name)

sample_json = [
    {"id": "1", "title": "Sample Document 1", "content": "This is the content of the first document."},
    {"id": "2", "title": "Sample Document 2", "content": "This is the content of the second document."}
]

s.add(sample_json)
s.commit()
```

### Update Documents

```python
import pysolr

solr_url = 'http://localhost:8983/solr/'
core_name = 'solr_test'

s = pysolr.Solr(solr_url + core_name)

update_json = [
    {"id": "1", "title": {"set": "Updated Title 1"}},
    {"id": "2", "content": {"set": "Updated content of the second document"}}
]

s.add(update_json, commit=True)
```

### Delete Documents

```python
import pysolr

solr_url = 'http://localhost:8983/solr/'
core_name = 'solr_test'

s = pysolr.Solr(solr_url + core_name)

delete_ids = ["1", "2"]

s.delete(id=delete_ids, commit=True)
```

## Read

```
import pysolr

# Define Solr server details
solr_url = 'http://localhost:8983/solr/'
core_name = 'solr_test'

# Connect to Solr
s = pysolr.Solr(solr_url + core_name)

# Sample query to retrieve all documents
query = '*:*'

# Perform query
results = s.search(query)

# Print results
print(f"Number of documents found: {results.hits}")
print("Documents:")
for doc in results.docs:
    print(doc)
```
