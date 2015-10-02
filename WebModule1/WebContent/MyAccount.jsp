<%@page import="addressbook.Record"%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns="http://www.w3.org/TR/REC-html40">
<head>
<title>My Address Book---My Account</title>

<script>

function form_validator()
{

  	if(theForm.contname.value == "") {
		 alert("Please Enter Name !");
		 theForm.userName.focus();
		 return(false);
	}

	if(theForm.contphone.value == "") {
		 alert("Please Enter Phone No !");
		 theForm.studentNo.focus();
		 return(false);
	}

	if(theForm.contaddress.value == "") {
		 alert("Please Enter Address !");
		 theForm.userID.focus();
		 return(false);
	}

}


</script>
</head>
<BODY bgcolor="#ffffff" bgproperties="fixed" background="images/pusar.GIF">

<BLOCKQUOTE dir=ltr style="MARGIN-RIGHT: 0px">

<%@ page contentType="text/html"%>
<%@ page import="java.util.*, java.sql.*" %>
  <%
  	String name=(String)session.getAttribute("username");

              if(name==null){
          response.sendRedirect("SessionExpire.jsp");
        }

        //out.println("This is a value in Enter Detail : "+name);
    String id = request.getParameter("id");
    String ename = "";
    String phone = "";
    String uname = "";
    String city = "";
    String country = "";
    String email = "";
  
    try {
		String connectionURL = "jdbc:mysql://localhost:3306/addressbook";
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL, "root", "root");
        statement = connection.createStatement();
        String QueryString = "SELECT * from info where user='"+ name +"';";
        rs = statement.executeQuery(QueryString);
		
     	while (rs.next()) {
     		ename = rs.getString("name");
     		phone = (rs.getString("phone")==null)?"-":rs.getString("phone");
     		uname = rs.getString("user");
     		city = (rs.getString("city").toString()=="")?"-":rs.getString("city");
     		country = (rs.getString("country")=="")?"-":rs.getString("country");
     		email = rs.getString("email");
		}
		
		rs.close();
		statement.close();
		connection.close();
	}
	catch (Exception ex) {
        System.out.println("Unable to connect to Database:"+ex);
    }
  %>

<P align=center></P>

<P align=center></P>

<P align=center></P>

<P align=center><strong><font face="Verdana" color="#800000">





<form onsubmit="form_validator()" name="theForm" action="addserver?edit=1">
</font></strong></P>

<input type="hidden" name="username" value="<%=name%>">

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
            <td valign="bottom">
            <p align="center"><b><font color="#99CCCC" size="5"></font></p>
            <p align="center">&nbsp;</p>
            <p align="center">&nbsp;</p>
            
            <b>
            <font face="VERDANA" color="blue" size="1">
            <font color="blue" face="verdana" size="1">
            <table cellSpacing="0" cellPadding="0" width="142" border="0" height="1">
            
              <tr>
                <td height="34" width="161">
                <img border="0" src="images/new.GIF" width="154" height="34"></td>
              </tr>
              <tr>
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
                
            <font face="VERDANA" color="blue" size="1">
                <font face="VERDANA" color="#99CCCC">
                <p>
            <b>
            <!--[if gte vml 1]><v:shapetype id="_x0000_t75"
 coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe"
 filled="f" stroked="f">
 <v:stroke joinstyle="miter"/>
 <v:formulas>
  <v:f eqn="if lineDrawn pixelLineWidth 0"/>
  <v:f eqn="sum @0 1 0"/>
  <v:f eqn="sum 0 0 @1"/>
  <v:f eqn="prod @2 1 2"/>
  <v:f eqn="prod @3 21600 pixelWidth"/>
  <v:f eqn="prod @3 21600 pixelHeight"/>
  <v:f eqn="sum @0 0 1"/>
  <v:f eqn="prod @6 1 2"/>
  <v:f eqn="prod @7 21600 pixelWidth"/>
  <v:f eqn="sum @8 21600 0"/>
  <v:f eqn="prod @7 21600 pixelHeight"/>
  <v:f eqn="sum @10 21600 0"/>
 </v:formulas>
 <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/>
 <o:lock v:ext="edit" aspectratio="t"/>
</v:shapetype><v:shape id="_x0000_s1031" type="#_x0000_t75" style='position:absolute;
 margin-left:135.75pt;margin-top:-99pt;width:381.75pt;height:243pt;z-index:1;
 mso-position-horizontal-relative:text;mso-position-vertical:absolute;
 mso-position-vertical-relative:text' wrapcoords="-171 0 -171 21479 21600 21479 21600 0 -171 0">
 <v:imagedata src="usermain_files/image001.jpg" o:title="pbog" gain="19661f"
  blacklevel="22938f"/>
