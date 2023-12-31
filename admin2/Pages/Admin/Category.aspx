<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="admin2.Pages.Admin.Category" %>

<%@ Register Src="~/Pages/Admin/Nevbar.ascx" TagPrefix="uc1" TagName="Nevbar" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Category Management</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>Category Management</h2>
    <uc1:Nevbar runat="server" ID="Nevbar" />

    <!-- Edit Category Form -->
    <button type="button" class="btn btn-primary" onclick="toggleForm('editCategoryForm')">Edit Category</button>

    <!-- Edit Category Form (Hidden by default) -->
    <form id="editCategoryForm" class="position-absolute" style="display: none;">
        <!-- Your form fields for editing category go here -->
        <div class="form-group">
            <label for="editCategoryName">Category id:</label>
            <input type="text" class="form-control" id="editCategoryName" name="editCategoryName" required>
        </div>
          <div class="form-group">
            <label for="editCategoryName">Category Name:</label>
            <input type="text" class="form-control" id="editCategoryName" name="editCategoryName" required>
        </div>

        <button type="submit" class="btn btn-primary">Edit Category</button>
    </form>

    <!-- Add New Category Form -->
    <button type="button" class="btn btn-success" onclick="toggleForm('addCategoryForm')">Add New Category</button>

    <!-- Add New Category Form (Hidden by default) -->
    <form id="addCategoryForm" class="position-absolute" style="display: none;">
        <!-- Your form fields for adding a new category go here -->
        <div class="form-group">
            <label for="newCategoryName">New Category Name:</label>
            <input type="text" class="form-control" id="newCategoryName" name="newCategoryName" required>
        </div>

        <button type="submit" class="btn btn-success">Add Category</button>
    </form>

    <!-- Delete Category Form -->
    <button type="button" class="btn btn-danger" onclick="toggleForm('deleteCategoryForm')">Delete Category</button>

    <!-- Delete Category Form (Hidden by default) -->
    <form id="deleteCategoryForm" class="position-absolute" style="display: none;">
        <!-- Your form fields for deleting a category go here -->
        <div class="form-group">
            <label for="deleteCategoryId">Category ID to Delete:</label>
            <input type="text" class="form-control" id="deleteCategoryId" name="deleteCategoryId" required>
        </div>
        <div class="form-group">
            <label for="deleteCategoryId">Category Name to Delete:</label>
            <input type="text" class="form-control" id="deleteCategoryId" name="deleteCategoryId" required>
        </div>

        <button type="submit" class="btn btn-danger">Delete Category</button>
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



