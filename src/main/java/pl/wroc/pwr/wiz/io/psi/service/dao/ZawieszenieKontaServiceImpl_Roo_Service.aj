// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.service.dao;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.wroc.pwr.wiz.io.psi.model.ZawieszenieKonta;
import pl.wroc.pwr.wiz.io.psi.service.dao.ZawieszenieKontaServiceImpl;

privileged aspect ZawieszenieKontaServiceImpl_Roo_Service {
    
    declare @type: ZawieszenieKontaServiceImpl: @Service;
    
    declare @type: ZawieszenieKontaServiceImpl: @Transactional;
    
    public long ZawieszenieKontaServiceImpl.countAllZawieszenieKontas() {
        return ZawieszenieKonta.countZawieszenieKontas();
    }
    
    public void ZawieszenieKontaServiceImpl.deleteZawieszenieKonta(ZawieszenieKonta zawieszenieKonta) {
        zawieszenieKonta.remove();
    }
    
    public ZawieszenieKonta ZawieszenieKontaServiceImpl.findZawieszenieKonta(Long id) {
        return ZawieszenieKonta.findZawieszenieKonta(id);
    }
    
    public List<ZawieszenieKonta> ZawieszenieKontaServiceImpl.findAllZawieszenieKontas() {
        return ZawieszenieKonta.findAllZawieszenieKontas();
    }
    
    public List<ZawieszenieKonta> ZawieszenieKontaServiceImpl.findZawieszenieKontaEntries(int firstResult, int maxResults) {
        return ZawieszenieKonta.findZawieszenieKontaEntries(firstResult, maxResults);
    }
    
    public void ZawieszenieKontaServiceImpl.saveZawieszenieKonta(ZawieszenieKonta zawieszenieKonta) {
        zawieszenieKonta.persist();
    }
    
    public ZawieszenieKonta ZawieszenieKontaServiceImpl.updateZawieszenieKonta(ZawieszenieKonta zawieszenieKonta) {
        return zawieszenieKonta.merge();
    }
    
}
