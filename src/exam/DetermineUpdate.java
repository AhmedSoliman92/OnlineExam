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

/**
 * Servlet implementation class DetermineUpdate
 */
@WebServlet("/DetermineUpdate")
public class DetermineUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetermineUpdate() {
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
		String uid=request.getParameter("Uid");
		
		String name="";
		String type="";
		String email="";
		String password="";
		String id="";
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:ahmed/rimy@localhost:1521/orcl");
			String sql="SELECT * FROM USERS WHERE ID=?";
			PreparedStatement stmt=con.prepareStatement(sql);
			
			stmt.setString(1,uid);
			ResultSet rs=stmt.executeQuery();
			int count=0;
			while(rs.next()){
			 name=rs.getString(1);
			 type=rs.getString(2);
			 email=rs.getString(3);
			 password=rs.getString(4);
			 id=rs.getString(5);
			 if(!id.contentEquals("null")) {
				 count+=1;
			 }
			}
			if(count!=0) {
				String a=request.getParameter(id);
				request.setAttribute("id", a);
				RequestDispatcher rd=request.getRequestDispatcher("/updateUser.jsp");
				rd.forward(request, response);
				
			}
		}catch(Exception e){
			System.out.println(e);
		}
	
	}

}
