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
 * Servlet implementation class SignIn
 */
@WebServlet("/SignIn")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignIn() {
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
		String Uid=request.getParameter("Uid");
		String epass=request.getParameter("upass");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:ahmed/rimy@localhost:1521/orcl");
			String sql="select * from USERS ";
			PreparedStatement stmt=con.prepareStatement(sql);
			
			ResultSet rs=stmt.executeQuery();
			String sign="SELECT * FROM USERS WHERE ID="+Uid;
			PreparedStatement ps=con.prepareStatement(sign);
			ResultSet rs1=ps.executeQuery();
			int count=0;
		    while(rs.next()){
					String id=rs.getString(5);
					String password=rs.getString(4);
					if(Uid.equals(id) && epass.equals(password))
					{
						count=count+1;
					}
				}
		   if(count!=0)
		   {
			   while(rs1.next()) {
				   boolean compareType1=rs1.getString("TYPE").equals("admin");
				   boolean compareType2=rs1.getString("TYPE").equals("Teacher");
				   String course=rs1.getString(5);
				   boolean compareType3=rs1.getString("TYPE").equals("Student");
				   if(compareType1==true) {
					   HttpSession session=request.getSession();
					   session.setAttribute("Uid",Uid );
					   RequestDispatcher rd=request.getRequestDispatcher("adminHome.jsp");
					   rd.forward(request,response);
					    	}else if (compareType2==true) {
					    		HttpSession session=request.getSession();
								session.setAttribute("Uid", course);
								RequestDispatcher rd=request.getRequestDispatcher("teacherHome.jsp");
								rd.forward(request, response);
					    	} else if (compareType3==true) {
					    		HttpSession session=request.getSession();
					    		session.setAttribute("Uid", Uid);
					    		RequestDispatcher rd=request.getRequestDispatcher("studentHome.jsp");
					    		rd.forward(request,response);
					    	}
					    }
				}
				else{
					response.sendRedirect("login.jsp");
				}
				   con.close();
		}
		catch(Exception e){
			System.out.println("Exception Found!!"+e);
		}
	}

}
