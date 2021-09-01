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
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet(name = "GetCityData", value = "/getcitydata.do")
public class GetCityData extends HttpServlet {
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

                String query = DBWorldQueries.getCity();

                ArrayList<City> allCities = new ArrayList<City>();

                ResultSet rs = dbm.ExecuteResultSet(query);

                while (rs.next())
                {
                    City c = new City();

                    c.setName(rs.getString("NAME"));
                    c.setCountryCode(rs.getString("CountryCode"));
                    c.setCountry(rs.getString("Country"));
                    c.setPopulation(rs.getInt("Population"));
                    System.out.println(c);
                    allCities.add(c);
                }
                s.setAttribute("cityData", allCities);
                System.out.println("finish getting cityData");

            }
            catch (Exception ex)
            {
                throw new IOException("Query could not be executed to get all cities");
            }
            response.sendRedirect(getServletContext().getInitParameter("hostURL")
                    + getServletContext().getContextPath() +"/Protected/listCities.jsp");
        }
        else
        {
            response.sendRedirect("login.jsp");
        }
    }
}
