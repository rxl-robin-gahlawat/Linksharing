<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>




</head>

<body>
<div class="bg-img height: 100vh;">

    <!--Navigation bar-->

    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #06064b; padding: 20px 10px; height: 15vh; border-radius: 3px">
        <div class="container-fluid">

            <a class="navbar-brand" href="#"><h1 style="color: white;">Linksharing</h1></a>


            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse offset-2" id="navbarNav">

                <form class="d-flex " role="search">
                    <input class="form-control me-2 " type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-info" type="submit">Search</button>
                </form>


                <ul class="navbar-nav ">

                    <!-- Create topic Modal -->
                    <li class="nav-item">
                        <!-- Button to trigger modal -->
                        <button type="button" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"
                                data-bs-target="#createTopicModal">
                            <g:img dir="images" file="Icons/topic_icon.png" height = "34" width="40"/>
                        </button>
                        <!-- Create Topic Modal -->
                        <div class="modal fade" id="createTopicModal" tabindex="-1"
                             aria-labelledby="createTopicModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- modal content -->
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="createTopicModalLabel">Create Topic</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                        <div class="modal-body">
                                            <g:form controller="dashboard" action="createTopic">
                                                <div class="mb-3">
                                                    <label for="topicName" class="form-label">Name*</label>
                                                    <input type="text" class="form-control" id="topicName" name="topicName" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="visibility" class="form-label">Visibility</label>
                                                    <select class="form-select" id="visibility" name="visibility">
                                                        <option value="public">Public</option>
                                                        <option value="private">Private</option>
                                                    </select>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Create</button>
                                                </div>

                                            </g:form>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </li>






                    <!-- Create Link Resource Modal -->


                    <li class="nav-item">
                        <!-- Button to trigger modal id="createLinkResourceModalDropdownButton"-->
                        <button type="button" id="createLinkResourceModalDropdownButton" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"
                                data-bs-target="#linkResourceModal">
                            <g:img dir="images" file="Icons/link_icon.png" height = "34" width="40"/>
                        </button>

                        <!-- Link Resource Modal -->
                        <div class="modal fade" id="linkResourceModal" tabindex="-1"
                             aria-labelledby="createTopicModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- modal content -->
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="linkResourceModalLabel">Share Link Resource</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">

                                        <g:form controller="dashboard" action="createLinkResource">

                                            <div class="mb-3">
                                                <label for="linkResourceModal" class="form-label">Link*</label>
                                                <input type="text" class="form-control" id="resourceLink" name="resourceLink" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="linkResourceModal" class="form-label">Description*</label>
%{--                                                <input type="textarea" height="20" class="form-control" id="linkResourceDescription" name="linkResourceDescription">--}%
                                                <textarea id="w3review" name="resourceDescription" rows="4" cols="44" required></textarea>

                                            </div>



                                            <div class="mb-3">
                                                <label for="linkResourceModal" class="form-label">Topic</label>

                                                <select class="form-select" id="availableTopics" name="availableTopic">
                                                </select>

                                            </div>

                                            <div class="modal-footer">
                                                <button id = "closeLinkResourceButton" type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Share</button>
                                            </div>

                                        </g:form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>




