<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome To My Address Book---Sign Up</title>

<script language="JavaScript">

function form_validator()
{
	if(regForm.username.value == "") {
		 alert("Please Enter UserName !");
		 regForm.username.focus();
		 return(false);
	}

	if(regForm.password.value == "") {
		 alert("Please Enter Password !");
		 regForm.password.focus();
		 return(false);
	}
	
  	if(regForm.cname.value == "") {
		 alert("Please Enter your Name !");
		 regForm.cname.focus();
		 return(false);
	}
	
	if(regForm.email.value == "") {
		 alert("Please Enter your E-mail !");
		 regForm.email.focus();
		 return(false);
	}
	
	if(regForm.password.value != regForm.conpassword.value) {
		alert("Password and Confirm Password do not Match!");
		regForm.conpassword.focus();
		 return(false);
	}
	
	var pass = regForm.password.value;
	if(pass.length < 6) {
		alert("Please Enter Minimum 6 character Password!");
		regForm.password.focus();
		 return(false);
	}
	
	var email = regForm.email.value;
	var filter=/^.+@.+\..{2,3}$/;
	if (!filter.test(email)) {
	    alert("Please enter a valid Email address!");
	    regForm.email.focus();
	    return false;
	}
}
</script>
</head>
<BODY bgcolor="#ffffff" bgproperties="fixed" background="images/pusar.GIF">

<BLOCKQUOTE dir=ltr style="MARGIN-RIGHT: 0px">
<%--   <% --%>


<!--   	String name=(String)session.getAttribute("username"); -->

<!--               if(name==null){ -->
<!--           response.sendRedirect("SessionExpire.jsp"); -->
<!--         } -->

<!--         //out.println("This is a value in Register : "+name); -->
<!--   %> -->

<P align=center></P>

<P align=center></P>

<P align=center></P>

<P align=center><strong><font face="Verdana" color="#800000">

</font></strong></P>
</BLOCKQUOTE>
<form onsubmit="return form_validator()" name="regForm" action="regserver">


<%-- <input type="hidden" name="username" value="<%=name%>"> --%>
<%
	try{
		int flag = Integer.parseInt(request.getParameter("flag"));
		if(flag == 1) {
			out.print("<span style=\"color:red;font-size: 20px;font-weight: bold;\">Username already exists!</span>");
		}
		if(flag == 2) {
			out.print("<span style=\"color:red;font-size: 20px;font-weight: bold;\">E-mail address already exists!</span>");
		}
	}
	catch(Exception ex) {};

	
%>
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
            <td><font face="Arial, Helvetica, sans-serif"><strong>Welcome to My Address Book</strong></font>
            <span style="text-align: right; margin-left: 412px;"><a href="" style="color: #99CCCC;">Back</a></span>
            <br>
            <font face="Verdana, arial, helvetica, sans-serif" size="-1">Enter your Basic details and own an Address Book for free    !<br><br></font>
<!--             <input type="hidden" value="0" name="flag"> -->
<!--               In case of any error in marks contact Administrator.-->
		<table cellSpacing="2" cellPadding="3" width="80%" align="center" border="0" height="235"> 
                <tr bgColor="#cccccc">
                  <td noWrap colSpan="2" height="16">
                  <font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  Enter Basic Details</font>
                  </td>
                </tr>
                <tr bgColor="#eeeeee">
                  <td noWrap align="right" height="32" valign="center">
                  <font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  Username:<span style="color:red;">*</span></font>
                          <input name="username" maxLength=20 size="22">
                          <font face="Verdana, arial, helvetica, sans-serif" size="-1">&nbsp;
                  </font></td>
                  <td vAlign="top" bgColor="#eeeeee" height="32">
                  </td>
                </tr>
                <tr bgColor="#eeeeee">
                  <td noWrap align="right" height="33">
                  <font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  Password:<span style="color:red;">*</span></font>
                          <input type="password" name="password" maxLength=30 size="22">
                          <font face="Verdana, arial, helvetica, sans-serif" size="-1">&nbsp;
                  </font></td>
                  <td vAlign="top" bgColor="#eeeeee" height="33">&nbsp;&nbsp;&nbsp;(To make your password secure, enter &nbsp;&nbsp;&nbsp;atleast 6 characters.)
                </tr>
                <tr bgColor="#eeeeee">
                  <td noWrap align="right" height="33">
                  <font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  Confirm Password:<span style="color:red;">*</span></font>
                          <input type="password" name="conpassword" maxLength=30 size="22">
                          <font face="Verdana, arial, helvetica, sans-serif" size="-1">&nbsp;
                  </font></td>
                  <td vAlign="top" bgColor="#eeeeee" height="33">
                  </td>
                </tr>
                <tr bgColor="#eeeeee">
                <td noWrap align="right" width="50%" height="23">
                  <font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  Name:<span style="color:red;">*</span></font>
                          <input name="cname" size="22" maxLength=15>
                          <font face="Verdana, arial, helvetica, sans-serif" size="-1">&nbsp;
                  </font></td>
                  <td vAlign="top" bgColor="#eeeeee" height="32">
                  </td>
                </tr>
                <tr bgColor="#eeeeee">
                <td noWrap align="right" height="32" valign="center">
                  <font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  City:&nbsp;&nbsp;</font>
                          <input name="city" maxLength=20 size="22">
                          <font face="Verdana, arial, helvetica, sans-serif" size="-1">&nbsp;
                  </font></td>
                  <td vAlign="top" bgColor="#eeeeee" height="32">
                  </td>
                </tr>
                <tr bgColor="#eeeeee">
                <td noWrap align="right" height="32" valign="center">
                  <font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  Country:&nbsp;&nbsp;</font>
                          <input name="country" maxLength=20 size="22">
                          <font face="Verdana, arial, helvetica, sans-serif" size="-1">&nbsp;
                  </font></td>
                  <td vAlign="top" bgColor="#eeeeee" height="32">
                  </td>
                </tr>
                <tr bgColor="#eeeeee">
                <td noWrap align="right" height="32" valign="center">
                  <font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  Phone:&nbsp;&nbsp;</font>
                          <input name="phone" maxLength=20 size="22">
                          <font face="Verdana, arial, helvetica, sans-serif" size="-1">&nbsp;
                  </font></td>
                  <td vAlign="top" bgColor="#eeeeee" height="32">&nbsp;&nbsp;&nbsp;(Enter your 10 digit mobile number)
                  </td>
                </tr>
                <tr bgColor="#eeeeee">
                  <td noWrap align="right" height="33">
                  <font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  E-mail:<span style="color:red;">*</span></font>
                          <input type=text name="email" maxLength=30 size="22">
                          <font face="Verdana, arial, helvetica, sans-serif" size="-1">&nbsp;
                  </font></td>
                  <td vAlign="top" bgColor="#eeeeee" height="33">&nbsp;&nbsp;&nbsp;(e.g. someone@example.com)
                  </td>
                </tr>
                <tr bgColor="#eeeeee">
                <td colSpan="2" height="16"><strong>
                  <font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  NOTE - </font></strong>
                  <font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  <b></b> </font><strong>
                  <font face="Verdana, arial, helvetica, sans-serif" size="-1">
                  To make any changes&nbsp;contact the HelpDesk.</font></strong> 
                  <br/> <span style="color:red;margin-left: 50px;">*</span> fields are mandatory</td>
                </tr>
                <tr bgColor="#cccccc">
                  <td align="right" colSpan="2" height="27">
     <input type="submit" value="  Save  " " style="background-color:#EFEFEF">&nbsp;
     <input type="reset" value="  Reset  " " style="background-color:#EFEFEF"></td>
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
</html>