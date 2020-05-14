package domain;

public class Emp {
    private Integer empId;
    private String empNo;
    private String empName;
    private int sex;
    private String deptName;
    private String position;
    private String birthday;
    private String tel;
    private String status;

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpNo() {
        return empNo;
    }

    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "empId=" + empId +
                ", empNo='" + empNo + '\'' +
                ", empName='" + empName + '\'' +
                ", sex=" + sex +
                ", deptName='" + deptName + '\'' +
                ", position='" + position + '\'' +
                ", birthday='" + birthday + '\'' +
                ", tel='" + tel + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
