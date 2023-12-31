using System;
using System.Configuration;
using MongoDB.Bson;
using MongoDB.Driver;

namespace admin2.Pages.Admin
{
    public partial class Voucher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // You can add any initialization logic here
        }

        protected void btnAddVoucher_Click(object sender, EventArgs e)
        {
            string voucherCode = txtVoucherCode.Value.Trim();
            decimal voucherAmount;
            string expiryDate = txtVoucherExpiryDate.Value;

            if (!string.IsNullOrEmpty(voucherCode) && decimal.TryParse(txtVoucherAmount.Value, out voucherAmount) && !string.IsNullOrEmpty(expiryDate))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["MongoDBConnectionString"].ConnectionString;
                string databaseName = ConfigurationManager.AppSettings["MongoDBDatabaseName"];

                var client = new MongoClient(connectionString);
                var database = client.GetDatabase(databaseName);
                var collection = database.GetCollection<BsonDocument>("coupons");

                var voucherDocument = new BsonDocument
                {
                    { "code", voucherCode },
                    { "Type", "Voucher"},
                    { "amount", voucherAmount },
                    { "expiryDate", expiryDate }
                };

                collection.InsertOne(voucherDocument);

                // Add logic for feedback, such as showing a success message.
                lblVoucherFeedback.Text = "Voucher added successfully!";
            }
            else
            {
                // Add logic for feedback, such as showing an error message.
                lblVoucherFeedback.Text = "Please enter valid voucher details.";
            }
        }

        protected void btnSearchVoucher_Click(object sender, EventArgs e)
        {
            string voucherCode = txtSearchVoucherCode.Value.Trim();

            if (!string.IsNullOrEmpty(voucherCode))
            {
                BsonDocument voucher = GetVoucherFromMongoDB(voucherCode);

                if (voucher != null)
                {
                    // Voucher found, display voucher details
                    string expiryDate = voucher.Contains("expiryDate") ? voucher["expiryDate"].ToString() : "N/A";
                    decimal amount = voucher.Contains("amount") ? voucher["amount"].AsDecimal : 0;

                    lblVoucherDetails.Text = $"Voucher Details: <br/>Code - {voucher["code"]},<br/>Expiry Date - {expiryDate},<br/>Amount - {amount:C}";
                }
                else
                {
                    // Voucher not found, provide feedback to the user.
                    lblVoucherDetails.Text = "Voucher not found.";
                }
            }
            else
            {
                // Add logic for feedback, such as showing an error message.
                lblVoucherDetails.Text = "Please enter a valid voucher code.";
            }
        }

        private BsonDocument GetVoucherFromMongoDB(string voucherCode)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MongoDBConnectionString"].ConnectionString;
            string databaseName = ConfigurationManager.AppSettings["MongoDBDatabaseName"];

            var client = new MongoClient(connectionString);
            var database = client.GetDatabase(databaseName);
            var collection = database.GetCollection<BsonDocument>("coupons");

            var filter = Builders<BsonDocument>.Filter.Eq("code", voucherCode);
            return collection.Find(filter).FirstOrDefault();
        }
    }
}
