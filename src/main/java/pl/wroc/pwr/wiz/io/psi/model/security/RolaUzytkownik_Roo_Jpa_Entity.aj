// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model.security;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import pl.wroc.pwr.wiz.io.psi.model.security.RolaUzytkownik;

privileged aspect RolaUzytkownik_Roo_Jpa_Entity {
    
    declare @type: RolaUzytkownik: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long RolaUzytkownik.id;
    
    @Version
    @Column(name = "version")
    private Integer RolaUzytkownik.version;
    
    public Long RolaUzytkownik.getId() {
        return this.id;
    }
    
    public void RolaUzytkownik.setId(Long id) {
        this.id = id;
    }
    
    public Integer RolaUzytkownik.getVersion() {
        return this.version;
    }
    
    public void RolaUzytkownik.setVersion(Integer version) {
        this.version = version;
    }
    
}
