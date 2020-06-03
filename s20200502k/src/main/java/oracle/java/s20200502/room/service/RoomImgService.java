package oracle.java.s20200502.room.service;

import java.util.List;

import oracle.java.s20200502.room.model.RoomImg;

public interface RoomImgService {

	int insert(List<String> pathList, int ro_num);

	List<RoomImg>  getRoomImg(int ro_num);

}
