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
import pl.wroc.pwr.wiz.io.psi.model.Wartosc;
import pl.wroc.pwr.wiz.io.psi.model.WartoscDataOnDemand;

privileged aspect WartoscDataOnDemand_Roo_DataOnDemand {
    
    declare @type: WartoscDataOnDemand: @Component;
    
    private Random WartoscDataOnDemand.rnd = new SecureRandom();
    
    private List<Wartosc> WartoscDataOnDemand.data;
    
    public Wartosc WartoscDataOnDemand.getNewTransientWartosc(int index) {
        Wartosc obj = new Wartosc();
        setWartosc(obj, index);
        return obj;
    }
    
    public void WartoscDataOnDemand.setWartosc(Wartosc obj, int index) {
        String wartosc = "wartosc_" + index;
        obj.setWartosc(wartosc);
    }
    
    public Wartosc WartoscDataOnDemand.getSpecificWartosc(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Wartosc obj = data.get(index);
        Long id = obj.getId();
        return Wartosc.findWartosc(id);
    }
    
    public Wartosc WartoscDataOnDemand.getRandomWartosc() {
        init();
        Wartosc obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Wartosc.findWartosc(id);
    }
    
    public boolean WartoscDataOnDemand.modifyWartosc(Wartosc obj) {
        return false;
    }
    
    public void WartoscDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Wartosc.findWartoscEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Wartosc' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Wartosc>();
        for (int i = 0; i < 10; i++) {
            Wartosc obj = getNewTransientWartosc(i);
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