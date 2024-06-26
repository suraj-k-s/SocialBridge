<%-- 
    Document   : ChangePassword
    Created on : May 5, 2021, 2:15:33 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>
    <%

        if (request.getParameter("btn_change") != null) {

            String db_password = "", current_password = "", new_password = "", re_password = "";

            String selQry = "select * from tbl_sponser where sponser_id='" + session.getAttribute("sid") + "'";
            ResultSet rs = con.selectCommand(selQry);
            if (rs.next()) {
                db_password = rs.getString("sponser_password");
            }

            current_password = request.getParameter("txt_curpass");
            new_password = request.getParameter("txt_nwpass");
            re_password = request.getParameter("txt_repass");

            if (current_password.equals(db_password)) {
                if (new_password.equals(re_password)) {
                    String upQry = "update tbl_sponser set "
                            + "sponser_password='" + new_password + "' "
                            + "where sponser_id='" + session.getAttribute("sid") + "'";
                    if (con.executeCommand(upQry)) {
    %> 
    <script type="text/javascript">
        alert("Updated Successfully Please Login Again..");
        setTimeout(function() {
            window.location.href = '../logout.jsp'
        }, 100);
    </script>
    <%
                    }
                } else {
                    out.println("<script>alert('New Password Missmatched')</script>");
                }
            } else {
                out.println("<script>alert('Current Password Missmatched')</script>");
            }

        }


    %>
    <body>
        <div id="tab" align="center">
            <h1>Change Password</h1>

            <form>

                <table border="1">
                    <tr>
                        <td>Current Password</td>
                        <td><input type="text" name="txt_curpass" required=""></td>
                    </tr>
                    <tr>
                        <td>New Password</td>
                        <td><input type="text" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                         title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" name="txt_nwpass" required=""></td>
                    </tr>
                    <tr>
                        <td>Re-Password</td>
                        <td><input type="password" name="txt_repass" required=""></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" name="btn_change" value="Change">
                        </td>
                    </tr>
                </table>

            </form>

        </div>
        <%@include file="Footer.jsp" %>
    </body>
</html>
