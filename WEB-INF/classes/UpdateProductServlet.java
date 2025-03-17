import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/UpdateProductServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();	
	try{
	        String appPath = request.getServletContext().getRealPath("/");

		Class.forName("org.postgresql.Driver");

		Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/jwldb","postgres","test");

		String pid = request.getParameter("prod_id");
		String pname = request.getParameter("prod_name");
		String prate = request.getParameter("rate");
		String pdisc = request.getParameter("disc");
		String cat = request.getParameter("cid");

	        for (Part part : request.getParts()) {
	            String fileName = extractFileName(part);

		    if(!fileName.equals(""))
		    {
			java.io.File d = new java.io.File(appPath + "products/"+pid+".jpg");
			d.delete();
                    	part.write(appPath + "products/"+pid+".jpg");
		    }
	        }

		con.createStatement().executeUpdate("update product set prod_desc='"+pname+"', rate="+prate+", disc="+pdisc+", cat_id="+cat+" where prod_id="+pid);

		response.sendRedirect("add_products.jsp");
	}
	catch(Exception e){
		out.println("<h4>"+e+"</h4>");
	}	
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}
