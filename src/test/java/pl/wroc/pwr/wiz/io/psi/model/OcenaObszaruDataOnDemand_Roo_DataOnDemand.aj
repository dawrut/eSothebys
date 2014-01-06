// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;
import pl.wroc.pwr.wiz.io.psi.model.OcenaObszaru;
import pl.wroc.pwr.wiz.io.psi.model.OcenaObszaruDataOnDemand;

privileged aspect OcenaObszaruDataOnDemand_Roo_DataOnDemand {
    
    declare @type: OcenaObszaruDataOnDemand: @Component;
    
    private Random OcenaObszaruDataOnDemand.rnd = new SecureRandom();
    
    private List<OcenaObszaru> OcenaObszaruDataOnDemand.data;
    
    public OcenaObszaru OcenaObszaruDataOnDemand.getNewTransientOcenaObszaru(int index) {
        OcenaObszaru obj = new OcenaObszaru();
        setPunkty(obj, index);
        return obj;
    }
    
    public void OcenaObszaruDataOnDemand.setPunkty(OcenaObszaru obj, int index) {
        int punkty = index;
        obj.setPunkty(punkty);
    }
    
    public OcenaObszaru OcenaObszaruDataOnDemand.getSpecificOcenaObszaru(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        OcenaObszaru obj = data.get(index);
        Long id = obj.getId();
        return OcenaObszaru.findOcenaObszaru(id);
    }
    
    public OcenaObszaru OcenaObszaruDataOnDemand.getRandomOcenaObszaru() {
        init();
        OcenaObszaru obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return OcenaObszaru.findOcenaObszaru(id);
    }
    
    public boolean OcenaObszaruDataOnDemand.modifyOcenaObszaru(OcenaObszaru obj) {
        return false;
    }
    
    public void OcenaObszaruDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = OcenaObszaru.findOcenaObszaruEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'OcenaObszaru' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<OcenaObszaru>();
        for (int i = 0; i < 10; i++) {
            OcenaObszaru obj = getNewTransientOcenaObszaru(i);
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
            data.add(obj);
        }
    }
    
}