

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


    <div class="container-fluid p-5">

        <div class="row">
            <div class="container col-sm-6 mb-2">

                <!-- User Details -->

                <div class="card p-2" style="background-color: #eee">
                    <div class="container-fluid" >
                        <div class="row d-flex align-items-center" >
                            <div class="col-sm-4 ">
                                <g:img dir="images" file="${user.photo.substring(25)}" height = "96" width="100" class="centered" />
                            </div>

                            <div class="col-sm-7">
                                <div class="card-block">
                                    <h5 class="card-title">${user.firstName} ${user.lastName} </h5>
                                </div>
                                <div class="card-block">
                                    <p>@${user.username}</p>
                                </div>
                                <div class="card-block d-flex">
                                    <p class="col-sm-7"> subscriptions</p>
                                    <p class="col-sm-5">topics</p>
                                </div>
                                <div class="card-block d-flex">
                                    <a href="#" class="card-link col-sm-7">${subsMap["subsCount"]}</a>
                                    <a href="#" class="card-link col-sm-5">${subsMap["topicsCount"]}</a>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>


                <!-- Subscriptions -->



                <g:render template="/template/subscriptionList" />




                <!-- Trending topics -->




                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Trending Topics</h5>
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



            <div class="container col-sm-1">


            </div>

            <div class="container col-sm-5">

                <h2>Inbox</h2>


            </div>


        </div>

    </div>



</main>
</body>
</html>