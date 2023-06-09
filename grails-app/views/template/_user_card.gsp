


<g:each in="${subsInfoList}" var="userInfo">

    <div class="card p-2" style="background-color: #eee">

        <div class="container-fluid" >

            <div class="row d-flex align-items-center" >

                <div class="col-sm-4 ">
                    <a href="/profile/user">
                        <g:img dir="images" file="${userInfo["user"].photo.substring(25)}" height = "96" width="100" class="centered" />
                    </a>
                </div>

                <div class="col-sm-7">
                    <div class="card-block">
                        <h5 class="card-title">${userInfo["user"].firstName} ${userInfo["user"].lastName} </h5>
                    </div>
                    <div class="card-block">
                        <a href="/profile/user">@${userInfo["user"].username}</a>
                    </div>

                    <div class="card-block d-flex">
                        <p class="col-sm-7"> subscriptions</p>
                        <p class="col-sm-5">topics</p>
                    </div>

                    <div class="card-block d-flex">
                        <a href="/profile/user" class="card-link col-sm-7" style="text-decoration: none">${userInfo["subsMap"]["subsCount"]}</a>
                        <a href="/profile/user" class="card-link col-sm-5" style="text-decoration: none">${userInfo["subsMap"]["topicsCount"]}</a>
                    </div>

                </div>


            </div>

        </div>

    </div>
    <br>



</g:each>










