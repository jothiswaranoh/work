import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrRequest;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.request.CollectionAdminRequest;
import org.apache.solr.client.solrj.request.UpdateRequest;
import org.apache.solr.common.SolrInputDocument;

import java.util.Collections;

public class SolrJavaExample {

    public static void main(String[] args) throws Exception {
        // Solr server details
        String solrUrl = "http://localhost:8983/solr/";
        String coreName = "solr_test";

        // Connect to Solr
        SolrClient solrClient = new HttpSolrClient.Builder(solrUrl).build();

        // Step 1: Create Solr Core
        createSolrCore(solrClient, coreName);

        // Step 2: Insert Documents
        insertDocuments(solrClient, coreName);

        // Step 3: Update Documents
        updateDocuments(solrClient, coreName);

        // Step 4: Delete Documents
        deleteDocuments(solrClient, coreName);

        // Close Solr client
        solrClient.close();
    }

    private static void createSolrCore(SolrClient solrClient, String coreName) throws Exception {
        CollectionAdminRequest.createCore(coreName, "configset", solrClient).process(solrClient);
        System.out.println("Core created: " + coreName);
    }

    private static void insertDocuments(SolrClient solrClient, String coreName) throws Exception {
        SolrInputDocument doc1 = new SolrInputDocument();
        doc1.addField("id", "1");
        doc1.addField("title", "Sample Document 1");
        doc1.addField("content", "This is the content of the first document.");

        SolrInputDocument doc2 = new SolrInputDocument();
        doc2.addField("id", "2");
        doc2.addField("title", "Sample Document 2");
        doc2.addField("content", "This is the content of the second document.");

        solrClient.add(coreName, doc1);
        solrClient.add(coreName, doc2);
        solrClient.commit(coreName);
        System.out.println("Documents inserted successfully.");
    }

    private static void updateDocuments(SolrClient solrClient, String coreName) throws Exception {
        SolrInputDocument updateDoc1 = new SolrInputDocument();
        updateDoc1.addField("id", "1");
        updateDoc1.addField("title", Collections.singletonMap("set", "Updated Title 1"));

        SolrInputDocument updateDoc2 = new SolrInputDocument();
        updateDoc2.addField("id", "2");
        updateDoc2.addField("content", Collections.singletonMap("set", "Updated content of the second document"));

        UpdateRequest updateRequest = new UpdateRequest();
        updateRequest.add(updateDoc1);
        updateRequest.add(updateDoc2);
        solrClient.request(updateRequest, coreName);
        solrClient.commit(coreName);
        System.out.println("Documents updated successfully.");
    }

    private static void deleteDocuments(SolrClient solrClient, String coreName) throws Exception {
        solrClient.deleteById(coreName, "1");
        solrClient.deleteById(coreName, "2");
        solrClient.commit(coreName);
        System.out.println("Documents deleted successfully.");
    }
}
