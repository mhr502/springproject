package oracle.java.omyBatis3.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.omyBatis3.model.Dept;
import oracle.java.omyBatis3.model.DeptVO;

@Repository // dao가 바뀜
public class DeptDaoImpl implements DeptDao {

	@Autowired
	private SqlSession session;

	public List<Dept> deptSelect() {
		return session.selectList("TKselectDept");
	}

	@Override
	public void insertDept(DeptVO deptVO) {
		session.selectOne("ProcDept", deptVO);
	}

	@Override
	public void SelListDept(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		session.selectList("ProcDeptList",map);
	}

}
