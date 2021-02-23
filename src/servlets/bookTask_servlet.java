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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(
        name="bookTask",urlPatterns = {"/bookTask"}
)
public class bookTask_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookTask_servlet() {
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


// check login
        HttpSession session = request.getSession();
        Account User = UtilsMy.getLoginedUser(session);
        request.setAttribute("user",User);
        if (User == null) {
            // Redirect to login page.
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        doPost(request, response);

    }


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        HttpSession session = request.getSession();
        Account User = UtilsMy.getLoginedUser(session);
        request.setAttribute("user",User);
        if (User == null) {
            // Redirect to login page.
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        request.setCharacterEncoding("utf-8");


        Task task = null;
        String name = request.getParameter("name");
        String content = request.getParameter("content");
        String idProjectStr = request.getParameter("idProject");
        String timeFromStr = request.getParameter("timefrom");
        String timeEndStr = request.getParameter("timeend");
        String idStaffStr = request.getParameter("idstaff");


        boolean hasError = false;
        String errorString = null;

        java.sql.Timestamp timeFrom = null;
        java.sql.Timestamp timeEnd = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        SimpleDateFormat output = new SimpleDateFormat("yyyy-MM-dd HH:mm");


        Date d = null;
        try {
            d = sdf.parse(timeFromStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String formattedTime = output.format(d);
        int idProject=0;
        int idStaff =0;
        System.out.print(idProjectStr);
        try {


            timeFrom = new java.sql.Timestamp(sdf.parse(timeFromStr).getTime());
            timeEnd = new java.sql.Timestamp(sdf.parse(timeEndStr).getTime());
            idProject = Integer.parseInt(idProjectStr);
            idStaff = Integer.parseInt(idStaffStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        task = new Task(name,content,idProject,idStaff,timeFrom,timeEnd);
        Connection conn = UtilsMy.getStoredConnection(request);
        try {

            UtilsDB.addTask(conn,task);

        } catch (SQLException e) {
            e.printStackTrace();
            hasError = true;
            errorString = e.getMessage();
        }
        if (hasError) {
            // Store information in request attribute, before forward.
            request.setAttribute("errorString", errorString);
            // Forward to /WEB-INF/views/login.jsp


            String ItemMenu = "tasks";
            request.setAttribute("ItemMenu",ItemMenu);
            String Name = "Tasks";
            request.setAttribute("Name",Name);
            response.sendRedirect(request.getContextPath() + "/tasks");
        }



        String ItemMenu = "tasks";
        request.setAttribute("ItemMenu",ItemMenu);
        String Name = "Tasks";
        request.setAttribute("Name",Name);
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/tasks");
        dispatcher.forward(request, response);

    }
}
