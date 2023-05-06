

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>



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
                <div class="card p-1 bg-opacity-50">
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
                                    <a href="#" class="card-link col-sm-6">Unsuscribe</a>
                                    <a href="#" class="card-link col-sm-3">no</a>
                                    <a href="#" class="card-link col-sm-3">no</a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="d-inline-flex justify-content-end">

                                <select class="selectpicker show-menu-arrow col-sm-3 me-2">
                                    <option>Serious</option>
                                    <option>Non-serious</option>
                                    <option>Casual</option>
                                </select>

                                <select class="selectpicker show-menu-arrow col-sm-3 me-2">
                                    <option>Private</option>
                                    <option>Public</option>
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

                <h2>Inbox</h2>


            </div>
        </div>

    </div>



</main>
</body>
</html>