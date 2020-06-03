package oracle.java.s20200502.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200502.room.dao.RoomDao;
import oracle.java.s20200502.room.model.Room;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	private RoomDao rd;	


	@Override
	public int insert(Room room) {
		System.out.println("RoomServiceImpl insert Start...");
		return rd.insert(room);
	}

	@Override
	public int titleToNum(String ro_title) {
		System.out.println("RoomServiceImpl titleToNum Start...");
		return rd.titleToNum(ro_title);
	}

	@Override
	public List<Room> list(Room room) {
		// TODO Auto-generated method stub
		return rd.list(room);
	}
}
