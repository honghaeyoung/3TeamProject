package springboot.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import springboot.project.dto.RoomCommentDto;
import springboot.project.dto.RoomDto;
import springboot.project.dto.RoomFileDto;

@Mapper
public interface RoomDao {
	
	public int roomshareWrite(RoomDto dto);
	public int uploadimg(RoomFileDto dto);
	public int roomcount();
	public List<RoomDto> roomList(Map<String, Object> map);
	public List<RoomFileDto> roomdata(int roomno);
	public RoomDto roomdetail(int roomno);
	public int countingRoom(int roomno);
	public int quitRoomshare(int roomno);
	public int deleteRoomshare(int roomno);
	public int updateRoomshare(RoomDto dto);
	public int deleteRoomFile(int roomno);
	public int updatefile(RoomFileDto dto);
	public List<RoomDto> roomSearch(Map<String,Object> map);
	public int countSearch (Map<String,Object> map);
	public List<RoomDto> roomListDate(Map<String, Object> map);
	public int rcommWrite(RoomCommentDto dto);
	public List<RoomCommentDto> rcommlist(int roomno);
	public int rcommdelete(int rsno);
	public RoomCommentDto commentOne(int rsno);
	public int rcommupdate(Map<String,Object> map);
	public List<RoomCommentDto> recommlist(int roomno);
}
