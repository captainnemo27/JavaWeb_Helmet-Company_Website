package beans;

import utils.UtilsDB;

import java.sql.Timestamp;

public class Project extends UtilsDB {
    private int id;
    private String name;
    private String content;
    private String statusProject;
    private Timestamp timeFrom;
    private Timestamp timeEnd;
    private int idTeam;
    private  int status;

    public Project(int id, String name, String content, String statusProject, Timestamp timeFrom, Timestamp timeEnd, int idTeam, int status) {
        this.id=id;
        this.name=name;
        this.content=content;
        this.statusProject=statusProject;
        this.timeFrom=timeFrom;
        this.timeEnd=timeEnd;
        this.idTeam=idTeam;
        this.status=status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public String getStatusProject() {
        return statusProject;
    }

    public void setStatusProject(String statusProject) {
        this.statusProject = statusProject;
    }

    public void setTimeFrom(Timestamp timeFrom) {
        this.timeFrom = timeFrom;
    }

    public Timestamp getTimeFrom() {
        return timeFrom;
    }

    public Timestamp getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(Timestamp timeEnd) {
        this.timeEnd = timeEnd;
    }

    public int getIdTeam() {
        return idTeam;
    }

    public void setIdTeam(int idTeam) {
        this.idTeam = idTeam;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
