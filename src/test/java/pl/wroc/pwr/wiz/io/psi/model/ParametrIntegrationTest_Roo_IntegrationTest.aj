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
import pl.wroc.pwr.wiz.io.psi.model.Parametr;
import pl.wroc.pwr.wiz.io.psi.model.ParametrDataOnDemand;
import pl.wroc.pwr.wiz.io.psi.model.ParametrIntegrationTest;

privileged aspect ParametrIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ParametrIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ParametrIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ParametrIntegrationTest: @Transactional;
    
    @Autowired
    ParametrDataOnDemand ParametrIntegrationTest.dod;
    
    @Test
    public void ParametrIntegrationTest.testCountParametrs() {
        Assert.assertNotNull("Data on demand for 'Parametr' failed to initialize correctly", dod.getRandomParametr());
        long count = Parametr.countParametrs();
        Assert.assertTrue("Counter for 'Parametr' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ParametrIntegrationTest.testFindParametr() {
        Parametr obj = dod.getRandomParametr();
        Assert.assertNotNull("Data on demand for 'Parametr' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Parametr' failed to provide an identifier", id);
        obj = Parametr.findParametr(id);
        Assert.assertNotNull("Find method for 'Parametr' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Parametr' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ParametrIntegrationTest.testFindAllParametrs() {
        Assert.assertNotNull("Data on demand for 'Parametr' failed to initialize correctly", dod.getRandomParametr());
        long count = Parametr.countParametrs();
        Assert.assertTrue("Too expensive to perform a find all test for 'Parametr', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Parametr> result = Parametr.findAllParametrs();
        Assert.assertNotNull("Find all method for 'Parametr' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Parametr' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ParametrIntegrationTest.testFindParametrEntries() {
        Assert.assertNotNull("Data on demand for 'Parametr' failed to initialize correctly", dod.getRandomParametr());
        long count = Parametr.countParametrs();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Parametr> result = Parametr.findParametrEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Parametr' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Parametr' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ParametrIntegrationTest.testFlush() {
        Parametr obj = dod.getRandomParametr();
        Assert.assertNotNull("Data on demand for 'Parametr' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Parametr' failed to provide an identifier", id);
        obj = Parametr.findParametr(id);
        Assert.assertNotNull("Find method for 'Parametr' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyParametr(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Parametr' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ParametrIntegrationTest.testMergeUpdate() {
        Parametr obj = dod.getRandomParametr();
        Assert.assertNotNull("Data on demand for 'Parametr' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Parametr' failed to provide an identifier", id);
        obj = Parametr.findParametr(id);
        boolean modified =  dod.modifyParametr(obj);
        Integer currentVersion = obj.getVersion();
        Parametr merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Parametr' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ParametrIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Parametr' failed to initialize correctly", dod.getRandomParametr());
        Parametr obj = dod.getNewTransientParametr(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Parametr' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Parametr' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Parametr' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ParametrIntegrationTest.testRemove() {
        Parametr obj = dod.getRandomParametr();
        Assert.assertNotNull("Data on demand for 'Parametr' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Parametr' failed to provide an identifier", id);
        obj = Parametr.findParametr(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Parametr' with identifier '" + id + "'", Parametr.findParametr(id));
    }
    
}