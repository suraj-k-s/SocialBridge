<%-- 
    Document   : HomePage
    Created on : May 5, 2021, 2:14:18 PM
    Author     : Pro-TECH
--%>

<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="SessionValidator.jsp" %>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title> Timeline</title>
        <link rel="icon" type="image/png" href="../Assets/friendskit/assets/img/favicon.png" />
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/fontisto@v3.0.4/css/fontisto/fontisto-brands.min.css" rel="stylesheet">
        <!-- Core CSS -->
        <link rel="stylesheet" href="../Assets/friendskit/assets/css/app.css">
        <link rel="stylesheet" href="../Assets/friendskit/assets/css/core.css">
    </head>

    <body onload="loadPage()">

        <!-- Pageloader -->
        <div class="pageloader"></div>
        <div class="infraloader is-active"></div>
        <div class="app-overlay is-sidebar-v1"></div>

        <div class="sidebar-v1 is-fold">
            <div class="top-section">
                <button id="sidebar-v1-close" class="close-button">
                    <i data-feather="arrow-left"></i>
                </button>


                <div class="user-block">
                    <img class="avatar" src="<%=session.getAttribute("sphoto")%>" alt="">
                    <div class="meta">
                        <span style="margin-left: 7px"><%=session.getAttribute("sname")%></span>
                        <span style="margin-left: 10px">Sponsor</span>
                    </div>
                </div>
            </div>
            <div class="bottom-section">
                <ul>
                    <li>
                        <a href="HomePage.jsp" class="is-active">
                            <i data-feather="clock"></i>
                            <span>Timeline</span>
                        </a>
                    </li>
                    <li>
                        <a href="Complaint.jsp" >
                            <i data-feather="alert-circle"></i>
                            <span>Complaint</span>
                        </a>
                    </li>
                    <li>
                        <a href="../logout.jsp" >
                            <i data-feather="log-out"></i>
                            <span>Logout</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="view-wrapper is-sidebar-v1 is-fold">

            <div class="toolbar-v1-fixed-wrap">
                <div class="toolbar-v1 is-narrow">
                    <!-- Sidebar Trigger -->
                    <div class="friendkit-hamburger sidebar-v1-trigger">
                        <span class="menu-toggle has-chevron">
                            <span class="icon-box-toggle">
                                <span class="rotate">
                                    <i class="icon-line-top"></i>
                                    <i class="icon-line-center"></i>
                                    <i class="icon-line-bottom"></i>
                                </span>
                            </span>
                        </span>
                    </div>
                    <h1>Timeline</h1>
                    <div class="controls">
                       
                        <div id="account-dropdown" class="navbar-item is-account drop-trigger has-caret">
                            <div class="user-image">
                                <img src="<%=session.getAttribute("sphoto")%>" alt="">
                                <span class="indicator"></span>
                            </div>

                            <div class="nav-drop is-account-dropdown">
                                <div class="inner">
                                    <div class="nav-drop-header">
                                        <span class="username"><%=session.getAttribute("sname")%></span>
                                        <label class="theme-toggle">
                                            <input type="checkbox">
                                            <span class="toggler">
                                                <span class="dark">
                                                    <i data-feather="moon"></i>
                                                </span>
                                                <span class="light">
                                                    <i data-feather="sun"></i>
                                                </span>
                                            </span>
                                        </label>
                                    </div>
                                    <div class="nav-drop-body account-items">
                                        <a id="profile-link" href="ViewProfile.jsp" class="account-item">
                                            <div class="media">
                                                <div class="media-left">
                                                    <div class="image">
                                                        <img src="<%=session.getAttribute("sphoto")%>" alt="">
                                                    </div>
                                                </div>
                                                <div class="media-content">
                                                    <h3><%=session.getAttribute("sname")%></h3>
                                                    <small>View Profile</small>
                                                </div>
                                                <div class="media-right">
                                                    <i data-feather="check"></i>
                                                </div>
                                            </div>
                                        </a>
                                        <hr class="account-divider">
                                        <a class="account-item" href="../logout.jsp">
                                            <div class="media">
                                                <div class="icon-wrap">
                                                    <i data-feather="power"></i>
                                                </div>
                                                <div class="media-content">
                                                    <h3>Log out</h3>
                                                    <small>Log out from your account.</small>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Container -->
            <div id="main-feed" class="container sidebar-boxed" data-open-sidebar data-page-title="Timeline">

                <div class="toolbar-v1 is-narrow">
                    <!-- Sidebar Trigger -->
                    <div class="friendkit-hamburger sidebar-v1-trigger">
                        <span class="menu-toggle has-chevron">
                            <span class="icon-box-toggle">
                                <span class="rotate">
                                    <i class="icon-line-top"></i>
                                    <i class="icon-line-center"></i>
                                    <i class="icon-line-bottom"></i>
                                </span>
                            </span>
                        </span>
                    </div>
                    <h1>Timeline</h1>
                    <div class="controls">
                        
                        <div id="account-dropdown" class="navbar-item is-account drop-trigger has-caret">
                            <div class="user-image">
                                <img src="<%=session.getAttribute("sphoto")%>" alt="">
                                <span class="indicator"></span>
                            </div>

                            <div class="nav-drop is-account-dropdown">
                                <div class="inner">
                                    <div class="nav-drop-header">
                                        <span class="username"><%=session.getAttribute("sname")%></span>
                                        <label class="theme-toggle">
                                            <input type="checkbox">
                                            <span class="toggler">
                                                <span class="dark">
                                                    <i data-feather="moon"></i>
                                                </span>
                                                <span class="light">
                                                    <i data-feather="sun"></i>
                                                </span>
                                            </span>
                                        </label>
                                    </div>
                                    <div class="nav-drop-body account-items">
                                        <a id="profile-link" href="ViewProfile.jsp" class="account-item">
                                            <div class="media">
                                                <div class="media-left">
                                                    <div class="image">
                                                        <img src="<%=session.getAttribute("sphoto")%>" alt="">
                                                    </div>
                                                </div>
                                                <div class="media-content">
                                                    <h3><%=session.getAttribute("sname")%></h3>
                                                    <small>View Profile</small>
                                                </div>
                                                <div class="media-right">
                                                    <i data-feather="check"></i>
                                                </div>
                                            </div>
                                        </a>
                                        <hr class="account-divider">
                                        <a class="account-item" href="../logout.jsp">
                                            <div class="media">
                                                <div class="icon-wrap">
                                                    <i data-feather="power"></i>
                                                </div>
                                                <div class="media-content">
                                                    <h3>Log out</h3>
                                                    <small>Log out from your account.</small>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Content placeholders at page load -->
                <!-- /html/partials/global/placeload/feed-page/feed-menu-shadow-dom.html -->
                <!-- this holds the animated content placeholders that show up before content -->
                <div id="shadow-dom" class="view-wrap">
                    <div class="columns">

                        <div class="column is-8">

                            <!-- Placeload element -->
                            <div class="placeload compose-placeload">
                                <div class="header">
                                    <div class="content-shape is-lg loads"></div>
                                    <div class="content-shape is-lg loads"></div>
                                    <div class="content-shape is-lg loads"></div>
                                </div>
                                <div class="body">
                                    <div class="img loads"></div>
                                    <div class="inner-wrap">
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Placeload element -->
                            <div class="placeload post-placeload">
                                <div class="header">
                                    <div class="img loads"></div>
                                    <div class="header-content">
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                    </div>
                                </div>
                                <div class="image-placeholder loads"></div>
                                <div class="placeholder-footer">
                                    <div class="footer-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Placeload element -->
                            <div class="placeload post-placeload">
                                <div class="header">
                                    <div class="img loads"></div>
                                    <div class="header-content">
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                    </div>
                                </div>
                                <div class="image-placeholder loads"></div>
                                <div class="placeholder-footer">
                                    <div class="footer-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Placeload element -->
                            <div class="placeload post-placeload">
                                <div class="header">
                                    <div class="img loads"></div>
                                    <div class="header-content">
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                    </div>
                                </div>
                                <div class="image-placeholder loads"></div>
                                <div class="placeholder-footer">
                                    <div class="footer-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Placeload element -->
                            <div class="placeload post-placeload">
                                <div class="header">
                                    <div class="img loads"></div>
                                    <div class="header-content">
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                    </div>
                                </div>
                                <div class="image-placeholder loads"></div>
                                <div class="placeholder-footer">
                                    <div class="footer-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="column is-4">

                            <!-- Placeload element -->
                            <div class="placeload stories-placeload">
                                <div class="header">
                                    <div class="content-shape loads"></div>
                                </div>
                                <div class="body">
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Placeload element -->
                            <div class="placeload mini-widget-placeload">
                                <div class="body">
                                    <div class="inner-wrap">
                                        <div class="img loads"></div>
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                        <div class="content-shape loads"></div>
                                        <div class="button-shape loads"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Placeload element -->
                            <div class="placeload list-placeload">
                                <div class="header">
                                    <div class="content-shape loads"></div>
                                </div>
                                <div class="body">
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                    <div class="flex-block">
                                        <div class="img loads"></div>
                                        <div class="inner-wrap">
                                            <div class="content-shape loads"></div>
                                            <div class="content-shape loads"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- Feed page main wrapper -->
                <div id="activity-feed" class="view-wrap true-dom is-hidden">
                    <div class="columns">

                        <!-- Middle column -->
                        <div class="column is-8">

                            <!-- Publishing Area -->
                            <!-- /partials/pages/feed/compose-card.html -->
                            <div id="compose-card" class="card is-new-content">
                                <!-- Top tabs -->
                                <div class="tabs-wrapper">
                                    <div class="tabs is-boxed is-fullwidth">
                                        <ul>
                                            <li class="is-active">
                                                <a>
                                                    <span class="icon is-small"><i data-feather="edit-3"></i></span>
                                                    <span>Publish</span>
                                                </a>
                                            </li>
                                            <!-- Close X button -->
                                            <li class="close-wrap">
                                                <span class="close-publish" id="close-publish" onclick="clearText()">
                                                    <i data-feather="x"></i>
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- Tab content -->
                                    <div class="tab-content">
                                        <!-- Compose form -->
                                        <div class="compose">
                                            <div class="compose-form">
                                                <img src="<%=session.getAttribute("sphoto")%>" alt="">
                                                <div class="control">
                                                    <textarea id="publish" class="textarea" rows="3" placeholder="Write something ..."></textarea>
                                                </div>
                                            </div>

                                            <div id="feed-upload" class="feed-upload">

                                            </div>

                                            <div id="options-summary" class="options-summary"></div>


                                        </div>
                                        <!-- /Compose form -->

                                        <!-- Hidden Options -->
                                        <div class="hidden-options">
                                            <div class="target-channels" >
                                                <!-- Publication Channel -->
                                                <div class="channel" onclick="checkOnlyOne(1)">
                                                    <div class="round-checkbox is-small">
                                                        <div>
                                                            <input class="checks" type="checkbox" id="checkbox-1" onclick="checkOnlyOne(1)"  name="check_sel" value="1">
                                                            <label for="checkbox-1"></label>
                                                        </div>
                                                    </div>
                                                    <div class="channel-icon">
                                                        <i data-feather="bell"></i>
                                                    </div>
                                                    <div class="channel-name"> All</div>
                                                </div>
                                                <div class="channel" onclick="checkOnlyOne(2)">
                                                    <div class="round-checkbox is-small">
                                                        <div>
                                                            <input class="checks" type="checkbox" id="checkbox-1" onclick="checkOnlyOne(1)" name="check_sel" value="2">
                                                            <label for="checkbox-1"></label>
                                                        </div>
                                                    </div>
                                                    <div class="channel-icon">
                                                        <i data-feather="bell"></i>
                                                    </div>
                                                    <div class="channel-name">Only For  Sponsors</div>
                                                </div>
                                                <div class="channel" onclick="checkOnlyOne(3)" >
                                                    <div class="round-checkbox is-small">
                                                        <div>
                                                            <input class="checks" type="checkbox" id="checkbox-1" onclick="checkOnlyOne(1)" name="check_sel" value="3">
                                                            <label for="checkbox-1"></label>
                                                        </div>
                                                    </div>
                                                    <div class="channel-icon">
                                                        <i data-feather="bell"></i>
                                                    </div>
                                                    <div class="channel-name">Only For Influencer</div>
                                                </div>
                                              
                                            </div>
                                        </div>
                                        <!-- General basic options -->
                                        <div id="basic-options" class="compose-options">
                                            <!-- Upload action -->
                                            <div class="compose-option">
                                                <i data-feather="camera"></i>
                                                <span>Media</span>
                                                <input id="feed-upload-input-2" type="file" type="file" onchange="readURL(this)">
                                            </div>

                                        </div>
                                        <!-- /General basic options -->

                                        <!-- Footer buttons -->
                                        <div class="more-wrap">
                                            <!-- Publish button -->
                                            <button id="publish-button" onclick="insPost()"  class="button is-solid accent-button is-fullwidth is-disabled">
                                                Publish
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- POST #1 -->
                            <div id="post-load">

                            </div>
                            <!-- POST #1 -->
                            <!-- Load more posts -->
                            <div class=" load-more-wrap has-text-centered">
                                <a href="#" class="load-more-button" onclick="loadPage()">Load More</a>
                            </div>
                            <!-- /Load more posts -->

                        </div>
                        <!-- /Middle column -->

                        <!-- Right side column -->
                        <div class="column is-4">

                            <!-- Stories widget -->
                            <!-- /partials/widgets/stories-widget.html -->
                            <div class="card">
                                <div class="card-heading is-bordered">
                                    <h4>Influencer</h4>
                                </div>
                                <div class="card-body no-padding">
                                   
                                    <%

                                        String selQry = "select * from tbl_influencer";

                                        ResultSet rs = con.selectCommand(selQry);
                                        while (rs.next()) {
                                    %>

                                    <div class="story-block" onclick="window.location='InfluencerChat/Chat.jsp?id=<%=rs.getString("influencer_id")%>'">
                                        <div class="img-wrapper">
                                            <img src="<%=rs.getString("influencer_photo")%>" data-user-popover="1" alt="">
                                        </div>
                                        <div class="story-meta">
                                            <span><%=rs.getString("influencer_name")%></span>
                                            <span><%=rs.getString("influencer_contact")%></span>
                                        </div>
                                    </div>


                                    <%
                                        }


                                    %>
                                </div>
                            </div>
                           

                        </div>
                        <!-- /Right side column -->
                    </div>
                </div>

            </div>

        </div>

        <script src="../Assets/JQuery/jQuery.js"></script>
        <script>
                                    function clearText()
                                    {
                                        document.getElementById("feed-upload").innerHTML = "";
                                        $('#feed-upload-input-1, #feed-upload-input-2').val('').attr('disabled', false);
                                        $(this).closest('.upload-wrap').remove();
                                        document.getElementById("close-publish").click();
                                        document.getElementById("publish").value = "";
                                        var x = document.getElementsByClassName('checks');
                                        var i;
                                        for (i = 0; i < x.length; i++) {
                                            x[i].checked = false;
                                        }
                                        loadPage();
                                    }
                                    function deletePost(id)
                                    {


                                        $.ajax({url: "../Assets/AjaxPages/AjaxDeletePost.jsp?id=" + id,
                                            success: function() {
                                                loadPage();
                                            }});
                                    }
                                    function checkOnlyOne(b) {
                                        var x = document.getElementsByClassName('checks');
                                        var i;
                                        for (i = 0; i < x.length; i++) {
                                            if (x[i].value != b)
                                                x[i].checked = false;
                                        }
                                    }
                                    function insPost()
                                    {

                                        var div = document.getElementById("feed-upload").innerHTML;

                                        if (div.trim() === "")
                                        {

                                            var content = document.getElementById("publish").value;
                                            var type = $('.checks:checked').val();

                                            $.ajax({
                                                type: 'POST',
                                                url: '../Assets/AjaxPages/AjaxSponsorPost.jsp',
                                                data: {content: content,
                                                    type: type,
                                                    file: ""
                                                },
                                                success: function(result) {

                                                    if (result.trim() === "1") {

                                                        clearText();
                                                    }
                                                }});
                                        }
                                        else
                                        {
                                            var text = document.getElementById("post_media").src;
                                            var content = document.getElementById("publish").value;
                                            var type = $('.checks:checked').val();

                                            $.ajax({
                                                type: 'POST',
                                                url: '../Assets/AjaxPages/AjaxSponsorPost.jsp',
                                                data: {content: content,
                                                    type: type,
                                                    file: text
                                                },
                                                success: function(result) {

                                                    if (result.trim() === "1") {

                                                        clearText();
                                                    }
                                                }});
                                        }

                                    }
                                    function loadPage()
                                    {
                                        $("#post-load").load('../Assets/AjaxPages/AjaxSponsorPostLoad.jsp');
                                    }

                                    function fclick(id)
                                    {
                                        var div = document.querySelector('#cid-' + id);
                                        div.classList.toggle('is-hidden');

                                    }
                                    function onLike(img)
                                    {
                                        var string = img.src;
                                        var name = string.substring(string.length - 11);
                                        var id = img.alt;
                                        if (name === 'heart-b.svg')
                                        {

                                            $.ajax({
                                                type: 'POST',
                                                url: '../Assets/AjaxPages/AjaxSponsorLike.jsp',
                                                data: {id: id},
                                                success: function(result) {
                                                    loadPage();
                                                    img.src = '../Assets/friendskit/assets/img/icons/feed/heart-r.svg';

                                                }});
                                        }
                                        else if (name === 'heart-r.svg')
                                        {

                                            $.ajax({
                                                type: 'POST',
                                                url: '../Assets/AjaxPages/AjaxSponsorDislike.jsp',
                                                data: {id: id},
                                                success: function(result) {
                                                    loadPage();
                                                    img.src = '../Assets/friendskit/assets/img/icons/feed/heart-b.svg';

                                                }});

                                        }

                                    }
                                    function comment(id)
                                    {
                                        var content = document.getElementById("content-" + id).value;
                                        $.ajax({
                                            type: 'POST',
                                            url: '../Assets/AjaxPages/AjaxSponsorComment.jsp',
                                            data: {id: id,
                                                content: content},
                                            success: function(result) {
                                                loadPage();
                                            }});
                                    }
        </script>

        <!-- Concatenated js plugins and jQuery -->
        <script src="../Assets/friendskit/assets/js/app.js"></script>
        <script src="https://js.stripe.com/v3/"></script>
        <script src="../Assets/friendskit/assets/data/tipuedrop_content.js"></script>

        <!-- Core js -->
        <script src="../Assets/friendskit/assets/js/global.js"></script>

        <!-- Navigation options js -->
        <script src="../Assets/friendskit/assets/js/navbar-v1.js"></script>
        <script src="../Assets/friendskit/assets/js/navbar-v2.js"></script>
        <script src="../Assets/friendskit/assets/js/navbar-mobile.js"></script>
        <script src="../Assets/friendskit/assets/js/navbar-options.js"></script>
        <script src="../Assets/friendskit/assets/js/sidebar-v1.js"></script>

        <!-- Core instance js -->
        <script src="../Assets/friendskit/assets/js/main.js"></script>
        <script src="../Assets/friendskit/assets/js/chat.js"></script>
        <script src="../Assets/friendskit/assets/js/touch.js"></script>
        <script src="../Assets/friendskit/assets/js/tour.js"></script>
        <!-- Components js -->
        <script src="../Assets/friendskit/assets/js/explorer.js"></script>
        <script src="../Assets/friendskit/assets/js/widgets.js"></script>
        <script src="../Assets/friendskit/assets/js/modal-uploader.js"></script>
        <script src="../Assets/friendskit/assets/js/popovers-users.js"></script>
        <script src="../Assets/friendskit/assets/js/popovers-pages.js"></script>
        <script src="../Assets/friendskit/assets/js/lightbox.js"></script>

        <script src="../Assets/friendskit/assets/js/feed.js"></script>

        <script src="../Assets/friendskit/assets/js/webcam.js"></script>
        <script src="../Assets/friendskit/assets/js/compose.js"></script>
        <script src="../Assets/friendskit/assets/js/autocompletes.js"></script>

    </body>

</html>
