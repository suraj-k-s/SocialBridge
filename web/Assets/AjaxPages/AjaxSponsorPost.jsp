<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String Type = request.getParameter("type");
    String Content = request.getParameter("content");
    String File=request.getParameter("file");
    
    String insQry = "insert into tbl_post(post_date,post_content,post_file,privacy_status,sponser_id,sponser_name,sponser_photo,influencer_id,influencer_name,influencer_photo)"
            + "values(DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'),'"+Content+"','"+File+"','"+Type+"','"+session.getAttribute("sid") +"','"+session.getAttribute("sname") +"','"+session.getAttribute("sphoto") +"','0','0','0')";
    System.out.println(insQry);
    
    if(con.executeCommand(insQry))
    {
        out.println("1");
    }
    else
    {
        out.println("0");
    }
    
%>