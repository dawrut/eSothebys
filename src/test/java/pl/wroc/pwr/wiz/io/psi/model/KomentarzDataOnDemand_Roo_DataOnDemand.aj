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
import pl.wroc.pwr.wiz.io.psi.model.GraficznaOcenaSprzedazyDataOnDemand;
import pl.wroc.pwr.wiz.io.psi.model.Komentarz;
import pl.wroc.pwr.wiz.io.psi.model.KomentarzDataOnDemand;
import pl.wroc.pwr.wiz.io.psi.model.OcenaDataOnDemand;
import pl.wroc.pwr.wiz.io.psi.model.RodzajKomentarza;
import pl.wroc.pwr.wiz.io.psi.model.UczestnikDataOnDemand;
import pl.wroc.pwr.wiz.io.psi.model.UmowaDataOnDemand;

privileged aspect KomentarzDataOnDemand_Roo_DataOnDemand {
    
    declare @type: KomentarzDataOnDemand: @Component;
    
    private Random KomentarzDataOnDemand.rnd = new SecureRandom();
    
    private List<Komentarz> KomentarzDataOnDemand.data;
    
    @Autowired
    GraficznaOcenaSprzedazyDataOnDemand KomentarzDataOnDemand.graficznaOcenaSprzedazyDataOnDemand;
    
    @Autowired
    OcenaDataOnDemand KomentarzDataOnDemand.ocenaDataOnDemand;
    
    @Autowired
    UmowaDataOnDemand KomentarzDataOnDemand.umowaDataOnDemand;
    
    @Autowired
    UczestnikDataOnDemand KomentarzDataOnDemand.uczestnikDataOnDemand;
    
    public Komentarz KomentarzDataOnDemand.getNewTransientKomentarz(int index) {
        Komentarz obj = new Komentarz();
        setDataWystawienia(obj, index);
        setRodzaj(obj, index);
        setTresc(obj, index);
        setUniewazniony(obj, index);
        return obj;
    }
    
    public void KomentarzDataOnDemand.setDataWystawienia(Komentarz obj, int index) {
        Date dataWystawienia = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDataWystawienia(dataWystawienia);
    }
    
    public void KomentarzDataOnDemand.setRodzaj(Komentarz obj, int index) {
        RodzajKomentarza rodzaj = RodzajKomentarza.class.getEnumConstants()[0];
        obj.setRodzaj(rodzaj);
    }
    
    public void KomentarzDataOnDemand.setTresc(Komentarz obj, int index) {
        String tresc = "tresc_" + index;
        obj.setTresc(tresc);
    }
    
    public void KomentarzDataOnDemand.setUniewazniony(Komentarz obj, int index) {
        Boolean uniewazniony = Boolean.TRUE;
        obj.setUniewazniony(uniewazniony);
    }
    
    public Komentarz KomentarzDataOnDemand.getSpecificKomentarz(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Komentarz obj = data.get(index);
        Long id = obj.getId();
        return Komentarz.findKomentarz(id);
    }
    
    public Komentarz KomentarzDataOnDemand.getRandomKomentarz() {
        init();
        Komentarz obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Komentarz.findKomentarz(id);
    }
    
    public boolean KomentarzDataOnDemand.modifyKomentarz(Komentarz obj) {
        return false;
    }
    
    public void KomentarzDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Komentarz.findKomentarzEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Komentarz' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Komentarz>();
        for (int i = 0; i < 10; i++) {
            Komentarz obj = getNewTransientKomentarz(i);
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
