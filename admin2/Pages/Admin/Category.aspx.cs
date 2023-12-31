using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace admin2.Pages.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate the dropdown list with initial data
                PopulateDropdownList();
            }
        }

        // Method to populate the dropdown list with data
        private void PopulateDropdownList()
        {
            // Sample data for demonstration purposes
            List<string> categories = new List<string> { "Category 1", "Category 2", "Category 3" };

            // Bind the data to the dropdown list
            // dropdownListCategories.DataSource = categories;
            // dropdownListCategories.DataBind();
        }

        protected void btnEditCategory_Click(object sender, EventArgs e)
        {
            // Handle edit category button click
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            // Handle add category button click
        }

        protected void btnDeleteCategory_Click(object sender, EventArgs e)
        {
            // Handle delete category button click
        }
    }
}
