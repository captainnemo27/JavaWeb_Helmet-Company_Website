package beans;

import utils.UtilsDB;

public class Salary extends UtilsDB {
    private int month;
    private int year;
    private float fixsalary;
    private float bonus;
    private float salary;
    private  int idStaff;
    private String name;
    private String teamName;

    public Salary(int month, int year,String name, float fixSalary, float bonus, float salary, String teamName) {
        this.month=month;
        this.year=year;
        this.name=name;
        this.fixsalary=fixSalary;
        this.bonus=bonus;
        this.salary=salary;
        this.teamName=teamName;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getMonth() {
        return month;
    }

    public void setBonus(float bonus) {
        this.bonus = bonus;
    }

    public float getBonus() {
        return bonus;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public float getFixsalary() {
        return fixsalary;
    }

    public void setFixsalary(float fixsalary) {
        this.fixsalary = fixsalary;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public int getIdStaff() {
        return idStaff;
    }

    public void setIdStaff(int idStaff) {
        this.idStaff = idStaff;
    }
}
