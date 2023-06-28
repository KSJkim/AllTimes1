package com.AllTimes.controller;

import java.io.IOException;
import java.util.List;
import java.util.Spliterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class PageController {
	@RequestMapping(value = "/home_WeatherPage")
	public String home_WeatherPage(Model model) throws IOException {
		System.out.println("날씨 상세정보 페이지");
		
		String weatherURL = "https://weather.naver.com/today/11177103";
		Document weatherDoc = Jsoup.connect(weatherURL).get();
		Elements currentEle = weatherDoc.select("strong.current");
		Elements locationnameEle = weatherDoc.select("strong.location_name");
		Elements weeklyWeatherEle = weatherDoc.select("div#weekly");
		
		System.out.println("온도: "+currentEle);
		System.out.println("도시: "+locationnameEle);
		System.out.println(weeklyWeatherEle);
		model.addAttribute("current", currentEle);
		model.addAttribute("location", locationnameEle);
		model.addAttribute("weekly", weeklyWeatherEle);
		return "/home_WeatherPage";
	}
}
