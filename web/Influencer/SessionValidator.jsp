<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("iid") == null)
        {
            response.sendRedirect("../");
        }
    %>