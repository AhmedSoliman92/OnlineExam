package exam;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CreateNewExam
 */
@WebServlet("/CreateNewExam")
public class CreateNewExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateNewExam() {
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
		String Uid=request.getParameter("pid");
        String id=request.getParameter("id");
		
		String cid=request.getParameter("cid");
		String type=request.getParameter("type");
		String date1=request.getParameter("date");
		LocalDate date = LocalDate.parse(  date1.substring( 0 , 10 ) );		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:ahmed/rimy@localhost:1521/orcl");
		String sql="insert into EXAM (ID,CID,EXAM_TYPE,EXAM_DATE) VALUES(?,?,?,?)";
		PreparedStatement stmt=con.prepareStatement(sql);
		stmt.setString(1,id);
		stmt.setString(2,cid);
		stmt.setString(3,type);
		stmt.setObject(4, date);
		int num=stmt.executeUpdate();
		
		if(num!=0)
		{
			HttpSession session=request.getSession();
			session.setAttribute("cid", cid);
			//teacher
			session.setAttribute("Uid", Uid);
			RequestDispatcher rd=request.getRequestDispatcher("teacherHome.jsp");
			rd.forward(request, response);
		}
		else
		{
			HttpSession session=request.getSession();
			session.setAttribute("cid", cid);
			session.setAttribute("Uid", Uid);
			RequestDispatcher rd=request.getRequestDispatcher("createExam.jsp");
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
