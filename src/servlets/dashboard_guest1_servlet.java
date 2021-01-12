package servlets;

import beans.Task;
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
import java.util.List;


/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(
       name="dashboard_guest1", urlPatterns = {"/dashboard_guest1"}
)
public class dashboard_guest1_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public dashboard_guest1_servlet() {
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
        List<Task> listTask = null;
        List<Team> listTeam = null;

        boolean hasError = false;
        String errorString = null;


        Connection conn = UtilsMy.getStoredConnection(request);
        try {

            listTask = UtilsDB.storeListTaskRunning(conn);
            listTeam = UtilsDB.storeInfoListTeam(conn);
            //System.out.print(listTeam.get(0).getId());
            if (listTask == null || listTeam == null) {
                hasError = true;
                errorString = "Connection is invalid";

            }
        } catch (SQLException e) {
            e.printStackTrace();
            hasError = true;
            errorString = e.getMessage();
        }
        request.getSession().invalidate();
        // If error, forward to /WEB-INF/views/login.jsp
        if (hasError) {
            // Store information in request attribute, before forward.
            request.setAttribute("errorString", errorString);
            // Forward to /WEB-INF/views/login.jsp
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Views/dashboard_guest1.jsp");
            dispatcher.forward(request, response);
        }

        request.setAttribute("TeamList", listTeam);
        request.setAttribute("TaskList", listTask);
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/Views/dashboard_guest1.jsp");
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

