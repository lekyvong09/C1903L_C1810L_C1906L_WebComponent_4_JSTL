package com.ray.jstl.servlets;

import com.ray.jstl.dbmodels.DBManager;
import com.ray.jstl.helpers.DBWorldQueries;
import com.ray.jstl.models.WebUser;
import com.ray.jstl.utilities.CryptoUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "LoginUser", value = "/loginUser.do")
public class LoginUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession s = request.getSession();
        WebUser wu = (WebUser) s.getAttribute("authorized_user");

        if (wu == null || wu.getUid().equals("") || wu.getUid() == null || wu.getAuthLevel() < 1) {
            String uid = "";
            String pwd = "";

            if (request.getParameter("uid") != null)
                uid = request.getParameter("uid");

            if (request.getParameter("pwd") != null)
                pwd = request.getParameter("pwd");

            if ((wu == null || wu.getUid().equals("")  || wu.getAuthLevel() < 1 || wu.getUid() == null)
                    && (uid != "" && pwd != "")) {

                if (getServletConfig().getServletContext().getAttribute("WorldDBManager") != null)
                {
                    DBManager dbm = (DBManager)getServletConfig().getServletContext().getAttribute("WorldDBManager");

                    try {
                        if (!dbm.isConnected())
                        {
                            if (!dbm.openConnection())
                                throw new IOException("Could not connect to database and open connection");
                        }

                        //String query = DBWorldQueries.getWebUserByUsernameAndPassword(uid, pwd);
                        System.out.println(CryptoUtil.hashPassword(pwd,
                                getServletContext().getInitParameter("salt")));
                        String query = DBWorldQueries.getWebUserByUsernameAndPassword(uid,
                                CryptoUtil.hashPassword(pwd, getServletContext().getInitParameter("salt")));
                        ResultSet rs = dbm.ExecuteResultSet(query);

                        while (rs.next())
                        {
                            wu = new WebUser();

                            wu.setUid(rs.getString("uid"));
                            wu.setPwd(rs.getString("password"));
                            wu.setAuthLevel(rs.getInt("authLevel"));

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
                        }

                    }
                    catch (Exception ex)
                    {
                        System.out.println("Exception: " + ex.getMessage());
                        response.sendRedirect(getServletContext().getContextPath() +"/loginError.jsp");
                        return;
                    }
                }
                else
                {
                    response.sendRedirect(getServletContext().getContextPath() + "/login.jsp");
                }
            }

            if (wu == null || wu.getUid().equals("") || wu.getUid() == null || wu.getAuthLevel() < 1)
            {
                response.sendRedirect(getServletContext().getContextPath() +"/loginError.jsp");
                return;
            }

        }

        String target = (request.getParameter("dest")==null || request.getParameter("dest")=="")
                ? "index.jsp"
                : request.getParameter("dest");

        response.sendRedirect(target);
    }
}

