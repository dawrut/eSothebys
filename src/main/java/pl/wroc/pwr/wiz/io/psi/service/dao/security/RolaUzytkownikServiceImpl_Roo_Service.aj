// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.service.dao.security;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.wroc.pwr.wiz.io.psi.model.security.RolaUzytkownik;
import pl.wroc.pwr.wiz.io.psi.service.dao.security.RolaUzytkownikServiceImpl;

privileged aspect RolaUzytkownikServiceImpl_Roo_Service {
    
    declare @type: RolaUzytkownikServiceImpl: @Service;
    
    declare @type: RolaUzytkownikServiceImpl: @Transactional;
    
    public long RolaUzytkownikServiceImpl.countAllRolaUzytkowniks() {
        return RolaUzytkownik.countRolaUzytkowniks();
    }
    
    public void RolaUzytkownikServiceImpl.deleteRolaUzytkownik(RolaUzytkownik rolaUzytkownik) {
        rolaUzytkownik.remove();
    }
    
    public RolaUzytkownik RolaUzytkownikServiceImpl.findRolaUzytkownik(Long id) {
        return RolaUzytkownik.findRolaUzytkownik(id);
    }
    
    public List<RolaUzytkownik> RolaUzytkownikServiceImpl.findAllRolaUzytkowniks() {
        return RolaUzytkownik.findAllRolaUzytkowniks();
    }
    
    public List<RolaUzytkownik> RolaUzytkownikServiceImpl.findRolaUzytkownikEntries(int firstResult, int maxResults) {
        return RolaUzytkownik.findRolaUzytkownikEntries(firstResult, maxResults);
    }
    
    public void RolaUzytkownikServiceImpl.saveRolaUzytkownik(RolaUzytkownik rolaUzytkownik) {
        rolaUzytkownik.persist();
    }
    
    public RolaUzytkownik RolaUzytkownikServiceImpl.updateRolaUzytkownik(RolaUzytkownik rolaUzytkownik) {
        return rolaUzytkownik.merge();
    }
    
}
