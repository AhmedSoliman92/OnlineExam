package exam;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateUser
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String name=request.getParameter("uname");
		System.out.println(name);
		String password=request.getParameter("upass");
		System.out.println(password);
		String email=request.getParameter("uemail");
		System.out.println(email);
		String id=request.getParameter("uno");
		System.out.println("45454545454"+id);
		String type=request.getParameter("utype");
		System.out.println(type);
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:ahmed/rimy@localhost:1521/orcl");
			String sql="UPDATE USERS SET NAME=? ,TYPE=? ,EMAIL=? ,PASSWORD=? WHERE ID="+id;
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1,name);
			stmt.setString(2,type);
			stmt.setString(3,email);
			stmt.setString(4,password);
			int num=stmt.executeUpdate();
			if(num!=0)
			{
				response.sendRedirect("adminHome.jsp");	
			}
			else
			{
				response.sendRedirect("updateUser.jsp");
				
			}
			con.close();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
	}	
