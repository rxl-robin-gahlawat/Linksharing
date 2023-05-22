

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
            $('#EditPageTopicsDataTable').dataTable({
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

    <div class="container-fluid p-5">

        <div class="row">

            <div class="container col-sm-6 mb-2">

                <g:render template="/template/user_card" />



                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Topics</h5>

                    <p class="col-sm-3"></p>
                </div>

                <g:render template="/template/topic" />


            </div>



            <div class="container col-sm-1">
            </div>

            <div class="container col-sm-5">

                <div class="card" style="background-color:#eee ">
                    <div class="card-header">
                        <h4>Profile</h4>
                    </div>

                    <div class="card-body">

                        <g:uploadForm controller="profile" action="updateUserDetails">


                            <div class="form-group">
                                <label for="firstname">First Name:</label>
                                <input type="text" class="form-control" id="firstname" name="firstname" />
                            </div>

                            <div class="form-group">
                                <label for="lastname">Last Name:</label>
                                <input type="text" class="form-control" id="lastname" name="lastname" />
                            </div>


                            <div class="form-group">
                                <label for="username">Username:</label>
                                <input type="text" class="form-control" id="username" name="username" >
                            </div>



                            <div class="form-group">
                                <label for="photo">Photo:</label>
                                <input type="file" class="form-control" id="photo" name="photo">
                            </div>

                            <div class="mt-3">
                                <input type="submit" class="btn btn-primary offset-9" value="Update">
                            </div>



                        </g:uploadForm>



                    </div>
                </div>
                <br>
                <div class="card" style="background-color:#eee ">
                    <div class="card-header">
                        <h4>Update Password</h4>
                    </div>

                    <div class="card-body">

                        <g:form controller="profile" action="updatePassword">
                            <div class="form-group">
                                <label for="register_password">Password:</label>
                                <input type="password" class="form-control" id="register_password" name="password" required/>
                            </div>

                            <div class="form-group">
                                <label for="confirmpassword">Confirm Password:</label>
                                <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" required/>
                            </div>

                            <div class="mt-3">
                                <input type="submit" class="btn btn-primary offset-9" value="Update">
                            </div>

                        </g:form>


                    </div>
                </div>

            </div>

        </div>

    </div>




</div>

</body>
</html>