</v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;position:
absolute;z-index:1;left:181px;top:-132px;width:509px;height:324px'><img
width=509 height=324 src="usermain_files/image002.jpg" v:shapes="_x0000_s1031"></span><![endif]></b><font face="VERDANA" color="blue"></td>
              </tr>
            <font face="VERDANA" color="blue" size="1">
              <font face="VERDANA" size="1" color="#99CCCC">
              <tr>
            <font color="blue" face="verdana">
                <td width="161" background="images/menu_02.gif" height="18">
                <p align="center"><font color="#99CCCC" face="ms sans serif">&nbsp;</font></font></font></font></font></font><font color="blue"><a style="text-decoration: none" href="EnterDetail.jsp"><font color="#99CCCC" face="Verdana">Add Contact
               </font></a></td>
              </tr>
              </font>
            <font face="VERDANA" color="blue" size="1">
              <tr>
            <font color="blue" face="verdana" size="1">
                <td width="161" background="images/menu_02.gif" height="19">&nbsp;</td>
              </font>
              </tr>
              </font>
            <font face="VERDANA" color="blue">
              <tr>
            <font color="blue" face="verdana">
                <td width="161" background="images/menu_02.gif" height="18">
                <p align="center"><font color="#99CCCC" face="ms sans serif">&nbsp;</font></font></font><font color="#99CCCC"><a style="text-decoration: none" href="SearchDetail.jsp"><font color="#99CCCC" face="Verdana">View Contacts
               </font></a></td>
              </tr>
            </font><font face="VERDANA" size="1" color="#99CCCC">
            <font face="VERDANA" color="blue" size="1">
            <font color="blue" face="verdana" size="1">
              <tr>
                <td width="161" background="images/menu_02.gif" height="19">&nbsp;</td>
              </tr>
              </font><font face="VERDANA" size="1" color="#99CCCC">
              <tr>
                <td width="161" background="images/menu_02.gif" height="1">
                 <p align="center"><font color="#99CCCC" face="ms sans serif">&nbsp;</font></font></font><font color="#99CCCC"><a style="text-decoration: none" href="Default.jsp"><font color="#99CCCC" face="Verdana">Log Out</font>
            </font></font>
               <font face="VERDANA" color="blue" size="1">
              <tr>
            <font color="blue" face="verdana" size="1">
                <td width="161" background="images/menu_02.gif" height="19">&nbsp;</td>
              </font>
              </tr>
              <tr>
                <td height="33" width="161">
            <b>
                <font face="VERDANA" color="blue" size="1">
                <img border="0" src="images/newnew.GIF" width="156" height="33"></font></b><p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p></td>
              </tr>
            </table>
            </font></b>
            <p align="center">&nbsp;</td>
            <td> 
            <p align="left"><b><font color="#99CCCC" size="5" style="text-transform: capitalize;">My Account</font>
            <span style="text-align: right; margin-left: 350px;"><a href="javascript:history.back()" style="color: #99CCCC;"></a></span>
            <br>
            <br>
            <%
            try{
        		if(request.getParameter("updtbinf")!=null) {
        			out.print("<span style=\"color:#99CCCC;font-size: 20px;font-weight: bold;\">Your Account Info. updated Successfully!</span>");
        		}
        	}
        	catch(Exception ex) {};
            
            %>
            <table cellSpacing="2" cellPadding="3" width="80%" align="left" border="1">
                <tr bgColor="#B9CECD">
                  <td noWrap colSpan="2" height="16">
                  <strong><font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  My Account Details</font></strong>
                  <span style=" margin-left:260px;"><a href="EditMyAccount.jsp" style="color: #638989;">Edit</a></span>
                  </td>
                </tr>
                <tr bgColor="#eeeeee">
                  <td noWrap align="left" width="80px" height="16">
                  	<strong><font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  	Name :</font></strong>      
                  </td>
                  <td bgColor="#eeeeee" height="32">
                  	<font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  	<%= ename %>
                  	</font>
                  </td>
                </tr>
                <tr bgColor="#eeeeee">
                  <td noWrap align="left" height="16">
                  	<strong><font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  	UserName :</font></strong>      
                  </td>
                  <td bgColor="#eeeeee" height="32">
                  	<font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  	<%= uname %>
                  	</font>
                  </td>
                </tr>
                <tr bgColor="#eeeeee">
                  <td noWrap align="left" height="16">
                  	<strong><font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  	Phone :</font></strong>      
                  </td>
                  <td bgColor="#eeeeee" height="32">
                  	<font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  	<%= phone %>
                  	</font>
                  </td>
                </tr>
                <tr bgColor="#eeeeee">
                  <td noWrap align="left" height="16">
                  	<strong><font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  	City :</font></strong>      
                  </td>
                  <td bgColor="#eeeeee" height="32">
                  	<font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  	<%= city %>
                  	</font>
                  </td>
                </tr>
                <tr bgColor="#eeeeee">
                  <td noWrap align="left" height="16">
                  	<strong><font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  	Country :</font></strong>      
                  </td>
                  <td bgColor="#eeeeee" height="32">
                  	<font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  	<%= country %>
                  	</font>
                  </td>
                </tr>
                <tr bgColor="#eeeeee">
                  <td noWrap align="left" height="16">
                  	<strong><font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  	E-mail :</font></strong>      
                  </td>
                  <td bgColor="#eeeeee" height="32">
                  	<font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  	<%= email %>
                  	</font>
                  </td>
                </tr>
                <tr bgColor="#B9CECD">
                  <td colspan="2">&nbsp;</td>
                </tr>
              </table>
            </td>
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
</form>

</BODY>
</HTML>
