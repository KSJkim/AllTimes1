package com.AllTimes.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.AllTimes.dao.ArticleDao;
import com.AllTimes.dto.ArticleDto;
import com.AllTimes.dto.CommentsDto;
import com.google.gson.Gson;



@Service
public class ArticleService {



	private ModelAndView mav;
	
	@Autowired
	private ArticleDao artDao;
	
	private String savePath 
	= "";
	
	/*---------- 기사 정보 관련 ----------*/
	public ModelAndView selectArticleList(String ar_genre) {
		System.out.println("ArticleService.articleList()");
		mav = new ModelAndView();
		
		int articleCount = artDao.selectArticleCount(ar_genre);
		mav.addObject("articleCount",articleCount);
		
		ArrayList<ArticleDto> articleList= artDao.selectArticleList(ar_genre);
		mav.addObject("articleList", articleList);
		
		System.out.println(articleCount);
		System.out.println(articleList);
		
		switch(ar_genre) {
			case "POLITICS" : mav.setViewName("article/POLITICS_PAGE");break;
			case "ECONOMY" : mav.setViewName("article/ECONOMY_PAGE");break;
			case "SOCIETY" : mav.setViewName("article/SOCIETY_PAGE");break;
			case "CULTURE" : mav.setViewName("article/CULTURE_PAGE");break;
			case "SPORT" : mav.setViewName("article/SPORT_PAGE");break;
			case "INTERNATIONAL" : mav.setViewName("article/INTERNATIONAL_PAGE");break;
			case "SCIENCE" : mav.setViewName("article/SCIENCE_PAGE");break;
			case "COVID" : mav.setViewName("article/COVIE_PAGE");break;
		}
		return mav;
		
	}

	public ModelAndView articleRead(int ar_no, String ar_genre) {
		System.out.println("ArticleService.articleRead()");
		mav = new ModelAndView();
		
		artDao.updateArticleHits(ar_no);
		int articleHits = artDao.selectArticleHits(ar_no);
		
		ArticleDto articleRead = artDao.selectArticleRead(ar_no);
		System.out.println(articleRead);
		
		ArrayList<CommentsDto> commentsList = artDao.selectCommentsList(ar_no);
		System.out.println(commentsList);
		
		int commentsCount = artDao.selectCommentsCount(ar_no);
		
		mav.addObject("articleRead", articleRead);
		mav.addObject("commentsList",commentsList);
		mav.addObject("commentsCount",commentsCount);
		
		switch(ar_genre) {
			case "POLITICS" : mav.setViewName("article/POLITICS_ARTICLE");break;
			case "ECONOMY" : mav.setViewName("article/ECONOMY_ARTICLE");break;
			case "SOCIETY" : mav.setViewName("article/SOCIETY_ARTICLE");break;
			case "CULTURE" : mav.setViewName("article/CULTURE_ARTICLE");break;
			case "SPORT" : mav.setViewName("article/SPORT_ARTICLE");break;
			case "INTERNATIONAL" : mav.setViewName("article/INTERNATIONAL_ARTICLE");break;
			case "SCIENCE" : mav.setViewName("article/SCIENCE_ARTICLE");break;
			case "COVID" : mav.setViewName("article/COVIE_ARTICLE");break;
		}
		return mav;
	}

	public ModelAndView commentsWrite(CommentsDto comment, RedirectAttributes ra) {
		System.out.println("ArticleService.commentsWrite()");
		mav = new ModelAndView();
		
		//input the comment
		int cm_no = artDao.selectCommentsNumber();//return cm_no
		comment.setCm_no(cm_no);
		//comment write
		int commentsInsert = artDao.insertCommentsWrite(comment);

		return mav;
	}
	/*---------- 기사 정보 관련 끝 ----------*/
	
	/*---------- 메인페이지 기사 관련 ----------*/
	/* 기사 제목 검색 service*/
	public ModelAndView SearchArticle(String SearchArticle) {
		
		mav = new ModelAndView();
		
		ArrayList<ArticleDto> SearchArt = artDao.selectSearchArticle(SearchArticle);
		
		System.out.println(SearchArt);

		
		mav.addObject("SearchArt", SearchArt);
		
		/*footer*/
		ArrayList<ArticleDto> ArticleHits = artDao.selectMainArticleHits();
		ArrayList<ArticleDto> ArticleLatestFooter = artDao.selectArticleLatestFooter();
		mav.addObject("ArticleHits", ArticleHits);
		mav.addObject("ArticleLatestFooter", ArticleLatestFooter);
		
		mav.setViewName("article/SearchArticle");
		
		return mav;
	}

	
	/* 기사 전체 목록 service*/
	public ModelAndView ArticleList() {
		
		mav = new ModelAndView();
		
		ArrayList<ArticleDto> ArticleList = artDao.selectAllArticleList();
		System.out.println(ArticleList);
		mav.addObject("ArticleList", ArticleList);
		
		/*footer*/
		ArrayList<ArticleDto> ArticleHits = artDao.selectMainArticleHits();
		ArrayList<ArticleDto> ArticleLatestFooter = artDao.selectArticleLatestFooter();
		mav.addObject("ArticleHits", ArticleHits);
		mav.addObject("ArticleLatestFooter", ArticleLatestFooter);
		
		mav.setViewName("home");
		
		return mav;
	}
	

