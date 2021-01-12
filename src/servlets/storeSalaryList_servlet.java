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
        name="storeSalaryList", urlPatterns = {"/storeSalaryList"}
)
public class storeSalaryList_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public storeSalaryList_servlet() {
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
        /*if (User == null) {
            // Redirect to login page.
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }*/
        // load Team
        List<Salary> listSalaryList = null;
        List<Salary> listSalary =null;
        String IdTeamStr = request.getParameter("IdTeamSalary");
        String idStaffStr = request.getParameter("iIdStaffSalary");
        String MonthStr = request.getParameter("Month");
        String YearStr = request.getParameter("Year");
        String chooseStr = request.getParameter("choose");
        boolean hasError = false;
        String errorString = null;
        int idStaff = 0 ;
        int idTeam = 0;
        int month = 0;
        int year = 2020;
        int choose =0;
        try {

            choose = Integer.parseInt(chooseStr);


        } catch (Exception e) {
        }
        try {

            idStaff = Integer.parseInt(idStaffStr);


        } catch (Exception e) {
        }
        try {


            idTeam = Integer.parseInt(IdTeamStr);

        } catch (Exception e) {
        }
        try {
            month = Integer.parseInt(MonthStr);

        } catch (Exception e) {
        }
        try {
            year = Integer.parseInt(YearStr);

        } catch (Exception e) {
        }
        System.out.print("idTeam: "+ idTeam +" year: "+ year +  " month :" + month+"---"+choose);
        Connection conn = UtilsMy.getStoredConnection(request);
        try {

            listSalary = UtilsDB.storeListSalary(conn);

            listSalaryList = UtilsDB.storeListSalaryTeam(conn,idTeam,month,year,choose);


            if(listSalary == null ){
                hasError = true;
                errorString = "User is no Permission to see list Salary";
            }
            if ( listSalaryList == null) {
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
        request.setAttribute("SalaryList", listSalary);
        request.setAttribute("SalaryTeamList", listSalaryList);

        String ItemMenu = "salary";
        request.setAttribute("ItemMenu",ItemMenu);
        String Name = "Salary";
        request.setAttribute("Name",Name);

        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/dashboard_guest");
        dispatcher.forward(request, response);

    }
}
