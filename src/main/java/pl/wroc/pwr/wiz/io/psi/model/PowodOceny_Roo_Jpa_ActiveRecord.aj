// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import pl.wroc.pwr.wiz.io.psi.model.PowodOceny;

privileged aspect PowodOceny_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager PowodOceny.entityManager;
    
    public static final EntityManager PowodOceny.entityManager() {
        EntityManager em = new PowodOceny().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PowodOceny.countPowodOcenys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PowodOceny o", Long.class).getSingleResult();
    }
    
    public static List<PowodOceny> PowodOceny.findAllPowodOcenys() {
        return entityManager().createQuery("SELECT o FROM PowodOceny o", PowodOceny.class).getResultList();
    }
    
    public static PowodOceny PowodOceny.findPowodOceny(Long id) {
        if (id == null) return null;
        return entityManager().find(PowodOceny.class, id);
    }
    
    public static List<PowodOceny> PowodOceny.findPowodOcenyEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PowodOceny o", PowodOceny.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void PowodOceny.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PowodOceny.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PowodOceny attached = PowodOceny.findPowodOceny(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PowodOceny.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PowodOceny.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PowodOceny PowodOceny.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PowodOceny merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}