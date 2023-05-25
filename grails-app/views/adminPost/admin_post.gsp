

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
            $('#AdminPostDataTable').dataTable({
                "ordering": true,
                "paging": true,
                "lengthMenu": [10, 20, 30, 40, 100],
                "pageLength": 10,
                "searching": true,
                "order": [[ 0, "asc" ]],


            });
        });


    </script>


</head>


<body>



<div>




    <div class="container mt-4">


        <div class="row mb-3">




        </div>

        <table id="AdminPostDataTable" class="table table-striped table-bordered">
            <thead>
            <tr>
%{--                <th>Id</th>--}%
                <th>Post</th>
                <th>Topic</th>
                <th>CreatedBy</th>
                <th>Description</th>
                <th>Date Created</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>

            <g:each in="${postList}" var="item">
                <tr >
%{--                    <td>${item.id}</td>--}%

                    <td>
                        <a href="/post?postId=${item.id}" style="text-decoration: none" >View Post</a>
                    </td>

                    <td>
                        <a href="/topic?topicId=${item.topic.id}" style="text-decoration: none" >${item.topic.name}</a>
                    </td>


                    <td>${item.createdBy.firstName} ${item.createdBy.lastName}</td>

                    <td class="resourceDescAdminPost">${item.description}</td>

                    <td>${item.dateCreated}</td>

                    <td>
                        <a href="/adminPost/deletePost?postId=${item.id}">
                            <button id ="${item.id}" class="btn btn-primary DeletionBtn">Delete</button>
                        </a>
                    </td>
                </tr>
            </g:each>



            </tbody>
        </table>


    </div>





</div>

</body>



<script>

    $(document).ready(function(){

        const paragraphs = document.querySelectorAll('.resourceDescAdminPost');
        paragraphs.forEach(paragraph => {
            const text = paragraph.innerHTML
            if (text.length > 60) {
                const truncatedText = text.substring(0, 60) + '...';
                paragraph.innerHTML = truncatedText;
            }

        })

    });

</script>




</html>



