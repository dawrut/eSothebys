// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import pl.wroc.pwr.wiz.io.psi.model.Kraj;

privileged aspect Kraj_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Kraj.entityManager;
    
    public static final EntityManager Kraj.entityManager() {
        EntityManager em = new Kraj().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Kraj.countKrajs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Kraj o", Long.class).getSingleResult();
    }
    
    public static List<Kraj> Kraj.findAllKrajs() {
        return entityManager().createQuery("SELECT o FROM Kraj o", Kraj.class).getResultList();
    }
    
    public static Kraj Kraj.findKraj(Long id) {
        if (id == null) return null;
        return entityManager().find(Kraj.class, id);
    }
    
    public static List<Kraj> Kraj.findKrajEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Kraj o", Kraj.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Kraj.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Kraj.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Kraj attached = Kraj.findKraj(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Kraj.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Kraj.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Kraj Kraj.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Kraj merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
