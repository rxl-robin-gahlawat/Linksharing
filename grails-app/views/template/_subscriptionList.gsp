<div class=" border mt-2 border bg-secondary rounded d-flex p-1">
    <h5 class="col-sm-6 text-white">Subscriptions</h5>

    <p class="col-sm-3"></p>
    <a class="col-sm-3" style="text-decoration: none">View All</a>
</div>

<g:each in="${subscribedTopicList}" var="subscribedTopic">

    <div class="card p-1 bg-opacity-50" style="background-color: white">
        <div class="container-fluid">

            <div class="row d-flex align-items-center">
                <div class="col-sm-2 ">
                    <g:img dir="images" file="${subscribedTopic["topic"].createdBy.photo.substring(25)}" height = "56" width="60" class="centered" id="imgHolderSubList-${subscribedTopic["topic"].id}" name="imgHolderSubList-${subscribedTopic["topic"].id}" />
                </div>

                <div class="col-sm-1"></div>

                <div class="col-sm-8">
                    <div class="card-block">
                        <a href="#" id="topicname-${subscribedTopic["topic"].id}" class="card-link col-sm-6 subscriptionTopicNameTag" style="text-decoration: none">${subscribedTopic["topic"].name}</a>
                        <button id="save-${subscribedTopic["topic"].id}" value="saveBtn" name="saveBtn" onclick="saveButtonSubList()"  class="subscriptionSaveBtn offset-1" style="display: none">Save</button>
                        <button id="cancel-${subscribedTopic["topic"].id}" value="cancelBtn" name="cancelBtn" onclick="cancelButtonSubList()" class="subscriptionCancelBtn" style="display: none">Cancel</button>
                    </div>

                    <div class="card-block d-flex">
                        <p class="col-sm-4">@${subscribedTopic["topic"].createdBy.username}</p>

                        <p class="col-sm-6">Subscriptions</p>

                        <p class="col-sm-2">Posts</p>
                    </div>

                    <div class="card-block d-flex">



                        <g:if test="${(subscribedTopic["topic"].createdBy==user)  }">
                            <a href="#" class="card-link col-sm-6" style="text-decoration: none; visibility: hidden">Empty</a>

                        </g:if>

                        <g:else>
                            <a href="/updatedashboard/unsubscribeTopic?topicID=${subscribedTopic["topic"].id}" class="card-link col-sm-6" style="text-decoration: none">Unsubscribe</a>

                        </g:else>



                        <a href="#" class="card-link col-sm-3" style="text-decoration: none">${subscribedTopic["subsCount"]}</a>
                        <a href="#" class="card-link col-sm-3" style="text-decoration: none">${subscribedTopic["postCount"]}</a>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top: 10px; margin-bottom: 10px">

                    <div class=" col-sm-7 mt-3">
                        <g:select name="${subscribedTopic["subID"]}" id="${subscribedTopic["subID"]}" class="subscriptionsSeriousnessPicker " from="${['CASUAL','SERIOUS','VERY_SERIOUS'] - ["${subscribedTopic["seriousness"]}"]}" value="${subscribedTopic["seriousness"]}"
                                  noSelection="${['':subscribedTopic["seriousness"]]}" />


                        <g:if test="${subscribedTopic["topic"].createdBy==user || user.admin==true  }">
                                <g:select name="${subscribedTopic["topic"].id}" id="${subscribedTopic["topic"].id}" class="subscriptionsVisibilityPicker" from="${['PUBLIC','PRIVATE'] - ["${subscribedTopic["topic"].visibility}"]}" value="${subscribedTopic["topic"].visibility}"
                                  noSelection="${['':subscribedTopic["topic"].visibility]}" />
                        </g:if>

                    </div>

                    <div class=" col-sm-5">


                        <g:if test="${subscribedTopic["topic"].createdBy==user || user.admin==true  }">

                            <button type="button" id="edit-${subscribedTopic["topic"].id}" class="btn btn-sm chat-icon mt-2 subscriptionEditBtn" >
                                <g:img dir="images" file="Icons/edit_icon.jpeg" height = "23" width="23" style="border-radius: 3px;"/>
                            </button>

                            <button type="button" id="del-${subscribedTopic["topic"].id}" class="btn btn-sm chat-icon mt-2 subscriptionDeleteBtn" >
                                <g:img dir="images" file="Icons/delete_icon.png" height = "30" width="30" style="border-radius: 3px;"/>
                            </button>

                        </g:if>

                        <button type="button" class="btn btn-sm chat-icon mt-2" >
                            <g:img dir="images" file="Icons/invite.png" height = "24" width="24" style="border-radius: 3px;"/>
                        </button>

                    </div>

            </div>

        </div>

    </div>
    <br>

</g:each>


<script>

    // AJAX to change seriousness in subscribed topics
    $(document).ready(function(){
        $(".subscriptionsSeriousnessPicker").click(function(){
            $.ajax({url: "/updatedashboard/updateSubscriptionsSeriousness?subid="+this.id+"&seriousness="+this.value, success: function(result){
                    window.location.reload();
            }});
        });
    });

    // AJAX to change visibility in subscribed topics
    $(document).ready(function(){
        $(".subscriptionsVisibilityPicker").click(function(){

            $.ajax({url: "/updatedashboard/updateSubscriptionsVisibility?topicid="+this.id+"&visibility="+this.value, success: function(result){
                    window.location.reload();
            }});

        });
    });

    // AJAX to edit button in subscription list
    $(document).ready(function(){
        $(".subscriptionEditBtn").click(function(){

            let tag = document.querySelector('#topicname-' + this.id.substring(5));
            let saveBtn = document.querySelector('#save-'+this.id.substring(5));
            let cancelBtn = document.querySelector('#cancel-'+this.id.substring(5));

            tag.contentEditable = true;
            tag.focus()

            saveBtn.style.display = "inline-block"
            cancelBtn.style.display = "inline-block"

        });
    });

    // AJAX to delete button in subscription list
    $(document).ready(function(){
        $(".subscriptionDeleteBtn").click(function(){

            $.ajax({url: "/updatedashboard/deleteTopic?topicid="+this.id.substring(4), success: function(result){
                    window.location.reload();
                }});

        });
    });


    // AJAX to cancel button in subscription list
    function cancelButtonSubList(){

        let id = event.target.id.substring(7)
        let tag = document.querySelector('#topicname-' + id);
        let saveBtn = document.querySelector('#save-'+ id);
        let cancelBtn = document.querySelector('#cancel-'+ id);

        saveBtn.style.display = "none"
        cancelBtn.style.display = "none"
        tag.contentEditable = false;

    }

    // AJAX to save button in subscription list
    function saveButtonSubList(){

        let id = event.target.id.substring(5)
        let tag = document.querySelector('#topicname-' + id);
        let saveBtn = document.querySelector('#save-'+ id);
        let cancelBtn = document.querySelector('#cancel-'+ id);

        let topicName = tag.text

        saveBtn.style.display = "none"
        cancelBtn.style.display = "none"
        tag.contentEditable = false;

        $.ajax({url: "/updatedashboard/updateSubscriptionsTopicName?topicid="+id+"&topicname="+topicName, success: function(result){
                window.location.reload();
            }});

    }







</script>





