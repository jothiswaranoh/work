import pysolr

# Define Solr server details
solr_url = 'http://localhost:8983/solr/'
core_name = 'solr_test'

# Connect to Solr
s = pysolr.Solr(solr_url + core_name)

# Sample JSON data
sample_json = [
    {
        "id": "1",
        "title": "Sample Document 1",
        "content": "This is the content of the first document."
    },
    {
        "id": "2",
        "title": "Sample Document 2",
        "content": "This is the content of the second document."
    }
]

# Index JSON documents
s.add(sample_json)

# Commit changes
s.commit()
