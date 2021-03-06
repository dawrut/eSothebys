// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import pl.wroc.pwr.wiz.io.psi.model.Wojewodztwo;

privileged aspect Wojewodztwo_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Wojewodztwo.entityManager;
    
    public static final EntityManager Wojewodztwo.entityManager() {
        EntityManager em = new Wojewodztwo().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Wojewodztwo.countWojewodztwoes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Wojewodztwo o", Long.class).getSingleResult();
    }
    
    public static List<Wojewodztwo> Wojewodztwo.findAllWojewodztwoes() {
        return entityManager().createQuery("SELECT o FROM Wojewodztwo o", Wojewodztwo.class).getResultList();
    }
    
    public static Wojewodztwo Wojewodztwo.findWojewodztwo(Long id) {
        if (id == null) return null;
        return entityManager().find(Wojewodztwo.class, id);
    }
    
    public static List<Wojewodztwo> Wojewodztwo.findWojewodztwoEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Wojewodztwo o", Wojewodztwo.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Wojewodztwo.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Wojewodztwo.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Wojewodztwo attached = Wojewodztwo.findWojewodztwo(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Wojewodztwo.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Wojewodztwo.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Wojewodztwo Wojewodztwo.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Wojewodztwo merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
