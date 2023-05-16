

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Linksharing</title>


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

<g:render template="/template/navbar" />


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
                                    <a href="#" style="text-decoration: none;" >${resource.topic.name} </a>
                                </label>

                            </div>
                            <div class="card-block">
                                <label>@${resource.createdBy.username}</label>
                                <label class="offset-3">${resource.dateCreated}</label>
                            </div>

                            <div class="card-block d-flex mt-2">

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





                            </div>


%{--                            <div class="card-block d-flex">--}%
%{--                                <a href="#" class="card-link col-sm-7" style="text-decoration: none">aa</a>--}%
%{--                                <a href="#" class="card-link col-sm-5" style="text-decoration: none">bb</a>--}%
%{--                            </div>--}%


                        </div>


                    </div>

                    <div class="row d-flex align-items-center">
                        <p>${resource.description}</p>
                    </div>

                    <div class="row d-flex align-items-center">

                        <div class="col-sm-auto">
                            <a href="/post/deletePost?postId=${resource.id}" target="_blank" class="card-link col-sm-6" style="text-decoration: none">Delete</a>
                        </div>

                        <div class="col-sm-auto">
                            <g:if test="${resource.class as String == 'class linksharing.LinkResource'}">
                                <a href="${resource.url}" target="_blank" class="card-link col-sm-6" style="text-decoration: none">View Full Site</a>
                            </g:if>

                            <g:else>
                                <a href="/download?path=${resource.filePath}" target="_blank" class="card-link col-sm-6" style="text-decoration: none">Download</a>
                            </g:else>
                        </div>





                    </div>


                </div>
            </div>




        </div>

        <div class="container col-sm-1">
        </div>


        <div class="container col-sm-5">

                <p>trending topics will be here</p>
%{--            <g:render template="/template/trendingTopicsList" />--}%


        </div>


    </div>

</div>


</body>

<script>
    const ratingInputs = document.querySelectorAll('input[name="rating"]');
    let selectedRating = null;

    ratingInputs.forEach(input => {
        input.addEventListener('change', () => {
            selectedRating = input.value;
            const ratingDiv = document.querySelector('.rating')
            $.ajax({url: "/post/rating?rating="+selectedRating+"&postId="+ratingDiv.id, success: function(result){
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