package pl.wroc.pwr.wiz.io.psi.service.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class ShaHashingUtil {
  private static final String SHA_256 = "SHA-256";
  private MessageDigest md;

  public ShaHashingUtil() throws NoSuchAlgorithmException {
    md = MessageDigest.getInstance(SHA_256);
  }

  public String hashPassword(String password) {
    byte[] byteData = getByteData(password);

    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < byteData.length; i++) {
      sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
    }
    
    return sb.toString();
  }

  private synchronized byte[] getByteData(String password) {
    md.update(password.getBytes());
    byte byteData[] = md.digest();
    return byteData;
  }
}
