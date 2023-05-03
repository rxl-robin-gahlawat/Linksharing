


<head>


    <link rel="stylesheet" type="text/css" href="${resource(dir:"css", file:"header.css")}">



    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">


    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>



</head>

<header class="header-properties">

    <h1>Linksharing</h1>

    <div class="search-box">
        <input type="text" placeholder="Search...">
        <button>Search</button>
    </div>


    <!--

    <div class="search-box">
        <g:form>
            <button>Create Topic</button>
        </g:form>
    </div>


    -->



    <div class="container">

        <!-- Button to Open the Modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
            Create Topic
        </button>


        <!-- The Modal -->

        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">

                        <h4 class="modal-title">Create Topic</h4>
                        <label>hhh</label>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>


                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">



                        <div class="content">
                            <form method="post" action="/submit_post">
                                <label for="title">Title:</label>
                                <input type="text" id="title" name="title" required>
                                <br>
                                <label for="visibility">visibility:</label>

                                <select class= "custom_class1" id="visibility">
                                    <option class = "custom_class1" value="Public" selected>Public</option>
                                    <option class="custom_class1" value="Private">Private</option>
                                </select>

                                <br>
                                <button type="submit">Submit</button>
                            </form>
                        </div>


                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>



    </div>














    <div class="search-box">
        <g:form>
            <button>Invite</button>
        </g:form>
    </div>


    <select class= "select-box" id="visibility1">
        <option value="username" selected>Username</option>
        <option value="profile">Profile</option>
        <option value="users">Users</option>
        <option value="topic">Topics</option>
        <option value="posts">Posts</option>
        <option value="posts">Logout</option>
    </select>



    <div class="search-box">
        <g:form controller="logout" action="index">
            <button>Logout</button>
        </g:form>
    </div>



</header>

