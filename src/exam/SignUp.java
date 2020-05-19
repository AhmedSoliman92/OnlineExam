package exam;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
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
		String password=request.getParameter("upass");
		String email=request.getParameter("uemail");
		String id=request.getParameter("uno");
		String type=request.getParameter("utype");
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:ahmed/rimy@localhost:1521/orcl");
		String sql="insert into USERS (NAME,TYPE,EMAIL,PASSWORD,ID) values('"+name+"','"+type+"','"+email+"','"+password+"','"+id+"')";
		PreparedStatement stmt=con.prepareStatement(sql);
		int num=stmt.executeUpdate();
		if(num!=0)
		{
			response.sendRedirect("adminHome.jsp");	
		}
		else
		{
			response.sendRedirect("signUp.jsp");
			
		}
		con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
