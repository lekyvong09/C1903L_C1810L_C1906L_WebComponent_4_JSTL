package com.ray.jstl.servlets;

import com.ray.jstl.dbmodels.DBManager;
import com.ray.jstl.helpers.DBWorldQueries;
import com.ray.jstl.models.City;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AddCity", value = "/addnewcity.do")
public class AddCity extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("cityName");
        String countryCode = request.getParameter("cityCountryCode");
        String countryName = request.getParameter("cityCountryName");
        String population = request.getParameter("cityPopulation");

        if (name == null || name.equals("")
            || countryCode == null || countryCode.equals("")
            || countryName == null || countryName.equals("")
            || population == null || population.equals(""))
        {
            response.sendRedirect(getServletContext().getInitParameter("hostURL")
                                    + getServletContext().getContextPath() + "/Protected/addCity.jsp");
        }

        try {
            City c = new City();
            c.setName(name);
            c.setCountryCode(countryCode);
            c.setCountry(countryName);
            c.setPopulation(Integer.parseInt(population));

            if (getServletConfig().getServletContext().getAttribute("WorldDBManager") != null)
            {
                DBManager dbm = (DBManager)getServletConfig().getServletContext().getAttribute("WorldDBManager");

                try {
                    if (!dbm.isConnected())
                    {
                        if (!dbm.openConnection())
                            throw new IOException("Could not connect to database and open connection");
                    }

                    String query = DBWorldQueries.insertCity(c);

                    dbm.ExecuteNonQuery(query);
                }
                catch (Exception ex)
                {
                    throw new IOException("Query could not be executed to insert a new city");
                }

                HttpSession s = request.getSession();
                s.setAttribute("cityData", null);

                response.sendRedirect(getServletContext().getContextPath() + "/Protected/listCities.jsp");
            }
            else
            {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception ex)
        {
            response.sendRedirect(getServletContext().getContextPath() + "/errorHandler.jsp");
        }



    }
}
