package com.ray.jstl.filters;

import com.ray.jstl.models.WebUser;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/Protected/*")
public class AuthorizationFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession s =  req.getSession();

        String dest = req.getServletContext().getContextPath() + "/login.jsp";

        if (req.getRequestURI().toLowerCase().contains("cit"))
        {
            dest = dest + "?dest=Protected/listCities.jsp";
        } else if (req.getRequestURI().toLowerCase().contains("countries")) {
            dest = dest + "?dest=Protected/listCountries.jsp";
        }

        if (s.getAttribute("authorized_user") == null) {
            res.sendRedirect(dest);
            return;
        } else {
            WebUser wu = (WebUser) s.getAttribute("authorized_user");
            if (wu.getUid()==null || wu.getUid().equals("") || wu.getPwd()== null || wu.getPwd().equals("")) {
                res.sendRedirect(dest);
                return;
            }
        }

        chain.doFilter(request, response);
    }
}
