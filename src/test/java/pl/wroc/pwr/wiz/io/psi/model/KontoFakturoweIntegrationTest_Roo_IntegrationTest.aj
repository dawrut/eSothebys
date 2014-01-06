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
import pl.wroc.pwr.wiz.io.psi.model.KontoFakturowe;
import pl.wroc.pwr.wiz.io.psi.model.KontoFakturoweDataOnDemand;
import pl.wroc.pwr.wiz.io.psi.model.KontoFakturoweIntegrationTest;

privileged aspect KontoFakturoweIntegrationTest_Roo_IntegrationTest {
    
    declare @type: KontoFakturoweIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: KontoFakturoweIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: KontoFakturoweIntegrationTest: @Transactional;
    
    @Autowired
    KontoFakturoweDataOnDemand KontoFakturoweIntegrationTest.dod;
    
    @Test
    public void KontoFakturoweIntegrationTest.testCountKontoFakturowes() {
        Assert.assertNotNull("Data on demand for 'KontoFakturowe' failed to initialize correctly", dod.getRandomKontoFakturowe());
        long count = KontoFakturowe.countKontoFakturowes();
        Assert.assertTrue("Counter for 'KontoFakturowe' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void KontoFakturoweIntegrationTest.testFindKontoFakturowe() {
        KontoFakturowe obj = dod.getRandomKontoFakturowe();
        Assert.assertNotNull("Data on demand for 'KontoFakturowe' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'KontoFakturowe' failed to provide an identifier", id);
        obj = KontoFakturowe.findKontoFakturowe(id);
        Assert.assertNotNull("Find method for 'KontoFakturowe' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'KontoFakturowe' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void KontoFakturoweIntegrationTest.testFindAllKontoFakturowes() {
        Assert.assertNotNull("Data on demand for 'KontoFakturowe' failed to initialize correctly", dod.getRandomKontoFakturowe());
        long count = KontoFakturowe.countKontoFakturowes();
        Assert.assertTrue("Too expensive to perform a find all test for 'KontoFakturowe', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<KontoFakturowe> result = KontoFakturowe.findAllKontoFakturowes();
        Assert.assertNotNull("Find all method for 'KontoFakturowe' illegally returned null", result);
        Assert.assertTrue("Find all method for 'KontoFakturowe' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void KontoFakturoweIntegrationTest.testFindKontoFakturoweEntries() {
        Assert.assertNotNull("Data on demand for 'KontoFakturowe' failed to initialize correctly", dod.getRandomKontoFakturowe());
        long count = KontoFakturowe.countKontoFakturowes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<KontoFakturowe> result = KontoFakturowe.findKontoFakturoweEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'KontoFakturowe' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'KontoFakturowe' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void KontoFakturoweIntegrationTest.testFlush() {
        KontoFakturowe obj = dod.getRandomKontoFakturowe();
        Assert.assertNotNull("Data on demand for 'KontoFakturowe' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'KontoFakturowe' failed to provide an identifier", id);
        obj = KontoFakturowe.findKontoFakturowe(id);
        Assert.assertNotNull("Find method for 'KontoFakturowe' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyKontoFakturowe(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'KontoFakturowe' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void KontoFakturoweIntegrationTest.testMergeUpdate() {
        KontoFakturowe obj = dod.getRandomKontoFakturowe();
        Assert.assertNotNull("Data on demand for 'KontoFakturowe' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'KontoFakturowe' failed to provide an identifier", id);
        obj = KontoFakturowe.findKontoFakturowe(id);
        boolean modified =  dod.modifyKontoFakturowe(obj);
        Integer currentVersion = obj.getVersion();
        KontoFakturowe merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'KontoFakturowe' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void KontoFakturoweIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'KontoFakturowe' failed to initialize correctly", dod.getRandomKontoFakturowe());
        KontoFakturowe obj = dod.getNewTransientKontoFakturowe(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'KontoFakturowe' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'KontoFakturowe' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'KontoFakturowe' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void KontoFakturoweIntegrationTest.testRemove() {
        KontoFakturowe obj = dod.getRandomKontoFakturowe();
        Assert.assertNotNull("Data on demand for 'KontoFakturowe' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'KontoFakturowe' failed to provide an identifier", id);
        obj = KontoFakturowe.findKontoFakturowe(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'KontoFakturowe' with identifier '" + id + "'", KontoFakturowe.findKontoFakturowe(id));
    }
    
}
