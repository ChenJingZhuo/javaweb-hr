package domain;

public class Dept {
	private Integer deptId;
	private String deptNo;
	private String deptName;
	private int enabled;

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "Dept [deptId=" + deptId + ", deptNo=" + deptNo + ", deptName=" + deptName + ", enabled=" + enabled
				+ "]";
	}

}
