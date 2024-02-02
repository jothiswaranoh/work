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
