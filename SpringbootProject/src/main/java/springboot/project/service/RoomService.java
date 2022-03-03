package springboot.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springboot.project.dao.RoomDao;
import springboot.project.dto.RoomCommentDto;
import springboot.project.dto.RoomDto;
import springboot.project.dto.RoomFileDto;

@Service
public class RoomService {

	@Autowired
	RoomDao dao;
	
	public int roomshareWrite(RoomDto dto) {
		return dao.roomshareWrite(dto);
	}
	
	public int uploadimg(RoomFileDto dto) {
		return dao.uploadimg(dto);
	}
	
	public int roomcount() {
		return dao.roomcount();
	}
	public List<RoomDto> roomList(int start, int end){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return dao.roomList(map);
	}
	
	public List<RoomFileDto> roomdata(int roomno){
		return dao.roomdata(roomno);
	}
	
	public RoomDto roomdetail(int roomno) {
		return dao.roomdetail(roomno);
	}
	
	public int countingRoom(int roomno) {
		return dao.countingRoom(roomno);
	}
	
	public int quitRoomshare(int roomno) {
		return dao.quitRoomshare(roomno);
	}
	
	public int deleteRoomshare(int roomno) {
		return dao.deleteRoomshare(roomno);
	}
	public int updateRoomshare(RoomDto dto) {
		return dao.updateRoomshare(dto);
	}
	
	public int deleteRoomFile(int roomno) {
		return dao.deleteRoomFile(roomno);
	}
	
	public int updatefile(RoomFileDto dto) {
		return dao.updatefile(dto);
	}
	
	public List<RoomDto> roomSearch(String search, int searchn,int start,int end){
		Map map = new HashMap<String, Object>();
		map.put("search",search);
		map.put("searchn",searchn);
		map.put("start", start);
		map.put("end", end);
		return dao.roomSearch(map);
	}
	public int countSearch (String search, int searchn) {
		Map map = new HashMap<String, Object>();
		map.put("search",search);
		map.put("searchn",searchn);
		return dao.countSearch(map);
	}
	
	public List<RoomDto> roomListDate(int start, int end){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return dao.roomList(map);
	}
	
	public int rcommWrite(RoomCommentDto dto) {
		return dao.rcommWrite(dto);
	}
	
	public List<RoomCommentDto> rcommlist(int roomno){
		return dao.rcommlist(roomno);
	}
	public int rcommdelete(int rsno) {
		return dao.rcommdelete(rsno);
	}
	
	public RoomCommentDto commentOne(int rsno) {
		return dao.commentOne(rsno);
	}
	
	public int rcommupdate(String rscontent, int rsno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("rscontent", rscontent);
		map.put("rsno", rsno);
		return dao.rcommupdate(map);
	}
	
	public List<RoomCommentDto> recommlist(int roomno){
		return dao.recommlist(roomno);
	}
	
	public List<RoomDto> mainRomm(){
		return dao.mainRomm();
	}
	
	
}
