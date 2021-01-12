package servlets;

import beans.Account;
import beans.Staff;
import utils.UtilsDB;
import utils.UtilsMy;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;


/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(
        name="user",urlPatterns = {"/user"}
)
public class user_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_servlet() {
        super();

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        HttpSession session = request.getSession();
        Account User = UtilsMy.getLoginedUser(session);
        // check cookie of user login
        if (User == null) {
            // Redirect to login page.
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        Staff staff = null;
        boolean hasError = false;
        String errorString = request.getParameter("errorString");
        System.out.print("\nError: "+errorString + "\n");
         Connection conn = UtilsMy.getStoredConnection(request);
            try {
                // Find the user in the DB.
                staff = UtilsDB.storeInfoUser(conn, User.getUserName());

                if (staff == null) {
                    hasError = true;
                    errorString = "User Name is not a Staff";


                }
            } catch (SQLException e) {
                e.printStackTrace();
                hasError = true;
                errorString = e.getMessage();
            }
        String checkpointOK = "selected";
        String checkpointNotOK = "";

        if(staff != null){
            if(staff.getSex().equals("male")){
                request.setAttribute("sex1",checkpointOK);
                request.setAttribute("sex2",checkpointNotOK);
                request.setAttribute("sex3",checkpointNotOK);
            }
            else if(staff.getSex().equals("female")){
                request.setAttribute("sex1",checkpointNotOK);
                request.setAttribute("sex2",checkpointOK);
                request.setAttribute("sex3",checkpointNotOK);
            }
            else if(staff.getSex().equals("orther"))
            {
                request.setAttribute("sex1",checkpointNotOK);
                request.setAttribute("sex2",checkpointNotOK);
                request.setAttribute("sex3",checkpointOK);
            }

        }
        else {
            String userError = "you just have Account is not a Staff";
            request.setAttribute("userError", userError);
        }


        request.setAttribute("staff",staff);
        request.setAttribute("user",User);
        String ItemMenu = "user";
        request.setAttribute("ItemMenu",ItemMenu);
        String Name = "User";
        request.setAttribute("Name",Name);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/dashboard_guest");
        dispatcher.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        HttpSession session = request.getSession();
        Account User = UtilsMy.getLoginedUser(session);
        // check cookie of user login
        if (User == null) {
            // Redirect to login page.
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        request.setCharacterEncoding("utf-8");

        String idStr= (String)request.getParameter("id");
        String name = (String) request.getParameter("name");
        String dateOfBirthStr =  request.getParameter("dateOfBirth");
        String address = (String) request.getParameter("address");
        /*String sex1 = (String) request.getParameter("sex1");
        String sex2 = (String) request.getParameter("sex2");*/
        String sex = (String) request.getParameter("sex");
        String phone = (String) request.getParameter("phone");
        String email = (String) request.getParameter("email");
        String idTeamStr = (String) request.getParameter("idTeam");
        String aboutStaff = (String) request.getParameter("aboutStaff");
        String statusStr = (String) request.getParameter("status");
        if(idStr!=null && name!=null && dateOfBirthStr!=null && address!=null && sex !=null && phone != null && email != null && idTeamStr !=null ){
            System.out.print(dateOfBirthStr);
            System.out.print("\nPost status:");

            if(aboutStaff==null)
            {
                aboutStaff=name+email+phone;
            }
            int id = 0;
            int idTeam=0;
            int status =1;


            java.util.Date dateOfBirth = null;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            try {

                dateOfBirth = new java.util.Date(sdf.parse(dateOfBirthStr).getTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }


            try {
                idTeam = Integer.parseInt(idTeamStr);
                id = Integer.parseInt(idStr);
                //status = Integer.parseInt(statusStr);

            } catch (Exception e) {
            }


            Staff st = new Staff(id,name,dateOfBirth,address,sex,phone,email,User.getUserName(),idTeam,aboutStaff,status);
            boolean hasError = false;
            String errorString ="";
            if (name == null /*|| dateOfBirth == null || address ==null || email == null || idTeam == 0 || phone == null*/) {
                hasError = true;
                errorString = "Required fill full, Name or Dateofbirth or Address or Email or Phone or IdTeam is null!";

            } else {
                Connection conn = UtilsMy.getStoredConnection(request);
                try {
                    // update the user in the DB.
                    UtilsDB.storeUpdateStaff(conn, st );
                } catch (SQLException e) {
                    e.printStackTrace();
                    hasError = true;
                    errorString = e.getMessage();
                }
            }
            if (hasError) {

                request.setAttribute("errorString", errorString);
                System.out.print(errorString);
            }
            request.setAttribute("user",User);
        }

        doGet(request,response);

    }
}
