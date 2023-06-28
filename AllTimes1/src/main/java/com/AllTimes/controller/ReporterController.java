package com.AllTimes.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.AllTimes.service.ReporterService;
import com.AllTimes.dto.ArticleDto;
import com.AllTimes.dto.ReporterDto;

	@Controller
	public class ReporterController {

		private ModelAndView mav;
		
		@Autowired
		private ReporterService reSvc;
		
		@RequestMapping(value = "/ReporterWriteForm")
		public ModelAndView ReporterWriteForm (){
			System.out.println("/reporterWriteForm 기사작성 페이지 이동");		
			
			mav = reSvc.reporterWriteForm();
			
			return mav;
			
		}
		@RequestMapping(value ="/ReporterWrite")
		public ModelAndView ReporterWrite (ArticleDto article, RedirectAttributes ra) throws IllegalStateException, IOException {
			System.out.println("/ReporterWrite 글작성");
			System.out.println("입력한 기사 정보: " + article);		
			mav = reSvc.reporterWrite(article,ra);
			return mav;
		}

		@RequestMapping(value = "/ReporterModifyForm")
		public ModelAndView ReporterModifyForm (String rid){
			System.out.println("/reporterModifyForm 내기사 관리 페이지 이동");
			mav = reSvc.reporterModifyForm(rid);
			return mav;
		}
		
		@RequestMapping(value ="/ReporterModify")
		public ModelAndView ReporterModify (ReporterDto rid, RedirectAttributes ra) throws IllegalStateException, IOException {
			System.out.println("/ReporterModify 내 기사 관리");
			mav = reSvc.reporterModify(rid,ra);
			return mav;
		}
		@RequestMapping(value ="/ReporterInfo")
		public ModelAndView ReporterInfo(String rid) {
			System.out.println("/ReporterInfo 기자 정보");
			mav = reSvc.ReporterInfo(rid);
			
			return mav;
		}
		
		
		@RequestMapping(value = "/ReporterArticleManagement")
		public ModelAndView ReporterArticleManagement (String rid){
			System.out.println("/ReporterArticleManagement 내 기사 관리");
			
			
			mav = reSvc.ReporterArticleManagement(rid);
			
			return mav;
		}
		
		@RequestMapping(value="ReporterLoginForm")
		public String ReportLoginForm() {
			System.out.println("/ReporterLoginForm 로그인 페이지 이동");
		
			
			return "Reporter/ReporterLoginForm";
		}
		
}
