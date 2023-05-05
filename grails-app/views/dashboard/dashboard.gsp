

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!--

    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }


    header {
        background-color: #8B0000;
        color: #fff;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 20px;
    }

    .search-box {
        display: flex;
        align-items: center;
    }

    .search-box input[type="text"] {
        padding: 10px;
        border: none;
        border-radius: 5px;
        margin-right: 10px;
    }

    .search-box button {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #0077b6;
        color: #fff;
        cursor: pointer;
    }

    main {
        display: flex;
        margin: 20px;
    }

    .sidebar-left {
        flex: 1;
        margin-right: 20px;
    }

    .sidebar-left h2 {
        margin-bottom: 10px;
    }

    .status-container {
        background-color: #eee;
        padding: 10px;
        margin-bottom: 10px;
    }

    .top-posts {
        display: flex;
        flex-direction: column;
    }

    .post {
        background-color: #eee;
        padding: 10px;
        margin-bottom: 10px;
    }

    .post h3 {
        margin-top: 0;
    }

    .sidebar-right {
        flex: 1;
        margin-left: 20px;
    }

    .login-form, .register-form {
        background-color: #eee;
        padding: 10px;
        margin-bottom: 20px;
    }

    .login-form h2, .register-form h2 {
        margin-top: 0;
        margin-bottom: 10px;
    }

    .login-form form, .register-form form {
        display: flex;
        flex-direction: column;
    }

    .login-form label, .register-form label {
        margin-bottom: 5px;
    }

    .login-form input[type="text"], .login-form input[type="password"], .register-form input[type="text"], .register-form input[type="password"], .register-form input[type="email"], .register-form input[type="file"] {
        padding: 10px;
        border: none;
        border-radius: 5px;
        margin-bottom: 10px;
    }

    .login-form .form-links {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 10px;
    }

    .login-form .form-links a {
        color: #0077b6;
        text-decoration: none;
    }

    .login-form .form-links a:hover {
        text-decoration: underline;
    }

    .login-form input[type="submit"], .register-form input[type="submit"] {
        padding: 10px;
        border: none;
        border-radius: 5px;
        background-color: #0077b6;
        color: #fff;
        cursor: pointer;
    }

    .register-form input[type="file"] {
        padding: 5px 0;
        margin-bottom: 0;
    }

    </style>
-->

</head>

<head>
    <title>Home Page</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>

<g:render template="/template/navbar" />


<main>

%{--    <div class="sidebar-left">--}%

%{--        <h2>Recent Shares</h2>--}%
%{--        <div class="status-container">--}%
%{--            <p>Example status update</p>--}%
%{--            <p>Another example status update</p>--}%
%{--        </div>--}%

%{--        <h2>Top Posts</h2>--}%
%{--        <div class="top-posts">--}%
%{--            <div class="post">--}%
%{--                <h3>Example post title</h3>--}%
%{--                <p>Example post content</p>--}%
%{--            </div>--}%
%{--            <div class="post">--}%
%{--                <h3>Another example post title</h3>--}%
%{--                <p>Another example post content</p>--}%
%{--            </div>--}%
%{--        </div>--}%

%{--    </div>--}%


    <div class="container-fluid p-4">

        <div class="row">
            <div class="container col-sm-5 mb-2">
                <div class="card p-2">
                    <div class="container-fluid">
                        <div class="row d-flex align-items-center">
                            <div class="col-sm-4 ">
                                <img class="card-img-top userImage" src="${resource(dir:'images',file:'user.svg')}" alt="Card image cap">
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-7">
                                <div class="card-block">
                                    <h5 class="card-title">User Name</h5>
                                </div>
                                <div class="card-block">
                                    <p>@Name</p>
                                </div>
                                <div class="card-block d-flex">
                                    <p class="col-sm-7"> subscriptions</p>
                                    <p class="col-sm-5">topics</p>
                                </div>
                                <div class="card-block d-flex">
                                    <a href="#" class="card-link col-sm-7">no</a>
                                    <a href="#" class="card-link col-sm-5">no</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Subcriptions</h5>
                    <p class="col-sm-3"></p>
                    <a class="col-sm-3"> View All</a>
                </div>
                <div class="card p-1 bg-success bg-opacity-50">
                    <div class="container-fluid">
                        <div class="row d-flex align-items-center">
                            <div class="col-sm-2 ">
                                <img class="card-img-top userImageSmall" src="${resource(dir:'images',file:'user.svg')}" alt="Card image cap">
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-8">
                                <div class="card-block">
                                    <h4 class="card-title">User Name</h4>
                                </div>
                                <div class="card-block d-flex">
                                    <p class="col-sm-4">@Name</p>
                                    <p class="col-sm-6"> subscriptions</p>
                                    <p class="col-sm-2">topics</p>
                                </div>
                                <div class="card-block d-flex">
                                    <a href="#" class="card-link col-sm-6">UnSuscribe</a>
                                    <a href="#" class="card-link col-sm-3">no</a>
                                    <a href="#" class="card-link col-sm-3">no</a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="d-inline-flex justify-content-end">

                                <select class="selectpicker show-menu-arrow col-sm-3 me-2">
                                    <option>Mustard</option>
                                    <option>Ketchup</option>
                                    <option>Relish</option>
                                </select>
                                <a class=""><img src="${resource(dir: "images", file: "sendInvite.svg")}"/></a>
                            </div>



                        </div>
                    </div>
                </div>


            </div>

            <div class="container col-sm-2">



            </div>

            <div class="container col-sm-5">

                <h1>Inbox comes here</h1>


            </div>
        </div>

    </div>



</main>
</body>
</html>