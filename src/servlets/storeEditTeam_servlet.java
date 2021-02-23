package servlets;

import beans.Team;
import utils.UtilsDB;
import utils.UtilsMy;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;


/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(
        urlPatterns = {"/storeEditTeam"}
)
public class storeEditTeam_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public storeEditTeam_servlet() {
        super();

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        // check login
        String idStr = request.getParameter("id");


        Team myteam = null;
        boolean hasError = false;
        String errorString = null;
        int sc = 0;
        try {
            sc = Integer.parseInt(idStr);
        } catch (Exception e) {}
        Connection conn = UtilsMy.getStoredConnection(request);
        try {

            myteam = UtilsDB.storeInfoTeam(conn,sc);
            System.out.print(myteam.getAdmin());

            if (myteam == null) {
                hasError = true;
                errorString = "Connection is invalid";

            }
        } catch (SQLException e) {
            e.printStackTrace();
            hasError = true;
            errorString = e.getMessage();
        }

        request.setAttribute("teamEdit", myteam);
        String ItemMenu = "team";

        request.setAttribute("ItemMenu",ItemMenu);
        String Name = "Team";
        request.setAttribute("Name",Name);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/team");
        dispatcher.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setCharacterEncoding("utf-8");

        String idstr = request.getParameter("teamId");
        String name = (String) request.getParameter("teamName");

        String teamAddress = request.getParameter("teamAddress");
        String teamEmail = request.getParameter("teamEmail");
        String teamPhone = request.getParameter("teamPhone");
        String teamIdAdminStr =  request.getParameter("teamIdAdmin");



        int teamIdAdmin = 0;
        int status =1;
        int id=0;

        try {
            id=Integer.parseInt(idstr);
            teamIdAdmin = Integer.parseInt(teamIdAdminStr);


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

                UtilsDB.storeupdateTeam(conn, team);
            } catch (SQLException e) {
                e.printStackTrace();
                hasError = true;
                errorString = e.getMessage();
            }
        }
        if (hasError) {

            request.setAttribute("errorStringUpdateTeam", errorString);
            System.out.print(errorString);
        }

        doGet(request, response);
    }
}
