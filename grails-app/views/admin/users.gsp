<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Linksharing</title>

</head>

<head>


    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap5.min.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap5.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</head>

<body>


<nav class="navbar navbar-expand-lg navbar-light"
     style="background-color: #06064b; padding: 20px 10px; height: 15vh; border-radius: 3px">
    <div class="container-fluid">

        <a class="navbar-brand" href="/dashboard"><h1 style="color: white;">Linksharing</h1></a>


        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse offset-2 justify-content-end" id="navbarNav">
            <form class="d-flex " role="search">
                <input class="form-control me-2 " type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-info" type="submit">Search</button>
            </form>

        </div>


        <div class="dropdown">


            <button class="btn btn-outline-info dropdown-toggle offset-2" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                ${user.username}
            </button>


            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Profile</a></li>

                <g:if test="${user.admin}">
                    <li><a class="dropdown-item" href="/admin/users">Users</a></li>
                    <li><a class="dropdown-item" href="#">Topics</a></li>
                    <li><a class="dropdown-item" href="#">Posts</a></li>

                </g:if>

                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="/logout">Logout</a></li>
            </ul>


            <div class="userProfilePhoto mt-3 offset-10">
                <label  class="form-label mt-1">
                    <g:img dir="images" file="${user.photo.substring(25)}" height = "36" width="40" style="border-radius: 40%;"/>
                </label>
            </div>


        </div>






    </div>
</nav>





<div class="container mt-4">


    <div class="row mb-3">


        <g:select name="n1" id="i1" class="form-select userActivationPicker" from="${['All Users','Active','Inactive']}" value="v1"/>


    </div>

    <table id="usersTable" class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Id</th>
            <th>Username</th>
            <th>Email</th>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Active</th>
            <th>Manage</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${userList}" var="item">

            <tr class="userRow isActive-${item.active}">
                <td>${item.id}</td>
                <td>${item.username}</td>
                <td>${item.email}</td>
                <td>${item.firstName}</td>
                <td>${item.lastName}</td>
                <g:if test = "${item.active}">
                    <td>Yes</td>
                </g:if>
                <g:else>
                    <td>No</td>
                </g:else>

                <td>
                    <g:if test ="${item.active}">
                        <a id="${item.id}" class="link-offset-2 link-offset-3-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover ActivationLink" >
                            Deactivate
                        </a>
                    </g:if>
                    <g:else>
                        <a id="${item.id}" class="link-offset-2 link-offset-3-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover ActivationLink" >
                            Activate
                        </a>
                    </g:else>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>


</div>





</body>


<script>
        $(document).ready(function() {
            $('#usersTable').DataTable({
                "lengthMenu": [5, 10, 30],
                "pageLength": 20
            });
        });

        $(document).ready(function() {
            $('.ActivationLink').click(function(event) {
                $.ajax({
                    url: "/admin/userActivation?userId="+this.id, success: function(response) {
                        // console.log(response)
                        window.location.reload()
                    }
                });
            });
        });

        $(document).ready(function(){
            $(".userActivationPicker").click(function(){

                if(this.value == 'Active'){
                    $(".isActive-true").show()
                    $(".isActive-false").hide()
                }
                else if(this.value == 'Inactive'){
                    $(".isActive-false").show()
                    $(".isActive-true").hide()
                }
                else{
                    $(".isActive-true").show()
                    $(".isActive-false").show()
                }

            });
        });

</script>




</html>
