// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import pl.wroc.pwr.wiz.io.psi.model.UstawieniaSprzedazy;

privileged aspect UstawieniaSprzedazy_Roo_Jpa_Entity {
    
    declare @type: UstawieniaSprzedazy: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long UstawieniaSprzedazy.id;
    
    @Version
    @Column(name = "version")
    private Integer UstawieniaSprzedazy.version;
    
    public Long UstawieniaSprzedazy.getId() {
        return this.id;
    }
    
    public void UstawieniaSprzedazy.setId(Long id) {
        this.id = id;
    }
    
    public Integer UstawieniaSprzedazy.getVersion() {
        return this.version;
    }
    
    public void UstawieniaSprzedazy.setVersion(Integer version) {
        this.version = version;
    }
    
}