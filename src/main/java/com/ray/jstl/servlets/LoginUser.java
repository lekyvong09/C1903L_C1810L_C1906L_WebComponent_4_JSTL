package com.ray.jstl.servlets;

import com.ray.jstl.models.WebUser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginUser", value = "/loginUser.do")
public class LoginUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uid = request.getParameter("uid");
        String pwd = request.getParameter("pwd");

        int authLevel = 1;

        WebUser wu = new WebUser();
        wu.setUid(uid);
        wu.setPwd(pwd);
        wu.setAuthLevel(authLevel);

        HttpSession s = request.getSession();
        s.setAttribute("authorized_user", wu);

        if (request.getParameter("rememberMe") != null)
        {
            String rememberMe =  request.getParameter("rememberMe");
            if (rememberMe.equalsIgnoreCase("ON"))
            {
                int CookieLife = 3600*24*7;

                Cookie uidCookie = new Cookie("credentials_uid", uid);
                Cookie pwdCookie = new Cookie("credentials_pwd", pwd);

                uidCookie.setMaxAge(CookieLife);
                pwdCookie.setMaxAge(CookieLife);

                response.addCookie(uidCookie);
                response.addCookie(pwdCookie);
            }
        }

        String target = (request.getParameter("dest")==null || request.getParameter("dest")=="")
                ? "index.jsp"
                : request.getParameter("dest") + ".jsp";

        response.sendRedirect(target);
    }
}
