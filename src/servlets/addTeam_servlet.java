package servlets;

import beans.Account;
import beans.Team;
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


/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(
        name="addTeam",urlPatterns = {"/addTeam"}
)
public class addTeam_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public addTeam_servlet() {
        super();

    }

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
        Team team = null;
        int idTeam =1;
        boolean hasError = false;
        String errorString = request.getParameter("errorString");
        System.out.print("\nError: "+errorString + "\n");
        Connection conn = UtilsMy.getStoredConnection(request);
        try {
            // Find the user in the DB.
            team = UtilsDB.storeInfoTeam(conn, idTeam);

            if (team == null) {
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



        request.setAttribute("teamInfo",team);
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


        String name = (String) request.getParameter("teamName");
        String teamAddress = request.getParameter("teamAddress");
        String teamEmail = request.getParameter("teamEmail");
        String teamPhone = request.getParameter("teamPhone");
        String teamIdAdminStr =  request.getParameter("teamIdAdmin");



        int teamIdAdmin = 0;
        int status =1;
        int id=0;

        try {

            teamIdAdmin = Integer.parseInt(teamIdAdminStr);
            //status = Integer.parseInt(statusStr);

        } catch (Exception e) {
        }


        Team team = new Team(id,name, teamAddress,teamPhone,teamEmail,teamIdAdmin);
        boolean hasError = false;
        String errorString ="";
        if (name == null /*|| dateOfBirth == null || address ==null || email == null || idTeam == 0 || phone == null*/) {
            hasError = true;
            errorString = "Required fill full, Name  or Address or Email or Phone or IdTeam is null!";

        } else {
            Connection conn = UtilsMy.getStoredConnection(request);
            try {
                // update the user in the DB.
                UtilsDB.storeaddTeam(conn, team);
            } catch (SQLException e) {
                e.printStackTrace();
                hasError = true;
                errorString = e.getMessage();
            }
        }
        if (hasError) {

            request.setAttribute("errorStringAddTeam", errorString);
            System.out.print(errorString);
        }
        request.setAttribute("user",User);
        //doGet(request,response);

    }
}
