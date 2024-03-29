<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String id = request.getParameter("id");
    String Content = request.getParameter("content");
     
    String insQry = "insert into tbl_comment(comment_date,comment_content,post_id, influencer_id, influencer_name, influencer_photo,sponser_id, sponser_name, sponser_photo)"
            + "values(DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'),'"+Content+"','"+id+"','"+session.getAttribute("iid") +"','"+session.getAttribute("iname") +"','"+session.getAttribute("iphoto") +"','0','0','0')";
    
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