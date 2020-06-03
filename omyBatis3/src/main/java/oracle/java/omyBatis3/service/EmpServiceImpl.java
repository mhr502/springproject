package oracle.java.omyBatis3.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.omyBatis3.dao.DeptDao;
import oracle.java.omyBatis3.dao.EmpDao;
import oracle.java.omyBatis3.dao.Member1Dao;
import oracle.java.omyBatis3.model.Dept;
import oracle.java.omyBatis3.model.DeptVO;
import oracle.java.omyBatis3.model.Emp;
import oracle.java.omyBatis3.model.EmpDept;
import oracle.java.omyBatis3.model.Member1;

@Service
public class EmpServiceImpl implements EmpService {
	
	@Autowired
	private EmpDao ed;
	@Autowired
	private DeptDao dd;
	@Autowired
	private Member1Dao md;
	
	@Override
	public List<Emp> list(Emp emp) {
		
		return ed.list(emp);
	}

	@Override
	public int total() {
		System.out.println("EmpServiceImpl list total...");
		
		return ed.total();
	}

	@Override
	public Emp detail(int empno) {
		System.out.println("EmpServiceImpl list detail empno->"+empno);
		return ed.detail(empno);
	}

	@Override
	public int update(Emp emp) {
		// TODO Auto-generated method stub
		System.out.println("EmpServiceImpl list update emp->"+emp);
		return ed.update(emp);
	}

	@Override
	public List<Emp> listManager() {
		System.out.println("EmpServiceImpl listManager...");

		return ed.listManager();
	}
	//dd->DeptDao
	@Override
	public List<Dept> select() {
		System.out.println("EmpServiceImpl select...");
		return dd.deptSelect();
	}

	@Override
	public int insert(Emp emp) {
		System.out.println("EmpServiceImpl insert...");
		return ed.insert(emp);
	}

	@Override
	public int delete(Emp emp) {
		System.out.println("EmpServiceImpl delete...");
		return ed.delete(emp);
	}

	@Override
	public List<EmpDept> listEmp(EmpDept empDept) {
		// TODO Auto-generated method stub
		return ed.listEmp(empDept);
	}

	@Override
	public String deptName(int deptNo) {
		// TODO Auto-generated method stub
		return ed.deptName(deptNo);
	}

	@Override
	public void insertDept(DeptVO deptVO) {
		// TODO Auto-generated method stub
		dd.insertDept(deptVO);
	}

	@Override
	public void SelListDept(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dd.SelListDept(map);
	}

	@Override
	public List<Member1> listMem(Member1 member1) {
		// TODO Auto-generated method stub
		System.out.println("EmpServiceImpl listMem");
		return md.listMem(member1);
	}

	@Override
	public int memCount(String id) {
		// TODO Auto-generated method stub
		System.out.println("EmpServiceImpl memCount id->"+id);
		return md.memCount(id);
	}


}
