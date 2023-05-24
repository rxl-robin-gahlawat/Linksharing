
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

    <div id="fail-message" class="toast show position-fixed top-0 start-50 translate-middle-x mt-1" style="z-index: 9999; background-color: red;">
        <div class="toast-header" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
            <strong class="me-auto">${flash.message}</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
        </div>
    </div>
    </div>

</g:if>

<g:if test="${flash.successMessage}">

    <div id="success-message" class="toast show position-fixed top-0 start-50 translate-middle-x mt-1" style="z-index: 9999; background-color: #5ae017;">
        <div class="toast-header" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
            <strong class="me-auto">${flash.successMessage}</strong>
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

        </div>
    </nav>

</div>


<div>

    <div class="container-fluid p-5">

        <div class="row">
            <div class="container col-sm-6 mb-2">



                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Top Posts</h5>
                    <div class="col-sm-3">
                    <g:select name="timePicker" id="timePicker" class="timePicker form-select offset-10" from="${['Today','1 Week', '1 Month', '1 Year'] - ["${timeFrame}"]}" value="${timeFrame}"
                              noSelection="${['':timeFrame]}" />
                    </div>
                </div>
                <g:render template="/template/top_posts" />



                <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                    <h5 class="col-sm-6 text-white">Recent Shares</h5>

                    <p class="col-sm-3"></p>
                </div>
                <g:render template="/template/recent_posts" />

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

                            <div style="color: red" id="loginmsg"></div>

                            <div class="form-group">
                                <label for="email_login">Email/Username</label>
                                <input type="text" class="form-control" id="email_login" name="email" required>
                            </div>

                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>

                            <div>
                                <button type="submit" class="btn btn-primary mt-2 offset-5" id="loginBtn">Login</button>
                            </div>

                        </g:form>

                        <div class="nav-item">
                            <!-- Button to trigger modal -->
                            <a  style="text-decoration: none" id="ForgotPasswordDropdownButton" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"
                                data-bs-target="#ForgotPasswordModal">
                                Forgot Password?
                            </a>
                            <!-- Modal functionality -->
                            <div class="modal fade" id="ForgotPasswordModal" tabindex="-1"
                                 aria-labelledby="ForgotPasswordModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- modal content -->
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="Forgot PasswordModalLabel">Send Default Password</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <g:form controller="login" action="sendForgotPasswordMail">
                                                <div class="mb-3">
                                                    <label for="forgotPasswordEmail" class="form-label">Email*</label>
                                                    <input type="email" class="form-control" id="forgotPasswordEmail" name="forgotPasswordEmail" required>
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-bs-dismiss="modal">Close</button>
                                                    <button class="btn btn-primary">Send</button>
                                                </div>

                                            </g:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <br>
                <div class="card" style="background-color:#eee ">
                    <div class="card-header">
                        <h2>Register</h2>
                    </div>

                    <div class="card-body">

                        <g:uploadForm controller="register" action="registerUser">

                            <div style="color: red" id="registermsg"></div>

                            <div class="form-group">
                                <label for="firstname">First Name *</label>
                                <input type="text" class="form-control enableRegisterBtn" id="firstname" name="firstname" required/>
                            </div>

                            <div class="form-group">
                                <label for="lastname">Last Name </label>
                                <input type="text" class="form-control" id="lastname" name="lastname"/>
                            </div>

                            <div style="color: red" id="emailmsg"></div>


                            <div class="form-group">
                                <label for="email">Email *</label>
                                <input type="email" class="form-control enableRegisterBtn" id="email" name="email" required>
                            </div>

                            <div style="color: red" id="usernamemsg"></div>


                            <div class="form-group">
                                <label for="username" >Username *</label>
                                <input type="text" class="form-control enableRegisterBtn" id="username" name="username" required>
                            </div>

                            <div class="form-group">
                                <label for="password">Password *</label>
                                <input type="password" class="form-control enableRegisterBtn" id="register_password" name="password" required/>
                            </div>

                            <div class="form-group">
                                <label for="confirm_password">Confirm Password *</label>
                                <input type="password" class="form-control enableRegisterBtn" id="confirm_password" name="confirm_password" required/>
                            </div>

                            <div style="color: red" id="message"></div>

                            <div class="form-group">
                                <label for="photo">Photo:</label>
                                <input type="file" class="form-control" id="photo" name="photo" accept=".png, .jpg, .jpeg">
                            </div>

                            <div class="mt-3">
                                <input type="submit" id="registerBtn" class="btn btn-primary offset-5" value="Register" disabled>
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



    // AJAX to change visibility in subscribed topics
    $(document).ready(function(){
        $(".timePicker").click(function(){

            // $.ajax({url: "/login?timeFrame="+this.value, success: function(result){
            //         // window.location.reload();
            //     }});

            window.location.replace("/login?timeFrame="+this.value);


        });
    });



    // AJAX to check email existence
    $(document).ready(function() {
        var delay = 10; // Delay in milliseconds
        var timer;

        $('#email').on('keyup', function() {
            clearTimeout(timer);

            timer = setTimeout(function() {
                var email = $('#email').val().trim();

                $.ajax({url: "/register/checkUniqueEmail?email="+email, success: function(result){

                        if (result=="false") {
                            $('#emailmsg').text('');
                            // document.getElementById("registerBtn").disabled = false;
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
            clearTimeout(timer);

            timer = setTimeout(function() {
                var username = $('#username').val().trim();

                $.ajax({url: "/register/checkUniqueUsername?username="+username, success: function(result){

                        if (result=="false") {
                            $('#usernamemsg').text('');
                            // document.getElementById("registerBtn").disabled = false;
                        }
                        else {
                            $('#usernamemsg').text('* Username already exists.');
                            document.getElementById("registerBtn").disabled = true;
                        }
                }});



            }, delay);
        });
    });


    // Jquery to check if password and confirm-password are correct.
    $(document).ready(function() {
        var delay = 100; // Delay in milliseconds
        var timer;

        $('#confirm_password, #register_password').on('keyup', function() {
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
                    // document.getElementById("registerBtn").disabled = false;
                }
            }, delay);
        });
    });


    // Jquery to disable update button if register fields are emtpy
    $(document).ready(function() {

        const inputs = document.querySelectorAll('.enableRegisterBtn');
        inputs.forEach(input => {
            input.addEventListener('keyup', () => {
                const fname = document.getElementById("firstname")
                const email = document.getElementById("email")
                const uname = document.getElementById("username")
                const password = document.getElementById("register_password")
                const confirm_password = document.getElementById("confirm_password")



                if( fname.value.trim() != '' && email.value.trim() != '' && uname.value.trim() != '' && password.value.trim() != '' && confirm_password.value.trim() != '')
                    document.getElementById("registerBtn").disabled = false;
                else
                    document.getElementById("registerBtn").disabled = true;
            });
        });

    });


    // JQuery to handle input length in register form
    $(document).ready(function() {

        const inputs = document.querySelectorAll('#firstname, #lastname, #username, #email, #register_password, #confirm_password');
        inputs.forEach(input => {
            input.addEventListener('keyup', () => {
                const fname = document.getElementById("firstname")
                const lname = document.getElementById("lastname")
                const uname = document.getElementById("username")
                const email = document.getElementById("email")
                const register_password = document.getElementById("register_password")
                const confirm_password = document.getElementById("confirm_password")


                if(fname.value.trim().length>50 || lname.value.trim().length>50 || uname.value.trim().length>50 || email.value.trim().length>50 ||
                    register_password.value.trim().length>50 || confirm_password.value.trim().length>50 ){
                    document.getElementById("registerBtn").disabled = true;
                    $('#registermsg').text('* Size in input should be less than 50 alphabets');
                }
                else{
                    $('#registermsg').text('');
                }
            });
        });

    });


    $(document).ready(function() {
    });



    // JQuery to handle input length for login form
    $(document).ready(function() {
        const inputs = document.querySelectorAll('#email_login, #password');
        inputs.forEach(input => {
            input.addEventListener('keyup', () => {
                const email_login = document.getElementById("email_login")
                const pass = document.getElementById("password")

                if(email_login.value.trim().length>50 || pass.value.trim().length>50){
                    document.getElementById("loginBtn").disabled = true;
                    $('#loginmsg').text('* Size in input should be less than 50 alphabets');
                }
                else{
                    document.getElementById("loginBtn").disabled = false;
                    $('#loginmsg').text('');
                }
            });
        });

    });


    // To hide message after few seconds
    setTimeout(function() {
        var failMessage = document.getElementById("fail-message");
        failMessage.style.display = "none";

    }, 3000);
    setTimeout(function() {
        var successMessage = document.getElementById("success-message");
        successMessage.style.display = "none";

    }, 3000);





</script>

</html>

