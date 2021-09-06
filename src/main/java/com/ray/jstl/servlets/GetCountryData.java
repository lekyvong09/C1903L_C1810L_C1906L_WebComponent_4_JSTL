package com.ray.jstl.servlets;

import com.ray.jstl.dbmodels.DBManager;
import com.ray.jstl.helpers.DBWorldQueries;
import com.ray.jstl.models.Country;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet(name = "GetCountryData", value = "/getcountrydata.do")
public class GetCountryData extends HttpServlet {
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

                String query = DBWorldQueries.getCountry();

                ArrayList<Country> allCountries = new ArrayList<Country>();

                ResultSet rs = dbm.ExecuteResultSet(query);

                while (rs.next())
                {
                    Country c = new Country();

                    c.setCode(rs.getString("code"));
                    c.setName(rs.getString("name"));
                    c.setPopulation(rs.getInt("population"));
                    c.setDensity(rs.getInt("density"));

                    allCountries.add(c);
                }
                s.setAttribute("countryData", allCountries);

            }
            catch (Exception ex)
            {
                throw new IOException("Query could not be executed to get all countries");
            }
            response.sendRedirect(getServletContext().getInitParameter("hostURL")
                    + getServletContext().getContextPath() + "/Protected/listCountries.jsp");
        }
        else
        {
            response.sendRedirect("login.jsp?dest=listCountries");
        }
    }
}
