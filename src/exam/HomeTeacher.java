 package exam;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class HomeTeacher
 */
@WebServlet("/HomeTeacher")
public class HomeTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeTeacher() {
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
		HttpSession session=request.getSession();
		String pid= (String) session.getAttribute("Uid");
		System.out.println("fdsfdgshwer3ea"+pid);
		String name="";
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:ahmed/rimy@localhost:1521/orcl");
			String sql="SELECT * FROM COURSES WHERE PID=?";
			PreparedStatement stmt=con.prepareStatement(sql);
			
			stmt.setString(2,pid);
			ResultSet rs=stmt.executeQuery();
			int count=0;
			while(rs.next()){
			
		        name=rs.getString(3);
		     if(!name.equals("null")) {
		    	 count+=1;
		     }
			}
			if(count!=0) {
				session.setAttribute("pid", pid);
				RequestDispatcher rd=request.getRequestDispatcher("teacherHome.jsp");
				rd.forward(request, response);
			}
			else {
				session.setAttribute("pid", pid);
				RequestDispatcher rd=request.getRequestDispatcher("teacherHome.jsp");
				rd.forward(request, response);
				}
		}catch(Exception e){
			System.out.println(e);
		}
			
	}

}
