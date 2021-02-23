package beans;

public class Team {
    private int id;
    private  String name;
    private String address;
    private String phone;
    private String email;
    private int idAdmin;
    private int status;
    private String admin;
    public Team(int id, String name, String address, String phone, String email, int idAdmin, int status) {
        this.id=id;
        this.name =name;
        this.address =address;
        this.phone =phone;
        this.email = email;
        this.idAdmin =idAdmin;
        this.status =status;
    }

    public Team() {

    }

    public Team(int id,String name,  String teamAddress, String teamPhone, String teamEmail, int teamIdAdmin) {
        this.id = id;
        this.name = name;
        this.idAdmin = teamIdAdmin;
        this.email = teamEmail;
        this.address = teamAddress;
        this.phone = teamPhone;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public int getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(int idAdmin) {
        this.idAdmin = idAdmin;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getStatus() {
        return status;
    }
}
