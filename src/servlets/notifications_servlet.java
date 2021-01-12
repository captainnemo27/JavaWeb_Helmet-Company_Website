package servlets;

import beans.Account;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * Servlet implementation class HomeServlet
 */
@WebServlet(name="notifications", urlPatterns = { "/notifications"})
public class notifications_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public notifications_servlet() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        Account Ac = new Account();
        Ac.setUserName((String) request.getParameter("userName"));
        Ac.setDisplayName((String) request.getParameter("displayName"));
        Ac.setPassWord((String)request.getParameter("passWord"));
        Ac.setType((String)request.getParameter("type"));
        request.setAttribute("Account",Ac);
        String ItemMenu = "notifications";
        request.setAttribute("ItemMenu",ItemMenu);
        String Name = "Notifications";
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
