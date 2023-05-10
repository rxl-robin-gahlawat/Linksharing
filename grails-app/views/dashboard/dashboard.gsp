

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
                                    <a href="#" class="card-link col-sm-7" style="text-decoration: none">${subsMap["subsCount"]}</a>
                                    <a href="#" class="card-link col-sm-5" style="text-decoration: none">${subsMap["topicsCount"]}</a>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>


                <g:render template="/template/subscriptionList" />
                <g:render template="/template/trendingTopicsList" />

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