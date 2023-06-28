package com.AllTimes.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.AllTimes.dto.ArticleDto;
import com.AllTimes.dto.MemberDto;
import com.AllTimes.dto.ReporterDto;
import com.AllTimes.paging.Criteria;
import com.AllTimes.service.AdminService;

@Controller
public class AdminController {
	
	private ModelAndView mav;
	@Autowired
	private AdminService AdminSvc;
	
	@RequestMapping(value = "/Admin_Home")
	public ModelAndView Admin_Home() {
		System.out.println("/Admin_Home 관리자 홈페이지로");
		mav = AdminSvc.Admin_Home();
		
		return mav;
	}
	
	/*---------회원 계정 관리--------*/
	@RequestMapping(value ="/Admin_MemberManagement")
	public ModelAndView Admin_MemberManagement(Criteria cri) {
		
		System.out.println("/Admin_MemberManagement 회윈관리 페이지 이동");
		mav = AdminSvc.Admin_MemberManagement(cri);
		
		return mav;
	}

	@RequestMapping(value="/Admin_MemberModifyPage")
	public ModelAndView Admin_MemberModifyPage(String mid) {
		System.out.println("/Admin_MemberManagement 회윈 상세정보 페이지 이동");
		System.out.println(mid+"님의 정보");
		
		mav = AdminSvc.Admin_MemberModifyPage(mid);
				
		return mav;
	}
	@RequestMapping(value="/Admin_MemberModify")
	public ModelAndView Admin_MemberModify(MemberDto memberInfo, RedirectAttributes ra) {
		System.out.println("Admin_MemberModify 회원 정보 수정 요청");
		System.out.println(memberInfo);
		
		mav = AdminSvc.Admin_MemberModify(memberInfo, ra);
		
		return mav;
	}
	
	@RequestMapping(value="/memberTelCheck")
	public @ResponseBody String memberTelCheck(String inputContact) {
		
		String telCheckResult = AdminSvc.memberTelCheck(inputContact);
		
		return telCheckResult;
	}
	
	/*---------회원 계정 관리 끝--------*/
	/*---------기자 계정 관리--------*/
	@RequestMapping(value="/Admin_ReporterManagement")
	public ModelAndView Admin_ReporterManagement(Criteria cri){
		System.out.println("/Admin_ReporterManagement 기자관리 페이지 이동");
		
		mav = AdminSvc.Admin_ReporterManagement(cri);
		
		return mav;
		
	}
	
	@RequestMapping(value="/Admin_ReporterModifyPage")
	public ModelAndView Admin_ReporterModifyPage(String rid) {
		System.out.println("/Admin_ReporterModifyPage 기자 상세정보 페이지 이동");
		System.out.println(rid+"님의 정보");
		
		mav = AdminSvc.Admin_ReporterModifyPage(rid);
		
		return mav;
		
	}
	
	@RequestMapping(value="/Admin_ReporterModify")
	public ModelAndView Admin_ReporterModify(ReporterDto reporterInfo, RedirectAttributes ra){
		System.out.println("/Admin_ReporterModify 기자 정보수정 요청");
		
		mav = AdminSvc.Admin_ReporterModify(reporterInfo, ra);
		
		return mav;
	}
	
	@RequestMapping(value="/Admin_ReporterDelete")
	public ModelAndView Admin_ReporterDelete(String rid, RedirectAttributes ra) {
		System.out.println("/ReporterDelete 기자계정 삭제요청");
		System.out.println(rid);
		mav = AdminSvc.Admin_ReporterDelete(rid, ra);
		
		return mav;
	}
	
	@RequestMapping(value="/Admin_ReporterStateToggle")
	public ModelAndView Admin_ReporterStateToggle(String rid, int rstate) {
		System.out.println("/reporterStateToggle 기자 글 작성권한 변경");
		System.out.println("rid:"+rid+", rstate: "+rstate);
		mav = AdminSvc.Admin_ReporterStateToggle(rid, rstate);
		
		return mav;
	}
	
	@RequestMapping(value="/Admin_ReporterJoinPage")
	public String Admin_ReporterJoin() {
		System.out.println("/Admin_ReporterJoin 기자계정 추가 페이지 이동");
		
		return "Admin/Admin_ReporterJoinPage";
	}
	
	@RequestMapping(value="/Admin_ReporterJoin")
	public ModelAndView Admin_ReporterJoin(ReporterDto reporterForm, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("/Admin_ReporterJoin 기자계정 추가 요청");
		System.out.println(reporterForm);
		
		mav = AdminSvc.Admin_registReporter(reporterForm, ra);
		
		return mav;
	}
	
