package pl.wroc.pwr.wiz.io.psi.service.utils.helpers;

import java.util.ArrayList;
import java.util.List;

import pl.wroc.pwr.wiz.io.psi.model.security.Roles;

public class RoleGenerator {

  public List<Roles> getAdminRoles() {
    List<Roles> role = getSprzedajacyRoles();
    role.add(Roles.ROLE_ADMIN);

    return role;
  }

  public List<Roles> getModeratorRoles() {
    List<Roles> role = getSprzedajacyRoles();
    role.add(Roles.ROLE_MODERATOR);

    return role;
  }

  public List<Roles> getSprzedajacyRoles() {
    List<Roles> role = getKupujacyRoles();
    role.add(Roles.ROLE_SPRZEDAJACY);

    return role;
  }

  public List<Roles> getKupujacyRoles() {
    List<Roles> role = getBasicRoles();
    role.add(Roles.ROLE_KUPTERAZ);
    role.add(Roles.ROLE_LICYTATOR);

    return role;
  }

  private List<Roles> getBasicRoles() {
    List<Roles> role = new ArrayList<>();
    role.add(Roles.ROLE_WYSLIJWIADOMOSC);

    return role;
  }
}
