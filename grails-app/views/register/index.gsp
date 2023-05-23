


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>

<body>


<g:if test="${flash.message}">

    <div class="toast show position-fixed top-0 start-50 translate-middle-x" style="z-index: 9999; background-color: red;">
        <div class="toast-header" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
            <strong class="me-auto">${flash.message}</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
        </div>
    </div>
    </div>


</g:if>


<div class="bg-img height: 100vh;">

    <nav class="navbar navbar-expand-lg navbar-light"
         style="background-color: #06064b; padding: 20px 10px; height: 15vh; border-radius: 3px">
        <div class="container-fluid">

            <a class="navbar-brand" href="/login"><h1 style="color: white;">Linksharing</h1></a>


            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

%{--            <div class="collapse navbar-collapse offset-2 justify-content-end" id="navbarNav">--}%
%{--                <form class="d-flex " role="search">--}%
%{--                    <input class="form-control me-2 " type="search" placeholder="Search" aria-label="Search">--}%
%{--                    <button class="btn btn-outline-info" type="submit">Search</button>--}%
%{--                </form>--}%

%{--            </div>--}%

        </div>
    </nav>

</div>


<div>




    <div class="container-fluid p-5">

        <div class="row">

            <div class="container col-sm-6 mb-2">

                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Recent Shares</h5>

                    <p class="col-sm-3"></p>
                    <a class="col-sm-3" style="text-decoration: none">View All</a>
                </div>


                <g:render template="/template/recent_posts" />


                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Top Posts</h5>

                    <p class="col-sm-3"></p>
                    <a class="col-sm-3" style="text-decoration: none">View All</a>
                </div>




                <g:render template="/template/top_posts" />


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
                        <h2>Login</h2>
                    </div>

                    <div class="card-body">
                        <g:form controller="login" action="loginUser">
                            <div class="form-group">
                                <label for="email_login">Email/Username</label>
                                <input type="text" class="form-control" id="email_login" name="email" required>
                            </div>

                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>

                            <div class="mt-3">
                                <a href="/login/forgotPassword" class="float-right" style="text-decoration: none">Forgot password?</a>
                                <button type="submit" class="btn btn-primary offset-6">Login</button>
                            </div>
                        </g:form>
                    </div>
                </div>
                <br>
                <div class="card" style="background-color:#eee ">
                    <div class="card-header">
                        <h2>Register</h2>
                    </div>

                    <div class="card-body">

                        <g:uploadForm controller="register" action="registerUser">


                            <div class="form-group">
                                <label for="firstname">First Name:</label>
                                <input type="text" class="form-control" id="firstname" name="firstname"/>
                            </div>

                            <div class="form-group">
                                <label for="lastname">Last Name:</label>
                                <input type="text" class="form-control" id="lastname" name="lastname"/>
                            </div>

                            <div style="color: red" id="emailmsg"></div>


                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>

                            <div style="color: red" id="usernamemsg"></div>


                            <div class="form-group">
                                <label for="username" >Username:</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>

                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" class="form-control" id="register_password" name="password" required/>
                            </div>

                            <div class="form-group">
                                <label for="confirm_password">Confirm Password:</label>
                                <input type="password" class="form-control" id="confirm_password" name="confirm_password" required/>
                            </div>

                            <div style="color: red" id="message"></div>

                            <div class="form-group">
                                <label for="photo">Photo:</label>
                                <input type="file" class="form-control" id="photo" name="photo">
                            </div>

                            <div class="mt-3">
                                <input type="submit" id="registerBtn" class="btn btn-primary offset-9" value="Register">
                            </div>



                        </g:uploadForm>

                    </div>
                </div>

            </div>

        </div>

    </div>

</div>

</body>


<script>




    // AJAX to check email existence
    $(document).ready(function() {
        var delay = 10; // Delay in milliseconds
        var timer;

        $('#email').on('keyup', function() {
            console.log("started...")
            clearTimeout(timer);

            timer = setTimeout(function() {
                var email = $('#email').val().trim();

                $.ajax({url: "/register/checkUniqueEmail?email="+email, success: function(result){
                        console.log(result)

                        if (result=="false") {
                            $('#emailmsg').text('');
                            document.getElementById("registerBtn").disabled = false;
                        }
                        else {
                            $('#emailmsg').text('* Email already in use.');
                            document.getElementById("registerBtn").disabled = true;
                        }
                    }});

            }, delay);
        });
    });



    // AJAX to check user existence
    $(document).ready(function() {
        var delay = 10; // Delay in milliseconds
        var timer;

        $('#username').on('keyup', function() {
            console.log("started...")
            clearTimeout(timer);

            timer = setTimeout(function() {
                var username = $('#username').val().trim();

                $.ajax({url: "/register/checkUniqueUsername?username="+username, success: function(result){
                        console.log(result)

                        if (result=="false") {
                            $('#usernamemsg').text('');
                            document.getElementById("registerBtn").disabled = false;
                        }
                        else {
                            $('#usernamemsg').text('* Username already exists.');
                            document.getElementById("registerBtn").disabled = true;
                        }
                }});



            }, delay);
        });
    });


    // AJAX to check if password and confirm-password are correct.
    $(document).ready(function() {
        var delay = 100; // Delay in milliseconds
        var timer;

        $('#confirm_password').on('keyup', function() {
            clearTimeout(timer);

            timer = setTimeout(function() {
                var password = $('#register_password').val();
                var confirmPassword = $('#confirm_password').val();

                if (password !== confirmPassword) {
                    $('#message').text('* Password and Confirm Password do not match.');
                    document.getElementById("registerBtn").disabled = true;

                }
                else {
                    $('#message').text('');
                    document.getElementById("registerBtn").disabled = false;
                }
            }, delay);
        });
    });


    $(document).ready(function() {




    });




</script>

</html>

