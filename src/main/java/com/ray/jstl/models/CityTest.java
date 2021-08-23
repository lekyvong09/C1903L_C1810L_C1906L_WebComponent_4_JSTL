package com.ray.jstl.models;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class CityTest {
    com.ray.jstl.models.City c;
    private String name = "HoChiMinh";
    private String countryCode = "VNM";
    private String country = "Vietnam";
    private int population = 100000000;

    @Before
    public void setUp() {
        c = new com.ray.jstl.models.City();
    }

    @Test
    public void testDefaultConstructor() {
        Assert.assertNotNull("Could not create a new City", c);
    }

    @Test
    public void testGettersAndSetters() {
        c.setName(name);
        Assert.assertEquals("Could not set name",name,c.getName());

        c.setCountryCode(countryCode);
        Assert.assertEquals("Could not set countryCode",countryCode,c.getCountryCode());

        c.setCountry(country);
        Assert.assertEquals("Could not set country",country,c.getCountry());

        c.setPopulation(population);
        Assert.assertEquals("Could not set population",population,c.getPopulation());
    }

    @Test
    public void testToString(){
        c.setName(name);
        c.setCountryCode(countryCode);
        c.setCountry(country);
        c.setPopulation(population);

        String returnStr = c.toString();

        Assert.assertTrue("ToString does not contain value for name", returnStr.contains(name));
        Assert.assertTrue("ToString does not contain value for countryCode", returnStr.contains(countryCode));
        Assert.assertTrue("ToString does not contain value for country", returnStr.contains(country));
        Assert.assertTrue("ToString does not contain value for population", returnStr.contains(String.format("%d",population)));
    }

}
