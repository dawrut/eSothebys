// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import pl.wroc.pwr.wiz.io.psi.model.Wojewodztwo;

privileged aspect Wojewodztwo_Roo_Jpa_Entity {
    
    declare @type: Wojewodztwo: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Wojewodztwo.id;
    
    @Version
    @Column(name = "version")
    private Integer Wojewodztwo.version;
    
    public Long Wojewodztwo.getId() {
        return this.id;
    }
    
    public void Wojewodztwo.setId(Long id) {
        this.id = id;
    }
    
    public Integer Wojewodztwo.getVersion() {
        return this.version;
    }
    
    public void Wojewodztwo.setVersion(Integer version) {
        this.version = version;
    }
    
}
