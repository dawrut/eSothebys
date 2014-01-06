// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import pl.wroc.pwr.wiz.io.psi.model.Urlop;

privileged aspect Urlop_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Urlop.entityManager;
    
    public static final EntityManager Urlop.entityManager() {
        EntityManager em = new Urlop().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Urlop.countUrlops() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Urlop o", Long.class).getSingleResult();
    }
    
    public static List<Urlop> Urlop.findAllUrlops() {
        return entityManager().createQuery("SELECT o FROM Urlop o", Urlop.class).getResultList();
    }
    
    public static Urlop Urlop.findUrlop(Long id) {
        if (id == null) return null;
        return entityManager().find(Urlop.class, id);
    }
    
    public static List<Urlop> Urlop.findUrlopEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Urlop o", Urlop.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Urlop.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Urlop.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Urlop attached = Urlop.findUrlop(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Urlop.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Urlop.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Urlop Urlop.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Urlop merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
