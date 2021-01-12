package servlets;

import beans.Account;
import beans.Task;
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
        name="storeTaskName", urlPatterns = {"/storeTaskName"}
)
public class storeTaskName_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public storeTaskName_servlet() {
        super();

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
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
        request.setAttribute("user",User);
        if (User == null) {
            // Redirect to login page.
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        // load Team
        List<Task> listTaskName = null;
        List<Task> listTask =null;
        String charStr = request.getParameter("textName");
        String idStaffStr = request.getParameter("idStaff");
        String idProjectStr = request.getParameter("idProject");

        boolean hasError = false;
        String errorString = null;
        int idStaff = 0 ;
        int idProject = 0;
        try {

            idStaff = Integer.parseInt(idStaffStr);


        } catch (Exception e) {
        }
        try {


            idProject = Integer.parseInt(idProjectStr);

        } catch (Exception e) {
        }
        System.out.print(idStaff + "---"+ idProject +"---  "+charStr);
        Connection conn = UtilsMy.getStoredConnection(request);
        try {

            listTask = UtilsDB.storeListTask(conn);

            listTaskName = UtilsDB.storeListTask(conn,charStr,idProject,idStaff);

            //System.out.print(listTeam.get(0).getId());
            if(listTask == null ){
                hasError = true;
                errorString = "User is no Permission to see list Task";
            }
            if ( listTaskName == null) {
                hasError = true;
                errorString = "No Task has Name like this";

            }
        } catch (SQLException e) {
            e.printStackTrace();
            hasError = true;
            errorString = e.getMessage();
        }
        if(hasError){
            request.setAttribute("errorString",errorString);

        }


        request.setAttribute("TaskList", listTask);
        request.setAttribute("TaskNameList", listTaskName);

        String ItemMenu = "tasks";
        request.setAttribute("ItemMenu",ItemMenu);
        String Name = "Tasks";
        request.setAttribute("Name",Name);

        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/dashboard_guest");
        dispatcher.forward(request, response);

    }
}
