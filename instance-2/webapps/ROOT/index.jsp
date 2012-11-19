<%-- 
    Document   : index
    Created on : 18 Sep, 2012, 6:35:44 PM
    Author     : ramki
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<FONT size = 5 COLOR="#0000FF">
        Instance 2 <br/><br/>
        </FONT>
       
        <hr/>

        <FONT size = 5 COLOR="#CC0000">
         <br/>
        Session Id : <%=request.getSession().getId()%> <br/>
        Is it New Session : <%=request.getSession().isNew()%><br/>
        Session Creation Date : <%=new Date(request.getSession().getCreationTime())%><br/>
        Session Access Date : <%=new Date(request.getSession().getLastAccessedTime())%><br/><br/>
        </FONT>
        <b>Cart List </b><br/>
        <hr/>
        
        
        <ul>
        <%

                String bookName = request.getParameter("bookName");
                List<String> listOfBooks = (List<String>) request.getSession().getAttribute("Books");

                if (listOfBooks == null) {
                    listOfBooks = new ArrayList<String>();
                    request.getSession().setAttribute("Books", listOfBooks);
                }
                if (bookName != null) {
                    listOfBooks.add(bookName);
 		    request.getSession().setAttribute("Books", listOfBooks);
                }


                for (String book : listOfBooks) {
                    out.println("<li>"+book + "</li><br/>");
                }
            
        %>
        </ul>
        <hr/>
        <form action="index.jsp" method="post">
            Book Name <input type="text" name="bookName" />

            <input type="submit" value="Add to Cart"/>
        </form>
        <hr/>
    </body>
</html>

