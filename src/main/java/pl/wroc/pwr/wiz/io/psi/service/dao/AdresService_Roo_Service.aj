// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.service.dao;

import java.util.List;
import pl.wroc.pwr.wiz.io.psi.model.Adres;
import pl.wroc.pwr.wiz.io.psi.service.dao.AdresService;

privileged aspect AdresService_Roo_Service {
    
    public abstract long AdresService.countAllAdreses();    
    public abstract void AdresService.deleteAdres(Adres adres);    
    public abstract Adres AdresService.findAdres(Long id);    
    public abstract List<Adres> AdresService.findAllAdreses();    
    public abstract List<Adres> AdresService.findAdresEntries(int firstResult, int maxResults);    
    public abstract void AdresService.saveAdres(Adres adres);    
    public abstract Adres AdresService.updateAdres(Adres adres);    
}