// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package pl.wroc.pwr.wiz.io.psi.model;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import pl.wroc.pwr.wiz.io.psi.model.Kraj;
import pl.wroc.pwr.wiz.io.psi.model.Wojewodztwo;

privileged aspect Wojewodztwo_Roo_Finder {
    
    public static TypedQuery<Wojewodztwo> Wojewodztwo.findWojewodztwoesByKraj(Kraj kraj) {
        if (kraj == null) throw new IllegalArgumentException("The kraj argument is required");
        EntityManager em = Wojewodztwo.entityManager();
        TypedQuery<Wojewodztwo> q = em.createQuery("SELECT o FROM Wojewodztwo AS o WHERE o.kraj = :kraj", Wojewodztwo.class);
        q.setParameter("kraj", kraj);
        return q;
    }
    
}