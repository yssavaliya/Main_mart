<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Mart</title>
    <!-- Add Bootstrap CSS (you can use a CDN or include the local file) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 56px; /* Adjust this value based on the height of your navbar */
        }

        @media (max-width: 767.98px) {
            body {
                padding-top: 0;
            }
        }

        .navbar-brand img {
            height: 20px;
        }

        .navbar-nav {
            text-align: center;
        }

        .navbar-nav .nav-item {
            margin-bottom: 5px;
        }

        .navbar-nav .nav-link {
            display: block;
            padding: 10px;
            text-align: center;
        }

        .navbar-nav .nav-item.dropdown:hover .dropdown-menu {
            display: block;
        }

        .navbar-nav .dropdown-item:hover {
            background-color: #aaa; /* Add your desired hover background color */
            color: #000; /* Add your desired hover text color */
        }

        .navbar-toggler {
            margin-top: 10px;
        }
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <h4 style="color:white; margin-right:10px">
            Main Mart
        </h4>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="Home.aspx">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="Category.aspx" id="navbarDropdownCategories" role="button"
                        aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-th"></i> Categories
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Product.aspx">
                        <i class="fas fa-box"></i> Products
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Customer.aspx">
                        <i class="fas fa-user"></i> Customer Account
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Coupen.aspx">
                        <i class="fas fa-ticket-alt"></i> Coupon Codes
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Voucher.aspx">
                        <i class="fas fa-gift"></i> Vouchers
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="OrderStatus.aspx">
                        <i class="fas fa-shopping-cart"></i> Orders
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Stock.aspx">
                        <i class="fas fa-warehouse"></i> Stock Management
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Content goes here -->

    <!-- Add Bootstrap JS and dependencies (you can use a CDN or include the local files) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>

</body>

</html>

