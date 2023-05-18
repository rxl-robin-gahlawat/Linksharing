

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Linksharing</title>

</head>

<body>

<g:render template="/template/navbar" />

<main>


    <div class="container-fluid p-5">

        <div class="row">
            <div class="container col-sm-6 mb-2">

                <!-- Topic Details Card -->

                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Topic : "${subscribedTopicList[0].topic.name}"</h5>
                </div>

                <g:render template="/template/subscriptionList" />

                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Users : "${subscribedTopicList[0].topic.name}"</h5>
                </div>

%{--                <g:each in="${subsInfoList}" var="userInfo">--}%

%{--                    <p>${userInfo["user"].username}</p>--}%

                    <g:render template="/template/user_card" />

%{--                </g:each>--}%




            </div>

            <div class="container col-sm-1">
            </div>


            <div class="container col-sm-5">


                <g:render template="/template/all_posts" />


            </div>


        </div>

    </div>



</main>




</body>





</html>