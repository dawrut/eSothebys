// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

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
import pl.wroc.pwr.wiz.io.psi.model.Umowa;
import pl.wroc.pwr.wiz.io.psi.model.UmowaDataOnDemand;
import pl.wroc.pwr.wiz.io.psi.model.UmowaIntegrationTest;

privileged aspect UmowaIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UmowaIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UmowaIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: UmowaIntegrationTest: @Transactional;
    
    @Autowired
    UmowaDataOnDemand UmowaIntegrationTest.dod;
    
    @Test
    public void UmowaIntegrationTest.testCountUmowas() {
        Assert.assertNotNull("Data on demand for 'Umowa' failed to initialize correctly", dod.getRandomUmowa());
        long count = Umowa.countUmowas();
        Assert.assertTrue("Counter for 'Umowa' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UmowaIntegrationTest.testFindUmowa() {
        Umowa obj = dod.getRandomUmowa();
        Assert.assertNotNull("Data on demand for 'Umowa' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Umowa' failed to provide an identifier", id);
        obj = Umowa.findUmowa(id);
        Assert.assertNotNull("Find method for 'Umowa' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Umowa' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void UmowaIntegrationTest.testFindAllUmowas() {
        Assert.assertNotNull("Data on demand for 'Umowa' failed to initialize correctly", dod.getRandomUmowa());
        long count = Umowa.countUmowas();
        Assert.assertTrue("Too expensive to perform a find all test for 'Umowa', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Umowa> result = Umowa.findAllUmowas();
        Assert.assertNotNull("Find all method for 'Umowa' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Umowa' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UmowaIntegrationTest.testFindUmowaEntries() {
        Assert.assertNotNull("Data on demand for 'Umowa' failed to initialize correctly", dod.getRandomUmowa());
        long count = Umowa.countUmowas();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Umowa> result = Umowa.findUmowaEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Umowa' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Umowa' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void UmowaIntegrationTest.testFlush() {
        Umowa obj = dod.getRandomUmowa();
        Assert.assertNotNull("Data on demand for 'Umowa' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Umowa' failed to provide an identifier", id);
        obj = Umowa.findUmowa(id);
        Assert.assertNotNull("Find method for 'Umowa' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUmowa(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Umowa' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UmowaIntegrationTest.testMergeUpdate() {
        Umowa obj = dod.getRandomUmowa();
        Assert.assertNotNull("Data on demand for 'Umowa' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Umowa' failed to provide an identifier", id);
        obj = Umowa.findUmowa(id);
        boolean modified =  dod.modifyUmowa(obj);
        Integer currentVersion = obj.getVersion();
        Umowa merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Umowa' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UmowaIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Umowa' failed to initialize correctly", dod.getRandomUmowa());
        Umowa obj = dod.getNewTransientUmowa(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Umowa' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Umowa' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Umowa' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void UmowaIntegrationTest.testRemove() {
        Umowa obj = dod.getRandomUmowa();
        Assert.assertNotNull("Data on demand for 'Umowa' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Umowa' failed to provide an identifier", id);
        obj = Umowa.findUmowa(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Umowa' with identifier '" + id + "'", Umowa.findUmowa(id));
    }
    
}