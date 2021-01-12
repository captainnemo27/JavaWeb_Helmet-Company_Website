package servlets;

import beans.Task;
import utils.UtilsDB;
import utils.UtilsMy;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;


/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(
        urlPatterns = {"/storeCheckTask"}
)
public class storeCheckTask_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public storeCheckTask_servlet() {
        super();

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        boolean hasError = false;
        String errorString = null;
        Task task = null;
        String idstr = request.getParameter("id");
        String checkValue = request.getParameter("check");
        System.out.print(checkValue+"  "+ idstr);
        int status = 0;
        if(checkValue.equals("Running"))
        {
            status=0;
        }
        else if (checkValue.equals("Done"))
        {
            status=1;
        }
        int idTask = 0;
        try {

            idTask = Integer.parseInt(idstr);


        } catch (Exception e) {
        }

        System.out.print(status);
        Connection conn = UtilsMy.getStoredConnection(request);
        try {

            UtilsDB.storeCheckTask(conn,idTask,status);

        } catch (SQLException e) {
            e.printStackTrace();
            hasError = true;
            errorString = e.getMessage();
        }
        if(hasError) {
            request.setAttribute("errorString", errorString);

        }
        try (PrintWriter out = response.getWriter()) {
            out.write("[" + errorString + "]");
        }
        /*String ItemMenu = "tasks";
        request.setAttribute("ItemMenu",ItemMenu);
        String Name = "Tasks";
        request.setAttribute("Name",Name);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/dashboard_guest");
        dispatcher.forward(request, response);*/
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
