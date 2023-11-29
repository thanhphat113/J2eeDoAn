<%-- 
    Document   : nav
    Created on : Nov 28, 2023, 2:43:51 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-2 sidenav" >
    <h4>Admin Page</h4>
    <ul class="nav nav-pills nav-stacked">
        <li><a href="#section1">Home</a></li>
        <li><a href="#section2">Products Manager</a></li>
        <li><a href="#section3">Accounts Manager</a></li>
        <li class="active"><a href="/J2eeDoAn/OrderManagerServlet">Orders Manager</a></li>
        <li><a href="#section3">Supplier Manager</a></li>
        <li><a href="#section3">Statics</a></li>        
    </ul><br>
    <div class="input-group">
        <input type="text" class="form-control" placeholder="Search Blog..">
        <span class="input-group-btn">
            <button class="btn btn-default" type="button">
                <span class="glyphicon glyphicon-search"></span>
            </button>
        </span>
    </div>
</div>
