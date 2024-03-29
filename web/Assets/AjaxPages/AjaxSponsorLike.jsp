<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String Id = request.getParameter("id");
    String selQry = "select * from tbl_like where post_id ='"+Id+"' and sponser_id ='"+session.getAttribute("sid")+"'";
    ResultSet rs = con.selectCommand(selQry);
    if(!rs.next())
    {
        String insQry = "insert into tbl_like(post_id,sponser_id,sponser_name,sponser_photo,influencer_photo,influencer_id,influencer_name)"
            + "values('" + Id + "','" + session.getAttribute("sid") + "','" + session.getAttribute("sname") + "','" + session.getAttribute("sphoto") + "','0','0','0')";

    if (con.executeCommand(insQry)) {
        String likesel = "select count(like_id) as count from tbl_like where post_id='" + Id + "'";
        ResultSet cv = con.selectCommand(likesel);
        if (cv.next()) {
            out.println(cv.getString("count"));
        }

    } else {
        out.println("0");
        System.out.println(insQry);
    }
    }
    

%>