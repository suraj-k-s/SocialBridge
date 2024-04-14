<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String selQry = "select * from tbl_sponser_influencer_chat tsc inner join tbl_sponser t on (tsc.to_sponser_id=t.sponser_id) or (tsc.from_sponser_id=t.sponser_id) where t.sponser_id='" + request.getParameter("id") + "' order by chat_id";
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()) {

        if (rs.getString("to_influencer_id").equals(session.getAttribute("iid"))) {


%>

<div class="chat-message is-received">
    <img src="<%=rs.getString("sponser_photo")%>" alt="">
    <div class="message-block">
        <span><%=rs.getString("sponser_name")%></span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
   
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>

<%
} else if (rs.getString("from_influencer_id").equals(session.getAttribute("iid"))) {

    String sel = "select * from tbl_influencer where influencer_id='" + rs.getString("from_influencer_id") + "'";

    ResultSet z = con.selectCommand(sel);
    if (z.next()) {
%>
<div class="chat-message is-sent">
    <img src="<%=z.getString("influencer_photo")%>" alt="">
    <div class="message-block">
        <span><%=z.getString("influencer_name")%></span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
     <%

        if (!rs.getString("chat_content").equals("This message was Deleted")) {
    %>
    <img style="width: 20px;height: 20px;margin-top: 30px" src="../../Assets/friendskit/assets/img/icons/feed/delete.svg" onclick="deleteChat(<%=rs.getString("chat_id")%>)">

    <%
        }
    %>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>
<%
            }

        }
    }


%>