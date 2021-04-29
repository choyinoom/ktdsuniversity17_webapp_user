package com.ktdsuniversity.edu.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.board.service.BoardService;
import com.ktdsuniversity.edu.board.vo.ArticleVO;


@Controller
public class FileDownloadController {
	private static final String ARTICLE_FILE_REPO = "C:\\Users\\lho16\\git workspace\\uni17_admin\\src\\main\\webapp\\resources\\articleFile";
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;
	
	@RequestMapping("/download.do") 
	protected void download(@RequestParam("imageFileName") String imageFileName,	//?��미�? ?��?��?���? ?��?��
							@RequestParam("articleNO") String articleNO,
			                 HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_FILE_REPO + "\\" +articleNO+"\\"+ imageFileName;	//?��?�� 경로 ?��?��
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("fileDown.do")
	   public ModelAndView filedown(HttpServletRequest request, String filename) throws Exception {
		
		  String articleId = request.getParameter("articleId");
		  System.out.println(articleId);
	      System.out.println("filename :: " + filename);
	      String path = ARTICLE_FILE_REPO +  "\\" + articleId + "\\";
	      
	      HashMap map = new HashMap();
	      map.put("path", path); 
	      
	   
	      return new ModelAndView("downloadView", map); 

	   }

}


