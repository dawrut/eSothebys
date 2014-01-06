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
import pl.wroc.pwr.wiz.io.psi.model.Szczegoly;
import pl.wroc.pwr.wiz.io.psi.model.SzczegolyDataOnDemand;

privileged aspect SzczegolyDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SzczegolyDataOnDemand: @Component;
    
    private Random SzczegolyDataOnDemand.rnd = new SecureRandom();
    
    private List<Szczegoly> SzczegolyDataOnDemand.data;
    
    public Szczegoly SzczegolyDataOnDemand.getNewTransientSzczegoly(int index) {
        Szczegoly obj = new Szczegoly();
        setWprowadzonaWartosc(obj, index);
        return obj;
    }
    
    public void SzczegolyDataOnDemand.setWprowadzonaWartosc(Szczegoly obj, int index) {
        String wprowadzonaWartosc = "wprowadzonaWartosc_" + index;
        obj.setWprowadzonaWartosc(wprowadzonaWartosc);
    }
    
    public Szczegoly SzczegolyDataOnDemand.getSpecificSzczegoly(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Szczegoly obj = data.get(index);
        Long id = obj.getId();
        return Szczegoly.findSzczegoly(id);
    }
    
    public Szczegoly SzczegolyDataOnDemand.getRandomSzczegoly() {
        init();
        Szczegoly obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Szczegoly.findSzczegoly(id);
    }
    
    public boolean SzczegolyDataOnDemand.modifySzczegoly(Szczegoly obj) {
        return false;
    }
    
    public void SzczegolyDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Szczegoly.findSzczegolyEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Szczegoly' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Szczegoly>();
        for (int i = 0; i < 10; i++) {
            Szczegoly obj = getNewTransientSzczegoly(i);
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
