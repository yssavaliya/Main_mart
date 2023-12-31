<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="admin2.Pages.Admin.Product" %>

<%@ Register Src="~/Pages/Admin/Nevbar.ascx" TagPrefix="uc1" TagName="Nevbar" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Product Management</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>Product Management</h2>
    <uc1:Nevbar runat="server" ID="Nevbar" />

    <!-- Add Product Form -->
    <button type="button" class="btn btn-success" onclick="toggleForm('addProductForm')">Add Product</button>

    <!-- Add Product Form (Hidden by default) -->
    <form id="addProductForm" class="position-absolute" style="display: none;">
        <!-- Your form fields for adding a new product go here -->
        <div class="form-group">
            <label for="productName">Product Name:</label>
            <input type="text" class="form-control" id="productName" name="productName" required>
        </div>

        <div class="form-group">
            <label for="productPrice">Product Price:</label>
            <input type="text" class="form-control" id="productPrice" name="productPrice" required>
        </div>

        <button type="submit" class="btn btn-success">Add Product</button>
    </form>

    <!-- Update Product Form -->
    <button type="button" class="btn btn-primary" onclick="toggleForm('updateProductForm')">Update Product</button>

    <!-- Update Product Form (Hidden by default) -->
    <form id="updateProductForm" class="position-absolute" style="display: none;">
        <!-- Your form fields for updating a product go here -->
        <div class="form-group">
            <label for="updateProductId">Product ID to Update:</label>
            <input type="text" class="form-control" id="updateProductId" name="updateProductId" required>
        </div>

        <div class="form-group">
            <label for="updatedProductName">Updated Product Name:</label>
            <input type="text" class="form-control" id="updatedProductName" name="updatedProductName" required>
        </div>

        <div class="form-group">
            <label for="updatedProductPrice">Updated Product Price:</label>
            <input type="text" class="form-control" id="updatedProductPrice" name="updatedProductPrice" required>
        </div>

        <button type="submit" class="btn btn-primary">Update Product</button>
    </form>

    <!-- Delete Product Form -->
    <button type="button" class="btn btn-danger" onclick="toggleForm('deleteProductForm')">Delete Product</button>

    <!-- Delete Product Form (Hidden by default) -->
    <form id="deleteProductForm" class="position-absolute" style="display: none;">
        <!-- Your form fields for deleting a product go here -->
        <div class="form-group">
            <label for="deleteProductId">Product ID to Delete:</label>
            <input type="text" class="form-control" id="deleteProductId" name="deleteProductId" required>
        </div>

        <button type="submit" class="btn btn-danger">Delete Product</button>
    </form>

    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Your custom scripts -->
    <script>
        function toggleForm(formId) {
            var forms = document.querySelectorAll('form.position-absolute');
            forms.forEach(function (form) {
                form.style.display = 'none';
            });

            var form = document.getElementById(formId);
            form.style.display = 'block';
        }
    </script>
</body>
</html>
