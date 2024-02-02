import pysolr

# Define Solr server details
solr_url = 'http://localhost:8983/solr/'
core_name = 'solr_test'

# Connect to Solr
s = pysolr.Solr(solr_url + core_name)

# Delete documents by ID
delete_ids = ["1"]

# Delete documents
s.delete(id=delete_ids, commit=True)
