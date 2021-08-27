package com.ray.jstl.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "InvalidateSessionAndRemoveCookies", value = "/invalidatesessionandremovecookies.do")
public class InvalidateSessionAndRemoveCookies extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession s = request.getSession();
        s.invalidate();

        Cookie[] MyCookies = request.getCookies();
        if (MyCookies != null && MyCookies.length > 0)
        {
            for (Cookie c : MyCookies)
            {
                if (c.getName().toLowerCase().contains("credentials"))
                {
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
        }
        response.sendRedirect("ClearSessionsAndCookies.jsp");

    }

}
