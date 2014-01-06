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
import pl.wroc.pwr.wiz.io.psi.model.Wojewodztwo;
import pl.wroc.pwr.wiz.io.psi.model.WojewodztwoDataOnDemand;

privileged aspect WojewodztwoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: WojewodztwoDataOnDemand: @Component;
    
    private Random WojewodztwoDataOnDemand.rnd = new SecureRandom();
    
    private List<Wojewodztwo> WojewodztwoDataOnDemand.data;
    
    public Wojewodztwo WojewodztwoDataOnDemand.getNewTransientWojewodztwo(int index) {
        Wojewodztwo obj = new Wojewodztwo();
        setNazwa(obj, index);
        return obj;
    }
    
    public void WojewodztwoDataOnDemand.setNazwa(Wojewodztwo obj, int index) {
        String nazwa = "nazwa_" + index;
        obj.setNazwa(nazwa);
    }
    
    public Wojewodztwo WojewodztwoDataOnDemand.getSpecificWojewodztwo(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Wojewodztwo obj = data.get(index);
        Long id = obj.getId();
        return Wojewodztwo.findWojewodztwo(id);
    }
    
    public Wojewodztwo WojewodztwoDataOnDemand.getRandomWojewodztwo() {
        init();
        Wojewodztwo obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Wojewodztwo.findWojewodztwo(id);
    }
    
    public boolean WojewodztwoDataOnDemand.modifyWojewodztwo(Wojewodztwo obj) {
        return false;
    }
    
    public void WojewodztwoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Wojewodztwo.findWojewodztwoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Wojewodztwo' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Wojewodztwo>();
        for (int i = 0; i < 10; i++) {
            Wojewodztwo obj = getNewTransientWojewodztwo(i);
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
