// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import pl.wroc.pwr.wiz.io.psi.model.Regulamin;

privileged aspect Regulamin_Roo_Jpa_Entity {
    
    declare @type: Regulamin: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Regulamin.id;
    
    @Version
    @Column(name = "version")
    private Integer Regulamin.version;
    
    public Long Regulamin.getId() {
        return this.id;
    }
    
    public void Regulamin.setId(Long id) {
        this.id = id;
    }
    
    public Integer Regulamin.getVersion() {
        return this.version;
    }
    
    public void Regulamin.setVersion(Integer version) {
        this.version = version;
    }
    
}