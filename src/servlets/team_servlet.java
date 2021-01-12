package servlets;

import beans.Account;
import beans.Project;
import beans.Staff;
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
import java.util.List;


/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(
       urlPatterns = {"/team"}
)
public class team_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public team_servlet() {
        super();

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
// check login
        HttpSession session = request.getSession();
        Account User = UtilsMy.getLoginedUser(session);
        request.setAttribute("user",User);
        if (User == null) {
            // Redirect to login page.
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        // load Team
        List<Project> listProject = null;
        List<Team> listTeam = null;
        Team myteam = null;
        Staff staff = null;
        boolean hasError = false;
        String errorString = null;

        Connection conn = UtilsMy.getStoredConnection(request);
        try {


            listProject = UtilsDB.storeListProject(conn);
            listTeam = UtilsDB.storeInfoListTeam(conn);
            staff = UtilsDB.storeInfoUser(conn,User.getUserName());
            myteam = UtilsDB.storeInfoTeam(conn,staff.getIdTeam());

            //System.out.print(listTeam.get(0).getId());
            if (listProject == null || listTeam == null) {
                hasError = true;
                errorString = "Connection is invalid";

            }
        } catch (SQLException e) {
            e.printStackTrace();
            hasError = true;
            errorString = e.getMessage();
        }

        request.setAttribute("myTeam", myteam);
        //System.out.print(myteam.getAdmin());
        request.setAttribute("TeamList", listTeam);
        request.setAttribute("ProjectList", listProject);
        String ItemMenu = "";


        if( User.getType().equals("Admin")){
            ItemMenu = "team";
        }
        else if (User.getType().equals("Emp"))
            ItemMenu = "teamS";
        else if (User.getType().equals("LeaderTeam"))
            ItemMenu = "teamL";

        request.setAttribute("ItemMenu",ItemMenu);
        String Name = "Team";
        request.setAttribute("Name",Name);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/dashboard_guest");
        dispatcher.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
