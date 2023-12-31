using System;
using System.Configuration;
using MongoDB.Bson;
using MongoDB.Driver;

namespace admin2.Pages.Admin
{
    public partial class Coupen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // You can add any initialization logic here
        }

        private BsonDocument GetCouponFromMongoDB(string couponCode)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MongoDBConnectionString"].ConnectionString;
            string databaseName = ConfigurationManager.AppSettings["MongoDBDatabaseName"];

            var client = new MongoClient(connectionString);
            var database = client.GetDatabase(databaseName);
            var collection = database.GetCollection<BsonDocument>("Discount");

            var filter = Builders<BsonDocument>.Filter.Eq("code", couponCode);
            return collection.Find(filter).FirstOrDefault();
        }

        protected void btnAddCoupon_Click(object sender, EventArgs e)
        {
            string couponCode = txtCouponCode.Value.Trim();
            string expiryDate = txtExpiryDate.Value;
            int discountPercent;

            if (!string.IsNullOrEmpty(couponCode) && !string.IsNullOrEmpty(expiryDate) && int.TryParse(txtDiscountPercent.Value, out discountPercent))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["MongoDBConnectionString"].ConnectionString;
                string databaseName = ConfigurationManager.AppSettings["MongoDBDatabaseName"];

                var client = new MongoClient(connectionString);
                var database = client.GetDatabase(databaseName);
                var collection = database.GetCollection<BsonDocument>("Discount");

                var couponDocument = new BsonDocument
                {
                    { "code", couponCode },
                    { "expiryDate", expiryDate },
                    { "discountPercent", discountPercent }
                };

                collection.InsertOne(couponDocument);

                // Add logic for feedback, such as showing a success message.
                lblFeedback.Text = "Coupon added successfully!";
            }
            else
            {
                // Add logic for feedback, such as showing an error message.
                lblFeedback.Text = "Please enter valid coupon details.";
            }
        }

        protected void btnSearchCoupon_Click(object sender, EventArgs e)
        {
            string couponCode = txtSearchCoupon.Value.Trim();

            if (!string.IsNullOrEmpty(couponCode))
            {
                BsonDocument coupon = GetCouponFromMongoDB(couponCode);

                if (coupon != null)
                {
                    // Coupon found, display details
                    string expiryDate = coupon.Contains("expiryDate") ? coupon["expiryDate"].ToString() : "N/A";
                    int discountPercent = coupon.Contains("discountPercent") ? coupon["discountPercent"].AsInt32 : 0;

                    lblCouponDetails.Text = $"Coupon Details: <br/>Code - {coupon["code"]},<br/>Expiry Date - {expiryDate},<br/>Discount Percent - {discountPercent}%";
                }
                else
                {
                    // Coupon not found, provide feedback to the user.
                    lblCouponDetails.Text = "Coupon not found.";
                }
            }
            else
            {
                // Add logic for feedback, such as showing an error message.
                lblCouponDetails.Text = "Please enter a valid coupon code.";
            }
        }
    }
}