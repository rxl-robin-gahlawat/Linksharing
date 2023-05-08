<div class=" border mt-2 border bg-secondary rounded d-flex p-1">
    <h5 class="col-sm-6 text-white">Subscriptions</h5>

    <p class="col-sm-3"></p>
    <a class="col-sm-3">View All</a>
</div>

<g:each in="${subscribedTopicList}" var="subscribedTopic">

    <div class="card p-1 bg-opacity-50" style="background-color: white">
        <div class="container-fluid">

            <div class="row d-flex align-items-center">
                <div class="col-sm-2 ">
                    <g:img dir="images" file="${subscribedTopic["user"].photo.substring(25)}" height = "56" width="60" class="centered" />
                </div>

                <div class="col-sm-1"></div>

                <div class="col-sm-8">
                    <div class="card-block">
                        <a href="#" class="card-link col-sm-6">${subscribedTopic["topic"].name}</a>
                    </div>

                    <div class="card-block d-flex">
                        <p class="col-sm-4">@${subscribedTopic["user"].username}</p>

                        <p class="col-sm-6">Subscriptions</p>

                        <p class="col-sm-2">Posts</p>
                    </div>

                    <div class="card-block d-flex">
                        <a href="#" class="card-link col-sm-6">Unsubscribe</a>
                        <a href="#" class="card-link col-sm-3">${subscribedTopic["subsCount"]}</a>
                        <a href="#" class="card-link col-sm-3">${subscribedTopic["postCount"]}</a>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top: 10px; margin-bottom: 10px">
                <div class="d-inline-flex justify-content-end">


                    <g:select name="${subscribedTopic["subID"]}" id="${subscribedTopic["subID"]}" class="subscriptionsSeriousnessPicker" from="${['CASUAL','SERIOUS','VERY_SERIOUS'] - ["${subscribedTopic["seriousness"]}"]}" value="${subscribedTopic["seriousness"]}"
                              noSelection="${['':subscribedTopic["seriousness"]]}" />


                    <g:if test=" ${user}==${subscribedTopic["user"]} || ${user.admin}==true">

                        <select class="selectpicker show-menu-arrow col-sm-3 me-2">
                            <option>Private</option>
                            <option>Public</option>
                        </select>

                        <a class=""><img src="${resource(dir: "images", file: "sendInvite.svg")}"/>Edit</a>
                        <a class=""><img src="${resource(dir: "images", file: "sendInvite.svg")}"/>Delete</a>

                    </g:if>

                    <a class=""><img src="${resource(dir: "images", file: "sendInvite.svg")}"/>Invite</a>

                </div>
            </div>

        </div>

    </div>

</g:each>


<script>


    $(document).ready(function(){
        $(".subscriptionsSeriousnessPicker").click(function(){
            $.ajax({url: "/updatedashboard/updateSubscriptionsSeriousness?subid="+this.id+"&seriousness="+this.value, success: function(result){
                    window.location.reload();
            }});
        });
    });





</script>





