package com.ray.jstl.servlets;

import com.ray.jstl.dbmodels.DBManager;
import com.ray.jstl.helpers.DBWorldQueries;
import com.ray.jstl.models.City;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Set;

@WebServlet(name = "CityController", value = "/Protected/citycontroller.do")
public class CityController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String theCommand = request.getParameter("command");

        if (theCommand == null) {
            theCommand = "LIST";
        }

        switch (theCommand) {
            case "DELETE":
                deleteCity(request, response);
                break;
            case "LOAD":
                loadCity(request, response);
                break;
            default:
                getCityData(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String theCommand = request.getParameter("command");

        if (theCommand == null) {
            theCommand = "LIST";
        }

        switch (theCommand) {
            case "ADD":
                addCity(request,response);
                break;
            case "UPDATE":
                updateCity(request, response);
                break;
        }

    }

    private void getCityData(HttpServletRequest request, HttpServletResponse response) throws IOException {
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

                    c.setId(rs.getInt("id"));
                    c.setName(rs.getString("NAME"));
                    c.setCountryCode(rs.getString("CountryCode"));
                    c.setCountry(rs.getString("Country"));
                    c.setPopulation(rs.getInt("Population"));
                    c.setImageUrl((rs.getString("imageUrl") == null || rs.getString("imageUrl").equals("")) ?
                            "default320x320.jpg" : rs.getString("imageUrl"));
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
            response.sendRedirect(getServletContext().getInitParameter("hostURL")
                    + getServletContext().getContextPath() + "login.jsp");
        }
    }

    private Integer parseIntOrNull(String value) {
        if (value == null || value.equals(""))
            return null;
            try {
                return Integer.parseInt(value);
            } catch ( NumberFormatException e) {
                e.printStackTrace();
                return null;
            }
    }

    private void addCity(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession s = request.getSession();
        StringBuilder errors = new StringBuilder("");
        String name = request.getParameter("cityName");
        String countryCode = request.getParameter("cityCountryCode");
        String countryName = request.getParameter("cityCountryName");
        String population = request.getParameter("cityPopulation");

//        if (name == null || name.equals("")
//                || countryCode == null || countryCode.equals("")
//                || countryName == null || countryName.equals("")
//                || population == null || population.equals(""))
//        {
//            response.sendRedirect(getServletContext().getInitParameter("hostURL")
//                    + getServletContext().getContextPath() + "/Protected/addCity.jsp");
//        }

        City c = new City();
        c.setName(name);
        c.setCountryCode(countryCode);
        c.setCountry(countryName);
        c.setPopulation(parseIntOrNull(population) != null ? parseIntOrNull(population) : 0);

        ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
        Validator validator = validatorFactory.getValidator();
        Set<ConstraintViolation<City>> constraintViolations = validator.validate(c);

        if (!constraintViolations.isEmpty()) {
            errors.append("<ul>");
            for (ConstraintViolation<City> constraintViolation : constraintViolations) {
                errors.append("<li>" + constraintViolation.getPropertyPath() + " "
                        + constraintViolation.getMessage() + "</li>");
                if (String.valueOf(constraintViolation.getPropertyPath()).equals("population"))
                    request.setAttribute("validationPopulation", constraintViolation.getMessage());
                if (String.valueOf(constraintViolation.getPropertyPath()).equals("name"))
                    request.setAttribute("validationCityName", constraintViolation.getMessage());
                if (String.valueOf(constraintViolation.getPropertyPath()).equals("country"))
                    request.setAttribute("validationCountryName", constraintViolation.getMessage());
                if (String.valueOf(constraintViolation.getPropertyPath()).equals("countryCodes"))
                    request.setAttribute("validationCountryCodes", constraintViolation.getMessage());

            }
            errors.append("</ul>");
            System.out.println(errors);
            s.setAttribute("validationError", errors);

//            response.sendRedirect(getServletContext().getInitParameter("hostURL")
//                    + getServletContext().getContextPath() + "/Protected/addCity.jsp");

            request.setAttribute("isDirty", true);
            request.setAttribute("tempCity", c);

            RequestDispatcher rd = request.getRequestDispatcher("addCity.jsp");
            rd.forward(request, response);

            return;
        } else {
            s.setAttribute("validationError", null);
        }

        try {

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

                s.setAttribute("cityData", null);

                response.sendRedirect(getServletContext().getInitParameter("hostURL") +
                        getServletContext().getContextPath() + "/Protected/listCities.jsp");
            }
            else
            {
                response.sendRedirect(getServletContext().getInitParameter("hostURL")
                        + getServletContext().getContextPath() + "login.jsp");
            }
        } catch (Exception ex)
        {
            response.sendRedirect(getServletContext().getInitParameter("hostURL")
                    + getServletContext().getContextPath() + "/errorHandler.jsp");
        }
    }


    private void loadCity(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession s = request.getSession();
        String cityId = request.getParameter("cityId");

        if (getServletConfig().getServletContext().getAttribute("WorldDBManager") != null)
        {
            DBManager dbm = (DBManager)getServletConfig().getServletContext().getAttribute("WorldDBManager");

            try {
                if (!dbm.isConnected())
                {
                    if (!dbm.openConnection())
                        throw new IOException("Could not connect to database and open connection");
                }

                String query = DBWorldQueries.loadCity(cityId);

                City theCity = new City();

                ResultSet rs = dbm.ExecuteResultSet(query);

                while (rs.next())
                {
                    theCity.setId(rs.getInt("id"));
                    theCity.setName(rs.getString("NAME"));
                    theCity.setCountryCode(rs.getString("CountryCode"));
                    theCity.setCountry(rs.getString("Country"));
                    theCity.setPopulation(rs.getInt("Population"));
                    theCity.setImageUrl((rs.getString("imageUrl") == null || rs.getString("imageUrl").equals("")) ?
                            "default320x320.jpg" : rs.getString("imageUrl"));
                }
                s.setAttribute("theCity", theCity);
            }
            catch (Exception ex)
            {
                throw new IOException("Query could not be executed to get the city with given id");
            }
            response.sendRedirect(getServletContext().getInitParameter("hostURL")
                    + getServletContext().getContextPath() +"/Protected/updateCity.jsp");
        }
        else
        {
            response.sendRedirect(getServletContext().getInitParameter("hostURL")
                    + getServletContext().getContextPath() + "login.jsp");
        }
    }


    private void updateCity(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
                    + getServletContext().getContextPath() + "/Protected/citycontroller.do?command=LOAD&cityId="
                    + request.getParameter("cityId"));
            return;
        }

        try {

            HttpSession s = request.getSession();
            City tempCity = (City) s.getAttribute("theCity");

            int id = Integer.parseInt(request.getParameter("cityId"));

            City c = new City();

            c.setId(id);
            c.setName(name);
            c.setCountryCode(countryCode);
            c.setCountry(countryName);
            c.setPopulation(Integer.parseInt(population));
            c.setImageUrl(tempCity.getImageUrl());

            if (getServletConfig().getServletContext().getAttribute("WorldDBManager") != null)
            {
                DBManager dbm = (DBManager)getServletConfig().getServletContext().getAttribute("WorldDBManager");

                try {
                    if (!dbm.isConnected())
                    {
                        if (!dbm.openConnection())
                            throw new IOException("Could not connect to database and open connection");
                    }

                    String query = DBWorldQueries.updateCity(c);

                    dbm.ExecuteNonQuery(query);
                }
                catch (Exception ex)
                {
                    throw new IOException("Query could not be executed to insert a new city");
                }

                s.setAttribute("cityData", null);
                s.setAttribute("theCity", null);

                response.sendRedirect(getServletContext().getInitParameter("hostURL") +
                        getServletContext().getContextPath() + "/Protected/listCities.jsp");
            }
            else
            {
                response.sendRedirect(getServletContext().getInitParameter("hostURL")
                        + getServletContext().getContextPath() + "login.jsp");
            }
        } catch (Exception ex)
        {
            response.sendRedirect(getServletContext().getInitParameter("hostURL")
                    + getServletContext().getContextPath() + "/errorHandler.jsp");
        }
    }


    private void deleteCity(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            String cityId = request.getParameter("cityId");

            if (getServletConfig().getServletContext().getAttribute("WorldDBManager") != null)
            {
                DBManager dbm = (DBManager)getServletConfig().getServletContext().getAttribute("WorldDBManager");

                try {
                    if (!dbm.isConnected())
                    {
                        if (!dbm.openConnection())
                            throw new IOException("Could not connect to database and open connection");
                    }

                    String query = DBWorldQueries.deleteCity(cityId);

                    dbm.ExecuteNonQuery(query);
                }
                catch (Exception ex)
                {
                    throw new IOException("Query could not be executed to insert a new city");
                }

                HttpSession s = request.getSession();
                s.setAttribute("cityData", null);

                response.sendRedirect(getServletContext().getInitParameter("hostURL") +
                        getServletContext().getContextPath() + "/Protected/listCities.jsp");
            }
            else
            {
                response.sendRedirect(getServletContext().getInitParameter("hostURL")
                        + getServletContext().getContextPath() + "login.jsp");
            }
        } catch (Exception ex)
        {
            response.sendRedirect(getServletContext().getInitParameter("hostURL")
                    + getServletContext().getContextPath() + "/errorHandler.jsp");
        }
    }
}
