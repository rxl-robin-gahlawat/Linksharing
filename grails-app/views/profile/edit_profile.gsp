

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


%{--                <div class="card p-2" style="background-color: #eee">--}%
%{--                    <div class="container-fluid">--}%
%{--                        <div class="row d-flex align-items-center">--}%
%{--                            <div class="col-sm-4 ">--}%
%{--                                <p>a</p>--}%
%{--                            </div>--}%

%{--                            <div class="col-sm-7">--}%
%{--                                <p>b</p>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%

%{--                    <div class="container-fluid">--}%
%{--                        <div class="row d-flex align-items-center">--}%
%{--                            <div class="col-sm-4 ">--}%
%{--                                <p>c</p>--}%
%{--                            </div>--}%

%{--                            <div class="col-sm-7">--}%
%{--                                <p>d</p>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%


            </div>

            <!------------------------------------------------------------------------------->


            <div class="container col-sm-1">
            </div>

            <!--------------------------------------------------------------------------------->
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