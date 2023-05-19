
<div class=" border mt-2 border bg-secondary rounded d-flex p-1">
    <h5 class="col-sm-6 text-white">Posts : "${subscribedTopicList[0].topic.name}"</h5>
</div>

<g:each in="${postList}" var="resource">

    <div class="card p-2">
        <div class="container-fluid" >
            <div class="row d-flex align-items-center" >
                <div class="col-sm-3 ">
                    <g:img dir="images" file="${resource.createdBy.photo.substring(25)}" height = "96" width="100" class="centered" />
                </div>
                <div class="col-sm-8">
                    <p>${resource.description}</p>
                </div>
            </div>


            <div class="row" style="margin-top: 10px; margin-bottom: 10px">

                <div class=" col-sm-6 mt-3">


                    <g:if test="${resource.class as String == 'class linksharing.LinkResource'}">
                        <a href="${resource.url}" target="_blank" class="card-link col-sm-6" style="text-decoration: none">View Full Site</a>
                    </g:if>

                    <g:else>
                        <a href="${resource.filePath}" target="_blank" class="card-link col-sm-6" style="text-decoration: none" download="">Download</a>

                    </g:else>


                </div>

                <div class=" col-sm-6 mt-3">

%{--                    <a href="/updatedashboard" class="card-link col-sm-6" style="text-decoration: none">Mark as Read</a>--}%
                    <a href="/post?postId=${resource.id}" class="card-link col-sm-6 offset-7" style="text-decoration: none">View Post</a>


                </div>

            </div>





            %{--            <div class="row d-flex align-items-center">--}%

%{--                <div class="col-sm-auto">--}%
%{--                    <a href="/post/deletePost?postId=${resource.id}" target="_blank" class="card-link col-sm-6" style="text-decoration: none">Delete</a>--}%
%{--                </div>--}%

%{--                <div class="col-sm-auto">--}%
%{--                    <g:if test="${resource.class as String == 'class linksharing.LinkResource'}">--}%
%{--                        <a href="${resource.url}" target="_blank" class="card-link col-sm-6" style="text-decoration: none">View Full Site</a>--}%
%{--                    </g:if>--}%

%{--                    <g:else>--}%
%{--                        <a href="/download?path=${resource.filePath}" target="_blank" class="card-link col-sm-6" style="text-decoration: none">Download</a>--}%
%{--                    </g:else>--}%
%{--                </div>--}%


%{--            </div>--}%


        </div>
    </div>
    <br>






</g:each>

