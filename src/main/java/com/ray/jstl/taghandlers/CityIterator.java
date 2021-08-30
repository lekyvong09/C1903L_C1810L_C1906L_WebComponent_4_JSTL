package com.ray.jstl.taghandlers;

import com.ray.jstl.models.City;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.ArrayList;

public class CityIterator extends SimpleTagSupport {

    // define variable for tag attribute
    private ArrayList<City> cityList;

    // set variable for tag attribute
    public void setCityList(ArrayList<City> cities) {
        this.cityList = cities;
    }

    @Override
    public void doTag() throws JspException, IOException {
        for (City c : cityList)
        {
            getJspContext().setAttribute("city", c);

            // push the value to JSP
            getJspBody().invoke(null);
        }
    }
}
