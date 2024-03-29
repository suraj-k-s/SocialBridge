<%-- 
    Document   : Login
    Created on : May 5, 2021, 2:13:16 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta http-equiv="x-ua-compatible" content="ie=edge">

            <title>Login</title>

            <!-- Core CSS -->
            <link rel="stylesheet" href="Assets/friendskit/assets/css/bulma.css">
            <link rel="stylesheet" href="Assets/friendskit/assets/css/app.css">
            <link rel="stylesheet" href="Assets/friendskit/assets/css/core.css">

        </head>
    <%

        if (request.getParameter("btn_login") != null) {

            String email = request.getParameter("txt_email");
            String password = request.getParameter("txt_password");
            String admin = "select * from tbl_admin where admin_email ='" + email + "' and admin_password='" + password + "' ";
            ResultSet rsA = con.selectCommand(admin);

            String influencer = "select * from tbl_influencer where influencer_email =  '" + email + "' and influencer_password= '" + password + "'";
            ResultSet rsT = con.selectCommand(influencer);

            String sponser = "select * from tbl_sponser where sponser_email = '" + email + "' and sponser_password= '" + password + "'";
            System.out.println(sponser);
            ResultSet rsS = con.selectCommand(sponser);

            if (rsA.next()) {
                session.setAttribute("aid", rsA.getString("admin_id"));
                session.setAttribute("aname", rsA.getString("admin_name"));
                response.sendRedirect("Admin/HomePage.jsp");
            } else if (rsT.next()) {
                session.setAttribute("iid", rsT.getString("influencer_id"));
                session.setAttribute("iname", rsT.getString("influencer_name"));
                session.setAttribute("iphoto", rsT.getString("influencer_photo"));
                session.setAttribute("iemail", rsT.getString("influencer_email"));
                response.sendRedirect("Influencer/HomePage.jsp");
            } else if (rsS.next()) {
                session.setAttribute("sid", rsS.getString("sponser_id"));
                session.setAttribute("sname", rsS.getString("sponser_name"));
                session.setAttribute("sphoto", rsS.getString("sponser_photo"));
                session.setAttribute("semail", rsS.getString("sponser_email"));
                response.sendRedirect("Sponsor/HomePage.jsp");

            } else {

    %> 
    <script type="text/javascript">
        alert("Invalid Login Credentials");
        setTimeout(function() {
            window.location.href = 'index.jsp'
        }, 100);
    </script>
    <%            }
        }
    %>
    <body>

        <!-- Pageloader -->
        <div class="pageloader"></div>
        <div class="infraloader is-active"></div>
        <div class="signup-wrapper">

            <!--        Fake navigation
                    <div class="fake-nav">
                        <a href="/" class="logo" style="font-weight:bolder;font-size: xx-large;color: dimgray;" >
                         College-Connect
                            
                        </a>
                    </div>-->

            <div class="container">
                <!--Container-->
                <div class="login-container">
                    <div class="columns is-vcentered">
                        <div class="column is-6 image-column">
                            <!--Illustration-->
                            <img class="light-image login-image" src="Assets/friendskit/assets/img/illustrations/login.svg" alt="">
                            <img class="dark-image login-image" src="Assets/friendskit/assets/img/illustrations/login-dark.svg" alt="">
                        </div>
                        <div class="column is-6">

                            <h2 class="form-title">Welcome </h2>
                            <h3 class="form-subtitle">Enter your credentials to sign in.</h3>

                            <!--Form-->

                            <form method="post">
                                <div class="login-form">
                                    <div class="form-panel">
                                        <div class="field">
                                            <label>Email</label>
                                            <div class="control">
                                                <input type="email" id="input" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                                       class="input" autocomplete="off"  name="txt_email" placeholder="Enter your Email" required="required"/>
                                            </div>
                                        </div>
                                        <div class="field">
                                            <label>Password</label>
                                            <div class="control">
                                                <input type="password" class="input" name="txt_password" placeholder="Enter your password" required="required"/>
                                                <!--                                                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                                                                                       title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" -->

                                            </div>
                                        </div>
                                        <br><br>
                                    </div>
                                    <div class="buttons">
                                        <button class="button is-solid primary-button is-fullwidth raised" type="submit"  name="btn_login"><span>Login</span></button>                    
                                    </div>
                                    <div align="right" >
                                        <a href="SignUp.jsp"><span>sign up -></span></a>                    
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Concatenated js plugins and jQuery -->
        <script src="Assets/friendskit/assets/js/app.js"></script>

        <!-- Core js -->
        <script src="Assets/friendskit/assets/data/tipuedrop_content.js"></script>
        <script src="Assets/friendskit/assets/js/global.js"></script>
        <script src="Assets/friendskit/assets/js/main.js"></script>

        <!-- Page and UI related js -->
        <script src="Assets/friendskit/assets/js/signup.js"></script>
    </body>

</html>