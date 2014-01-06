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
import pl.wroc.pwr.wiz.io.psi.model.Uzytkownik;
import pl.wroc.pwr.wiz.io.psi.model.UzytkownikDataOnDemand;
import pl.wroc.pwr.wiz.io.psi.model.UzytkownikIntegrationTest;

privileged aspect UzytkownikIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UzytkownikIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UzytkownikIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: UzytkownikIntegrationTest: @Transactional;
    
    @Autowired
    UzytkownikDataOnDemand UzytkownikIntegrationTest.dod;
    
    @Test
    public void UzytkownikIntegrationTest.testCountUzytkowniks() {
        Assert.assertNotNull("Data on demand for 'Uzytkownik' failed to initialize correctly", dod.getRandomUzytkownik());
        long count = Uzytkownik.countUzytkowniks();
        Assert.assertTrue("Counter for 'Uzytkownik' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UzytkownikIntegrationTest.testFindUzytkownik() {
        Uzytkownik obj = dod.getRandomUzytkownik();
        Assert.assertNotNull("Data on demand for 'Uzytkownik' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Uzytkownik' failed to provide an identifier", id);
        obj = Uzytkownik.findUzytkownik(id);
        Assert.assertNotNull("Find method for 'Uzytkownik' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Uzytkownik' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void UzytkownikIntegrationTest.testFindAllUzytkowniks() {
        Assert.assertNotNull("Data on demand for 'Uzytkownik' failed to initialize correctly", dod.getRandomUzytkownik());
        long count = Uzytkownik.countUzytkowniks();
        Assert.assertTrue("Too expensive to perform a find all test for 'Uzytkownik', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Uzytkownik> result = Uzytkownik.findAllUzytkowniks();
        Assert.assertNotNull("Find all method for 'Uzytkownik' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Uzytkownik' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UzytkownikIntegrationTest.testFindUzytkownikEntries() {
        Assert.assertNotNull("Data on demand for 'Uzytkownik' failed to initialize correctly", dod.getRandomUzytkownik());
        long count = Uzytkownik.countUzytkowniks();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Uzytkownik> result = Uzytkownik.findUzytkownikEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Uzytkownik' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Uzytkownik' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void UzytkownikIntegrationTest.testFlush() {
        Uzytkownik obj = dod.getRandomUzytkownik();
        Assert.assertNotNull("Data on demand for 'Uzytkownik' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Uzytkownik' failed to provide an identifier", id);
        obj = Uzytkownik.findUzytkownik(id);
        Assert.assertNotNull("Find method for 'Uzytkownik' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUzytkownik(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Uzytkownik' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UzytkownikIntegrationTest.testMergeUpdate() {
        Uzytkownik obj = dod.getRandomUzytkownik();
        Assert.assertNotNull("Data on demand for 'Uzytkownik' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Uzytkownik' failed to provide an identifier", id);
        obj = Uzytkownik.findUzytkownik(id);
        boolean modified =  dod.modifyUzytkownik(obj);
        Integer currentVersion = obj.getVersion();
        Uzytkownik merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Uzytkownik' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UzytkownikIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Uzytkownik' failed to initialize correctly", dod.getRandomUzytkownik());
        Uzytkownik obj = dod.getNewTransientUzytkownik(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Uzytkownik' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Uzytkownik' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Uzytkownik' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void UzytkownikIntegrationTest.testRemove() {
        Uzytkownik obj = dod.getRandomUzytkownik();
        Assert.assertNotNull("Data on demand for 'Uzytkownik' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Uzytkownik' failed to provide an identifier", id);
        obj = Uzytkownik.findUzytkownik(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Uzytkownik' with identifier '" + id + "'", Uzytkownik.findUzytkownik(id));
    }
    
}
