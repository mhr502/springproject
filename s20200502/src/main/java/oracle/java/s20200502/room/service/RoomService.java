package oracle.java.s20200502.room.service;

import java.util.List;

import oracle.java.s20200502.room.model.Room;

public interface RoomService {

	int insert(Room room);

	int titleToNum(String ro_title);

	List<Room> list(Room room);
	
}
