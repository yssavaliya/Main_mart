using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Web.UI;

namespace admin2.Pages.Admin
{
    public partial class Customer : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // MongoDB connection string
            string connectionString = "mongodb://localhost:27017";
            try
            {
                if (IsPostBack)
                {
                    // Get customer details from the form
                    string customerName = Request.Form["customer_name"];
                    string customerEmail = Request.Form["customer_email"];
                    string customerMobile = Request.Form["customer_mobile"];

                    // Create a MongoClient
                    var client = new MongoClient(connectionString);

                    // Access the database (replace "your_database" with your actual database name)
                    var database = client.GetDatabase("admin");

                    // Access a collection (replace "your_collection" with your actual collection name)
                    var collection = database.GetCollection<BsonDocument>("users");

                    // Create a filter to find the customer based on the provided details
                    var filter = Builders<BsonDocument>.Filter.Eq("name", customerName) &
                                 Builders<BsonDocument>.Filter.Eq("email", customerEmail) &
                                 Builders<BsonDocument>.Filter.Eq("phone", customerMobile);

                    // Find a single customer matching the filter
                    var customer = collection.Find(filter).FirstOrDefault();

                    // Display the result in the table
                    if (customer != null)
                    {
                        // Populate table rows with customer details
                        string tableRow = $"<tr><td>{customer["name"]}</td><td>{customer["email"]}</td><td>{customer["phone"]}</td></tr>";
                        resultTableBody.InnerHtml = tableRow;
                    }
                    else
                    {
                        // Handle when customer is not found
                        resultTableBody.InnerHtml = "<tr><td colspan='3'>Customer not found</td></tr>";
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception (e.g., log it, display an error message)
                Response.Write($"Error connecting to MongoDB: {ex.Message}");
            }
        }
    }
}
