

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Linksharing</title>



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




                <g:render template="/template/user_card" />
                <g:render template="/template/subscriptionList" />
                <g:render template="/template/trendingTopicsList" />

            </div>

            <div class="container col-sm-1">
            </div>


            <div class="container col-sm-5">


                <g:render template="/template/inbox" />


            </div>


        </div>

    </div>



</main>
</body>
</html>