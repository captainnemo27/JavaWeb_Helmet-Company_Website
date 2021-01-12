package servlets;

import beans.Account;
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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(name="dashboard", urlPatterns = { "/dashboard"})

public class dashboard_Servlet_User extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public dashboard_Servlet_User() {
        super();

    }

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

// load DB to dashboard
        List<Task> listTask = null;
        List<Team> listTeam = null;

        boolean hasError = false;
        String errorString = null;


        Connection conn = UtilsMy.getStoredConnection(request);
        try {

            listTask = UtilsDB.storeListTaskRunning(conn);
            listTeam = UtilsDB.storeInfoListTeam(conn);

            if (listTask == null || listTeam == null) {
                hasError = true;
                errorString = "Connection is invalid";

            }
        } catch (SQLException e) {
            e.printStackTrace();
            hasError = true;
            errorString = e.getMessage();
        }
        if (hasError) {
            // Store information in request attribute, before forward.
            request.setAttribute("errorString", errorString);
            // Forward to /WEB-INF/views/login.jsp


            String ItemMenu = "dashboard";
            request.setAttribute("ItemMenu",ItemMenu);
            String Name = "Dashboard";
            request.setAttribute("Name",Name);

            response.sendRedirect(request.getContextPath() + "/dashboard_guest");
        }

        request.setAttribute("TeamList", listTeam);
        request.setAttribute("TaskList", listTask);


        String ItemMenu = "dashboard";
        request.setAttribute("ItemMenu",ItemMenu);
        String Name = "Dashboard";
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
