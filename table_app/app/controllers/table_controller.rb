class TableController < ApplicationController

  def show
    solr_url = 'http://10.19.10.79:8986/solr/Jothish'
    solr = RSolr.connect(url: solr_url)
    response = solr.get('select', params: { q: '*:*', 'q.op' => 'OR', indent: true })
    solr_records = response['response']['docs']
    @records = solr_records
  end

  def index
  end

end
