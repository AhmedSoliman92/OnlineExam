package exam;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class registerCourse
 */
@WebServlet("/RegisterCourse")
public class RegisterCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterCourse() {
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
		String Uid= (String)session.getAttribute("Uid");
		String cid=request.getParameter("id");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:ahmed/rimy@localhost:1521/orcl");
		String sql="INSERT INTO ATTENDENCE (CID,SID) values('"+cid+"','"+Uid+"')";
		PreparedStatement stmt=con.prepareStatement(sql);
		int num=stmt.executeUpdate();
		if(num!=0)
		{
			session.setAttribute("Uid", Uid);

			RequestDispatcher rd=request.getRequestDispatcher("studentHome.jsp");
			rd.forward(request, response);
		}
		else
		{
			session.setAttribute("Uid", Uid);
			RequestDispatcher rd=request.getRequestDispatcher("registerCourse.jsp");
			rd.forward(request, response);
			
		}
		con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	

}
