<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="admin2.Pages.Admin.Stock" %>

<%@ Register Src="~/Pages/Admin/Nevbar.ascx" TagPrefix="uc1" TagName="Nevbar" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Stock Management</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>Stock Management</h2>
    <uc1:Nevbar runat="server" ID="Nevbar" />

    <!-- Update Stock Form -->
    <button type="button" class="btn btn-primary" onclick="toggleForm('updateStockForm')">Update Stock</button>

    <!-- Update Stock Form (Hidden by default) -->
    <form id="updateStockForm" class="position-absolute" style="display: none;">
        <!-- Your form fields for updating stock go here -->
        <div class="form-group">
            <label for="productIdToUpdateStock">Product ID to Update Stock:</label>
            <input type="text" class="form-control" id="productIdToUpdateStock" name="productIdToUpdateStock" required>
        </div>

        <div class="form-group">
            <label for="updatedStockQuantity">Updated Stock Quantity:</label>
            <input type="text" class="form-control" id="updatedStockQuantity" name="updatedStockQuantity" required>
        </div>

        <button type="submit" class="btn btn-primary">Update Stock</button>
    </form>

    <!-- Delete Stock Form -->
    <button type="button" class="btn btn-danger" onclick="toggleForm('deleteStockForm')">Delete Stock</button>

    <!-- Delete Stock Form (Hidden by default) -->
    <form id="deleteStockForm" class="position-absolute" style="display: none;">
        <!-- Your form fields for deleting stock go here -->
        <div class="form-group">
            <label for="productIdToDeleteStock">Product ID to Delete Stock:</label>
            <input type="text" class="form-control" id="productIdToDeleteStock" name="productIdToDeleteStock" required>
        </div>

        <button type="submit" class="btn btn-danger">Delete Stock</button>
    </form>

    <!-- Insert Stock Form -->
    <button type="button" class="btn btn-success" onclick="toggleForm('insertStockForm')">Insert Stock</button>

    <!-- Insert Stock Form (Hidden by default) -->
    <form id="insertStockForm" class="position-absolute" style="display: none;">
        <!-- Your form fields for inserting stock go here -->
        <div class="form-group">
            <label for="productIdToInsertStock">Product ID to Insert Stock:</label>
            <input type="text" class="form-control" id="productIdToInsertStock" name="productIdToInsertStock" required>
        </div>

        <div class="form-group">
            <label for="insertedStockQuantity">Inserted Stock Quantity:</label>
            <input type="text" class="form-control" id="insertedStockQuantity" name="insertedStockQuantity" required>
        </div>

        <button type="submit" class="btn btn-success">Insert Stock</button>
    </form>

    <!-- Stock Status Form -->
    <button type="button" class="btn btn-info" onclick="toggleForm('stockStatusForm')">Stock Status</button>

    <!-- Stock Status Form (Hidden by default) -->
    <form id="stockStatusForm" class="position-absolute" style="display: none;">
        <!-- Your form fields for checking stock status go here -->
        <div class="form-group">
            <label for="productIdToCheckStockStatus">Product ID to Check Stock Status:</label>
            <input type="text" class="form-control" id="productIdToCheckStockStatus" name="productIdToCheckStockStatus" required>
        </div>

        <button type="submit" class="btn btn-info">Check Stock Status</button>
    </form>
</div>

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
