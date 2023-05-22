

<html>
<head>



<g:render template="/template/navbar" />


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet"/>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>


<script>



    $(document).ready(function() {
        $('#dtBasicExample').dataTable({
            "ordering": true,
            "paging": true,
            "lengthMenu": [5, 10, 60, 80, 100],
            "pageLength": 5,
            "searching": true,
            "order": [[ 0, "asc" ],[1,"asc"],[2,"asc"],[3,"asc"],[4,"asc"]],

        });
    });

</script>



</head>


<body>





<h2 class='mb-3'>Basic example</h2>


<table id="dtBasicExample" class="table" width="100%">
    <thead>
    <tr>
        <th class="th-sm">Name
        </th>
        <th class="th-sm">Position
        </th>
        <th class="th-sm">Office
        </th>
        <th class="th-sm">Age
        </th>
        <th class="th-sm">Start date
        </th>
        <th class="th-sm">Salary
        </th>
    </tr>
    </thead>
    <tbody>

    <tr>
        <td>Charde Marshall</td>
        <td>Regional Director</td>
        <td>San Francisco</td>
        <td>36</td>
        <td>2008/10/16</td>
        <td>$470,600</td>
    </tr>
    <tr>
        <td>Haley Kennedy</td>
        <td>Senior Marketing Designer</td>
        <td>London</td>
        <td>43</td>
        <td>2012/12/18</td>
        <td>$313,500</td>
    </tr>
    <tr>
        <td>Tatyana Fitzpatrick</td>
        <td>Regional Director</td>
        <td>London</td>
        <td>19</td>
        <td>2010/03/17</td>
        <td>$385,750</td>
    </tr>

    <tr>
        <td>Gloria Little</td>
        <td>Systems Administrator</td>
        <td>New York</td>
        <td>59</td>
        <td>2009/04/10</td>
        <td>$237,500</td>
    </tr>
    <tr>
        <td>Bradley Greer</td>
        <td>Software Engineer</td>
        <td>London</td>
        <td>41</td>
        <td>2012/10/13</td>
        <td>$132,000</td>
    </tr>
    <tr>
        <td>Dai Rios</td>
        <td>Personnel Lead</td>
        <td>Edinburgh</td>
        <td>35</td>
        <td>2012/09/26</td>
        <td>$217,500</td>
    </tr>
    <tr>
        <td>Jenette Caldwell</td>
        <td>Development Lead</td>
        <td>New York</td>
        <td>30</td>
        <td>2011/09/03</td>
        <td>$345,000</td>
    </tr>
    <tr>
        <td>Yuri Berry</td>
        <td>Chief Marketing Officer (CMO)</td>
        <td>New York</td>
        <td>40</td>
        <td>2009/06/25</td>
        <td>$675,000</td>
    </tr>
    <tr>
        <td>Caesar Vance</td>
        <td>Pre-Sales Support</td>
        <td>New York</td>
        <td>21</td>
        <td>2011/12/12</td>
        <td>$106,450</td>
    </tr>
    </tbody>
    <tfoot>
    <tr>
        <th>Name
        </th>
        <th>Position
        </th>
        <th>Office
        </th>
        <th>Age
        </th>
        <th>Start date
        </th>
        <th>Salary
        </th>
    </tr>
    </tfoot>
</table>

</body>
</html>

