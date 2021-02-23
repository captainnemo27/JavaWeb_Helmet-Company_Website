package beans;

import utils.UtilsDB;

import java.util.Date;

public class Staff {
    private int id;
    private String name;
    private Date dateOfBirth;
    private String address;
    private String sex;
    private String phone;
    private String email;
    private float workTime;
    private int idTeam;
    private String userName;
    private String aboutStaff;
    private String userImage;
    private String linkFacebook;
    private int status;
    private int numTask;
    private String type;
    private String password;

    public Staff(int id, String name, Date dateOfBirth, String sex, String address,  String phone, String email, int idTeam, String aboutStaff, int status) {
        this.id =id;
        this.name =name;
        this.dateOfBirth = dateOfBirth;
        this.sex =sex;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.idTeam =idTeam;
        this.aboutStaff = aboutStaff;
        this.status =status;
    }

    public Staff(int id, String name, Date dateOfBirth, String address, String sex, String phone, String email, String username, String password, int idTeam, String aboutStaff, int status,String type) {
        this.id =id;
        this.name =name;
        this.dateOfBirth =dateOfBirth;
        this.sex =sex;
        this.address =address;
        this.phone = phone;
        this.email =email;
        this.idTeam =idTeam;
        this.userName=username;
        this.password = password;
        this.aboutStaff=aboutStaff;
        this.status =status;
        this.type =type;
    }

    public Staff(int id, String name, Date dateOfBirth, String address, String sex, String phone, String email, String userName, int idTeam, String aboutStaff, int status) {
        this.id =id;
        this.name =name;
        this.dateOfBirth =dateOfBirth;
        this.sex =sex;
        this.address =address;
        this.phone = phone;
        this.email =email;
        this.idTeam =idTeam;
        this.userName=userName;
        this.aboutStaff=aboutStaff;
        this.status =status;
    }

    public Staff(int id, String name, String address, String phone, String sex,int idTeam, int numTask, String type) {
        this.id =id;
        this.name=name;
        this.address =address;
        this.phone= phone;
        this.sex = sex;
        this.idTeam = idTeam;
        this.numTask =numTask;
        this.type =type;
    }
public Staff(){}


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getNumTask() {
        return numTask;
    }

    public String getType() {
        return type;
    }

    public void setNumTask(int numTask) {
        this.numTask = numTask;
    }

    public void setType(String type) {
        this.type = type;
    }

    // get contructor
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Date getDateOfBirth() {
        return dateOfBirth;
    }
    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public float getWorkTime() {
        return workTime;
    }
    public void setWorkTime(float workTime) {
        this.workTime = workTime;
    }
    public int getIdTeam() {
        return idTeam;
    }

    public void setIdTeam(int idTeam) {
        this.idTeam = idTeam;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAboutStaff() {
        return aboutStaff;
    }

    public void setAboutStaff(String aboutStaff) {
        this.aboutStaff = aboutStaff;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    public String getLinkFacebook() {
        return linkFacebook;
    }

    public void setLinkFacebook(String linkFacebook) {
        this.linkFacebook = linkFacebook;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
