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
import pl.wroc.pwr.wiz.io.psi.model.CzestotliwoscSubskrypcji;
import pl.wroc.pwr.wiz.io.psi.model.SposobPrezentacji;
import pl.wroc.pwr.wiz.io.psi.model.Subskrypcja;
import pl.wroc.pwr.wiz.io.psi.model.SubskrypcjaDataOnDemand;

privileged aspect SubskrypcjaDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SubskrypcjaDataOnDemand: @Component;
    
    private Random SubskrypcjaDataOnDemand.rnd = new SecureRandom();
    
    private List<Subskrypcja> SubskrypcjaDataOnDemand.data;
    
    public Subskrypcja SubskrypcjaDataOnDemand.getNewTransientSubskrypcja(int index) {
        Subskrypcja obj = new Subskrypcja();
        setCzestotliwoscSubskrypcji(obj, index);
        setWyswietlenie(obj, index);
        return obj;
    }
    
    public void SubskrypcjaDataOnDemand.setCzestotliwoscSubskrypcji(Subskrypcja obj, int index) {
        CzestotliwoscSubskrypcji czestotliwoscSubskrypcji = CzestotliwoscSubskrypcji.class.getEnumConstants()[0];
        obj.setCzestotliwoscSubskrypcji(czestotliwoscSubskrypcji);
    }
    
    public void SubskrypcjaDataOnDemand.setWyswietlenie(Subskrypcja obj, int index) {
        SposobPrezentacji wyswietlenie = SposobPrezentacji.class.getEnumConstants()[0];
        obj.setWyswietlenie(wyswietlenie);
    }
    
    public Subskrypcja SubskrypcjaDataOnDemand.getSpecificSubskrypcja(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Subskrypcja obj = data.get(index);
        Long id = obj.getId();
        return Subskrypcja.findSubskrypcja(id);
    }
    
    public Subskrypcja SubskrypcjaDataOnDemand.getRandomSubskrypcja() {
        init();
        Subskrypcja obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Subskrypcja.findSubskrypcja(id);
    }
    
    public boolean SubskrypcjaDataOnDemand.modifySubskrypcja(Subskrypcja obj) {
        return false;
    }
    
    public void SubskrypcjaDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Subskrypcja.findSubskrypcjaEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Subskrypcja' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Subskrypcja>();
        for (int i = 0; i < 10; i++) {
            Subskrypcja obj = getNewTransientSubskrypcja(i);
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
