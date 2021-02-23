package utils;

import beans.*;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UtilsDB {

    // change to URL decode
    public static String decodeValue(String value) {
        try {
            return URLDecoder.decode(value, StandardCharsets.UTF_8.toString());
        } catch (UnsupportedEncodingException ex) {
            throw new RuntimeException(ex.getCause());
        }
    }
    public static List<Account> listNhanVien(Connection conn) throws SQLException {
        String sql = "SELECT UserName, DisplayName,PassWord,Type FROM ACOUNT";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Account> list1 = new ArrayList<Account>();
        while (rs.next()){
            String userName = rs.getString("UserName");
            String displayName =rs.getString("DisplayName");
            String passWord = rs.getString("PassWord");
            String type = rs.getString("Type");
            Account sv = new Account(userName,displayName,passWord,type);
            sv.setUserName(userName);
            sv.setDisplayName(displayName);
            sv.setPassWord(passWord);
            sv.setType(type);
            list1.add(sv);
            System.out.println(sv);
        }

        return list1;
    }
    public static Account findUser(Connection conn, String userName) throws SQLException {

        String sql = "Select a.UserName, a.PassWord, a.Type, a.DisplayName from User_Account a "//
                + " where a.UserName = ? ";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);

        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            String password = rs.getString("Password");
            String Type = rs.getString("Type");
            String displayName = rs.getString("DisplayName");
            Account user = new Account();
            user.setUserName(userName);
            user.setPassWord(password);
            user.setDisplayName(displayName);
            user.setType(Type);
            return user;
        }
        return null;
    }
    public static Account findUser(Connection conn, //
                                       String username, String password) throws SQLException {

        String sql = "EXEC dbo.SP_Login @username= ? , @password = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, username);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();
        Account Ac = new Account();
        if (rs.next()) {
            String userName = rs.getString("UserName");
            String displayName = rs.getString("DisplayName");
            String passWord = rs.getString("PassWord");
            String type = rs.getString("Type");

            Ac.setUserName(userName);
            Ac.setDisplayName(displayName);
            Ac.setPassWord(passWord);
            Ac.setType(type);

            System.out.println("UserName: " + userName);
            System.out.println("Password: " + passWord+"\n" +"----------------------------------");

            return Ac;
        }
        return null;
    }
    public static Account findAccountLogin(Connection conn, String UserName, String PassWord) throws SQLException {
        String sql = "EXEC dbo.SP_Login @username= ? , @password = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, UserName);
        pstm.setString(2,PassWord);

        ResultSet rs = pstm.executeQuery();
        Account Ac = new Account();
        if(rs.next() && rs.getRow()>0){
            String userName = rs.getString("UserName");
            String displayName = rs.getString("DisplayName");
            String passWord = rs.getString("PassWord");
            String type = rs.getString("Type");

            Ac.setUserName(userName);
            Ac.setDisplayName(displayName);
            Ac.setPassWord(passWord);
            Ac.setType(type);
            System.out.println("UserName: " + userName);
            System.out.println("Password: " + passWord+"\n" +"----------------------------------");

            return Ac;
        }
        return Ac;
    }
    public static List<Task> storeListTaskRunning(Connection conn)throws SQLException{

        String sql = "EXEC SP_ListTaskRunning";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Task> list1 = new ArrayList<Task>();
        while (rs.next()){
            int id = rs.getInt("Id");
            String name = rs.getString("Name");
            String content = rs.getString("Content");
            Timestamp timeFrom = rs.getTimestamp("TimeFrom");
            Timestamp timeEnd = rs.getTimestamp("TimeEnd");
            int idProject = rs.getInt("IdProject");
            int statusTask = rs.getInt("StatusTask");
            int status = rs.getInt("status");

            Task task = new Task(id,name,content,timeFrom,timeEnd,idProject,statusTask,status);
            //System.out.println(task.getId()+"---------");
            list1.add(task);

        }

        return list1;
    }
    public static List<Team> storeInfoListTeam(Connection conn)throws SQLException{

        String sql = "EXEC SP_ListInfoTeam";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Team> list1 = new ArrayList<Team>();
        while (rs.next()){
            int id = rs.getInt("Id");
            String name = rs.getString("Name");
            String address = rs.getString("Address");
            String phone = rs.getString("Phone") ;
            String email = rs.getString("Email");
            int idAdmin = rs.getInt("IdAmin");
            int status = rs.getInt("status");

            Team team = new Team(id,name,address,phone,email,idAdmin,status);

            list1.add(team);
            /*System.out.println();*/
        }

        return list1;
    }
    public  static Staff storeInfoUser(Connection conn, String UserName)throws SQLException {
        String sql = "EXEC dbo.SP_InforUser @username=?;";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, UserName);

        ResultSet rs = pstm.executeQuery();
        Staff staff = new Staff();
        if(rs.next() && rs.getRow()>0){
            int id = rs.getInt("Id");
            String name = rs.getString("Name");
            Date dateofbirth = rs.getDate("DateOfBirth");
            String address = rs.getString("Address");
            String sex = rs.getString("Sex");
            String phone = rs.getString("Phone");
            String email = rs.getString("Email");
            int idTeam = rs.getInt("IdTeam");
            String userName = rs.getString("UserName");
            String aboutStaff = rs.getString("AboutStaff");
            int status = rs.getInt("Status");

            staff.setId(id);
            staff.setName(decodeValue(name));
            staff.setDateOfBirth((java.sql.Date) dateofbirth);
            staff.setAddress(address);
            staff.setSex(sex);
            staff.setPhone(phone);
            staff.setEmail(email);
            staff.setIdTeam(idTeam);
            staff.setUserName(userName);
            staff.setAboutStaff(aboutStaff);
            staff.setStatus(status);
            System.out.println("UserName: " + userName);
            System.out.println("----------------------------------");
            return staff;

        }
        return null;
    }
    public static void updateNhanVien(Connection conn, Account sv) throws SQLException {
        String sql = "Update STAFF set Name=?, Phone=? where Id=? ";

        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setString(1, sv.getUserName());
        pstm.setString(2, sv.getPassWord());
        //pstm.setInt(3, sv.getType());
        pstm.executeUpdate();

    }
    public static Object deleteNhanVien(Connection conn, Account sv) throws SQLException {
        String sql = "DELETE FROM STAFF where id =?";

        PreparedStatement pstm = conn.prepareStatement(sql);
       //pstm.setInt( 1,sv.getId());

        pstm.executeQuery();
        return null;
    }

    public static void storeUpdateStaff(Connection conn, Staff st) throws SQLException {
        String sql = "Update STAFF set Name=?, DateOfBirth=?, Address=?, Sex=?, Phone=?, Email=?,IdTeam=?, AboutStaff =?, status  =? where UserName=? ";

        PreparedStatement pstm = conn.prepareStatement(sql);
        //System.out.println(st.getName());
        pstm.setString(1, st.getName());
        java.sql.Date sqlDate = new java.sql.Date(st.getDateOfBirth().getTime());// set date in Util to Date in Sql
        pstm.setDate(2,  sqlDate);
        pstm.setString(3,st.getAddress());
        pstm.setString(4,st.getSex());
        pstm.setString(5,st.getPhone());
        pstm.setString(6,st.getEmail());
        pstm.setInt(7,st.getIdTeam());
        pstm.setString(8,st.getAboutStaff());
        pstm.setInt(9,st.getStatus());
        pstm.setString(10,st.getUserName());

        //pstm.setInt(3, sv.getType());
        pstm.executeUpdate();

    }

    public static List<Task> storeListTask(Connection conn) throws
            SQLException{
        String sql = "EXEC dbo.SP_storeListTask ";

        PreparedStatement pstm = conn.prepareStatement(sql);


        ResultSet rs = pstm.executeQuery();
        List<Task> TaskList = new ArrayList<Task>();
        while (rs.next()){
            int id = rs.getInt("Id");
            String name = rs.getString("Name");
            String content = rs.getString("Content");
            int statusTask = rs.getInt("StatusTask");
            Timestamp timeFrom = rs.getTimestamp("TimeFrom");
            Timestamp timeEnd = rs.getTimestamp("TimeEnd");
            int idProject = rs.getInt("IdProject");
            int status = rs.getInt("status");
            Task task =new Task(id,name,content,statusTask,timeFrom,timeEnd,idProject,status);
            TaskList.add(task);
        }
        System.out.println("---------storeListTask------------");
        return TaskList;
    }
    public static List<Project> storeListProject(Connection conn, int idteam) throws SQLException {
        String sql = "SELECT * FROM FN_storeListProjectTeam(?)";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,idteam);

        ResultSet rs = pstm.executeQuery();
        List<Project> ProjectList = new ArrayList<Project>();
        while (rs.next()){
            // edit name
            int id = rs.getInt("Id");
            String name = rs.getString("Name");
            String content = rs.getString("Content");
            String statusProject = rs.getString("StatusProject");
            Timestamp timeFrom = rs.getTimestamp("TimeFrom");
            Timestamp timeEnd = rs.getTimestamp("TimeEnd");
            int idTeam = rs.getInt("IdTeam");
            int status = rs.getInt("status");
            Project project =new Project(id,name,content,statusProject,timeFrom,timeEnd,idTeam,status);
            ProjectList.add(project);
        }
        System.out.println("---------storeListProject------------");
        return ProjectList;

    }
    public static List<Project> storeListProject(Connection conn) throws SQLException {
        String sql = "SELECT * FROM FN_storeListProjectRunning() ";

        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Project> ProjectList = new ArrayList<Project>();
        while (rs.next()){
            // edit name
            int id = rs.getInt("Id");
            String name = rs.getString("Name");
            String content = rs.getString("Content");
            String statusProject = rs.getString("StatusProject");
            Timestamp timeFrom = rs.getTimestamp("TimeFrom");
            Timestamp timeEnd = rs.getTimestamp("TimeEnd");
            int idTeam = rs.getInt("IdTeam");
            int status = rs.getInt("status");
            Project project =new Project(id,name,content,statusProject,timeFrom,timeEnd,idTeam,status);
            ProjectList.add(project);
        }
        System.out.println("---------storeListProject------------");
        return ProjectList;
    }



    public static List<Salary> storeListSalary(Connection conn) throws SQLException{
        String sql = "SELECT* from FN_storeListSalary()";

        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Salary> SalaryList = new ArrayList<Salary>();
        while (rs.next()){
            int month = rs.getInt("Month");
            int year = rs.getInt("SYear");
            String name = rs.getString("Name");
            float fixSalary = rs.getFloat("FixedSalary");
            float bonus = rs.getFloat("Bonus");
            float salary = fixSalary+bonus;
            String teamName = rs.getString("Team");
            Salary Salary =new Salary(month,year,name,fixSalary,bonus,salary,teamName);
            SalaryList.add(Salary);
        }
        System.out.println("---------storeListSalary:------------");
        return SalaryList;
    }
    public static List<Task> storeListTask(Connection conn,String Char,int idProject, int idStaff) throws SQLException{

        String sql = "exec SP_storeTaskName ?,?,? ";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,Char);
        pstm.setInt(2,idProject);
        pstm.setInt(3,idStaff);
        ResultSet rs = pstm.executeQuery();
        List<Task> TaskList = new ArrayList<Task>();
        while (rs.next()){
            int id = rs.getInt("Id");
            String name = rs.getString("Name");
            String content = rs.getString("Content");
            Timestamp timeFrom = rs.getTimestamp("TimeFrom");
            Timestamp timeEnd = rs.getTimestamp("TimeEnd");
            int status = rs.getInt("status");
            int statusTask =rs.getInt("StatusTask");
            String nameStaff = rs.getString("nameStaff");
            String nameProject = rs.getString("nameProject");
            Task Task =new Task(id,name,content,timeFrom,timeEnd,status,statusTask,nameStaff,nameProject);
            TaskList.add(Task);
        }
        System.out.println("---------storeListTask:------------");
        return TaskList;
    }

    public static void addTask(Connection conn, Task task) throws SQLException {
        String sql = "EXEC SP_addTask ?,?,?,?,?,? ";

        PreparedStatement pstm = conn.prepareStatement(sql);
        //System.out.println(st.getName());
        pstm.setString(1, task.getName());
        pstm.setString(2,task.getContent());
        pstm.setInt(3,task.getIdProject());
        pstm.setInt(4,task.getIdStaff());
        java.sql.Date sqlDateFrom = new java.sql.Date(task.getTimeFrom().getTime());
        java.sql.Date sqlDateEnd = new java.sql.Date(task.getTimeEnd().getTime());// set date in Util to Date in Sql
        pstm.setDate(5,  sqlDateFrom);
        pstm.setDate(6,  sqlDateEnd);


        //pstm.setInt(3, sv.getType());
        pstm.executeUpdate();
    }

    public static List<Salary> storeListSalaryTeam(Connection conn, int idTeam, int month, int year, int choose) throws SQLException {
        String sql = "exec SP_storeSalaryTeam ?,?,?,?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,idTeam);
        pstm.setInt(2,month);
        pstm.setInt(3,year);
        pstm.setInt(4,choose);
        ResultSet rs = pstm.executeQuery();
        List<Salary> SalaryList = new ArrayList<Salary>();
        while (rs.next()){
            int Month = rs.getInt("Month");
            int Year = rs.getInt("SYear");
            String name = rs.getString("Name");
            float fixSalary = rs.getFloat("FixedSalary");
            float bonus = rs.getFloat("Bonus");
            float salary = fixSalary+bonus;
            String teamName = rs.getString("Team");
            Salary Salary =new Salary(Month,Year,name,fixSalary,bonus,salary,teamName);
            SalaryList.add(Salary);
        }
        System.out.println("---------storeListSalary_2:------------");
        return SalaryList;

    }

    public static List<Staff> storeListStaff(Connection conn, int idTeam) throws SQLException{
        String sql = "EXEC SP_storeStaffOfTeam ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,idTeam);
        ResultSet rs = pstm.executeQuery();
        List<Staff> StaffList = new ArrayList<Staff>();
        while (rs.next()){
            int id = rs.getInt("Id");
            String name = rs.getString("Name");
            String address = rs.getString("Address");
            String phone = rs.getString("Phone");
            String sex= rs.getString("Sex");
            int idteam = rs.getInt("IdTeam");
            int numTask = rs.getInt("NumTask");
            String type = rs.getString("Type");
            Staff  staff = new Staff(id,name,address,phone,sex,idteam,numTask,type);
            StaffList.add(staff);
        }
        System.out.println("---------storeListStaff:------------");
        return StaffList;
    }

    public static Account storeUpdateInfoAccount(Connection conn, String userName, String oldPassWord, String newPassWord) throws  SQLException{
        String sql = "EXEC SP_storeUpdateInfoAccount ?,?,? ";
        String sql2 = "EXEC dbo.SP_InforUser @username=?;";
        PreparedStatement pstm2 = conn.prepareStatement(sql2);
        pstm2.setString(1,userName);
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,userName);
        pstm.setString(3,oldPassWord);
        pstm.setString(2,newPassWord);
        pstm.executeUpdate();
        ResultSet rs = pstm2.executeQuery();
        Account Account1 = new Account();
        if(rs.next() && rs.getRow()>0){

            String email = rs.getString("Email");
            Account1.setEmail(email);
            Account1.setUserName(userName);
            Account1.setPassWord(newPassWord);
            return Account1;

        }
        return Account1;

    }

    public static void storaddStaff(Connection conn, Staff st) throws SQLException {
        String sql ="EXEC SP_addStaff ?,?,?,?,?,?,?,?,?,?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,st.getName());
        java.sql.Date sqlDate = new java.sql.Date(st.getDateOfBirth().getTime());
        pstm.setDate(2, sqlDate);
        pstm.setString(3,st.getAddress());
        pstm.setString(4,st.getSex());
        pstm.setString(5,st.getPhone());
        pstm.setString(6,st.getEmail());
        pstm.setString(7,st.getUserName());
        pstm.setString(8,st.getPassword());
        pstm.setInt(9,st.getIdTeam());
        pstm.setString(10,st.getType());
        pstm.executeUpdate();

    }

    public static void storedeleteTeam(Connection conn, int idTeam, int status) throws SQLException {
        String sql ="EXEC SP_DeleteTeam ?,?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,idTeam);
        pstm.setInt(2,status);
        pstm.executeUpdate();
    }

    public static Team storeInfoTeam(Connection conn, int idTeam)  throws SQLException {
        String sql = "EXEC SP_storeInfoTeam ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,idTeam);
        ResultSet rs = pstm.executeQuery();
        Team team = new Team();
        if(rs.next() && rs.getRow()>0){
            int id = rs.getInt("Id");
            String name = rs.getString("Name");
            String address = rs.getString("Address");
            String phone = rs.getString("Phone") ;
            String email = rs.getString("Email");
            int idAdmin = rs.getInt("IdAmin");
            String admin = rs.getString("Admin");

            team.setId(id);
            team.setName(name);
            team.setPhone(phone);
            team.setEmail(email);
            team.setAddress(address);
            team.setIdAdmin(idAdmin);
            team.setAdmin(admin);
            return team;
        }
        return team;
    }

    public static void storeCheckTask(Connection conn, int idtask,int status) throws SQLException {
        String sql ="EXEC SP_checkTask ?,?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,idtask);
        pstm.setInt(2,status);
        pstm.executeUpdate();
    }
    public static void storeaddTeam(Connection conn, Team team) throws SQLException {
        String sql ="EXEC SP_addTeam ?,?,?,?,?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,team.getName());
        pstm.setString(2,team.getAddress());
        pstm.setString(3,team.getPhone());
        pstm.setString(4,team.getEmail());
        pstm.setInt(5,team.getIdAdmin());
        pstm.executeUpdate();
    }

    public static void storedeleteTask(Connection conn, int idTask) throws SQLException{
        String sql ="EXEC SP_DeleteTask ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,idTask);
        pstm.executeUpdate();
    }

    public static List<Salary> storeMysalary(Connection conn, String userName) throws SQLException{
        String sql = "EXEC SP_storeMysalary ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,userName);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Salary> mysalary = new ArrayList<Salary>();
        if(rs.next() && rs.getRow()>0){
            int Month = rs.getInt("Month");
            int Year = rs.getInt("SYear");
            String name = rs.getString("Name");
            float fixSalary = rs.getFloat("FixedSalary");
            float bonus = rs.getFloat("Bonus");
            float salary = fixSalary+bonus;
            String teamName = rs.getString("Team");
            Salary Salary =new Salary(Month,Year,name,fixSalary,bonus,salary,teamName);
            mysalary.add(Salary);
        }
        return mysalary;
    }

    public static void checkSalaryMonth(Connection conn, int month, int year) throws SQLException{
        String sql ="EXEC SP_checkSalaryMonth ?,?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,month);
        pstm.setInt(2,year);
        pstm.executeUpdate();
    }

    public static void storeCheckSalaryYear(Connection conn, int yearI) throws SQLException{
        String sql ="EXEC SP_checkSalaryYearStaff ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,yearI);
        pstm.executeUpdate();
    }

    public static void storeupdateTeam(Connection conn, Team team) throws SQLException {
        String sql ="EXEC SP_updateTeam ?,?,?,?,?,?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,team.getId());
        pstm.setString(2,team.getName());
        pstm.setString(3,team.getAddress());
        pstm.setString(4,team.getPhone());
        pstm.setString(5,team.getEmail());
        pstm.setInt(6,team.getIdAdmin());
        pstm.executeUpdate();
    }
}
