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
import pl.wroc.pwr.wiz.io.psi.model.PowodZmianyDanych;
import pl.wroc.pwr.wiz.io.psi.model.UczestnikDataOnDemand;
import pl.wroc.pwr.wiz.io.psi.model.WniosekZmianyImieniaINazwiska;
import pl.wroc.pwr.wiz.io.psi.model.WniosekZmianyImieniaINazwiskaDataOnDemand;

privileged aspect WniosekZmianyImieniaINazwiskaDataOnDemand_Roo_DataOnDemand {
    
    declare @type: WniosekZmianyImieniaINazwiskaDataOnDemand: @Component;
    
    private Random WniosekZmianyImieniaINazwiskaDataOnDemand.rnd = new SecureRandom();
    
    private List<WniosekZmianyImieniaINazwiska> WniosekZmianyImieniaINazwiskaDataOnDemand.data;
    
    @Autowired
    UczestnikDataOnDemand WniosekZmianyImieniaINazwiskaDataOnDemand.uczestnikDataOnDemand;
    
    public WniosekZmianyImieniaINazwiska WniosekZmianyImieniaINazwiskaDataOnDemand.getNewTransientWniosekZmianyImieniaINazwiska(int index) {
        WniosekZmianyImieniaINazwiska obj = new WniosekZmianyImieniaINazwiska();
        setDataZlozenia(obj, index);
        setImie(obj, index);
        setNazwisko(obj, index);
        setPowod(obj, index);
        return obj;
    }
    
    public void WniosekZmianyImieniaINazwiskaDataOnDemand.setDataZlozenia(WniosekZmianyImieniaINazwiska obj, int index) {
        Date dataZlozenia = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDataZlozenia(dataZlozenia);
    }
    
    public void WniosekZmianyImieniaINazwiskaDataOnDemand.setImie(WniosekZmianyImieniaINazwiska obj, int index) {
        String imie = "imie_" + index;
        obj.setImie(imie);
    }
    
    public void WniosekZmianyImieniaINazwiskaDataOnDemand.setNazwisko(WniosekZmianyImieniaINazwiska obj, int index) {
        String nazwisko = "nazwisko_" + index;
        obj.setNazwisko(nazwisko);
    }
    
    public void WniosekZmianyImieniaINazwiskaDataOnDemand.setPowod(WniosekZmianyImieniaINazwiska obj, int index) {
        PowodZmianyDanych powod = PowodZmianyDanych.class.getEnumConstants()[0];
        obj.setPowod(powod);
    }
    
    public WniosekZmianyImieniaINazwiska WniosekZmianyImieniaINazwiskaDataOnDemand.getSpecificWniosekZmianyImieniaINazwiska(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        WniosekZmianyImieniaINazwiska obj = data.get(index);
        Long id = obj.getId();
        return WniosekZmianyImieniaINazwiska.findWniosekZmianyImieniaINazwiska(id);
    }
    
    public WniosekZmianyImieniaINazwiska WniosekZmianyImieniaINazwiskaDataOnDemand.getRandomWniosekZmianyImieniaINazwiska() {
        init();
        WniosekZmianyImieniaINazwiska obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return WniosekZmianyImieniaINazwiska.findWniosekZmianyImieniaINazwiska(id);
    }
    
    public boolean WniosekZmianyImieniaINazwiskaDataOnDemand.modifyWniosekZmianyImieniaINazwiska(WniosekZmianyImieniaINazwiska obj) {
        return false;
    }
    
    public void WniosekZmianyImieniaINazwiskaDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = WniosekZmianyImieniaINazwiska.findWniosekZmianyImieniaINazwiskaEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'WniosekZmianyImieniaINazwiska' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<WniosekZmianyImieniaINazwiska>();
        for (int i = 0; i < 10; i++) {
            WniosekZmianyImieniaINazwiska obj = getNewTransientWniosekZmianyImieniaINazwiska(i);
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
