// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import pl.wroc.pwr.wiz.io.psi.model.Kategoria;

privileged aspect Kategoria_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Kategoria.entityManager;
    
    public static final EntityManager Kategoria.entityManager() {
        EntityManager em = new Kategoria().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Kategoria.countKategorias() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Kategoria o", Long.class).getSingleResult();
    }
    
    public static List<Kategoria> Kategoria.findAllKategorias() {
        return entityManager().createQuery("SELECT o FROM Kategoria o", Kategoria.class).getResultList();
    }
    
    public static Kategoria Kategoria.findKategoria(Long id) {
        if (id == null) return null;
        return entityManager().find(Kategoria.class, id);
    }
    
    public static List<Kategoria> Kategoria.findKategoriaEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Kategoria o", Kategoria.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Kategoria.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Kategoria.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Kategoria attached = Kategoria.findKategoria(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Kategoria.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Kategoria.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Kategoria Kategoria.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Kategoria merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