	/* 기사 정보 페이지 service */
	public ModelAndView ArticleInfo(String ar_no) {
		
		mav = new ModelAndView();
		
		ArticleDto ArticleInfo = artDao.selectArticleInfo(ar_no);
		System.out.println(ArticleInfo);
		
		mav.addObject("ArticleInfo", ArticleInfo);
		
		/*footer*/
		ArrayList<ArticleDto> ArticleHits = artDao.selectMainArticleHits();
		ArrayList<ArticleDto> ArticleLatestFooter = artDao.selectArticleLatestFooter();
		mav.addObject("ArticleHits", ArticleHits);
		mav.addObject("ArticleLatestFooter", ArticleLatestFooter);
		
		mav.setViewName("article/ArticleInfo");
		
		return mav;
	}
	/*---------- 메인페이지 기사 관련 끝----------*/
	/*기사 수정 페이지 Service*/
	public ModelAndView ArticleModify(int ar_no) {
		mav = new ModelAndView();
		ArticleDto ArticleModify = artDao.selectArticleModify(ar_no);
		System.out.println(ArticleModify);
		mav.addObject("ArticleModify", ArticleModify);
		mav.setViewName("article/ArticleModify");

		return mav;
	}
	
	public ModelAndView ArticleModifyRequest(ArticleDto article, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("/ArticleService.ArticleModify()");
		mav = new ModelAndView();
		
		//첨부파일
		MultipartFile AR_FILE = article.getAr_file();
		String AR_FILENAME = "";
		
		if(!AR_FILE.isEmpty()) {
			AR_FILENAME = AR_FILE.getOriginalFilename();
			//파일명을 추출하는 부분
			UUID uuid = UUID.randomUUID();
			//중복방지를 위한 임의의 파일명
			AR_FILENAME = uuid.toString()+"_"+AR_FILENAME;
			//임의의 파일명 + 파일명을 합쳐서 파일명 재정의
			System.out.println("첨부파일명 : " + AR_FILENAME);
			System.out.println("실행여부확인1");
			AR_FILE.transferTo( new File(savePath, AR_FILENAME) );
			System.out.println("실행여부확인2");
			//아무 내용도 없이 이름만있는(AR_FILENAME)에다가 웹에서 올린파일을 덮어쓰기
		}
		article.setAr_img(AR_FILENAME);
		System.out.println("실행여부확인3");
		
		//updatet문 수행
		int ArticleModify = artDao.ArticleModifyRequest(article);
		System.out.println("실행여부확인4");
		System.out.println("ArticleModifyRequest : "  +ArticleModify);
	
		ra.addFlashAttribute("msg", article.getAr_no()+"번 글이 수정 되었습니다.");
		System.out.println("실행여부확인5");
		
		mav.setViewName("redirect:/ArticleModify?ar_no="+article.getAr_no());
		
		return mav;
	}


	
	

public ModelAndView ArticleDelete(int ar_no, String rid, RedirectAttributes ra) {
		System.out.println("ArticleService.ArticleDelete()");
		mav = new ModelAndView();
		//작성한 글 삭제
		//첨부파일 확인
		System.out.println("삭제여부확인1");
		ArrayList<String> ar_FileList = artDao.Articleselect(ar_no);
		System.out.println(ar_FileList);
		System.out.println("삭제여부확인2");
		/*
		for(int i = 0; i < ar_FileList.size();i++) {
			if(ar_FileList.get(i) != null) {
				File file = new File(savePath,ar_FileList.get(i));
				file.delete();
		
			}
		}
		 */
		
		int ArticleDelete = artDao.ArticleDelete(ar_no);
		System.out.println("삭제여부확인3");
	
		//삭제 후 글목록
		mav.setViewName("redirect:/ReporterArticleManagement?rid="+rid);
		System.out.println("삭제여부확인4");
		
		return mav;
}

}
