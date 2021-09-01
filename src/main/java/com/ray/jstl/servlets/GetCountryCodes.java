package com.ray.jstl.servlets;

import com.ray.jstl.dbmodels.DBManager;
import com.ray.jstl.helpers.DBWorldQueries;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet(name = "GetCountryCodes", value = "/getcountrycodes.do")
public class GetCountryCodes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession s = request.getSession();

        if (getServletConfig().getServletContext().getAttribute("WorldDBManager") != null)
        {
            DBManager dbm = (DBManager)getServletConfig().getServletContext().getAttribute("WorldDBManager");

            try {
                if (!dbm.isConnected())
                {
                    if (!dbm.openConnection())
                        throw new IOException("Could not connect to database and open connection");
                }

                String query = DBWorldQueries.getCountryCodes();

                ArrayList<String> allCountryCodes = new ArrayList<String>();

                ResultSet rs = dbm.ExecuteResultSet(query);

                while (rs.next())
                {
                    String c = rs.getString("Code");
                    allCountryCodes.add(c);
                }

                s.setAttribute("countryCodes", allCountryCodes);

            }
            catch (Exception ex)
            {
                throw new IOException("Query could not be executed to get country codes");
            }
            response.sendRedirect(getServletContext().getInitParameter("hostURL")
                    + getServletContext().getContextPath() + "/Protected/addCity.jsp");
        }
        else
        {
            response.sendRedirect("login.jsp");
        }
    }
}