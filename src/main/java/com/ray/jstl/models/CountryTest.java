package com.ray.jstl.models;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class CountryTest {
    com.ray.jstl.models.Country c;
    private String code = "VNM";
    private String name = "Vietnam";
    private int population = 100000000;
    private int density = 1000;

    @Before
    public void setUp() {
        c = new com.ray.jstl.models.Country();
    }

    @Test
    public void testDefaultConstructor() {
        Assert.assertNotNull("Could not create a new Country", c);
    }

    @Test
    public void testGettersAndSetters() {
        c.setCode(code);
        Assert.assertEquals("Could not set code", code, c.getCode());

        c.setName(name);
        Assert.assertEquals("Could not set name", name, c.getName());

        c.setPopulation(population);
        Assert.assertEquals("Could not set population", population, c.getPopulation());

        c.setDensity(density);
        Assert.assertEquals("Could not set density", density, c.getDensity());
    }

    @Test
    public void testToString() {
        c.setCode(code);
        c.setName(name);
        c.setPopulation(population);
        c.setDensity(density);

        String returnStr = c.toString();

        Assert.assertTrue("ToString does not contain value for code", returnStr.contains(code));
        Assert.assertTrue("ToString does not contain value for name", returnStr.contains(name));
        Assert.assertTrue("ToString does not contain value for population", returnStr.contains(String.valueOf(population)));
        Assert.assertTrue("ToString does not contain value for density", returnStr.contains(String.valueOf(density)));
    }
}
