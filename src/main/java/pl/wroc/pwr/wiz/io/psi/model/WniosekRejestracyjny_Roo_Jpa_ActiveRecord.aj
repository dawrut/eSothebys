// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import pl.wroc.pwr.wiz.io.psi.model.WniosekRejestracyjny;

privileged aspect WniosekRejestracyjny_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager WniosekRejestracyjny.entityManager;
    
    public static final EntityManager WniosekRejestracyjny.entityManager() {
        EntityManager em = new WniosekRejestracyjny().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long WniosekRejestracyjny.countWniosekRejestracyjnys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM WniosekRejestracyjny o", Long.class).getSingleResult();
    }
    
    public static List<WniosekRejestracyjny> WniosekRejestracyjny.findAllWniosekRejestracyjnys() {
        return entityManager().createQuery("SELECT o FROM WniosekRejestracyjny o", WniosekRejestracyjny.class).getResultList();
    }
    
    public static WniosekRejestracyjny WniosekRejestracyjny.findWniosekRejestracyjny(Long id) {
        if (id == null) return null;
        return entityManager().find(WniosekRejestracyjny.class, id);
    }
    
    public static List<WniosekRejestracyjny> WniosekRejestracyjny.findWniosekRejestracyjnyEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM WniosekRejestracyjny o", WniosekRejestracyjny.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void WniosekRejestracyjny.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void WniosekRejestracyjny.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            WniosekRejestracyjny attached = WniosekRejestracyjny.findWniosekRejestracyjny(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void WniosekRejestracyjny.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void WniosekRejestracyjny.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public WniosekRejestracyjny WniosekRejestracyjny.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        WniosekRejestracyjny merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
