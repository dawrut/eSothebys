// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import pl.wroc.pwr.wiz.io.psi.model.PowodZgloszenia;

privileged aspect PowodZgloszenia_Roo_Jpa_Entity {
    
    declare @type: PowodZgloszenia: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long PowodZgloszenia.id;
    
    @Version
    @Column(name = "version")
    private Integer PowodZgloszenia.version;
    
    public Long PowodZgloszenia.getId() {
        return this.id;
    }
    
    public void PowodZgloszenia.setId(Long id) {
        this.id = id;
    }
    
    public Integer PowodZgloszenia.getVersion() {
        return this.version;
    }
    
    public void PowodZgloszenia.setVersion(Integer version) {
        this.version = version;
    }
    
}
