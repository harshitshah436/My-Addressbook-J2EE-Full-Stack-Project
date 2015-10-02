package addressbook;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;
public class AddServer extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html";
  
	public void init() throws ServletException {
	}

    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType(CONTENT_TYPE);
    	PrintWriter out = response.getWriter();
    	String name=request.getParameter("contname");
    	String phone=request.getParameter("contphone");
    	String address=request.getParameter("contaddress");
    	String user=request.getParameter("username");
    	String id = request.getParameter("id");
    	String delFlag = request.getParameter("delflag");
    	
    	System.out.println("the values are as follows");
    	System.out.println(name+address+phone+user);
    	
    	System.out.println(request.getQueryString());
    	
    	if(delFlag!=null) {
    		delDetail(delFlag);
    		System.out.println("del");
    		response.sendRedirect("SearchDetail.jsp?del=1");
    	}
    	else {
    		if(id!=null) {
        		updateDetail(id, user, name, phone, address);
        		System.out.println("update");
        		response.sendRedirect("SearchDetail.jsp?updt=1");
        	}
        	else {
        		addDetail(user,name,phone,address);
        		System.out.println("add");
        		response.sendRedirect("AddSuccess.jsp");
        	}
    	}
    	
    	HttpSession session=request.getSession(true);
    }

   	public void addDetail(String user,String name,String phone,String address ){

    	try {

    		Class.forName("com.mysql.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/addressbook","root","root");
    		Statement st = con.createStatement();
    		st.executeUpdate("insert into record(user,name,phone,address) values('"+user+"','"+name+"','"+phone+"','"+address+"')");
    		st.close();
    	}
    	catch (Exception ex) {
    		System.out.println("Unable to insert values : "+ex);
    	}
    }
    
    public void updateDetail(String id, String user, String name, String phone, String address) {
    	try {

    		Class.forName("com.mysql.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/addressbook","root","root");
    		Statement st = con.createStatement();
    		st.executeUpdate("update record set user='" + user + "'," + "name='" + name + "'," + "phone='" + phone + "'," + "address='" + address + "' where id='" + id + "';");
    		st.close();
    	}
    	catch (Exception ex) {
    		System.out.println("Unable to update values : "+ex);
    	}
    }
    
    private void delDetail(String delFlag) {
    	try {

    		Class.forName("com.mysql.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/addressbook","root","root");
    		Statement st = con.createStatement();
    		st.execute("delete from record where id='" + delFlag + "';");
    		st.close();
    	}
    	catch (Exception ex) {
    		System.out.println("Unable to delete values : "+ex);
    	}
	}
    
    public void destroy() {
    }
}
