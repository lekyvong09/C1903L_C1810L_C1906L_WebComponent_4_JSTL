package com.ray.jstl.helpers;

import com.ray.jstl.models.City;

public class DBWorldQueries {

    public static String getCity() {
        return "select * from city order by population DESC";
    }

    public static String getCountry() {
        return "select code, name, population, density from country order by code";
    }

    public static String insertCity(City c) {
        /*
            INSERT INTO city(Name, CountryCode, Country, Population)
                VALUES ('Tokyo', 'JPN' ,'Japan',1232432)
         */
        return String.format("INSERT INTO city(Name, CountryCode, Country, Population) VALUES ('%s','%s','%s', %d)"
                    , c.getName()
                    , c.getCountryCode()
                    , c.getCountry()
                    , c.getPopulation());
    }

    public static String getCountryCodes() {
        return "select distinct code from country order by Code";
    }
}
