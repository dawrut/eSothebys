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
import pl.wroc.pwr.wiz.io.psi.model.NaruszeniaRegulaminu;
import pl.wroc.pwr.wiz.io.psi.model.NaruszeniaRegulaminuDataOnDemand;
import pl.wroc.pwr.wiz.io.psi.model.NaruszeniaRegulaminuIntegrationTest;

privileged aspect NaruszeniaRegulaminuIntegrationTest_Roo_IntegrationTest {
    
    declare @type: NaruszeniaRegulaminuIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: NaruszeniaRegulaminuIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: NaruszeniaRegulaminuIntegrationTest: @Transactional;
    
    @Autowired
    NaruszeniaRegulaminuDataOnDemand NaruszeniaRegulaminuIntegrationTest.dod;
    
    @Test
    public void NaruszeniaRegulaminuIntegrationTest.testCountNaruszeniaRegulaminus() {
        Assert.assertNotNull("Data on demand for 'NaruszeniaRegulaminu' failed to initialize correctly", dod.getRandomNaruszeniaRegulaminu());
        long count = NaruszeniaRegulaminu.countNaruszeniaRegulaminus();
        Assert.assertTrue("Counter for 'NaruszeniaRegulaminu' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void NaruszeniaRegulaminuIntegrationTest.testFindNaruszeniaRegulaminu() {
        NaruszeniaRegulaminu obj = dod.getRandomNaruszeniaRegulaminu();
        Assert.assertNotNull("Data on demand for 'NaruszeniaRegulaminu' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'NaruszeniaRegulaminu' failed to provide an identifier", id);
        obj = NaruszeniaRegulaminu.findNaruszeniaRegulaminu(id);
        Assert.assertNotNull("Find method for 'NaruszeniaRegulaminu' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'NaruszeniaRegulaminu' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void NaruszeniaRegulaminuIntegrationTest.testFindAllNaruszeniaRegulaminus() {
        Assert.assertNotNull("Data on demand for 'NaruszeniaRegulaminu' failed to initialize correctly", dod.getRandomNaruszeniaRegulaminu());
        long count = NaruszeniaRegulaminu.countNaruszeniaRegulaminus();
        Assert.assertTrue("Too expensive to perform a find all test for 'NaruszeniaRegulaminu', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<NaruszeniaRegulaminu> result = NaruszeniaRegulaminu.findAllNaruszeniaRegulaminus();
        Assert.assertNotNull("Find all method for 'NaruszeniaRegulaminu' illegally returned null", result);
        Assert.assertTrue("Find all method for 'NaruszeniaRegulaminu' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void NaruszeniaRegulaminuIntegrationTest.testFindNaruszeniaRegulaminuEntries() {
        Assert.assertNotNull("Data on demand for 'NaruszeniaRegulaminu' failed to initialize correctly", dod.getRandomNaruszeniaRegulaminu());
        long count = NaruszeniaRegulaminu.countNaruszeniaRegulaminus();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<NaruszeniaRegulaminu> result = NaruszeniaRegulaminu.findNaruszeniaRegulaminuEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'NaruszeniaRegulaminu' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'NaruszeniaRegulaminu' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void NaruszeniaRegulaminuIntegrationTest.testFlush() {
        NaruszeniaRegulaminu obj = dod.getRandomNaruszeniaRegulaminu();
        Assert.assertNotNull("Data on demand for 'NaruszeniaRegulaminu' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'NaruszeniaRegulaminu' failed to provide an identifier", id);
        obj = NaruszeniaRegulaminu.findNaruszeniaRegulaminu(id);
        Assert.assertNotNull("Find method for 'NaruszeniaRegulaminu' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyNaruszeniaRegulaminu(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'NaruszeniaRegulaminu' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void NaruszeniaRegulaminuIntegrationTest.testMergeUpdate() {
        NaruszeniaRegulaminu obj = dod.getRandomNaruszeniaRegulaminu();
        Assert.assertNotNull("Data on demand for 'NaruszeniaRegulaminu' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'NaruszeniaRegulaminu' failed to provide an identifier", id);
        obj = NaruszeniaRegulaminu.findNaruszeniaRegulaminu(id);
        boolean modified =  dod.modifyNaruszeniaRegulaminu(obj);
        Integer currentVersion = obj.getVersion();
        NaruszeniaRegulaminu merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'NaruszeniaRegulaminu' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void NaruszeniaRegulaminuIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'NaruszeniaRegulaminu' failed to initialize correctly", dod.getRandomNaruszeniaRegulaminu());
        NaruszeniaRegulaminu obj = dod.getNewTransientNaruszeniaRegulaminu(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'NaruszeniaRegulaminu' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'NaruszeniaRegulaminu' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'NaruszeniaRegulaminu' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void NaruszeniaRegulaminuIntegrationTest.testRemove() {
        NaruszeniaRegulaminu obj = dod.getRandomNaruszeniaRegulaminu();
        Assert.assertNotNull("Data on demand for 'NaruszeniaRegulaminu' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'NaruszeniaRegulaminu' failed to provide an identifier", id);
        obj = NaruszeniaRegulaminu.findNaruszeniaRegulaminu(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'NaruszeniaRegulaminu' with identifier '" + id + "'", NaruszeniaRegulaminu.findNaruszeniaRegulaminu(id));
    }
    
}