<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderStatus.aspx.cs" Inherits="admin2.Pages.Admin.OrderStatus" %>

<%@ Register Src="~/Pages/Admin/Nevbar.ascx" TagPrefix="uc1" TagName="Nevbar" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Order Management</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
    <form runat="server">
        <div class="container mt-5">
            <h2>Order Management</h2>
            <uc1:Nevbar runat="server" ID="Nevbar" />

            <div class="row">
                <!-- Update Order Status Form -->
                <div class="col-md-6 mb-4">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title">Update Order Status</h5>
                            <div class="mb-3">
                                <label for="txtOrderIdToUpdate" class="form-label">Order ID to Update:</label>
                                <input type="text" class="form-control" id="txtOrderIdToUpdate" runat="server" />
                            </div>
                            <div class="mb-3">
                                <label for="ddlUpdatedOrderStatus" class="form-label">Updated Order Status:</label>
                                <select class="form-select" id="ddlUpdatedOrderStatus" runat="server">
                                    <option value="Pending">Pending</option>
                                    <option value="Complete">Complete</option>
                                    <option value="Hold">Hold</option>
                                </select>
                            </div>
                            <asp:Button ID="btnUpdateOrderStatus" runat="server" Text="Update Order Status" CssClass="btn btn-primary" OnClick="btnUpdateOrderStatus_Click" />
                            <div class="mt-3">
                                <asp:Label ID="lblOrderStatusFeedback" runat="server" ForeColor="Green" EnableViewState="false"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Order Rejection Form -->
                <div class="col-md-6 mb-4">
                    <div class="card shadow">
                        <div class="card-body">
                            <h5 class="card-title">Reject Order</h5>
                            <div class="mb-3">
                                <label for="txtOrderIdToReject" class="form-label">Order ID to Reject:</label>
                                <input type="text" class="form-control" id="txtOrderIdToReject" runat="server" />
                            </div>
                            <div class="mb-3">
                                <label for="txtRejectionReason" class="form-label">Rejection Reason:</label>
                                <textarea class="form-control" id="txtRejectionReason" runat="server" rows="3"></textarea>
                            </div>
                            <asp:Button ID="btnRejectOrder" runat="server" Text="Reject Order" CssClass="btn btn-danger" OnClick="btnRejectOrder_Click" />
                            <div class="mt-3">
                                <asp:Label ID="lblOrderRejectionFeedback" runat="server" ForeColor="Red" EnableViewState="false"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
