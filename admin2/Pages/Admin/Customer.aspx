<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="admin2.Pages.Admin.Customer" %>

<%@ Register Src="~/Pages/Admin/Nevbar.ascx" TagPrefix="uc1" TagName="Nevbar" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Customer Account Details</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <uc1:Nevbar runat="server" ID="Nevbar" />
    <div class="container mt-5">
        <h2>Customer Account Details</h2>

        <!-- Find Customer Form -->
        <form runat="server" method="post">
            <div class="form-group">
                <label for="customer_name">Customer Name:</label>
                <input type="text" class="form-control" id="customer_name" name="customer_name" required>
            </div>

            <div class="form-group">
                <label for="customer_email">Customer Email:</label>
                <input type="email" class="form-control" id="customer_email" name="customer_email" required>
            </div>

            <div class="form-group">
                <label for="customer_mobile">Customer Mobile Number:</label>
                <input type="tel" class="form-control" id="customer_mobile" name="customer_mobile" required>
            </div>

            <button type="submit" class="btn btn-primary">Find Customer</button>
        </form>
    </div>

    <!-- Display Result Table -->
    <div class="mt-3 p-5">
        <h3>Search Result</h3>
        <table class="table ">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Phone</th>
                </tr>
            </thead>
            <tbody runat="server" id="resultTableBody">
                <%-- C# code will populate the table rows here --%>
            </tbody>
        </table>
    </div>

    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Include any necessary scripts here -->
</body>
</html>
