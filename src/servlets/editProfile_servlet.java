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
import java.sql.Date;
import java.sql.SQLException;


/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(
        name="editProfile",urlPatterns = {"/editProfile"}
)
public class editProfile_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public editProfile_servlet() {
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
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        // check login
        HttpSession session = request.getSession();
        Account User = UtilsMy.getLoginedUser(session);
        // check cookie of user login
        if (User == null) {
            // Redirect to login page.
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // update staff
        String idStr= (String)request.getParameter("id");
        String name = (String) request.getParameter("name");
        String dateOfBirthStr = (String) request.getParameter("dateOfBirth");
        String address = (String) request.getParameter("address");
        String sex1 = (String) request.getParameter("sex1");
        String sex2 = (String) request.getParameter("sex2");
        String sex3 = (String) request.getParameter("sex3");
        String phone = (String) request.getParameter("phone");
        String email = (String) request.getParameter("email");
        String idTeamStr = (String) request.getParameter("idTeam");
        String aboutStaff = (String) request.getParameter("aboutStaff");
        String statusStr = (String) request.getParameter("status");
        String sex = "orther";

        System.out.print(name);
        if(sex1.equals("checked")){
                sex = "male";
        }
        else if(sex2.equals("checked")){
            sex = "female";
        }
        else if(sex3.equals("checked"))
        {
            sex = "orther";
        }

        int id = 0;
        int idTeam=0;
        int status =1;
        Date dateOfBirth = null;
        try {
            idTeam = Integer.parseInt(idTeamStr);
            id = Integer.parseInt(idStr);
            //status = Integer.parseInt(statusStr);
            dateOfBirth= Date.valueOf(dateOfBirthStr);
        } catch (Exception e) {
        }
        Staff st = new Staff(id,name,dateOfBirth,address,sex,phone,email,User.getUserName(),idTeam,aboutStaff,status);

            Connection conn = UtilsMy.getStoredConnection(request);
            try{
                UtilsDB.storeUpdateStaff(conn, st );
            }
            catch (SQLException e){ }


        request.setAttribute("user",User);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/user");
        dispatcher.forward(request, response);
    }
}
