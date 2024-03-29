<%-- 
    Document   : ViewTeachers
    Created on : 17 Jun, 2023, 2:37:28 PM
    Author     : BASIL LENIN
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>College</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>


    <body>
        <div id="tab" align="center">
            <h1> Sponsor List</h1>
            <table>
                <tr>
                    <th>Sl.no</th>
                    <th>Subject</th>
                    <th>Teacher</th>
                    <th>Chat</th>


                </tr>
                <%                    int i = 0;
                    String selQry = "select * tbl_sponser";
                    ResultSet rsz = con.selectCommand(selQry);
                    while (rsz.next()) {
                        i++;
                %>

                <tr>
                    <td><%=i%></td>



                    <td><%=rsz.getString("sponser_name")%></td>
                    <td><a href="SponsorChat/Chat.jsp?id=<%=rsz.getString("sponser_id")%>">Chat</a></td>

                </tr>

                <%
                    }

                %>
            </table>
        </div>
        <%@include file="Footer.jsp" %>
    </body>

</html>
