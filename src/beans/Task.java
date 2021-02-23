package beans;


import java.sql.Timestamp;

public class Task {
    private int id;
    private String name;
    private String content;
    private int statusTask;
    private Timestamp timeFrom;
    private Timestamp timeEnd;
    private int idProject;
    private int status;
    private String nameStaff;
    private String nameProject;
    private int idStaff;

    public Task(int id, String name, String content, Timestamp timeFrom, Timestamp timeEnd, int idProject, int statusTask, int status) {
        this.id=id;
        this.name = name;
        this.content=content;
        this.timeFrom=timeFrom;
        this.timeEnd=timeEnd;
        this.idProject=idProject;
        this.status=status;
        this.statusTask=statusTask;
    }

    public Task(int id, String name, String content, int statusTask, Timestamp timeFrom, Timestamp timeEnd, int idProject, int status) {
        this.id=id;
        this.name = name;
        this.content=content;
        this.timeFrom=timeFrom;
        this.timeEnd=timeEnd;
        this.idProject=idProject;
        this.status=status;
        this.statusTask=statusTask;
    }

    public Task(int id, String name, String content, Timestamp timeFrom, Timestamp timeEnd, int status, int statusTask, String nameStaff, String nameProject) {
        this.id=id;
        this.name = name;
        this.content=content;
        this.timeFrom=timeFrom;
        this.timeEnd=timeEnd;
        this.status=status;
        this.statusTask=statusTask;
        this.nameStaff=nameStaff;
        this.nameProject=nameProject;
    }

    public Task(String name, String content, int idProject, int idStaff, Timestamp timeFrom, Timestamp timeEnd) {
        this.name = name;
        this.content=content;
        this.timeFrom=timeFrom;
        this.timeEnd=timeEnd;
        this.idProject=idProject;
        this.idStaff=idStaff;
    }

    public void setIdStaff(int idStaff) {
        this.idStaff = idStaff;
    }

    public int getIdStaff() {
        return idStaff;
    }

    public String getNameProject() {
        return nameProject;
    }

    public String getNameStaff() {
        return nameStaff;
    }

    public void setNameProject(String nameProject) {
        this.nameProject = nameProject;
    }

    public void setNameStaff(String nameStaff) {
        this.nameStaff = nameStaff;
    }

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStatusTask() {
        return statusTask;
    }

    public void setStatusTask(int statusTask) {
        this.statusTask = statusTask;
    }

    public Timestamp getTimeFrom() {
        return timeFrom;
    }

    public void setTimeFrom(Timestamp timeFrom) {
        this.timeFrom = timeFrom;
    }

    public Timestamp getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(Timestamp timeEnd) {
        this.timeEnd = timeEnd;
    }

    public int getIdProject() {
        return idProject;
    }

    public void setIdProject(int idProject) {
        this.idProject = idProject;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Task(int id, String name, String content, int status, Timestamp timeFrom, Timestamp timeEnd, int idProject) {
        this.id = id;
        this.name = name;
        this.content = content;
        this.status = status;
        this.timeFrom = timeFrom;
        this.timeEnd = timeEnd;
        this.idProject = idProject;
    }
}
