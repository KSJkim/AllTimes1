package com.AllTimes.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.AllTimes.dto.ArticleDto;
import com.AllTimes.dto.CommentsDto;
import com.AllTimes.dto.MemberDto;
import com.AllTimes.dto.ReporterDto;
import com.AllTimes.paging.Criteria;

@Mapper
public interface AdminDao {

	ArrayList<MemberDto> MemberList(Criteria cri);

	MemberDto MemberInfoSelect(String mid);

	int MemberModify(MemberDto memberInfo);

	String MemberPwGet(String mid);
	
	String memberTelCheck(String inputContact);

	ReporterDto ReporterInfo(String rid);

	String ReporterPwGet(String rid);
	
	int ReporterModify(ReporterDto reporterInfo);

	int reporterDelete(String rid);

	int stateToggle(@Param("rid") String rid, @Param("rstate") int rstate);

	int registReporter(ReporterDto reporterForm);

	String oldFileSelect(String rid);

	int profileChange(ReporterDto reporter);

	String reporterIdCheck(String inputId);

	String reporterTelCheck(String inputContact);
	
	ArrayList<ReporterDto> rSearchAll(@Param("keyword") String keyword, @Param("cri") Criteria cri);

	ArrayList<ReporterDto> rSearchName(@Param("keyword") String keyword, @Param("cri") Criteria cri);

	ArrayList<ReporterDto> rSearchId(@Param("keyword") String keyword, @Param("cri") Criteria cri);

	ArrayList<MemberDto> mSearchAll(@Param("keyword") String keyword, @Param("cri") Criteria cri);

	ArrayList<MemberDto> mSearchId(@Param("keyword") String keyword, @Param("cri") Criteria cri);

	ArrayList<MemberDto> mSearchName(@Param("keyword") String keyword, @Param("cri") Criteria cri);

	ArrayList<ReporterDto> reporterListPaging(Criteria cri);
	
	int getTotalAccountR();

	int getSearchAccountR(String keyword);

	int getTotalAccountM();
	
	int getSearchAccountM(String keyword);
	
	int getTotalArticle();

	int getSearchArticle(String ar_genre);

	List<ArticleDto> selectAllArticle();

	List<ArticleDto> selectArticleList(String ar_genre);

	ArticleDto selectArticleInfo(int ar_no);

	List<ArticleDto> aSearchName(@Param("keyword") String keyword, @Param("cri") Criteria cri);

	List<ArticleDto> aSearchTitle(@Param("keyword") String keyword, @Param("cri") Criteria cri);
	
	List<ArticleDto> aSearchAll(@Param("keyword") String keyword, @Param("cri") Criteria cri);

	int articleDelete(int ar_no);

	ArrayList<CommentsDto> selectComment(int ar_no);

	String Ar_oldFileSelect(int dtoAr_no);

	int Ar_imgChange(ArticleDto article);

	int articleModify(ArticleDto article);

	int Ar_commentAllDelete(int ar_no);

	int commentDelete(@Param("ar_no") int ar_no, @Param("cm_no") int cm_no);

}
