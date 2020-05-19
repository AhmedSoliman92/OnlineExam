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
 * Servlet implementation class Result
 */
@WebServlet("/Result")
public class Result extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Result() {
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
		String Uid=(String)session.getAttribute("Uid");
		String eid=(String)session.getAttribute("eid");
		session.setAttribute("Uid", Uid);
		session.setAttribute("eid", eid);
		int marks=0;
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:ahmed/rimy@localhost:1521/orcl");		
		String sql="SELECT *FROM RESULTS WHERE SID="+Uid+" AND EID="+eid;
		PreparedStatement stmt=con.prepareStatement(sql);
		ResultSet rs=stmt.executeQuery();
		int count=0;
		while(rs.next()) {
			String mark=rs.getString(4);
			marks+=Integer.parseInt(mark);
			count=+1;
		}	
		
		if(count!=0)
		{
		
			
			session.setAttribute("marks", String.valueOf(marks));
			session.setAttribute("Uid", Uid);
			RequestDispatcher rs1=request.getRequestDispatcher("Result.jsp");
			rs1.forward(request, response);
		}
		else
		{
			response.sendRedirect("studentHome.jsp");
			
		}
		con.close();	
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
