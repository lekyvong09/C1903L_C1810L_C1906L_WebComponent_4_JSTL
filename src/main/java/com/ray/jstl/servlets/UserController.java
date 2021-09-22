package com.ray.jstl.servlets;

import com.ray.jstl.dao.UserDao;
import com.ray.jstl.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserController", value = "/user/*")
public class UserController extends HttpServlet {
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();

        switch (action) {
            case "/new":
                showNewForm(request, response);
                break;
            case "/edit":
                showEditForm(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws IOException {

        List<User> userList = userDao.getAllUser();

        HttpSession s = request.getSession();
        s.setAttribute("listUser", userList);

        response.sendRedirect(getServletContext().getInitParameter("hostURL")
                + getServletContext().getContextPath() + "/user-list.jsp");
    }


    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession s = request.getSession();
        s.setAttribute("theUser", null);
        response.sendRedirect(getServletContext().getInitParameter("hostURL")
                + getServletContext().getContextPath() + "/user-form.jsp");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDao.getUser(id);

        HttpSession s = request.getSession();
        s.setAttribute("theUser", existingUser);

        response.sendRedirect(getServletContext().getInitParameter("hostURL")
                + getServletContext().getContextPath() + "/user-form.jsp");
    }

}
