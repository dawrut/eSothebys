// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import pl.wroc.pwr.wiz.io.psi.model.Szczegoly;

privileged aspect Szczegoly_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Szczegoly.entityManager;
    
    public static final EntityManager Szczegoly.entityManager() {
        EntityManager em = new Szczegoly().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Szczegoly.countSzczegolys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Szczegoly o", Long.class).getSingleResult();
    }
    
    public static List<Szczegoly> Szczegoly.findAllSzczegolys() {
        return entityManager().createQuery("SELECT o FROM Szczegoly o", Szczegoly.class).getResultList();
    }
    
    public static Szczegoly Szczegoly.findSzczegoly(Long id) {
        if (id == null) return null;
        return entityManager().find(Szczegoly.class, id);
    }
    
    public static List<Szczegoly> Szczegoly.findSzczegolyEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Szczegoly o", Szczegoly.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Szczegoly.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Szczegoly.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Szczegoly attached = Szczegoly.findSzczegoly(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Szczegoly.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Szczegoly.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Szczegoly Szczegoly.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Szczegoly merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
