import pysolr

# Define Solr server details
solr_url = 'http://localhost:8983/solr/'
core_name = 'solr_test'

# Connect to Solr
s = pysolr.Solr(solr_url + core_name)

# Update JSON data
update_json = [
    {"id": "1", "title": {"set": "Updated Title 1"}},
    {"id": "2", "content": {"set": "Updated content of the second document"}}
]

# Update documents
s.add(update_json, commit=True)
