package servlets;

import beans.Account;
import beans.Salary;
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
        name="getSalary",urlPatterns = {"/getSalary"}
)
public class getSalary_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public getSalary_servlet() {
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
        request.setAttribute("user",User);
        if (User == null) {
            // Redirect to login page.
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        String month = request.getParameter("monthget");
        String year = request.getParameter("yearget");
        // load DB to Task
        List<Salary> listSalary = null;
        List<Salary> mysalary = null;

        boolean hasError = false;
        String errorString = null;

        int monthI = 0;
        int yearI = 0;
        try {

            monthI = Integer.parseInt(month);
            yearI = Integer.parseInt(year);


        } catch (Exception e) {}
        Connection conn = UtilsMy.getStoredConnection(request);
        try {

            listSalary = UtilsDB.storeListSalary(conn);
            mysalary = UtilsDB.storeMysalary(conn,User.getUserName());
            UtilsDB.checkSalaryMonth(conn,monthI,yearI);
            if (listSalary == null ) {
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


            String ItemMenu = "salary";
            String Name = "Salary";
            request.setAttribute("ItemMenu",ItemMenu);
            request.setAttribute("Name",Name);
            response.sendRedirect(request.getContextPath() + "/dashboard_guest");
        }


        request.setAttribute("SalaryList",listSalary);
        String ItemMenu = "salary";
        if( User.getType().equals("Admin")){
            ItemMenu = "salary";
        }
        else if (User.getType().equals("Emp"))
            ItemMenu = "salaryS";
        else if (User.getType().equals("LeaderTeam"))
            ItemMenu = "salary";
        String Name = "Salary";
        request.setAttribute("SalaryListS",mysalary);
        request.setAttribute("ItemMenu",ItemMenu);
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
