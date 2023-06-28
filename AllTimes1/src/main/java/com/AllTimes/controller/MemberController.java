package com.AllTimes.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.AllTimes.dao.ArticleDao;
import com.AllTimes.dto.ArticleDto;
import com.AllTimes.service.MemberService;
import com.AllTimes.dto.MemberDto;

@Controller
public class MemberController {
	
	private ModelAndView mav;
	
	@Autowired
	private MemberService memSvc;
	
	@Autowired
	private ArticleDao artDao;
	
	@RequestMapping(value = "/home")
	public String home() {
		System.out.println("/home 메인 페이지 이동");

		return "home";
	}
	
	/* 로그인 페이지 이동 */ 
	@RequestMapping(value = "/MemberLoginForm")
	public String MemberLoginForm( ) {
		System.out.println("/MemberLoginForm 로그인 페이지 이동");
		
		
		return "member/MemberLoginForm";
	}
	
	/* 회원가입 페이지 이동 */
	@RequestMapping(value = "/MemberJoinForm")
	public String MemberJoinForm( ) {
		System.out.println("/MemberJoinForm 회원가입 페이지 이동");
		

		
		return "member/MemberJoinForm";
	}
	
	/* 내정보보기 페이지 이동 */
	@RequestMapping(value = "/MemberModifyForm")
	public ModelAndView MemberModifyForm(String mid) {
		System.out.println("/MemberModifyForm 내정보보기 페이지 이동");
		
		mav = memSvc.MemberModifyForm(mid);
		
		return mav;
	}
	
	/* 회원 로그인 */
	@RequestMapping(value = "/MemberLogin")
	public ModelAndView MemberLogin(String mid, String mpw) {
		System.out.println("/MemberLogin 로그인 요청");
		System.out.println("아이디 : " + mid + " , 비밀번호 : " + mpw);
		
		mav = memSvc.MemberLogin(mid,mpw);
		
		return mav;
		
	}
	
	/* 기자 로그인 */
	@RequestMapping(value = "/ReporterLogin")
	public ModelAndView ReporterLogin(String rid, String rpw) {
		System.out.println("/ReporterLogin 로그인 요청");
		
		if(rid.equals("admin")&&rpw.equals("admin")) {
			mav = memSvc.adminLogin();
		}else {
		mav = memSvc.ReporterLogin(rid,rpw);
		}
		return mav;
		
	}
	
	/* 회원,기자 로그아웃 */
	@RequestMapping(value= "/MemberLogout")
	public ModelAndView memberLogut() {
		System.out.println("/memberLogut 로그아웃 요청");
		
		mav = memSvc.MemberLogout();
		
		return mav;
	}
	/* 회원 정보 수정 */
	@RequestMapping(value = "/MemberModify")
	public ModelAndView MemberModify(MemberDto member, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("/memberModify 정보수정 요청");
		System.out.println("수정할 회원 정보: " + member);
		
		mav = memSvc.MemberModify(member, ra);
		
		return mav;
	}
	

}
