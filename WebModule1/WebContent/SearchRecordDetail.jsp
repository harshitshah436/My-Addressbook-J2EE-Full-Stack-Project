<%@page import="addressbook.Record"%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns="http://www.w3.org/TR/REC-html40">
<head>

<title>My Address Book---Search Details</title>

<script>

function form_validator()
{

  	if(theForm.search.value == "") {
		 alert("Please Enter Name To Search!");
		 theForm.search.focus();
		 return(false);
	}
}
</script>
</head>
<BODY bgcolor="#ffffff" bgproperties="fixed" background="images/pusar.GIF">

<BLOCKQUOTE dir=ltr style="MARGIN-RIGHT: 0px">

<P align=center></P>

<P align=center></P>

<P align=center></P>

<P align=center><strong><font face="Verdana" color="#800000">





<form onsubmit="form_validator()" name="theForm" action="searchserver">
            <!--<input type="hidden" value="0" name="flag">-->
             <%
//    	String name=(String)session.getAttribute("u");
//	String add=(String)session.getAttribute("uu");
//    	out.println("this is Search Result page"+name +add );>
  	String username=(String)session.getAttribute("username");

              if(username==null){
          response.sendRedirect("SessionExpire.jsp");
        }

//	Object data=session.getAttribute("info");
//        out.println("This is data"+data);
            %>

</font></strong></P>


<div style="position:absolute; top:125; left:400; z-index:2; width:666; height:163">
  <i><font color="#99CCCC" face="Monotype Corsiva" size="3">Search by Name</font></i>
  <input type="text" style="background-color:#99CCCC" size="28" name="search" style="color:green">
    <input type="submit" value="  Search  " style="background-color:#EFEFEF"> 
</div>




