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
import pl.wroc.pwr.wiz.io.psi.model.Adres;
import pl.wroc.pwr.wiz.io.psi.model.AdresDataOnDemand;
import pl.wroc.pwr.wiz.io.psi.model.AdresIntegrationTest;

privileged aspect AdresIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AdresIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AdresIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: AdresIntegrationTest: @Transactional;
    
    @Autowired
    AdresDataOnDemand AdresIntegrationTest.dod;
    
    @Test
    public void AdresIntegrationTest.testCountAdreses() {
        Assert.assertNotNull("Data on demand for 'Adres' failed to initialize correctly", dod.getRandomAdres());
        long count = Adres.countAdreses();
        Assert.assertTrue("Counter for 'Adres' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AdresIntegrationTest.testFindAdres() {
        Adres obj = dod.getRandomAdres();
        Assert.assertNotNull("Data on demand for 'Adres' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Adres' failed to provide an identifier", id);
        obj = Adres.findAdres(id);
        Assert.assertNotNull("Find method for 'Adres' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Adres' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AdresIntegrationTest.testFindAllAdreses() {
        Assert.assertNotNull("Data on demand for 'Adres' failed to initialize correctly", dod.getRandomAdres());
        long count = Adres.countAdreses();
        Assert.assertTrue("Too expensive to perform a find all test for 'Adres', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Adres> result = Adres.findAllAdreses();
        Assert.assertNotNull("Find all method for 'Adres' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Adres' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AdresIntegrationTest.testFindAdresEntries() {
        Assert.assertNotNull("Data on demand for 'Adres' failed to initialize correctly", dod.getRandomAdres());
        long count = Adres.countAdreses();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Adres> result = Adres.findAdresEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Adres' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Adres' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void AdresIntegrationTest.testFlush() {
        Adres obj = dod.getRandomAdres();
        Assert.assertNotNull("Data on demand for 'Adres' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Adres' failed to provide an identifier", id);
        obj = Adres.findAdres(id);
        Assert.assertNotNull("Find method for 'Adres' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAdres(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Adres' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AdresIntegrationTest.testMergeUpdate() {
        Adres obj = dod.getRandomAdres();
        Assert.assertNotNull("Data on demand for 'Adres' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Adres' failed to provide an identifier", id);
        obj = Adres.findAdres(id);
        boolean modified =  dod.modifyAdres(obj);
        Integer currentVersion = obj.getVersion();
        Adres merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Adres' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AdresIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Adres' failed to initialize correctly", dod.getRandomAdres());
        Adres obj = dod.getNewTransientAdres(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Adres' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Adres' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Adres' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void AdresIntegrationTest.testRemove() {
        Adres obj = dod.getRandomAdres();
        Assert.assertNotNull("Data on demand for 'Adres' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Adres' failed to provide an identifier", id);
        obj = Adres.findAdres(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Adres' with identifier '" + id + "'", Adres.findAdres(id));
    }
    
}