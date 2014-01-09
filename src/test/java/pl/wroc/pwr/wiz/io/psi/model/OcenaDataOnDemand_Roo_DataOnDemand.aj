// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pl.wroc.pwr.wiz.io.psi.model.KomentarzDataOnDemand;
import pl.wroc.pwr.wiz.io.psi.model.Ocena;
import pl.wroc.pwr.wiz.io.psi.model.OcenaDataOnDemand;

privileged aspect OcenaDataOnDemand_Roo_DataOnDemand {
    
    declare @type: OcenaDataOnDemand: @Component;
    
    private Random OcenaDataOnDemand.rnd = new SecureRandom();
    
    private List<Ocena> OcenaDataOnDemand.data;
    
    @Autowired
    KomentarzDataOnDemand OcenaDataOnDemand.komentarzDataOnDemand;
    
    public Ocena OcenaDataOnDemand.getNewTransientOcena(int index) {
        Ocena obj = new Ocena();
        setDataWystawienia(obj, index);
        setTresc(obj, index);
        return obj;
    }
    
    public void OcenaDataOnDemand.setDataWystawienia(Ocena obj, int index) {
        Date dataWystawienia = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDataWystawienia(dataWystawienia);
    }
    
    public void OcenaDataOnDemand.setTresc(Ocena obj, int index) {
        String tresc = "tresc_" + index;
        obj.setTresc(tresc);
    }
    
    public Ocena OcenaDataOnDemand.getSpecificOcena(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Ocena obj = data.get(index);
        Long id = obj.getId();
        return Ocena.findOcena(id);
    }
    
    public Ocena OcenaDataOnDemand.getRandomOcena() {
        init();
        Ocena obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Ocena.findOcena(id);
    }
    
    public boolean OcenaDataOnDemand.modifyOcena(Ocena obj) {
        return false;
    }
    
    public void OcenaDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Ocena.findOcenaEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Ocena' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Ocena>();
        for (int i = 0; i < 10; i++) {
            Ocena obj = getNewTransientOcena(i);
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
