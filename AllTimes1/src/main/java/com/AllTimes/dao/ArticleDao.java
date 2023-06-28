package com.AllTimes.dao;

import java.util.ArrayList;

import com.AllTimes.dto.ArticleDto;
import com.AllTimes.dto.CommentsDto;
import com.AllTimes.dto.ReporterDto;

public interface ArticleDao {

	int selectArticleCount(String ar_genre);

	ArrayList<ArticleDto> selectArticleList(String ar_genre);

	void updateArticleHits(int ar_no);
	
	int selectArticleHits(int ar_no);
	
	ArticleDto selectArticleRead(int ar_no);
	
	int selectCommentsNumber();
	
	int insertCommentsWrite(CommentsDto comment);
	
	//void updateCommentsNumber(int ar_no); 사용되지 않음
	
	ArrayList<CommentsDto> selectCommentsList(int ar_no);

	int selectCommentsCount(int ar_no);

	
	ArrayList<ArticleDto> selectSearchArticle(String searchArticle);
	
	ArticleDto selectArticleInfo(String ar_no);

	ArrayList<ArticleDto> selectAllArticleList();

	ArrayList<ArticleDto> selectMainArticleHits();

	ArrayList<ArticleDto> selectRandomArticle();

	ArrayList<ArticleDto> selectArticleCovid();

	ArrayList<ArticleDto> selectArticlePolitics();

	ArrayList<ArticleDto> selectArticleSociety();

	ArrayList<ArticleDto> selectArticleCulture();

	ArrayList<ArticleDto> selectArticleEconomy();

	ArrayList<ArticleDto> selectArticleSports();

	ArrayList<ArticleDto> selectArticleInternational();

	ArrayList<ArticleDto> selectArticleLatest();
	
	ArrayList<ArticleDto> selectArticleLatestHits();

	ArrayList<ArticleDto> selectArticleLatestThumbsup();

	ArrayList<ArticleDto> selectArticleLatestFooter();


	int getArticleMaxNo();
	int insertArticle(ArticleDto article);
	
	ReporterDto ReporterModifyForm(String rid);
	ArrayList<ReporterDto> ReporterArticle(String rid);

	ArticleDto selectArticleModify(int ar_no);

	int ArticleModifyRequest(ArticleDto article);

	ArrayList<String> Articleselect(int ar_no);

	int ArticleDelete(int ar_no);

	int ReporterModify(ReporterDto rdto);
	



}
