package com.AllTimes.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.AllTimes.dto.MemberDto;
import com.AllTimes.dto.ReporterDto;

public interface MemberDao {

	//@Select("SELECT * FROM MEMBER WHERE MID = #{mid} AND MPW = #{mpw}")
	MemberDto MemberLogin(@Param("mid")String mid, @Param("mpw")String mpw);

	ReporterDto ReporterLogin(@Param("rid")String rid, @Param("rpw")String rpw);

	MemberDto selectMemberModifyForm(String mid);
	
	int updateMember(MemberDto member);

	
	

}
