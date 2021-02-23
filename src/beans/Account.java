package beans;

import utils.UtilsDB;

public class Account {
    private String userName;
    private String displayName;
    private String passWord;
    private String type;
    private String email;

    public Account() {

    }
    public Account(String userName, String passWord) {
        this.userName = userName;
        this.passWord = passWord;

    }

    public String getUserName() {
        return userName;
    }
    public void setUserName(String UserName) {
        this.userName = UserName;
    }

    public String getDisplayName() {
        return displayName;
    }
    public void setDisplayName(String DisplayName) {
        this.displayName = DisplayName;
    }

    public String getPassWord() {
        return passWord;
    }
    public void setPassWord(String PassWord) {
        this.passWord = PassWord;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public boolean exitAccount(String errorString, String ErrorString, String username)
    {
        if (ErrorString == null && username != null) {
            return true;
        } else {
            return false;
        }
    }
    public Account(String userName, String displayName, String passWord, String type) {
        this.userName = userName;
        this.displayName = displayName;
        this.passWord = passWord;
        this.type = type;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }
}
