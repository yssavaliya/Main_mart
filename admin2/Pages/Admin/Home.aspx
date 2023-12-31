<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="admin2.Pages.Admin.Home" %>

<%@ Register Src="~/Pages/Admin/Nevbar.ascx" TagPrefix="uc1" TagName="Nevbar" %>

<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Home</title>
        <!-- Include Bootstrap CSS (you can use a CDN or include the local files) -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
        <!-- Include Font Awesome (you can use a CDN or include the local files) -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
                body{
                 margin-top:10px;
                 background:#FAFAFA;
                }
                .order-card {
                    color: #fff;
                }
                
                .bg-c-blue {
                    background: linear-gradient(45deg,#4099ff,#73b4ff);
                }
                
                .bg-c-green {
                    background: linear-gradient(45deg,#2ed8b6,#59e0c5);
                }
                
                .bg-c-yellow {
                    background: linear-gradient(45deg,#FFB64D,#ffcb80);
                }
                
                .bg-c-pink {
                    background: linear-gradient(45deg,#FF5370,#ff869a);
                }
                .card {
                    border-radius: 5px;
                    -webkit-box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
                    box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
                    border: none;
                    margin-bottom: 30px;
                    -webkit-transition: all 0.3s ease-in-out;
                    transition: all 0.3s ease-in-out;
                }
                
                .card .card-block {
                    padding: 30px;
                }
                
                .order-card i {
                    font-size: 26px;
                }
                
                .f-left {
                    float: left;
                }
                
                .f-right {
                    float: right;
                }
    </style>
     <!-- Bootstrap CSS -->
   
    <script type="text/javascript">
        function drawChart(chartData) {
            var ctx = document.getElementById('myChart').getContext('2d');

            var labels = chartData.map(item => item.Product);
            var data = chartData.map(item => item.Quantity);

            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Quantity',
                        data: data,
                        backgroundColor: 'rgba(0, 0, 0, 0.5)',
                        borderColor: 'rgba(0, 0, 0, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }
    </script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" integrity="sha384-r7k34FvEnlCT4R5uGr8aFbD9Ll3f+9Jqxj51m4WOsIIJdtd+yr9PaHdj47W9F8bm" crossorigin="anonymous"/>
</head>
<body>
       <div class="p-4"></div><!--This Div is to insert the space from top-->
<div id="navbarContainer">
    <uc1:Nevbar runat="server" id="Nevbar1" />
</div>
    <div class="container mt-2">

    <div class="card shadow-lg">
  <div class="card-body text-center">
 <h2>Welcome to Main Mart</h2>   
  </div>
          </div>

</div>
     <!--Order card-->
<div class="container mt-2">
    <div class="row">
        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-blue order-card shadow-lg">
                <div class="card-block">
                    <h6 class="m-b-20">Orders Received</h6>
                    <h2 class="text-right"><i class="fa fa-cart-plus f-left"></i><span id="ordersReceived" runat="server">486</span></h2>
                    <p class="m-b-0">Completed Orders<span class="f-right"><span id="completedOrdersSpan" runat="server">351</span></span></p>

                </div>
            </div>
        </div>
        <!--Order card-->

        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-green order-card shadow-lg">
                <div class="card-block">
                    <h6 class="m-b-20">Customer Received</h6>
                    <h2 class="text-right"><i class="fa fa-rocket f-left"></i><span id="customerReceived" runat="server">486</span></h2>
                    <p class="m-b-0">Completed Orders<span class="f-right">351</span></p>
                </div>
            </div>
        </div>
<!--Order card-->
        <div class="col-md-4 col-xl-3 ">
            <div class="card bg-c-yellow order-card shadow-lg">
                <div class="card-block">
                    <h6 class="m-b-20">Stock Received</h6>
                    <h2 class="text-right"><i class="fa fa-refresh f-left"></i><span>8</span></h2>
                    <p class="m-b-0">Completed Orders<span class="f-right">351</span></p>
                </div>
            </div>
        </div>
<!--Order card-->
        
        <div class="col-md-4 col-xl-3">
            <div class="card bg-c-pink order-card shadow-lg">
                <div class="card-block">
                    <h6 class="m-b-20">Payment Received</h6>
                    <h2 class="text-right"><i class="fa fa-credit-card f-left"></i><span>486</span></h2>
                    <p class="m-b-0">Completed Orders<span class="f-right">351</span></p>
                </div>
            </div>
        </div>
	</div>
</div>
      <%--charts--%>
  <div class="container">
<div class="row">
  <div class="col">
    <%--Chart orders--%>
          <form id="form1" runat="server">

 <div class="container mt-2">
      <div class="row">
          <div class="col-md-9 col-xl-9">
              <div class="card bg-c-blue order-card shadow-lg"style="width:100%" >
                  <div class="card-block">
                      <h6 class="m-b-20">Orders </h6>
                      <!-- Canvas for Combined Monthly and Yearly Chart -->
                      <canvas  id="myChart"></canvas>
                  </div>
              </div>
          </div>
      </div>
  </div>

<script>
    // Load the navbar into the specified container
    $(function () {
        $("#navbarContainer").load("Nevbar.ascx");
    });
</script>



       


       
    </form>

<!-- Include Bootstrap JS and dependencies (you can use a CDN or include the local files) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</body>
</html>