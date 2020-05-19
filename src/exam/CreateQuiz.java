package exam;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CreateQuiz
 */
@WebServlet("/CreateQuiz")
public class CreateQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateQuiz() {
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
		String eid=(String)session.getAttribute("eid");
		System.out.println("servlet"+eid);
		
		String cid=request.getParameter("cid");
		String id=request.getParameter("id");
		String ques=request.getParameter("question");
		String mark=request.getParameter("mark");

		String a=request.getParameter("opta");
		String b=request.getParameter("otpb");
		String c=request.getParameter("optc");
		String d=request.getParameter("optd");
		String answer=request.getParameter("answer");
		System.out.println(id);
		System.out.println(ques);
		System.out.println(ques);

		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:ahmed/rimy@localhost:1521/orcl");
		String sql="INSERT INTO QUESTION (ID,EID,QUESTION,MARKS,A,B,C,D,CORRECT_ANSWER) VALUES('"+id+"','"+eid+"','"+ques+"','"+mark+"','"+a+"','"+b+"','"+c+"','"+d+"','"+answer+"')";
		String sql1="INSERT INTO CORRECT_ANSWER (QID,ANSWER) VALUES('"+id+"','"+answer+"')";
		PreparedStatement stmt=con.prepareStatement(sql);
		PreparedStatement stmt1=con.prepareStatement(sql1);
		int num=stmt.executeUpdate();
		stmt1.executeUpdate();
		if(num!=0)
		{
			
			session.setAttribute("eid", eid);
			session.setAttribute("Uid",pid);
			RequestDispatcher rd=request.getRequestDispatcher("CreateQuiz.jsp");
			rd.forward(request, response);
			System.out.println("pid"+pid);

		}
		else
		{
			session.setAttribute("eid", eid);
			session.setAttribute("Uid",pid);
			System.out.println("pid"+pid);
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
