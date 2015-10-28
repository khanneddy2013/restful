// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pfs.restful.domain;

import com.pfs.restful.domain.PfsUser;
import com.pfs.restful.domain.PfsUserDataOnDemand;
import com.pfs.restful.domain.PfsUserIntegrationTest;
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

privileged aspect PfsUserIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PfsUserIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PfsUserIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: PfsUserIntegrationTest: @Transactional;
    
    @Autowired
    PfsUserDataOnDemand PfsUserIntegrationTest.dod;
    
    @Test
    public void PfsUserIntegrationTest.testCountPfsUsers() {
        Assert.assertNotNull("Data on demand for 'PfsUser' failed to initialize correctly", dod.getRandomPfsUser());
        long count = PfsUser.countPfsUsers();
        Assert.assertTrue("Counter for 'PfsUser' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PfsUserIntegrationTest.testFindPfsUser() {
        PfsUser obj = dod.getRandomPfsUser();
        Assert.assertNotNull("Data on demand for 'PfsUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PfsUser' failed to provide an identifier", id);
        obj = PfsUser.findPfsUser(id);
        Assert.assertNotNull("Find method for 'PfsUser' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'PfsUser' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PfsUserIntegrationTest.testFindAllPfsUsers() {
        Assert.assertNotNull("Data on demand for 'PfsUser' failed to initialize correctly", dod.getRandomPfsUser());
        long count = PfsUser.countPfsUsers();
        Assert.assertTrue("Too expensive to perform a find all test for 'PfsUser', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<PfsUser> result = PfsUser.findAllPfsUsers();
        Assert.assertNotNull("Find all method for 'PfsUser' illegally returned null", result);
        Assert.assertTrue("Find all method for 'PfsUser' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PfsUserIntegrationTest.testFindPfsUserEntries() {
        Assert.assertNotNull("Data on demand for 'PfsUser' failed to initialize correctly", dod.getRandomPfsUser());
        long count = PfsUser.countPfsUsers();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<PfsUser> result = PfsUser.findPfsUserEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'PfsUser' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'PfsUser' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PfsUserIntegrationTest.testFlush() {
        PfsUser obj = dod.getRandomPfsUser();
        Assert.assertNotNull("Data on demand for 'PfsUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PfsUser' failed to provide an identifier", id);
        obj = PfsUser.findPfsUser(id);
        Assert.assertNotNull("Find method for 'PfsUser' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPfsUser(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'PfsUser' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PfsUserIntegrationTest.testMergeUpdate() {
        PfsUser obj = dod.getRandomPfsUser();
        Assert.assertNotNull("Data on demand for 'PfsUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PfsUser' failed to provide an identifier", id);
        obj = PfsUser.findPfsUser(id);
        boolean modified =  dod.modifyPfsUser(obj);
        Integer currentVersion = obj.getVersion();
        PfsUser merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'PfsUser' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PfsUserIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'PfsUser' failed to initialize correctly", dod.getRandomPfsUser());
        PfsUser obj = dod.getNewTransientPfsUser(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'PfsUser' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'PfsUser' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'PfsUser' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PfsUserIntegrationTest.testRemove() {
        PfsUser obj = dod.getRandomPfsUser();
        Assert.assertNotNull("Data on demand for 'PfsUser' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PfsUser' failed to provide an identifier", id);
        obj = PfsUser.findPfsUser(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'PfsUser' with identifier '" + id + "'", PfsUser.findPfsUser(id));
    }
    
}