<div style="position:absolute; top:197; left:306; z-index:2; width:666; height:163">
<%@ page contentType="text/html"%>
    <%@ page import="java.util.*, org.apache.taglibs.datagrid.DataGridParameters, java.sql.*" %>
    <%@ taglib uri="http://jakarta.apache.org/taglibs/datagrid-1.0" prefix="ui" %>
    <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
    
	<%
		ArrayList records = new ArrayList ();
		Record objRecord = new Record();
		
		String sname = request.getParameter("search");
		
		int fromIndex, toIndex;
		
		try {
			String connectionURL = "jdbc:mysql://localhost:3306/addressbook";
	        Connection connection = null;
	        Statement statement = null;
	        ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "root", "root");
            statement = connection.createStatement();
            String QueryString="";
            
            if(sname != null)
            	QueryString = "select * from record where user='" + username + "' and name like '%" + sname + "%';";
            else
            	QueryString = "SELECT * from record where user='"+username+"';";
            rs = statement.executeQuery(QueryString);
			
            while (rs.next()) {		
            	objRecord = new Record ();
            	objRecord.setId(rs.getInt("id"));
            	objRecord.setUser(rs.getString("user"));
            	objRecord.setName(rs.getString("name"));
            	objRecord.setPhone(rs.getInt("phone"));
            	objRecord.setAddress(rs.getString("address"));
            	records.add(objRecord);
			}
            
			rs.close();
			statement.close();
			connection.close();
		}
		catch (Exception ex) {
            System.out.println("Unable to connect to Database:"+ex);
        }
   		
		fromIndex = (int) DataGridParameters.getDataGridPageIndex (request, "datagrid1");
		if ((toIndex = fromIndex+4) >= records.size ())
  			toIndex = records.size();
   		request.setAttribute ("records", records.subList(fromIndex, toIndex));
	%>
   <style>
    th a:link      { text-decoration: none; color: black }
     th a:visited   { text-decoration: none; color: black }
     .rows          { background-color: white }
     .hiliterows    { background-color: #848484; color: white; font-weight: bold }
     .alternaterows { background-color: #B9CECD }
     .header        { background-color: #99CCCC; color: #789E9C;font-weight: bold }
	
     .datagrid      { border: 1px solid #C7C5B2; font-family: arial; font-size: 11pt;
	    font-weight: normal }
	 .datagrid a {color: #789E9C;}
   </style>
   <script>
   		function ForDelete(id) {
   			var res = confirm("Are you sure to Delete this Record?");
   			var delFlag = document.getElementById("delflag");
   				if(res==true) {
   					delFlag.value = id;
   					document.theForm.action = "addserver";
   					document.forms.theForm.submit();
   				}
   		}
   </script>
   <input type="hidden" name="delflag">
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<ui:dataGrid items="${records}" var="record" name="datagrid1" cellPadding="0" 
    cellSpacing="0" styleClass="datagrid">
  <columns>
    <column width="130">
      <header value="Name" hAlign="center" styleClass="header"/>
      <item   value="${record.name}" hAlign="center" styleClass="item"/>
      <aggregate function="avg" pattern="#,##0.00 " var="total"/>
    </column>
    <column width="80">
      <header value="Phone" hAlign="center" styleClass="header"/>
      <item   value="${record.phone}" hAlign="center" styleClass="item"/>
      <aggregate function="avg" pattern="#,##0.00 " var="total"/>
    </column>
    <column width="300">
      <header value="Address" hAlign="center" styleClass="header"/>
      <item   value="${record.address}" hAlign="center" styleClass="item"/>
      <aggregate function="avg" pattern="#,##0.00 " var="total"/>
    </column>
	<column width="30">
	  <header value="" hAlign="center" styleClass="header"/>
      <item   value="Edit" hAlign="left" hyperLink="EditRecordDetail.jsp?id=${record.id}" styleClass="item"/>
      <aggregate function="count" var="total"/>
    </column>
	<column width="22">
	  <header value="" hAlign="center" styleClass="header"/>
      <item   value="Delete" hAlign="left" hyperLink="javascript:ForDelete(${record.id});" styleClass="item"/>
      <aggregate function="count" var="total"/>
    </column>
  </columns>
  <rows          styleClass="rows" hiliteStyleClass="hiliterows"/>
  <alternateRows styleClass="alternaterows"/>
  <paging        size="4" count="11" custom="true" nextUrlVar="next" 
       previousUrlVar="previous" pagesVar="pages"/>
  <order         imgAsc="up.gif" imgDesc="down.gif"/>
</ui:dataGrid>
<table width="500" style="font-family: arial; font-size: 10pt">
<tr>
<td align="left" width="33%">
<c:if test="${previous != null}">
<a href="<c:out value="${previous}"/>" style="color: #99CCCC;">Previous</a>
</c:if>&nbsp;
</td>
<td align="center" width="33%">
<c:forEach items="${pages}" var="page">
<c:choose>
  <c:when test="${page.current}">
    <b><a href="<c:out value="${page.url}"/>" style="color: #99CCCC;"><c:out value="${page.index}"/></a></b>
  </c:when>
  <c:otherwise>
    <a href="<c:out value="${page.url}"/>" style="color: #99CCCC;"><c:out value="${page.index}"/></a>
  </c:otherwise>
</c:choose>
</c:forEach>
</td>
<td align="right" width="33%">&nbsp;
<c:if test="${next != null}">
<a href="<c:out value="${next}"/>" style="color: #99CCCC;">Next</a>
</c:if>
</td>
</tr>
</table>
</div>





<p>&nbsp;</p>
<table cellSpacing="0" cellPadding="0" width="770" align="center" border="0">
  <tr>
    <td>
    <table cellSpacing="0" cellPadding="2" width="100%" bgColor="#99cccc" border="0">
      <tr>
        <td vAlign="top">&nbsp;<table cellSpacing="0" cellPadding="0" width="100%" bgColor="#ffffff" border="0">
          <tr>
            <td noWrap width="1%" height="1%">
            <img height="30" src="images/blue_top.gif" width="583"></td>
          </tr>
        </table>
        <table height="100%" cellSpacing="0" cellPadding="6" width="100%" bgColor="#ffffff" border="0">
          <tr>
            <td>

            <p align="center">&nbsp;</p>
            <font face="VERDANA" color="blue" size="1"><b>
            <font face="verdana" color="blue" size="1"><font color="blue">
            <table cellSpacing="0" cellPadding="0" width="152" border="0" height="45">
              <tr>
            <font color="blue" face="verdana" size="1">
                <td height="34" width="161">
                <img border="0" src="images/new.GIF" width="154" height="34"></td>
              </font>
              </tr>
              <tr>
            <font color="blue" face="verdana" size="1">
                <td width="161" background="images/menu_02.gif" height="18">
                <p align="center"><font color="#99CCCC" face="ms sans serif">&nbsp;</font></font></font><font color="blue"><font color="#314f6b"><a style="text-decoration: none" href="usermain.jsp"><font color="#99CCCC" face="Verdana">Home</font></a></font></td>
              </tr>
              </font>
            <font face="VERDANA" color="blue" size="1">
            <font color="blue" face="verdana" size="1">
              <tr>
                <td width="161" background="images/menu_02.gif" height="19">&nbsp;</td>
              </tr>
              </font><font face="VERDANA" size="1" color="#99CCCC">
              <tr>
                <td width="161" background="images/menu_02.gif" height="1"></font>
            </font></font>
               <font face="VERDANA" color="blue" size="1">
           
            <font face="VERDANA" color="blue">
                <p align="center">
                <font face="MS Sans Serif" color="#99CCCC">&nbsp;&nbsp;&nbsp;</font></font><font face="VERDANA" color="#99CCCC"></font></font><font face="VERDANA" color="blue"><font face="VERDANA" color="#99CCCC"><a href="MyAccount.jsp" style="text-decoration: none"><font color="#99CCCC">My Account
               </font></a></font></p>
                </font>
                
              <tr>
                <td width="161" background="images/menu_02.gif" height="19">&nbsp;</td>
              </tr>
              </font><font face="VERDANA" size="1" color="#99CCCC">
              <tr>
                <td width="161" background="images/menu_02.gif" height="1"></font>
            </font></font>
            <font face="VERDANA" color="blue">
                <p align="center">
                <font face="MS Sans Serif" color="#99CCCC">&nbsp;&nbsp;&nbsp;</font></font></font><font face="VERDANA" color="blue"><font face="VERDANA" color="#99CCCC"><a href="EnterDetail.jsp" style="text-decoration: none"><font color="#99CCCC">Add Contact</font></a></font></p>
                </font>
                <font face="VERDANA" color="#99CCCC" size="1">
                <p>
                </td>
              </tr>
              <tr>
            <font face="VERDANA" color="blue" size="1">
            <font face="VERDANA" color="blue" size="1">
            <font color="blue" face="verdana" size="1">
                <td width="161" background="images/menu_02.gif" height="18">
                <p align="center"><font color="#99CCCC" face="ms sans serif">&nbsp;</font></font></font></font></font></font><font color="blue"><a style="text-decoration: none" href="SearchDetail.jsp"><font color="#99CCCC" face="Verdana">View Contacts</font></a></td>
              </font>
              </tr>
              <tr>
            <font face="VERDANA" color="blue" size="1">
            <font face="VERDANA" color="blue" size="1">
            <font face="VERDANA" color="blue" size="1">
            <font color="blue" face="verdana" size="1">
                <td width="161" background="images/menu_02.gif" height="19">&nbsp;</td>
              </font>
              </font>
              </tr>
              <tr>
            <font face="VERDANA" color="blue" size="1">
            <font face="VERDANA" color="blue" size="1">
            <font face="VERDANA" color="blue" size="1">
            <font color="blue" face="verdana">
                <td width="161" background="images/menu_02.gif" height="18">
                <p align="center"><font color="#99CCCC" face="ms sans serif">&nbsp;</font></font></font><font color="#99CCCC"><a style="text-decoration: none" href="Default.jsp"><font color="#99CCCC" face="Verdana">Log Out</font></a></td>
            </font>
              </tr>
              <tr>
            <font face="VERDANA" color="blue" size="1">
            <font face="VERDANA" color="blue" size="1">
            <font face="VERDANA" color="blue" size="1">
            <font color="blue" face="verdana" size="1">
                <td width="161" background="images/menu_02.gif" height="19">&nbsp;</td>
              </font>
              </tr>
              <tr>
            <font face="VERDANA" color="blue" size="1">
            <font face="VERDANA" color="blue" size="1">
            <font face="VERDANA" color="blue" size="1">
                <font face="VERDANA" size="1" color="#99CCCC">
                <td height="33" width="161">
            <b>
                <font face="VERDANA" color="blue" size="1">
                <img border="0" src="images/newnew.GIF" width="156" height="33"></font></b><p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p></td>
            </font>
              </tr>
            <font face="VERDANA" color="blue" size="1">
            <font face="verdana" color="blue" size="1">
              </font>
              </font>
            <font face="VERDANA" color="blue" size="1"><font face="VERDANA" size="1" color="#99CCCC">
              </font><font face="VERDANA" size="1" color="#99CCCC">
              </table>
            </font></font></b>
            <p align="center">&nbsp;</td>
          </tr>
        </table>
        <table height="100%" cellSpacing="0" cellPadding="0" width="100%" bgColor="#ffffff" border="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</form>

</BODY>
</HTML>