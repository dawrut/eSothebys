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

    Uzytkownik uzytkownik = Uzytkownik.findUzytkowniksByEmailEquals(username).getSingleResult();

    if (uzytkownik == null) {
      // TODO: dodac i18n
      throw new BadCredentialsException("Błędny użytkownik lub hasło.");
    }

    if (!password.equals(uzytkownik.getHaslo())) {
      // TODO: dodac i18n
      throw new BadCredentialsException("Błędny użytkownik lub hasło.");
    }

    Collection<GrantedAuthority> authorities = getUzytkownikAuthorities(uzytkownik);

    return new UsernamePasswordAuthenticationToken(username, password, authorities);
  }

  private Collection<GrantedAuthority> getUzytkownikAuthorities(Uzytkownik uzytkownik) {
    Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

    for (RolaUzytkownik rola : RolaUzytkownik.findRolaUzytkowniksByEmail(uzytkownik)
        .getResultList()) {
      authorities.add(new SimpleGrantedAuthority(rola.getIdRoli().getNazwaRoli()));
    }
    return authorities;
  }

  public boolean supports(Class<? extends Object> authentication) {
    return true;
  }

}
