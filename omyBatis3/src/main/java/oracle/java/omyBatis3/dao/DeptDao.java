package oracle.java.omyBatis3.dao;

import java.util.HashMap;
import java.util.List;

import oracle.java.omyBatis3.model.Dept;
import oracle.java.omyBatis3.model.DeptVO;

public interface DeptDao {

	List<Dept> deptSelect();


	void insertDept(DeptVO deptVO);   //Procedure VO
	void SelListDept(HashMap<String, Object> map); //Procedure Cursor
	
}
