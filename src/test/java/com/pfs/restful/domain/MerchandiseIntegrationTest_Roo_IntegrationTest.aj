// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pfs.restful.domain;

import com.pfs.restful.domain.Merchandise;
import com.pfs.restful.domain.MerchandiseDataOnDemand;
import com.pfs.restful.domain.MerchandiseIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MerchandiseIntegrationTest_Roo_IntegrationTest {
    
    declare @type: MerchandiseIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: MerchandiseIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: MerchandiseIntegrationTest: @Transactional;
    
    @Autowired
    MerchandiseDataOnDemand MerchandiseIntegrationTest.dod;
    
    @Test
    public void MerchandiseIntegrationTest.testCountMerchandises() {
        Assert.assertNotNull("Data on demand for 'Merchandise' failed to initialize correctly", dod.getRandomMerchandise());
        long count = Merchandise.countMerchandises();
        Assert.assertTrue("Counter for 'Merchandise' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void MerchandiseIntegrationTest.testFindMerchandise() {
        Merchandise obj = dod.getRandomMerchandise();
        Assert.assertNotNull("Data on demand for 'Merchandise' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Merchandise' failed to provide an identifier", id);
        obj = Merchandise.findMerchandise(id);
        Assert.assertNotNull("Find method for 'Merchandise' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Merchandise' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void MerchandiseIntegrationTest.testFindAllMerchandises() {
        Assert.assertNotNull("Data on demand for 'Merchandise' failed to initialize correctly", dod.getRandomMerchandise());
        long count = Merchandise.countMerchandises();
        Assert.assertTrue("Too expensive to perform a find all test for 'Merchandise', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Merchandise> result = Merchandise.findAllMerchandises();
        Assert.assertNotNull("Find all method for 'Merchandise' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Merchandise' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void MerchandiseIntegrationTest.testFindMerchandiseEntries() {
        Assert.assertNotNull("Data on demand for 'Merchandise' failed to initialize correctly", dod.getRandomMerchandise());
        long count = Merchandise.countMerchandises();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Merchandise> result = Merchandise.findMerchandiseEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Merchandise' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Merchandise' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void MerchandiseIntegrationTest.testFlush() {
        Merchandise obj = dod.getRandomMerchandise();
        Assert.assertNotNull("Data on demand for 'Merchandise' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Merchandise' failed to provide an identifier", id);
        obj = Merchandise.findMerchandise(id);
        Assert.assertNotNull("Find method for 'Merchandise' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyMerchandise(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Merchandise' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void MerchandiseIntegrationTest.testMergeUpdate() {
        Merchandise obj = dod.getRandomMerchandise();
        Assert.assertNotNull("Data on demand for 'Merchandise' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Merchandise' failed to provide an identifier", id);
        obj = Merchandise.findMerchandise(id);
        boolean modified =  dod.modifyMerchandise(obj);
        Integer currentVersion = obj.getVersion();
        Merchandise merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Merchandise' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void MerchandiseIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Merchandise' failed to initialize correctly", dod.getRandomMerchandise());
        Merchandise obj = dod.getNewTransientMerchandise(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Merchandise' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Merchandise' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'Merchandise' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void MerchandiseIntegrationTest.testRemove() {
        Merchandise obj = dod.getRandomMerchandise();
        Assert.assertNotNull("Data on demand for 'Merchandise' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Merchandise' failed to provide an identifier", id);
        obj = Merchandise.findMerchandise(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Merchandise' with identifier '" + id + "'", Merchandise.findMerchandise(id));
    }
    
}
