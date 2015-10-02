package addressbook;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;
public class RegServer extends HttpServlet {
  private static final String CONTENT_TYPE = "text/html";

  //Initialize global variables
  public void init() throws ServletException {
  }

  //Process the HTTP Get request
  public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String name=request.getParameter("cname");
    String city=request.getParameter("city");
    String country = request.getParameter("country");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String user = request.getParameter("editbinf");

    System.out.println("the values are as follows");
    System.out.println(username+password+name+city+country+phone+email);
	HttpSession session=request.getSession(true);
	
    if(request.getParameter("editbinf") != null) {
    	updateDetail(user, name, city, country, phone);
    	response.sendRedirect("MyAccount.jsp?updtbinf=1");
    }
    else {
    int flag = addDetail(username,password,name,city,country,phone,email);
    	if(flag==0) {
    		response.sendRedirect("Default.jsp?regflg=1");
    	}
    	else {
    		response.sendRedirect("register.jsp?flag="+ flag);
    	}
    }
//    HttpSession session1=request.getSession();
//    session1.setAttribute("AdminName",ob);
//    out.println("The session att ");

  }

  public int addDetail(String username, String password, String name, String city, String country, String phone, String email){
	  
	int res = 0;
    try {

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/addressbook","root","root");
    Statement st = con.createStatement();
    
    ResultSet rs;
    rs= st.executeQuery("select * from info where user='"+username+"'");
    //ResultSet rs1 = st.executeQuery("select * from info where email='"+email+"'");
    if(rs.next()) {
    	res = 1;
    	//rs.close();
    }
    else {
    	rs = st.executeQuery("select * from info where email='"+email+"'");
    	if(rs.next())
        	res = 2;
        else {
        	if(phone != "")
        		st.executeUpdate("insert into info (user,password,name,city,country,phone,email) values ('"+username+"','"+password+"','"+name+"','"+city+"','"+country+"','"+phone+"','"+email+"')");
        	else
        		st.executeUpdate("insert into info (user,password,name,city,country,phone,email) values ('"+username+"','"+password+"','"+name+"','"+city+"','"+country+"',null,'"+email+"')");
        	res = 0;
         }
    }
    st.close();
    }
    catch (Exception ex) { System.out.println("Can't able to Sign up due to : " + ex);}
    return res;
  }
  
  public void updateDetail(String user, String name, String city, String country, String phone) {
  	try {

  		Class.forName("com.mysql.jdbc.Driver");
  		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/addressbook","root","root");
  		Statement st = con.createStatement();
  		if(phone != "")
  			st.executeUpdate("update info set name='" + name + "'," + "city='" + city + "'," + "country='" + country + "'," + "phone='" + phone + "' where user='" + user + "';");
  		else
  			st.executeUpdate("update info set name='" + name + "'," + "city='" + city + "'," + "country='" + country + "'," + "phone=null where user='" + user + "';");
  		st.close();
  	}
  	catch (Exception ex) {
  		System.out.println("Unable to update values : "+ex);
  	}
  }
  
  //Clean up resources
  public void destroy() {
  }
}
