package pl.wroc.pwr.wiz.io.psi.service.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import pl.wroc.pwr.wiz.io.psi.model.Uzytkownik;
import pl.wroc.pwr.wiz.io.psi.model.security.RolaUzytkownik;

@Component
public class AuthenticationProviderImpl implements AuthenticationProvider {

  public Authentication authenticate(Authentication authentication) throws AuthenticationException {
    String username = authentication.getName();
    String password = (String) authentication.getCredentials();

    try {
      Uzytkownik uzytkownik = Uzytkownik.findUzytkowniksByEmailEquals(username).getSingleResult();
      if (!password.equals(uzytkownik.getHaslo())) {
        badRoleException();
      }
      Collection<GrantedAuthority> authorities = getUzytkownikAuthorities(uzytkownik);

      authentication = new UsernamePasswordAuthenticationToken(username, password, authorities);
    } catch (Exception e) {
      badRoleException();
    }
    return authentication;
  }

  private Collection<GrantedAuthority> getUzytkownikAuthorities(Uzytkownik uzytkownik) {
    Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
    boolean kupujacy = false;
    for (RolaUzytkownik rola : RolaUzytkownik.findRolaUzytkowniksByEmail(uzytkownik)
        .getResultList()) {
      if ("ROLE_ZAWIESZONE".equals(rola.getIdRoli().getIdRoli())) badRoleException();
      if (("ROLE_KUPTERAZ".equals(rola.getIdRoli().getIdRoli()))) kupujacy = true;

      authorities.add(new SimpleGrantedAuthority(rola.getIdRoli().getNazwaRoli()));
    }

    if (!kupujacy) badRoleException();

    return authorities;
  }

  private void badRoleException() {
    throw new BadCredentialsException("Błędny użytkownik lub hasło");
  }

  public boolean supports(Class<? extends Object> authentication) {
    return true;
  }

}
