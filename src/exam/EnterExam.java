package exam;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EnterExam
 */
@WebServlet("/EnterExam")
public class EnterExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnterExam() {
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
		String qid=request.getParameter("qid");
		String mark=(String)session.getAttribute("mark");
		
		System.out.println(mark+"mark");
		System.out.println(qid+"qid");
		String answer=request.getParameter("a");
		String	qid1="";
		String	correctAns="";
		System.out.println(answer+"answer");
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:ahmed/rimy@localhost:1521/orcl");		
			String sql="INSERT INTO S_ANSWERS (SID,QID,ANSWER) values('"+Uid+"','"+qid+"','"+answer+"')";
			PreparedStatement stmt=con.prepareStatement(sql);
			int num=stmt.executeUpdate();
			if(num!=0)
			{
				session.setAttribute("Uid", Uid);
				RequestDispatcher rs=request.getRequestDispatcher("enterExam.jsp");
				rs.forward(request, response);
			}
			else
			{
				response.sendRedirect("signUp.jsp");
				
			}
			String sql1="SELECT DISTINCT C.ANSWER,C.QID FROM correct_answer C  INNER JOIN question Q ON Q.ID=C.QID INNER JOIN EXAM E ON Q.EID=E.ID";
			PreparedStatement stmt1=con.prepareStatement(sql1);
			ResultSet rs=stmt1.executeQuery();
			while(rs.next()) {
			qid1=rs.getString("QID");
			correctAns=rs.getString("ANSWER");
			
			System.out.println("qid"+qid1);
			System.out.println("qidddd"+qid);
			if(qid1.equals(qid)) {
				System.out.println("equallllllll");
				if(correctAns.equals(answer)) {
					String sqlresult="insert into RESULTS (SID,EID,MARK) values('"+Uid+"','"+eid+"','"+mark+"')";
					PreparedStatement stmt2=con.prepareStatement(sqlresult);
					stmt2.executeUpdate();
				}}
			}
			con.close();	
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
	
			
		}	