%{--                    <!-- Create Resource Link Modal -->--}%
%{--                    <li class="nav-item">--}%
%{--                        <!-- Button to trigger modal -->--}%
%{--                        <button type="button" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"--}%
%{--                                data-bs-target="#createLinkResourceModal">--}%
%{--                            <g:img dir="images" file="Icons/link_icon.png" height = "36" width="40" style="border-radius: 3px;"/>--}%
%{--                        </button>--}%

%{--                        <!-- Create LinkResource Modal -->--}%
%{--                        <div class="modal fade" id="createLinkResourceModal" tabindex="-1"--}%
%{--                             aria-labelledby="createLinkResourceModalLabel" aria-hidden="true">--}%
%{--                            <div class="modal-dialog">--}%
%{--                                <div class="modal-content">--}%
%{--                                    <!-- Modal Header -->--}%
%{--                                    <div class="modal-header">--}%
%{--                                        <h5 class="modal-title" id="createLinkResourceLabel">Create Resource</h5>--}%
%{--                                        <button type="button" class="btn-close" data-bs-dismiss="modal"--}%
%{--                                                aria-label="Close"></button>--}%
%{--                                    </div>--}%
%{--                                    <!-- Modal Body -->--}%
%{--                                    <div class="modal-body">--}%
%{--                                        <form>--}%
%{--                                            <div class="mb-3">--}%
%{--                                                <label for="userEmail" class="form-label">Resource*:</label>--}%
%{--                                                <input type="text" class="form-control" id="resource">--}%
%{--                                            </div>--}%
%{--                                            <div class="mb-3">--}%
%{--                                                <label for="shareTopic" class="form-label">Topic*:</label>--}%
%{--                                                <select class="form-select" id="ResourceTopic">--}%
%{--                                                    <option><a href="#">Topic1</a></option>--}%
%{--                                                    <option><a href="#">Topic2</a></option>--}%
%{--                                                    <option><a href="#">Topic3</a></option>--}%
%{--                                                    <option><a href="#">Topic4</a></option>--}%

%{--                                                </select>--}%
%{--                                            </div>--}%
%{--                                        </form>--}%
%{--                                    </div>--}%
%{--                                    <!-- Modal Footer -->--}%
%{--                                    <div class="modal-footer">--}%
%{--                                        <button type="button" class="btn btn-secondary"--}%
%{--                                                data-bs-dismiss="modal">Cancel</button>--}%
%{--                                        <button type="button" class="btn btn-primary">Invite</button>--}%

%{--                                    </div>--}%
%{--                                </div>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </li>--}%



                    <!-- Create Resource Document Modal -->
                    <li class="nav-item">
                        <!-- Button to trigger modal -->
                        <button type="button" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"
                                data-bs-target="#createResourceModal">
                            <g:img dir="images" file="Icons/doc_icon.png" height = "36" width="40" style="border-radius: 3px;"/>
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="createResourceModal1" tabindex="-1"
                             aria-labelledby="createResourceModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="createResourceLabel1">Create Resource</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <!-- Modal Body -->
                                    <div class="modal-body">
                                        <form>
                                            <div class="mb-3">
                                                <label for="userEmail" class="form-label">Resource*:</label>
                                                <input type="text" class="form-control" id="resource1">
                                            </div>
                                            <div class="mb-3">
                                                <label for="shareTopic" class="form-label">Topic*:</label>
                                                <select class="form-select" id="ResourceTopic1">
                                                    <option><a href="#">Topic1</a></option>
                                                    <option><a href="#">Topic2</a></option>
                                                    <option><a href="#">Topic3</a></option>
                                                    <option><a href="#">Topic4</a></option>

                                                </select>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- Modal Footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Cancel</button>
                                        <button type="button" class="btn btn-primary">Invite</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>






                    <!-- Send Invitation Modal -->
                    <li class="nav-item">
                        <!-- Button to trigger modal -->
                        <button type="button" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"
                                data-bs-target="#sendInvitationModal">
                            <g:img dir="images" file="invite.png" height = "34" width="40" style="border-radius: 3px;"/>
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="sendInvitationModal" tabindex="-1"
                             aria-labelledby="sendInvitationModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="sendInvitationModalLabel">Send Invitation</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <!-- Modal Body -->
                                    <div class="modal-body">
                                        <form>
                                            <div class="mb-3">
                                                <label for="userEmail" class="form-label">Email*:</label>
                                                <input type="text" class="form-control" id="userEmail">
                                            </div>
                                            <div class="mb-3">
                                                <label for="shareTopic" class="form-label">Topic*:</label>
                                                <select class="form-select" id="shareTopic">
                                                    <option><a href="#">Topic1</a></option>
                                                    <option><a href="#">Topic2</a></option>
                                                </select>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- Modal Footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Cancel</button>
                                        <button type="button" class="btn btn-primary">Invite</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>



                    <li class="nav-item">

                        <div class="btn-group offset-1">
                            <button type="button" class="btn btn-outline-info  mt-3 dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" >
                                User
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another</a></li>
                                <li><a class="dropdown-item" href="#">else </a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="/logout">Logout</a></li>
                            </ul>
                        </div>

                    </li>


                    <li class="nav-item">
                        <!-- User profile section -->
                        <div class="userProfilePhoto mt-3 offset-10">
                            <label  class="form-label mt-2">
                                %{--                                <a href="#"><img src="images/userProfilePhoto.svg" height="30" width="30"></a>--}%
                                <a style="color: red">Photo</a>
                            </label>
                        </div>
                    </li>

                </ul>

            </div>
        </div>
    </nav>


</div>


</body>

<script>

    $(document).ready(function(){
        $("#createLinkResourceModalDropdownButton").click(function(){

            var selectElement = document.getElementById("availableTopics")
            selectElement.options.length = 0;
            $.ajax({url: "/dashboard/loadSubscribedTopics", success: function(result){
                    for(let i =0; i< result.key.length; ++i){
                            var option = document.createElement("option");
                            option.text = result.key[i];
                            selectElement.add(option)
                    }
                }});
        });
    });


</script>

</html>