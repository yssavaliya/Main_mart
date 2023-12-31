<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Voucher.aspx.cs" Inherits="admin2.Pages.Admin.Voucher" %>

<%@ Register Src="~/Pages/Admin/Nevbar.ascx" TagPrefix="uc1" TagName="Nevbar" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Voucher Management</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
    <uc1:Nevbar runat="server" ID="Nevbar" />
    <div class="container mt-5 p-2">
        <div class="card shadow-lg ">
            <div class="card-header">
                <h2>Voucher Management</h2>
            </div>
            <div class="card-body">
                <form id="form1" runat="server">
                    <div class="container mt-5">
                        <!-- Voucher-specific fields -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="txtVoucherCode" class="form-label">Voucher Code:</label>
                                    <input type="text" class="form-control" id="txtVoucherCode" runat="server" />
                                </div>
                                <div class="mb-3">
                                    <label for="txtVoucherAmount" class="form-label">Voucher Amount:</label>
                                    <input type="number" class="form-control" id="txtVoucherAmount" runat="server" />
                                </div>
                                <div class="mb-3">
                                    <label for="txtVoucherExpiryDate" class="form-label">Expiry Date:</label>
                                    <input type="date" class="form-control" id="txtVoucherExpiryDate" runat="server" />
                                </div>
                                <button type="button" class="btn btn-primary" runat="server" onserverclick="btnAddVoucher_Click">Add Voucher</button>
                                <div class="mt-3">
                                    <asp:Label ID="lblVoucherFeedback" runat="server" ForeColor="Green" EnableViewState="false"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="txtSearchVoucherCode" class="form-label">Search Voucher:</label>
                                    <input type="text" class="form-control" id="txtSearchVoucherCode" runat="server" />
                                </div>
                                <button type="button" class="btn btn-success" runat="server" onserverclick="btnSearchVoucher_Click">Search Voucher</button>
                                <div class="mt-3">
                                    <asp:Label ID="lblVoucherDetails" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Bootstrap 5 JS and Popper.js links (required for Bootstrap components) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
