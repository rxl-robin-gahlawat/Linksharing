<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Linksharing</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>



</head>

<body>

<g:if test="${flash.successMessage}">

    <div id="success-message" class="toast show position-fixed top-0 start-50 translate-middle-x mt-1" style="z-index: 9999; background-color: deepskyblue;">
        <div class="toast-header" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
            <strong class="me-auto">${flash.successMessage}</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
        </div>
    </div>
    </div>

</g:if>

<g:if test="${flash.failMessage}">

    <div id="fail-message" class="toast show position-fixed top-0 start-50 translate-middle-x mt-1" style="z-index: 9999; background-color: red;">
        <div class="toast-header" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
            <strong class="me-auto">${flash.failMessage}</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
        </div>
    </div>
    </div>

</g:if>

<g:if test="${flash.message}">

    <div id="message" class="toast show position-fixed top-0 start-50 translate-middle-x mt-1" style="z-index: 9999; background-color: #838386;">
        <div class="toast-header" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
            <strong class="me-auto">${flash.message}</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
        </div>
    </div>
    </div>

</g:if>



<div class="bg-img height: 100vh;">

    <!--Navigation bar-->

    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #06064b; padding: 20px 10px; height: 15vh; border-radius: 3px">
        <div class="container-fluid">

            <a class="navbar-brand" href="/dashboard"><h1 style="color: white;">Linksharing</h1></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <g:if test="${user}">

                    <div class="collapse navbar-collapse offset-2" id="navbarNav">

                        <g:form controller="search" class="d-flex " role="search">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="searchInput" name="searchInput">
                            <button class="btn btn-outline-info" type="submit">Search</button>
                        </g:form>


                        <ul class="navbar-nav ">

                            <!-- Create topic Modal -->
                            <li class="nav-item">
                                <!-- Button to trigger modal -->
                                <button type="button" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"
                                        data-bs-target="#createTopicModal">
                                    <g:img dir="images" file="Icons/topic_icon.png" height = "34" width="40"/>
                                </button>
                                <!-- Modal functionality -->
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
                                                        <input type="url" class="form-control" id="resourceLink" name="resourceLink" required>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="linkResourceModal" class="form-label">Description*</label>
                                                        %{--                                                <input type="textarea" height="20" class="form-control" id="linkResourceDescription" name="linkResourceDescription">--}%
                                                        <textarea id="w3review" name="resourceDescription" rows="4" cols="40" required></textarea>

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


                            <!-- Create Document Resource Modal -->
                            <li class="nav-item">
                                <!-- Button to trigger modal id="createDocumentResourceModalDropdownButton"-->
                                <button type="button" id="createDocumentResourceModalDropdownButton" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"
                                        data-bs-target="#documentResourceModal">
                                    <g:img dir="images" file="Icons/doc_icon.png" height = "34" width="40"/>
                                </button>

                                <!-- Create Document Document Modal -->
                                <div class="modal fade" id="documentResourceModal" tabindex="-1"
                                     aria-labelledby="documentResourceModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <!-- modal content -->
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="documentResourceModalLabel">Share Document Resource</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">

                                                <g:uploadForm controller="dashboard" action="createDocumentResource">

                                                    <div class="mb-3">
                                                        <label for="linkResourceModal" class="form-label">Document*</label>
                                                        <input type="file" class="form-control" id="resourceDocument" name="resourceDocument" required>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="documentResourceModal" class="form-label">Description*</label>
                                                        <textarea id="resourceDescription"  name="resourceDescription" rows="4" cols="40" required></textarea>

                                                    </div>


                                                    <div class="mb-3">
                                                        <label for="documentResourceModal" class="form-label">Topic</label>
                                                        <select class="form-select" id="availableTopicDoc" name="availableTopicDoc">
                                                        </select>

                                                    </div>

                                                    <div class="modal-footer">
                                                        <button id = "closeDocumentResourceButton" type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Share</button>
                                                    </div>

                                                </g:uploadForm>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>



                            <!-- Send Invitation Modal -->
                            <li class="nav-item">
                                <!-- Button to trigger modal -->
                                <button type="button" id="sendInvitationModalDropdownButton" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"
                                        data-bs-target="#sendInvitationModal">
                                    <g:img dir="images" file="Icons/invite.png" height = "34" width="40"/>
                                </button>
                                <!-- Modal functionality -->
                                <div class="modal fade" id="sendInvitationModal" tabindex="-1"
                                     aria-labelledby="sendInvitationModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <!-- modal content -->
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="sendInvitationModalLabel">Send Invitation</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <g:form controller="dashboard" action="sendInvitation">
                                                    <div class="mb-3">
                                                        <label for="inviteEmail" class="form-label">Email*</label>
                                                        <input type="email" class="form-control" id="inviteEmail" name="inviteEmail" required>
                                                    </div>


                                                    <div class="mb-3">
                                                        <label for="sendInvitationModal" class="form-label">Topic</label>

                                                        <select class="form-select" id="invitationTopic" name="invitationTopic">
                                                        </select>

                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Invite</button>
                                                    </div>

                                                </g:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>




                            <!-- Username dropdown -->
                            <li class="nav-item">

                                <div class="btn-group offset-1">
                                    <button type="button" class="btn btn-outline-info  mt-3 dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" >
                                        ${user.username}
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="/profile/edit">Profile</a></li>

                                        <g:if test="${user.admin}">
                                            <li><a class="dropdown-item" href="/admin/users">Users</a></li>
                                            <li><a class="dropdown-item" href="/adminTopic">Topics</a></li>
                                            <li><a class="dropdown-item" href="/adminPost">Posts</a></li>

                                        </g:if>


                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item" href="/logout">Logout</a></li>
                                    </ul>
                                </div>

                            </li>


                            <!-- User profile section -->
                            <li class="nav-item">
                                <div class="userProfilePhoto mt-3 offset-10">
                                    <label  class="form-label mt-1">
                                        <a href="/profile/user">
                                            <g:img dir="images" file="${user.photo.substring(25)}" height = "36" width="40" style="border-radius: 40%;"/>
                                        </a>
                                    </label>
                                </div>
                            </li>

                        </ul>

                    </div>


                </g:if>


        </div>
    </nav>



