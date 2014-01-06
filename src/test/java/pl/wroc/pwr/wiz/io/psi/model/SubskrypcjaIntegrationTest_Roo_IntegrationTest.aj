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
import pl.wroc.pwr.wiz.io.psi.model.Subskrypcja;
import pl.wroc.pwr.wiz.io.psi.model.SubskrypcjaDataOnDemand;
import pl.wroc.pwr.wiz.io.psi.model.SubskrypcjaIntegrationTest;

privileged aspect SubskrypcjaIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SubskrypcjaIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SubskrypcjaIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SubskrypcjaIntegrationTest: @Transactional;
    
    @Autowired
    SubskrypcjaDataOnDemand SubskrypcjaIntegrationTest.dod;
    
    @Test
    public void SubskrypcjaIntegrationTest.testCountSubskrypcjas() {
        Assert.assertNotNull("Data on demand for 'Subskrypcja' failed to initialize correctly", dod.getRandomSubskrypcja());
        long count = Subskrypcja.countSubskrypcjas();
        Assert.assertTrue("Counter for 'Subskrypcja' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SubskrypcjaIntegrationTest.testFindSubskrypcja() {
        Subskrypcja obj = dod.getRandomSubskrypcja();
        Assert.assertNotNull("Data on demand for 'Subskrypcja' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Subskrypcja' failed to provide an identifier", id);
        obj = Subskrypcja.findSubskrypcja(id);
        Assert.assertNotNull("Find method for 'Subskrypcja' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Subskrypcja' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void SubskrypcjaIntegrationTest.testFindAllSubskrypcjas() {
        Assert.assertNotNull("Data on demand for 'Subskrypcja' failed to initialize correctly", dod.getRandomSubskrypcja());
        long count = Subskrypcja.countSubskrypcjas();
        Assert.assertTrue("Too expensive to perform a find all test for 'Subskrypcja', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Subskrypcja> result = Subskrypcja.findAllSubskrypcjas();
        Assert.assertNotNull("Find all method for 'Subskrypcja' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Subskrypcja' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SubskrypcjaIntegrationTest.testFindSubskrypcjaEntries() {
        Assert.assertNotNull("Data on demand for 'Subskrypcja' failed to initialize correctly", dod.getRandomSubskrypcja());
        long count = Subskrypcja.countSubskrypcjas();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Subskrypcja> result = Subskrypcja.findSubskrypcjaEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Subskrypcja' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Subskrypcja' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SubskrypcjaIntegrationTest.testFlush() {
        Subskrypcja obj = dod.getRandomSubskrypcja();
        Assert.assertNotNull("Data on demand for 'Subskrypcja' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Subskrypcja' failed to provide an identifier", id);
        obj = Subskrypcja.findSubskrypcja(id);
        Assert.assertNotNull("Find method for 'Subskrypcja' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifySubskrypcja(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Subskrypcja' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SubskrypcjaIntegrationTest.testMergeUpdate() {
        Subskrypcja obj = dod.getRandomSubskrypcja();
        Assert.assertNotNull("Data on demand for 'Subskrypcja' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Subskrypcja' failed to provide an identifier", id);
        obj = Subskrypcja.findSubskrypcja(id);
        boolean modified =  dod.modifySubskrypcja(obj);
        Integer currentVersion = obj.getVersion();
        Subskrypcja merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Subskrypcja' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SubskrypcjaIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Subskrypcja' failed to initialize correctly", dod.getRandomSubskrypcja());
        Subskrypcja obj = dod.getNewTransientSubskrypcja(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Subskrypcja' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Subskrypcja' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Subskrypcja' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void SubskrypcjaIntegrationTest.testRemove() {
        Subskrypcja obj = dod.getRandomSubskrypcja();
        Assert.assertNotNull("Data on demand for 'Subskrypcja' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Subskrypcja' failed to provide an identifier", id);
        obj = Subskrypcja.findSubskrypcja(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Subskrypcja' with identifier '" + id + "'", Subskrypcja.findSubskrypcja(id));
    }
    
}