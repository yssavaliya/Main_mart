using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace admin2.Pages.Admin
{
    public partial class Home : System.Web.UI.Page
    {
        private IMongoCollection<BsonDocument> collection;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // MongoDB connection setup
                string connectionString = ConfigurationManager.ConnectionStrings["MongoDBConnectionString"].ConnectionString;
                string databaseName = ConfigurationManager.AppSettings["MongoDBDatabaseName"];
                var client = new MongoClient(connectionString);
                var database = client.GetDatabase(databaseName);
                collection = database.GetCollection<BsonDocument>("Orders");
                

                // Access a collection (replace "your_collection" with your actual collection name)
                var totalOrderCollection = database.GetCollection<BsonDocument>("Orders");

                // Call the function to perform operations on the collection
                totalOrderProcessCollection(totalOrderCollection);

                // Access a collection (replace "your_collection" with your actual collection name)
                var userCollection = database.GetCollection<BsonDocument>("users");

                // Call the function to perform operations on the collection
                ProcessUserCollection(userCollection);

                // Retrieve data from MongoDB
                var filter = Builders<BsonDocument>.Filter.Empty;
                var result = collection.Find(filter).ToList();

                // Prepare data for the chart
                var chartData = new List<ChartData>();

                foreach (var document in result)
                {
                    chartData.Add(new ChartData
                    {
                        Product = document["customerName"].AsString,
                        Quantity = document["quantity"].AsInt32
                    });
                }

                // Convert data to JSON
                var serializer = new JavaScriptSerializer();
                var chartDataJson = serializer.Serialize(chartData);
                
                // Inject JavaScript to render the chart
                Page.ClientScript.RegisterStartupScript(this.GetType(), "drawChart", $"drawChart({chartDataJson});", true);

            }
        }

        public class ChartData
        {
            public string Product { get; set; }
            public int Quantity { get; set; }
        }
        private void ProcessUserCollection(IMongoCollection<BsonDocument> collection)
        {
            // Use the countDocuments method to get the total number of documents in the collection
            long totalUsers = collection.CountDocuments(new BsonDocument());

            // Update the HTML element with the fetched data
            customerReceived.InnerText = totalUsers.ToString();
        }

        private void totalOrderProcessCollection(IMongoCollection<BsonDocument> collection)
        {
            // Example: Query all documents in the collection
            var documents = collection.Find(new BsonDocument()).ToList();

            // Use the countDocuments method to get the total number of documents in the collection
            long totalOrders = collection.CountDocuments(new BsonDocument());

            // You can add more queries to get specific counts based on your requirements
            long completedOrders = collection.CountDocuments(new BsonDocument("status", "Completed"));

            // Update the HTML elements with the fetched data
            ordersReceived.InnerText = totalOrders.ToString();
            completedOrdersSpan.InnerText = completedOrders.ToString();

            

        }

        private IMongoDatabase ConnectToMongoDB(string connectionString, string databaseName)
        {
            // Create a MongoClient
            var client = new MongoClient(connectionString);

            // Access the database
            return client.GetDatabase(databaseName);
        }
    }
}