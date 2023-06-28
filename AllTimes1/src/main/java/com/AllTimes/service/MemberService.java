package com.AllTimes.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.AllTimes.dao.ArticleDao;
import com.AllTimes.dao.MemberDao;
import com.AllTimes.dao.ReporterDao;
import com.AllTimes.dto.ArticleDto;
import com.AllTimes.dto.MemberDto;
import com.AllTimes.dto.ReporterDto;

@Service
public class MemberService {

	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private ArticleDao articleDao;

	
	private String savePath = "";

	
	/* 회원 로그인 */
	public ModelAndView MemberLogin(String mid, String mpw) {
		
		mav = new ModelAndView();
		
		MemberDto MemberLogin = mdao.MemberLogin(mid,mpw);
		
		//아이디 비밀번호 확인
		if(MemberLogin != null) {
			//로그인성공
			System.out.println("로그인성공");
			//세션에 로그인 정보 저장
			session.setAttribute("loginMid", MemberLogin.getMid());
			session.setAttribute("loginMname", MemberLogin.getMname());
			
			/*footer*/
			ArrayList<ArticleDto> ArticleHits = articleDao.selectMainArticleHits();
			ArrayList<ArticleDto> ArticleLatestFooter = articleDao.selectArticleLatestFooter();
			mav.addObject("ArticleHits", ArticleHits);
			mav.addObject("ArticleLatestFooter", ArticleLatestFooter);
			
			mav.setViewName("redirect:/");
		} else {
			// 로그인 실패
			System.out.println("로그인실패");
			
			/*footer*/
			ArrayList<ArticleDto> ArticleHits = articleDao.selectMainArticleHits();
			ArrayList<ArticleDto> ArticleLatestFooter = articleDao.selectArticleLatestFooter();
			mav.addObject("ArticleHits", ArticleHits);
			mav.addObject("ArticleLatestFooter", ArticleLatestFooter);
			
			mav.setViewName("redirect:/MemberLoginForm");
		}
		
		return mav;
	}
	
	
	/* 기자 로그인 */
	public ModelAndView ReporterLogin(String rid, String rpw) {
		
		mav = new ModelAndView();
		
		ReporterDto ReporterLogin = mdao.ReporterLogin(rid,rpw);
		
		//아이디 비밀번호 확인
		if(ReporterLogin != null) {
			//로그인성공
			System.out.println("로그인성공");
			//세션에 로그인 정보 저장
			session.setAttribute("loginRid", ReporterLogin.getRid());
			session.setAttribute("loginRname", ReporterLogin.getRname());
			session.setAttribute("loginRprofile", ReporterLogin.getRprofile());
			
			/*footer*/
			ArrayList<ArticleDto> ArticleHits = articleDao.selectMainArticleHits();
			ArrayList<ArticleDto> ArticleLatestFooter = articleDao.selectArticleLatestFooter();
			mav.addObject("ArticleHits", ArticleHits);
			mav.addObject("ArticleLatestFooter", ArticleLatestFooter);
			
			mav.setViewName("redirect:/");
		} else {
			// 로그인 실패
			System.out.println("로그인실패");
			
			/*footer*/
			ArrayList<ArticleDto> ArticleHits = articleDao.selectMainArticleHits();
			ArrayList<ArticleDto> ArticleLatestFooter = articleDao.selectArticleLatestFooter();
			mav.addObject("ArticleHits", ArticleHits);
			mav.addObject("ArticleLatestFooter", ArticleLatestFooter);
			
			mav.setViewName("redirect:/MemberLoginForm");
		}
		
		return mav;
	}

	/* 로그아웃 */
	public ModelAndView MemberLogout() {
		
		mav = new ModelAndView();
		
		session.invalidate();
		
		mav.setViewName("redirect:/");
		
		return mav;
	}

	public ModelAndView MemberModify(MemberDto member, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("MemberService.MemberModify()");
		mav = new ModelAndView();
		int memberModify = mdao.updateMember(member); 
		
		mav.setViewName("redirect:/MemberModifyForm?mid="+member.getMid());
		return mav;
	}
	/*회원 정보 조회*/
	public ModelAndView MemberModifyForm(String mid) {
		System.out.println("MemberService.MemberModifyForm");
		mav = new ModelAndView();
		
		MemberDto MemberModify = mdao.selectMemberModifyForm(mid);
		
		mav.addObject("memberModify", MemberModify);
		mav.setViewName("member/MemberModifyForm");
		return mav;
	}



	public ModelAndView adminLogin() {
		System.out.println("MemberService.AdminLogin()");
		mav = new ModelAndView();
		mav.setViewName("redirect:/Admin_Home");
		session.setAttribute("loginRid", "Admin");
		
		return mav;
	}


	
}
