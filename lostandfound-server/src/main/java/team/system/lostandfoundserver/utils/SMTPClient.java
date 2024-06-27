package team.system.lostandfoundserver.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Base64;

public class SMTPClient {
  private String msg = "\r\n  【失物招领网】这是你的验证码，请查收：";
  private final String mailServer = "smtp.qq.com";
  private final Socket socket = new Socket(mailServer, 25);
  private final InputStream inputStream = socket.getInputStream();
  private final OutputStream outputStream = socket.getOutputStream();

  public SMTPClient() throws Exception {
  }

  private String receiveFromServer() throws IOException {
    byte[] value = new byte[1024];
    int i = inputStream.read(value);
    String str = new String(value);
    System.out.println("S: " + str);
    return str;
  }

  private void sendToServer(String response) throws IOException {
    outputStream.write(response.getBytes());
    System.out.println(response);
  }

  public boolean sendMessage(String email, String message) throws IOException {
    msg = msg + message;

    String recv;
    Base64.Encoder encoder = Base64.getEncoder();
    String userQQ = "1612253221@qq.com";
    String EuserQQ = new String(encoder.encode(userQQ.getBytes()));
    recv = receiveFromServer();
    if (recv.startsWith("220")) {
      System.out.println("220 reply not received from server.");
      return false;
    }

    String heloCommand = "HELO 192.168.1.105\r\n";
    sendToServer(heloCommand);
    recv = receiveFromServer();
    if (recv.startsWith("250")) {
      System.out.println("250 reply not received from server.");
      return false;
    }

    String loginCommand = "auth login\r\n";
    sendToServer(loginCommand);
    receiveFromServer();

    String userName = EuserQQ + "\r\n";
    sendToServer(userName);
    receiveFromServer();

    String authorizationCode = "aGZka25wdXRtd3h3YmViZg==";
    String passWord = authorizationCode + "\r\n";
    sendToServer(passWord);
    receiveFromServer();

    String mailCommand = "mail from: " + "<" + userQQ + ">\r\n";
    sendToServer(mailCommand);
    receiveFromServer();

    String rcpt_toCommand = "rcpt to: " + "<" + email + ">\r\n";
    sendToServer(rcpt_toCommand);
    receiveFromServer();

    String data = "data\r\n\r\n";
    sendToServer(data);
    receiveFromServer();

    sendToServer(msg);
    String endmsg = "\r\n.\r\n";
    sendToServer(endmsg);
    recv = receiveFromServer();
    if (recv.startsWith("250")) {
      System.out.println("250 reply not received from server.");
      return false;
    }

    String Quit = "quit\r\n";
    sendToServer(Quit);
    receiveFromServer();

    outputStream.close();
    inputStream.close();
    return true;
  }
}

