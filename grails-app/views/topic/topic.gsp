

<!DOCTYPE html>
<html lang="en">

<head>

    <g:render template="/template/navbar" />

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Linksharing</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet"/>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

    <script>



        $(document).ready(function() {
            $('#PostsDataTable, #SubUserDataTable').dataTable({
                "ordering": false,
                "bLengthChange": false,
                "paging": true,
                "lengthMenu": false,
                "pageLength": 2,
                "searching": false,
                "order": [[ 0, "asc" ]],
            });
        });


    </script>






</head>

<body>


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

                <g:render template="/template/sub_user_card" />


            </div>

            <div class="container col-sm-1">
            </div>


            <div class="container col-sm-5">

                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Posts : "${subscribedTopicList[0].topic.name}"</h5>
                </div>

                <g:render template="/template/all_posts" />


            </div>


        </div>

    </div>



</main>




</body>





</html>