</div>


</body>

<script>

    // $(document).ready(function (){
    //     const topicNameDiv = document.querySelector('#topicName')
    //
    //     topicNameDiv.addEventListener('keyup',()=>{
    //         console.log('dd')
    //         console.log(topicNameDiv.innerHTML.length)
    //     });
    //
    // })

    // AJAX to load subscribed topics while creating new link resources.
    $(document).ready(function(){
        $("#createLinkResourceModalDropdownButton").click(function(){

            var selectElement = document.getElementById("availableTopics")
            selectElement.options.length = 0;
            $.ajax({url: "/dashboard/loadSubscribedTopics", success: function(result){
                for(let i =0; i< result.key.length; ++i){
                    var option = document.createElement("option");
                    option.text = result.key[i][1];
                    option.value = result.key[i][0];
                    selectElement.add(option);
                    }
                }});
        });
    });


    // AJAX to load subscribed topics while creating new document resources.
    $(document).ready(function(){
        $("#createDocumentResourceModalDropdownButton").click(function(){

            var selectElement = document.getElementById("availableTopicDoc")
            selectElement.options.length = 0;
            $.ajax({url: "/dashboard/loadSubscribedTopics", success: function(result){
                    for(let i =0; i< result.key.length; ++i){
                        var option = document.createElement("option");
                        option.text = result.key[i][1];
                        option.value = result.key[i][0];
                        selectElement.add(option);
                    }
                }});
        });
    });


    // AJAX to load subscribed topics while creating new document resources.
    $(document).ready(function(){
        $("#sendInvitationModalDropdownButton").click(function(){

            var selectElement = document.getElementById("invitationTopic")
            selectElement.options.length = 0;
            $.ajax({url: "/dashboard/loadSubscribedTopics", success: function(result){
                    for(let i =0; i< result.key.length; ++i){
                        var option = document.createElement("option");
                        option.text = result.key[i][1];
                        option.value = result.key[i][0];
                        selectElement.add(option);
                    }
                }});
        });
    });

    setTimeout(function() {
        var failMessage = document.getElementById("fail-message");
        failMessage.style.display = "none";

    }, 3000);
    setTimeout(function() {
        var successMessage = document.getElementById("success-message");
        successMessage.style.display = "none";

    }, 3000);
    setTimeout(function() {
        var message = document.getElementById("message");
        message.style.display = "none";

    }, 3000);


</script>

</html>