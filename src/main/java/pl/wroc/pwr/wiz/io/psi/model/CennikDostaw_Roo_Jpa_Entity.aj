// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import pl.wroc.pwr.wiz.io.psi.model.CennikDostaw;

privileged aspect CennikDostaw_Roo_Jpa_Entity {
    
    declare @type: CennikDostaw: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long CennikDostaw.id;
    
    @Version
    @Column(name = "version")
    private Integer CennikDostaw.version;
    
    public Long CennikDostaw.getId() {
        return this.id;
    }
    
    public void CennikDostaw.setId(Long id) {
        this.id = id;
    }
    
    public Integer CennikDostaw.getVersion() {
        return this.version;
    }
    
    public void CennikDostaw.setVersion(Integer version) {
        this.version = version;
    }
    
}
