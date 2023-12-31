using System;
using System.Configuration;
using System.Web.UI;
using MongoDB.Bson;
using MongoDB.Driver;

namespace admin2.Pages.Admin
{
    public partial class OrderStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // You can add any initialization logic here
        }

        // Update Order Status Logic
        protected void btnUpdateOrderStatus_Click(object sender, EventArgs e)
        {
            string orderIdToUpdate = txtOrderIdToUpdate.Value.Trim();
            string updatedOrderStatus = ddlUpdatedOrderStatus.Value; // Corrected line

            if (!string.IsNullOrEmpty(orderIdToUpdate) && !string.IsNullOrEmpty(updatedOrderStatus))
            {
                // Connect to MongoDB
                string connectionString = ConfigurationManager.ConnectionStrings["MongoDBConnectionString"].ConnectionString;
                string databaseName = ConfigurationManager.AppSettings["MongoDBDatabaseName"];
                var client = new MongoClient(connectionString);
                var database = client.GetDatabase(databaseName);
                var collection = database.GetCollection<BsonDocument>("Orders");

                // Build filter to find the order by orderId
                var filter = Builders<BsonDocument>.Filter.Eq("orderNumber", orderIdToUpdate);

                // Build update definition to set the new status
                var update = Builders<BsonDocument>.Update.Set("status", updatedOrderStatus);

                // Update the document in the MongoDB collection
                var result = collection.UpdateOne(filter, update);

                if (result.ModifiedCount > 0)
                {
                    // Order status updated successfully
                    lblOrderStatusFeedback.Text = $"Order status for {orderIdToUpdate} updated to {updatedOrderStatus}";
                }
                else
                {
                    // Order not found
                    lblOrderStatusFeedback.Text = $"Order with ID {orderIdToUpdate} not found";
                }
            }
            else
            {
                // Validation failed
                lblOrderStatusFeedback.Text = "Please enter valid order ID and updated order status.";
            }
        }

        // Reject Order Logic
        protected void btnRejectOrder_Click(object sender, EventArgs e)
        {
            string orderIdToReject = txtOrderIdToReject.Value.Trim();
            string rejectionReason = txtRejectionReason.Value.Trim();

            if (!string.IsNullOrEmpty(orderIdToReject))
            {
                // Connect to MongoDB
                string connectionString = ConfigurationManager.ConnectionStrings["MongoDBConnectionString"].ConnectionString;
                string databaseName = ConfigurationManager.AppSettings["MongoDBDatabaseName"];
                var client = new MongoClient(connectionString);
                var database = client.GetDatabase(databaseName);
                var collection = database.GetCollection<BsonDocument>("Orders");

                // Build filter to find the order by orderId
                var filter = Builders<BsonDocument>.Filter.Eq("orderNumber", orderIdToReject);

                // Build update definition to set the new status to "Rejected" and store the rejection reason
                var update = Builders<BsonDocument>.Update
                    .Set("status", "Rejected")
                    .Set("rejectionReason", rejectionReason);

                // Update the document in the MongoDB collection
                var result = collection.UpdateOne(filter, update);

                if (result.ModifiedCount > 0)
                {
                    // Order rejected successfully
                    lblOrderRejectionFeedback.Text = $"Order with ID {orderIdToReject} rejected. Reason: {rejectionReason}";
                }
                else
                {
                    // Order not found
                    lblOrderRejectionFeedback.Text = $"Order with ID {orderIdToReject} not found";
                }
            }
            else
            {
                // Validation failed
                lblOrderRejectionFeedback.Text = "Please enter valid order ID.";
            }
        }
    }
}