	@RequestMapping(value="/Admin_ReporterProfileChange")
	public ModelAndView Admin_ReporterProfileChange(ReporterDto Reporter) {
		System.out.println("/Admin_ReporterProfileChange 프로필 사진 변경");
		System.out.println("rid: "+Reporter.getRid());
		
		mav = AdminSvc.Admin_ReporterProfileChange(Reporter);
		
		return mav;
	}	
	
	@RequestMapping(value="/reporterIdCheck")
	public @ResponseBody String reporterIdCheck(String inputId) {
		
		String idCheckResult = AdminSvc.reporterIdCheck(inputId);
		
		return idCheckResult;
	}
	
	@RequestMapping(value="/reporterTelCheck")
	public @ResponseBody String reporterTelCheck(String inputContact) {
		
		String telCheckResult = AdminSvc.reporterTelCheck(inputContact);
		
		return telCheckResult;
	}
	/*---------기자 계정 관리 끝--------*/
	/*---------검색기능--------*/
	@RequestMapping(value="/reporterSearch")
	public @ResponseBody  ModelAndView reporterSearch(String keyword, String searchType, Criteria cri) {
		System.out.println("검색어: "+keyword + "검색 종류: "+ searchType);
		
		
		mav = AdminSvc.reporterSearch(keyword, searchType, cri);
		
		return mav;
	}

	@RequestMapping(value="/memberSearch")
	public @ResponseBody  ModelAndView memberSearch(String keyword, String searchType, Criteria cri) {
		System.out.println("검색어: "+keyword + "검색 종류: "+ searchType);
		
		
		mav = AdminSvc.memberSearch(keyword, searchType, cri);
		
		return mav;
	}
	/*---------검색기능 끝--------*/
	
	/*----------기사 관리 페이지 이동----------*/
	@RequestMapping(value = "/Admin_ArticleManagement")
	public ModelAndView Admin_ArticleManagement(String ar_genre, Criteria cri) {
		System.out.println("/articleManagement 기사 관리 페이지 이동");
		
		mav = AdminSvc.Admin_ArticleManagement(ar_genre, cri);
		
		return mav;
	}
	
	/*----------기사 수정 페이지 이동----------*/
	@RequestMapping(value = "/Admin_ArticleInfoPage")
	public ModelAndView Admin_ArticleInfoPage(int ar_no) {
		System.out.println("/Admin_ArticleInfoPage 기사 상세페이지 이동");
		
		mav = AdminSvc.Admin_ArticleInfoPage(ar_no);
		
		return mav;
	}
	/*---------기사 삭제----------*/
	@RequestMapping(value="/Admin_ArticleDelete")
	public ModelAndView Admin_ArticleDelete(int ar_no, RedirectAttributes ra) {
		System.out.println("/Admin_ArticleDelete 기사 삭제 요청");
		System.out.println("글 번호: "+ar_no);
		
		mav = AdminSvc.Admin_ArticleDelete(ar_no, ra);
		
		return mav;
		
	}
	@RequestMapping(value = "/articleSearch")
	public @ResponseBody ModelAndView articleSearch(String keyword, String searchType, Criteria cri) {
		System.out.println("검색어: "+keyword+" 검색 종류: "+ searchType);
		
		mav = AdminSvc.articleSearch(keyword, searchType, cri);
		
		return mav;
	}
	@RequestMapping(value = "/Admin_articleModifyPage")
	public ModelAndView Admin_articleModifyPage(int ar_no){
		System.out.println("/Admin_articleModifyPage 기사 수정 페이지 이동");
		mav = AdminSvc.Admin_articleModifyPage(ar_no);
		
		return mav;  
	}
	@RequestMapping(value = "/Admin_articleModify")
	public ModelAndView Admin_articleModify(ArticleDto article, RedirectAttributes ra) {
		System.out.println("/Admin_articleModify 기사 수정 요청");
		System.out.println(article.getAr_no()+"번 기사 수정");
		mav = AdminSvc.Admin_articleModify(article, ra);
		
		return mav;
	}
	
	@RequestMapping(value = "/Admin_articleImgChange")
	public ModelAndView Admin_articleImgChange(ArticleDto article) {
		System.out.println("/Admin_articleImgChange 기사 이미지 변경");
		mav = AdminSvc.Admin_articleImgChange(article);
		
		return mav;
	}
	
	@RequestMapping(value= "/Admin_commentDelete")
	public ModelAndView Admin_commentDelete(int ar_no, int cm_no, RedirectAttributes ra) {
		System.out.println("/Admin_commentDelete 관리자_댓글 삭제 요청");
		System.out.println("글번호: "+ar_no+" 댓글번호: "+cm_no);
		mav = AdminSvc.Admin_commentDelete(ar_no, cm_no, ra);
		
		return mav;
	}
	
}
