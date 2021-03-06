// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pfs.restful.domain;

import com.pfs.restful.domain.FakturItem;
import com.pfs.restful.domain.FakturItemDataOnDemand;
import com.pfs.restful.domain.FakturItemIntegrationTest;
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

privileged aspect FakturItemIntegrationTest_Roo_IntegrationTest {
    
    declare @type: FakturItemIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: FakturItemIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: FakturItemIntegrationTest: @Transactional;
    
    @Autowired
    FakturItemDataOnDemand FakturItemIntegrationTest.dod;
    
    @Test
    public void FakturItemIntegrationTest.testCountFakturItems() {
        Assert.assertNotNull("Data on demand for 'FakturItem' failed to initialize correctly", dod.getRandomFakturItem());
        long count = FakturItem.countFakturItems();
        Assert.assertTrue("Counter for 'FakturItem' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void FakturItemIntegrationTest.testFindFakturItem() {
        FakturItem obj = dod.getRandomFakturItem();
        Assert.assertNotNull("Data on demand for 'FakturItem' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'FakturItem' failed to provide an identifier", id);
        obj = FakturItem.findFakturItem(id);
        Assert.assertNotNull("Find method for 'FakturItem' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'FakturItem' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void FakturItemIntegrationTest.testFindAllFakturItems() {
        Assert.assertNotNull("Data on demand for 'FakturItem' failed to initialize correctly", dod.getRandomFakturItem());
        long count = FakturItem.countFakturItems();
        Assert.assertTrue("Too expensive to perform a find all test for 'FakturItem', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<FakturItem> result = FakturItem.findAllFakturItems();
        Assert.assertNotNull("Find all method for 'FakturItem' illegally returned null", result);
        Assert.assertTrue("Find all method for 'FakturItem' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void FakturItemIntegrationTest.testFindFakturItemEntries() {
        Assert.assertNotNull("Data on demand for 'FakturItem' failed to initialize correctly", dod.getRandomFakturItem());
        long count = FakturItem.countFakturItems();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<FakturItem> result = FakturItem.findFakturItemEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'FakturItem' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'FakturItem' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void FakturItemIntegrationTest.testFlush() {
        FakturItem obj = dod.getRandomFakturItem();
        Assert.assertNotNull("Data on demand for 'FakturItem' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'FakturItem' failed to provide an identifier", id);
        obj = FakturItem.findFakturItem(id);
        Assert.assertNotNull("Find method for 'FakturItem' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyFakturItem(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'FakturItem' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void FakturItemIntegrationTest.testMergeUpdate() {
        FakturItem obj = dod.getRandomFakturItem();
        Assert.assertNotNull("Data on demand for 'FakturItem' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'FakturItem' failed to provide an identifier", id);
        obj = FakturItem.findFakturItem(id);
        boolean modified =  dod.modifyFakturItem(obj);
        Integer currentVersion = obj.getVersion();
        FakturItem merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'FakturItem' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void FakturItemIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'FakturItem' failed to initialize correctly", dod.getRandomFakturItem());
        FakturItem obj = dod.getNewTransientFakturItem(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'FakturItem' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'FakturItem' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'FakturItem' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void FakturItemIntegrationTest.testRemove() {
        FakturItem obj = dod.getRandomFakturItem();
        Assert.assertNotNull("Data on demand for 'FakturItem' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'FakturItem' failed to provide an identifier", id);
        obj = FakturItem.findFakturItem(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'FakturItem' with identifier '" + id + "'", FakturItem.findFakturItem(id));
    }
    
}
