package com.AllTimes.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.AllTimes.dao.ArticleDao;
import com.AllTimes.dto.ArticleDto;
import com.AllTimes.dto.CrawlingDto;
import com.AllTimes.dto.SnackCultureDto;
import com.AllTimes.dto.StockDto;
import com.AllTimes.service.ArticleService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ArticleDao articleDao;
	
	@Autowired
	private HttpServletRequest request;
	
	private ModelAndView mav;
	
	@Autowired
	private ArticleService articleSvc;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws IOException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws IOException {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		String rProfilePath = request.getSession().getServletContext().getRealPath("/");
		System.out.println(rProfilePath);
		
		
		/*  기사 전체 정보 */
		ArrayList<ArticleDto> ArticleList = articleDao.selectAllArticleList();
		
		System.out.println(ArticleList);
		model.addAttribute("ArticleList", ArticleList);
		
		
		/* 조회수 상위 5개 기사 */
		ArrayList<ArticleDto> ArticleHits = articleDao.selectMainArticleHits();
		
		System.out.println(ArticleHits);
		model.addAttribute("ArticleHits", ArticleHits);
		
		
		/* 코로나기사 상위 1개  */
		ArrayList<ArticleDto> ArticleCovid = articleDao.selectArticleCovid();
		
		System.out.println("코로나기사 : " + ArticleCovid);
		model.addAttribute("ArticleCovid", ArticleCovid);
		
		/* 정치기사 상위 1개  */
		ArrayList<ArticleDto> ArticlePolitics = articleDao.selectArticlePolitics();
		
		System.out.println("정치기사 : " + ArticlePolitics);
		model.addAttribute("ArticlePolitics", ArticlePolitics);
		
		/* 사회기사 상위 1개  */
		ArrayList<ArticleDto> ArticleSociety = articleDao.selectArticleSociety();
		
		System.out.println("사회기사 : " + ArticleSociety);
		model.addAttribute("ArticleSociety", ArticleSociety);
		
		/* 문화기사 상위 1개  */
		ArrayList<ArticleDto> ArticleCulture = articleDao.selectArticleCulture();
		
		System.out.println("문화기사 : " + ArticleCulture);
		model.addAttribute("ArticleCulture", ArticleCulture);
		
		/* 경제기사 상위 1개*/
		ArrayList<ArticleDto> ArticleEconomy = articleDao.selectArticleEconomy();
		
		System.out.println("경제기사 : " + ArticleEconomy);
		model.addAttribute("ArticleEconomy", ArticleEconomy);
		
		/* 스포츠기사 상위 1개*/
		ArrayList<ArticleDto> ArticleSports = articleDao.selectArticleSports();
		
		System.out.println("스포츠기사 : " + ArticleSports);
		model.addAttribute("ArticleSports", ArticleSports);
		
		/* 국제기사 상위 1개*/
		ArrayList<ArticleDto> ArticleInternational = articleDao.selectArticleInternational();
		
		System.out.println("국제기사 : " + ArticleInternational);
		model.addAttribute("ArticleInternational", ArticleInternational);
		
		/* 가장 최신 기사 3개*/
		ArrayList<ArticleDto> ArticleLatest = articleDao.selectArticleLatest();
		
		System.out.println("가장 최신 기사 : " + ArticleLatest);
		model.addAttribute("ArticleLatest", ArticleLatest);
		
		/* 가장 최신 기사 조회수 상위 1~3위 3개*/
		ArrayList<ArticleDto> ArticleLatestHits = articleDao.selectArticleLatestHits();
		
		System.out.println("최신 기사 조회수 상위 1~3위 : " + ArticleLatestHits);
		model.addAttribute("ArticleLatestHits", ArticleLatestHits);
		
		/* 가장 최신 기사 추천수 상위 1~3위 3개*/
		ArrayList<ArticleDto> ArticleLatestThumbsup = articleDao.selectArticleLatestThumbsup();
		
		System.out.println("최신 기사 추천수 상위 1~3위 : " + ArticleLatestThumbsup);
		model.addAttribute("ArticleLatestThumbsup", ArticleLatestThumbsup);
		
		/* FOOTER 가장 최신 기사 5개*/
		ArrayList<ArticleDto> ArticleLatestFooter = articleDao.selectArticleLatestFooter();
		
		System.out.println("가장 최신 기사 : " + ArticleLatestFooter);
		model.addAttribute("ArticleLatestFooter", ArticleLatestFooter);
		
		
		
		/* 크롤링 */
		/* 중앙일보 */
		String Jungurl = "https://www.joongang.co.kr/";
		System.out.println("중앙일보URL : " + Jungurl);
		
		Document Jungdoc = Jsoup.connect(Jungurl).get();
		
		//System.out.println(doc.toString());
		
		/* 중앙일보 헤드라인 기사 크롤링 */
		Elements Jungelement = Jungdoc.select("div.col_lg8");
		
		ArrayList<CrawlingDto> CrListJ = new ArrayList<CrawlingDto>();
		
		for(Element e: Jungelement.select("div.col_lg8"))
		{
			CrawlingDto JungCr = new CrawlingDto();
			
			String JungTitle = e.select("div.col_lg8 span.sm_hidden").text();
			System.out.println("기사제목 : " + JungTitle);
			JungCr.setCr_title(JungTitle);
			
			String JungDetail = e.select("div.col_lg8 p.description").text();
			System.out.println("기사내용 : " + JungDetail);
			JungCr.setCr_detail(JungDetail);
			
			String JungImg = e.select("div.col_lg8 img").attr("src");
			System.out.println("기사이미지 : " + JungImg);
			JungCr.setCr_img(JungImg);
			
			String JungLink = e.select("div.col_lg8 a").attr("href");
			System.out.println("기사URL : " + JungLink);
			JungCr.setCr_url(JungLink);
			
			CrListJ.add(JungCr);
		}
		
		System.out.println(CrListJ);
		
		request.setAttribute("CrListJ", CrListJ);
		
		System.out.println("");
		

		/* 동아일보 */
		String Dongurl = "https://www.donga.com/";
		System.out.println("동아일보URL : " + Dongurl);
		
		Document Dongdoc = Jsoup.connect(Dongurl).get();
		
		//System.out.println(doc.toString());
		
		/* 동아일보 헤드라인 기사 크롤링*/
		Elements Dongelement = Dongdoc.select("div.headline_box");
		//Elements Dongelement2 = Dongdoc.select("div.special_top");
		
		
		ArrayList<CrawlingDto> CrListD = new ArrayList<CrawlingDto>();
		
		for(Element e: Dongelement.select("div.headline_box"))
		{
			CrawlingDto DongCr = new CrawlingDto();
			
			//System.out.println(e);
			
			String DongTitle = e.select("div.headline_box div.head_title").text();
			System.out.println("기사제목 : " + DongTitle);
			DongCr.setCr_title(DongTitle);
			
			String DongDetail = e.select("div.headline_box p.desc").text();
			System.out.println("기사내용 : " + DongDetail);
			DongCr.setCr_detail(DongDetail);
			
			String DongImg = e.select("div.headline_box img").attr("src");
			System.out.println("기사이미지 : " + DongImg);
			DongCr.setCr_img(DongImg);
			
			String DongLink = e.select("div.headline_box  a").attr("href");
			System.out.println("기사URL : " + DongLink);
			DongCr.setCr_url(DongLink);
			
			CrListD.add(DongCr);
				
			}
		
		System.out.println(CrListD);
		
		request.setAttribute("CrListD", CrListD);
		
		System.out.println("");
		
			
		/* 한국일보 */
		String Hankukurl = "http://www.hankooki.com/";
		System.out.println("한국일보URL : " + Hankukurl);
		
		Document Hankukdoc = Jsoup.connect(Hankukurl).get();
		
		//System.out.println(doc.toString());
		
		/* 한국일보 헤드라인 기사 크롤링*/
		Elements Kyungelement = Hankukdoc.select("div.headline");
		
		ArrayList<CrawlingDto> CrListHankuk = new ArrayList<CrawlingDto>();
		
		for(Element e: Kyungelement.select("div.headline"))
		{
			CrawlingDto HankukCr = new CrawlingDto();
			
			String HankukTitle = e.select("div.headline div.htit").text();
			System.out.println("기사제목 : " + HankukTitle);
			HankukCr.setCr_title(HankukTitle);
			
			String HankukDetail = e.select("div.headline li.bun").text();
			System.out.println("기사내용 : " + HankukDetail);
			HankukCr.setCr_detail(HankukDetail);
			
			String HankukImg = e.select("div.headline img").attr("src");
			System.out.println("기사이미지 : " + HankukImg);
			HankukCr.setCr_img(HankukImg);
			
			String HankukLink = e.select("div.headline a").attr("href");
			System.out.println("기사URL : " + HankukLink);
			HankukCr.setCr_url(HankukLink);
			
			CrListHankuk.add(HankukCr);
			
		}
		
		System.out.println(CrListHankuk);
		
		request.setAttribute("CrListHankuk", CrListHankuk);
		
		System.out.println("");
		
		

		/* 한겨레신문 */
		String Hanurl = "https://hani.co.kr/";
		System.out.println("한겨례URL : " + Hanurl);
		
		Document Handoc = Jsoup.connect(Hanurl).get();
		
		//System.out.println(doc.toString());
		
		/* 한겨레신문 헤드라인 기사 크롤링*/
		Elements Hanelement = Handoc.select("div.main-top-article");
		
		ArrayList<CrawlingDto> CrListHan = new ArrayList<CrawlingDto>();
		
		for(Element e: Hanelement.select("div.main-top-article"))
		{
			CrawlingDto HanCr = new CrawlingDto();
			
			String HanTitle = e.select("div.main-top-article h4.article-title").text();
			System.out.println("기사제목 : " + HanTitle);
			HanCr.setCr_title(HanTitle);
			
			String HanDetail = e.select("div.main-top-article p.article-prologue").text();
			System.out.println("기사내용 : " + HanDetail);
			HanCr.setCr_detail(HanDetail);
			
			String HanImg = e.select("div.main-top-article img").attr("src");
			System.out.println("기사이미지 : " + HanImg);
			HanCr.setCr_img(HanImg);
			
			String HanLink = e.select("div.main-top-article a").attr("href");
			System.out.println("기사URL : https://hani.co.kr" + HanLink);
			HanCr.setCr_url("https://hani.co.kr"+HanLink);
			
			CrListHan.add(HanCr);
			
		}
		
		System.out.println(CrListHan);
		
		request.setAttribute("CrListHan", CrListHan);
		
		System.out.println("");
		
		
		/* 주식 크롤링 */
		/*코스피 크롤링 */
		String Kospiurl = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%A3%BC%EC%8B%9D";
		System.out.println("코스피URL : " + Kospiurl);
		
		Document Kospidoc = Jsoup.connect(Kospiurl).get();
		
		Elements Kospielement = Kospidoc.select("div.api_subject_bx");
	
		//System.out.println(Kospielement);
		
		ArrayList<StockDto> Kospi = new ArrayList<StockDto>();
		
		for(Element e: Kospielement.select("div.graph_lst_bx"))
		{
			//System.out.println(e);
			StockDto KospiCr = new StockDto();
			
			String StockName = e.select("li.csp dt span").text();
			System.out.println("주식이름 : " + StockName);
			KospiCr.setSt_name(StockName);
			
			String StockDate = e.select("li.csp dt em").text();
			System.out.println("주식날짜 : " + StockDate);
			KospiCr.setSt_date(StockDate);
			
			String StockIndex = e.select("li.csp dd strong").text();
			System.out.println("주식주가 : " + StockIndex);
			KospiCr.setSt_index(StockIndex);
			
			String StockUpdown = e.select("li.csp dd span.ico").text();
			System.out.println("주식상하 : " + StockUpdown);
			KospiCr.setSt_updown(StockUpdown);
			
			String StockPercent = e.select("li.csp dd em").text();
			System.out.println("주식상하 : " + StockPercent);
			KospiCr.setSt_percent(StockPercent);
			
			String StockImg = e.select("ul.lst img").attr("src");
			System.out.println("주식이미지 : " + StockImg);
			KospiCr.setSt_img(StockImg);
			
			String StockLink = e.select("ul.lst a").attr("href");
			System.out.println("주식URL : https://search.naver.com/search.naver" + StockLink);
			KospiCr.setSt_url("https://search.naver.com/search.naver" + StockLink);
			
			Kospi.add(KospiCr);
			
		}
		
		System.out.println(Kospi);
		
		request.setAttribute("Kospi", Kospi);
		
		System.out.println("");
		
		
		/*코스닥 크롤링 */
		String Kosdaqurl = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%A3%BC%EC%8B%9D";
		System.out.println("코스닥URL : " + Kosdaqurl);
		
		Document Kosdaqdoc = Jsoup.connect(Kosdaqurl).get();
		
		Elements Kosdaqelement = Kosdaqdoc.select("div.api_subject_bx");
	
		//System.out.println(Kospielement);
		
		ArrayList<StockDto> Kosdaq = new ArrayList<StockDto>();
		
		for(Element e: Kosdaqelement.select("div.graph_lst_bx"))
		{
			//System.out.println(e);
			StockDto KosdaqCr = new StockDto();
			
			String StockName = e.select("li.csd dt span").text();
			System.out.println("주식이름 : " + StockName);
			KosdaqCr.setSt_name(StockName);
			
			String StockDate = e.select("li.csd dt em").text();
			System.out.println("주식날짜 : " + StockDate);
			KosdaqCr.setSt_date(StockDate);
			
			String StockIndex = e.select("li.csd dd strong").text();
			System.out.println("주식주가 : " + StockIndex);
			KosdaqCr.setSt_index(StockIndex);
			
			String StockUpdown = e.select("li.csd dd span.ico").text();
			System.out.println("주식상하 : " + StockUpdown);
			KosdaqCr.setSt_updown(StockUpdown);
			
			String StockPercent = e.select("li.csd dd em").text();
			System.out.println("주식상하 : " + StockPercent);
			KosdaqCr.setSt_percent(StockPercent);
			
			String StockImg = e.select("ul.lst li.csd img").attr("src");
			System.out.println("주식이미지 : " + StockImg);
			KosdaqCr.setSt_img(StockImg);
			
			String StockLink = e.select("ul.lst li.csd a").attr("href");
			System.out.println("주식URL : https://search.naver.com/search.naver" + StockLink);
			KosdaqCr.setSt_url("https://search.naver.com/search.naver" + StockLink);
			
			Kosdaq.add(KosdaqCr);
			
		}
		
		System.out.println(Kosdaq);
		
		request.setAttribute("Kosdaq", Kosdaq);
		
		System.out.println("");
		
		
		/*스낵 컬쳐 1*/
		
		
		String Snack1 = "https://www.donga.com/";
		System.out.println("스낵1 URL : " + Snack1);
		
		Document Snackdoc = Jsoup.connect(Snack1).get();
		
		Elements Snackelement = Snackdoc.select("div.dlite_wrap");
		
		ArrayList<SnackCultureDto> SnackList = new ArrayList<SnackCultureDto>();
		
		for(Element e: Snackelement.select("div.dlite_wrap"))
		{
			
			SnackCultureDto Snack = new SnackCultureDto();
			
			//System.out.println(e);
			
			String SnackTitle = e.select("div.dlite_wrap ul li:first-child span.desc").text();
			System.out.println("스낵1 타이틀 : " + SnackTitle);
			Snack.setSn_title(SnackTitle);
			
			String SnackImg = e.select("div.dlite_wrap ul li img").attr("src");
			System.out.println("스낵1 이미지 : " + SnackImg);
			Snack.setSn_img(SnackImg);
			
			String SnackLink = e.select("div.dlite_wrap ul li a").attr("href");
			System.out.println("스낵1 URL : " + SnackLink);
			Snack.setSn_url(SnackLink);
			
			SnackList.add(Snack);  
		} 
		
		
		
		System.out.println(SnackList);
		
		request.setAttribute("SnackList", SnackList);
		
		System.out.println("");
		
		
		/*스낵 컬쳐 2*/
		String Snack2 = "https://www.donga.com/";
		System.out.println("스낵2 URL : " + Snack2);
		
		Document Snackdoc2 = Jsoup.connect(Snack2).get();
		
		Elements Snackelement2 = Snackdoc2.select("div.dlite_wrap");
		
		ArrayList<SnackCultureDto> SnackList2 = new ArrayList<SnackCultureDto>();
		
		for(Element e: Snackelement2.select("div.dlite_wrap"))
		{
			
			SnackCultureDto Snack = new SnackCultureDto();
			
			//System.out.println(e);
			
			String SnackTitle = e.select("div.dlite_wrap ul li:last-child span.desc").text();
			System.out.println("스낵2 타이틀 : " + SnackTitle);
			Snack.setSn_title(SnackTitle);
			
			String SnackImg = e.select("div.dlite_wrap ul li:last-child img").attr("src");
			System.out.println("스낵2 이미지 : " + SnackImg);
			Snack.setSn_img(SnackImg);
			
			String SnackLink = e.select("div.dlite_wrap ul li:last-child a").attr("href");
			System.out.println("스낵2 URL : " + SnackLink);
			Snack.setSn_url(SnackLink);
			
			SnackList2.add(Snack);
		}
		
		
		System.out.println(SnackList2);
		
		request.setAttribute("SnackList2", SnackList2);
		
		System.out.println(""); 
		
		
		
		
		
		model.addAttribute(formattedDate, formattedDate);
		
		return "home";
	}
	
}
