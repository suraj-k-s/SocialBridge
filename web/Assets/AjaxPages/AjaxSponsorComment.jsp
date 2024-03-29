<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String id = request.getParameter("id");
    String Content = request.getParameter("content");
     
    String insQry = "insert into tbl_comment(comment_date,comment_content,post_id,sponser_id, sponser_name, sponser_photo, influencer_id, influencer_name, influencer_photo)"
            + "values(DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'),'"+Content+"','"+id+"','"+session.getAttribute("sid") +"','"+session.getAttribute("sname") +"','"+session.getAttribute("sphoto") +"','0','0','0')";
    
    if(con.executeCommand(insQry))
    {
        out.println("1");
    }
    else
    {
        out.println("0");
        System.out.println(insQry);
    
    }
    
%>