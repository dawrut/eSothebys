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
import pl.wroc.pwr.wiz.io.psi.model.CennikDostaw;
import pl.wroc.pwr.wiz.io.psi.model.CennikDostawDataOnDemand;

privileged aspect CennikDostawDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CennikDostawDataOnDemand: @Component;
    
    private Random CennikDostawDataOnDemand.rnd = new SecureRandom();
    
    private List<CennikDostaw> CennikDostawDataOnDemand.data;
    
    public CennikDostaw CennikDostawDataOnDemand.getNewTransientCennikDostaw(int index) {
        CennikDostaw obj = new CennikDostaw();
        setNazwa(obj, index);
        setSzablon(obj, index);
        return obj;
    }
    
    public void CennikDostawDataOnDemand.setNazwa(CennikDostaw obj, int index) {
        String nazwa = "nazwa_" + index;
        obj.setNazwa(nazwa);
    }
    
    public void CennikDostawDataOnDemand.setSzablon(CennikDostaw obj, int index) {
        Boolean szablon = Boolean.TRUE;
        obj.setSzablon(szablon);
    }
    
    public CennikDostaw CennikDostawDataOnDemand.getSpecificCennikDostaw(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        CennikDostaw obj = data.get(index);
        Long id = obj.getId();
        return CennikDostaw.findCennikDostaw(id);
    }
    
    public CennikDostaw CennikDostawDataOnDemand.getRandomCennikDostaw() {
        init();
        CennikDostaw obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return CennikDostaw.findCennikDostaw(id);
    }
    
    public boolean CennikDostawDataOnDemand.modifyCennikDostaw(CennikDostaw obj) {
        return false;
    }
    
    public void CennikDostawDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = CennikDostaw.findCennikDostawEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'CennikDostaw' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<CennikDostaw>();
        for (int i = 0; i < 10; i++) {
            CennikDostaw obj = getNewTransientCennikDostaw(i);
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
