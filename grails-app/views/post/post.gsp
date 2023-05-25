


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
            $('#trendingTopicListDataTable').dataTable({
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



<style>

.rating {
    display: inline-block;
    direction: rtl;
}

.rating input {
    display: none;
}

.rating label {
    font-size: 30px;
    color: #ddd;
    cursor: pointer;
    display: inline-block;
    transform: scale(-1, 1);
}

.rating label:before {
    content: '\2605';
}

.rating input:checked ~ label {
    color: #ffce00;
}
</style>





<body>



<div class="container-fluid p-5">

    <div class="row">
        <div class="container col-sm-6 mb-2">


            <div class="card p-2" style="background-color: #eee">
                <div class="container-fluid" >
                    <div class="row d-flex align-items-center" >
                        <div class="col-sm-3 ">
                            <g:img dir="images" file="${resource.createdBy.photo.substring(25)}" height = "96" width="100" class="centered" />
                        </div>

                        <div class="col-sm-8">
                            <div class="card-block">
                                <label>
                                    <h5 class="card-title">${resource.createdBy.firstName} ${resource.createdBy.lastName} </h5>
                                </label>
                                <label class="offset-2">
                                    <a href="/topic?topicId=${resource.topic.id}" style="text-decoration: none;" >${resource.topic.name} </a>
                                </label>

                            </div>
                            <div class="card-block">
                                <label>@${resource.createdBy.username}</label>
                                <label id="postDate" class="offset-3">${resource.dateCreated}</label>
                            </div>

                            <div class="card-block d-flex mt-2">

                                <g:if test="${user && isSubscribed}">

                                    <div hidden="true" id="${resourceRating}" class="resourceRatingdiv">i</div>

                                    <div class="rating" id="${resource.id}">
                                        <input type="radio" id="star5" name="rating" value="5" />
                                        <label for="star5" title="5 stars"></label>
                                        <input type="radio" id="star4" name="rating" value="4" />
                                        <label for="star4" title="4 stars"></label>
                                        <input type="radio" id="star3" name="rating" value="3" />
                                        <label for="star3" title="3 stars"></label>
                                        <input type="radio" id="star2" name="rating" value="2" />
                                        <label for="star2" title="2 stars"></label>
                                        <input type="radio" id="star1" name="rating" value="1" />
                                        <label for="star1" title="1 star"></label>
                                    </div>

                                </g:if>

                                <div id="showRatingDiv" class="mt-2 offset-sm-1">Average Rating : ${avgPostRating} (${postRatingCount})</div>


%{--                                <div class="mt-2">Ratings : </div>--}%
%{--                                <div id="postRatingCountDiv" class="mt-2 "> ${postRatingCount} </div>--}%

                            </div>

                        </div>

                    </div>

                    <div class="row d-flex align-items-center">
                        <p>${resource.description}</p>
                    </div>

                    <div class="row align-items-center justify-content-end">

                        <div class="col-sm-5"></div>

                        <g:if test="${  user &&  ( user == resource.createdBy || user.admin == true )    }">

                            <div class="col-sm-2 justify-content-end">
                                <a href="/post/deletePost?postId=${resource.id}" target="_blank" class="card-link col-sm-6" style="text-decoration: none">Delete</a>
                            </div>


                            <!-- Edit modal for resources ---->

                            <g:if test="user">

                                <g:if test="${resource.class as String == 'class linksharing.LinkResource'}">
                                    <div class="col-sm-2">
                                        <!-- Button to trigger modal id="createLinkResourceModalDropdownButton"-->

                                        <a  style="text-decoration: none" id="EditLinkResourceDropdownButton" class="btn btn-link chat-icon" data-bs-toggle="modal"
                                            data-bs-target="#editLinkResourceModal">
                                            Edit
                                        </a>

                                        <!-- Link Resource Modal -->
                                        <div class="modal fade" id="editLinkResourceModal" tabindex="-1"
                                             aria-labelledby="editLinkResourceModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <!-- modal content -->
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="editLinkResourceModalLabel">Share Link Resource</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">

                                                        <g:form controller="post" action="editLinkResource">

                                                            <textarea rows="1" cols="5" name="postId" hidden>${resource.id}</textarea>

                                                            <div class="mb-3">
                                                                <label for="editLinkResourceModal" class="form-label">Link</label>
                                                                <input type="url" class="form-control" id="resourceLink" name="resourceLink" placeholder="${resource.url}" >
                                                            </div>

                                                            <div class="mb-3">
                                                                <label for="editLinkResourceModal" class="form-label">Description</label>
                                                                <textarea id="w3review" name="resourceDescription" rows="4" cols="44" placeholder="${resource.description}"></textarea>

                                                            </div>

                                                            <div class="mb-3">
                                                                <label for="editLinkResourceModal" class="form-label">Topic</label>

                                                                <select class="form-select" id="availableTopics" name="availableTopic" disabled>
                                                                    <option>${resource.topic.name}</option>
                                                                </select>

                                                            </div>

                                                            <div class="modal-footer">
                                                                <button id = "closeEditLinkResourceButton" type="button" class="btn btn-secondary"
                                                                        data-bs-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-primary">Edit</button>
                                                            </div>

                                                        </g:form>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </g:if>

                                <g:else>
                                    <div class="col-sm-2">
                                        <!-- Button to trigger modal id="createLinkResourceModalDropdownButton"-->

                                        <a  style="text-decoration: none" id="EditDocumentResourceDropdownButton" class="btn btn-link chat-icon" data-bs-toggle="modal"
                                            data-bs-target="#editDocumentResourceModal">
                                            Edit
                                        </a>

                                        <!-- Link Resource Modal -->
                                        <div class="modal fade" id="editDocumentResourceModal" tabindex="-1"
                                             aria-labelledby="editDocumentResourceModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <!-- modal content -->
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="editDocumentResourceModalLabel">Share Document Resource</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">

                                                        <g:uploadForm controller="post" action="editDocumentResource">

                                                            <textarea rows="1" cols="5" name="postId" hidden>${resource.id}</textarea>

                                                            <div class="mb-3">
                                                                <label for="editDocumentResourceModal" class="form-label">Document</label>
                                                                <input type="file" class="form-control" id="resourceDocument" name="resourceDoc">
                                                            </div>

                                                            <div class="mb-3">
                                                                <label for="editDocumentResourceModal" class="form-label">Description</label>
                                                                <textarea id="w3review1" name="resourceDescription" rows="4" cols="44" placeholder="${resource.description}"></textarea>

                                                            </div>

                                                            <div class="mb-3">
                                                                <label for="editDocumentResourceModal" class="form-label">Topic</label>

                                                                <select class="form-select" id="availableTopics1" name="availableTopic" disabled>
                                                                    <option>${resource.topic.name}</option>
                                                                </select>

                                                            </div>

                                                            <div class="modal-footer">
                                                                <button id = "closeDocumentLinkResourceButton" type="button" class="btn btn-secondary"
                                                                        data-bs-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-primary">Edit</button>
                                                            </div>

                                                        </g:uploadForm>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </g:else>

                            </g:if>




                        </g:if>

                        <div class="col-sm-3">
                            <g:if test="${resource.class as String == 'class linksharing.LinkResource'}">
                                <a href="${resource.url}" target="_blank" class="card-link col-sm-6" style="text-decoration: none">View Full Site</a>
                            </g:if>

                            <g:else>

                                <a href="${resource.filePath}" style="text-decoration: none" class="card-link col-sm-6" download>Download</a>

                            </g:else>


                        </div>

                    </div>


                </div>
            </div>



        </div>

        <div class="container col-sm-1">
        </div>


        <div class="container col-sm-5">

            <div class=" border mt-2 border bg-secondary rounded d-flex p-1">
                <h5 class="col-sm-6 text-white">Trending Topics</h5>

                <p class="col-sm-3"></p>
                <a class="col-sm-3" style="text-decoration: none">View All</a>
            </div>

            <g:render template="/template/trendingTopicsList" />


        </div>


    </div>

</div>


</body>

<script>

    %{--function formatDateTime(dateString) {--}%
    %{--    const date = new Date(dateString);--}%
    %{--    const options = {hour: 'numeric', minute: 'numeric', hour12: true};--}%
    %{--    const time = date.toLocaleString('en-US', options);--}%
    %{--    const formattedDate = date.toLocaleString('en-US', {--}%
    %{--        day: 'numeric',--}%
    %{--        month: 'short',--}%
    %{--        year: 'numeric'--}%
    %{--    });--}%
    %{--    return `${time} ${formattedDate}`;--}%
    %{--}--}%


    function formatDateTime(dateString) {
        const date = new Date(dateString);

        // Format the time component
        let hours = date.getHours();
        let minutes = date.getMinutes();
        const ampm = hours >= 12 ? 'PM' : 'AM';
        hours = hours % 12 || 12;
        minutes = minutes < 10 ? '0' + minutes : minutes;
        const time = hours + ':' + minutes + ' ' + ampm;

        // Format the date component
        const day = date.getDate();
        const month = date.toLocaleString('en-US', { month: 'short' });
        const year = date.getFullYear();
        const formattedDate = day + ' ' + month + ' ' + year;

        return time + " " + formattedDate;
    }



    $(document).ready(function(){

        const dateDiv = document.querySelector('#postDate')
        dateDiv.innerHTML = formatDateTime(dateDiv.innerHTML)


    });


    const ratingInputs = document.querySelectorAll('input[name="rating"]');
    let selectedRating = null;

    ratingInputs.forEach(input => {
        input.addEventListener('change', () => {
            selectedRating = input.value;
            const ratingDiv = document.querySelector('.rating')
            $.ajax({url: "/post/rating?rating="+selectedRating+"&postId="+ratingDiv.id, success: function(result){
                document.querySelector("#showRatingDiv").innerHTML = "Average Rating : " + parseFloat(result[1]).toFixed(1) + " (" + result[0] + ")"

                }});

        });
    });


    document.addEventListener("DOMContentLoaded", function() {

        var setResourceRating = document.querySelector(".resourceRatingdiv")
        var ratingElement = document.querySelector(".rating");


        if(setResourceRating.id=="1"){
            var star1 = ratingElement.querySelector("#star1");
            star1.checked = true
        }
        else if(setResourceRating.id=="2"){
            var star2 = ratingElement.querySelector("#star2");
            star2.checked = true
        }
        else if(setResourceRating.id=="3"){
            var star3 = ratingElement.querySelector("#star3");
            star3.checked = true
        }
        else if(setResourceRating.id=="4"){
            var star4 = ratingElement.querySelector("#star4");
            star4.checked = true
        }
        else if(setResourceRating.id=="5"){
            var star5 = ratingElement.querySelector("#star5");
            star5.checked = true
        }

    });



</script>


</html>
