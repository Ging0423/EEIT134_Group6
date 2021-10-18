package proj.controller;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import proj.models.*;

@WebServlet("/proj/CreateCtoCItem.do")
@MultipartConfig(fileSizeThreshold = 1024 * 10, // 10 KB
		maxFileSize = 1024 * 1024 * 32, // 300 KB
		maxRequestSize = 1024 * 1024 * 16 // 1 MB
)
public class CreateCtoCItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 定義存放錯誤訊息的 Collection物件
		Collection<String> errorMessage = new ArrayList<String>();
		UserItemDao cd = new UserItemDao();
		request.setAttribute("ErrorMsg", errorMessage);

		// 設定輸入資料的編碼
		request.setCharacterEncoding("UTF-8");
		String itemId = cd.getItemId();
		String memberId = "test";
		// 讀取使用者所輸入，由瀏覽器送來的 name 欄位內的資料，注意大小寫
		String name = request.getParameter("name");
		// 檢查使用者所輸入的資料
		if (name == null || name.trim().length() == 0) {
			errorMessage.add("名稱必須輸入");
		}
		// 讀取使用者所輸入，由瀏覽器送來的 qty 欄位內的資料，注意大小寫
		int qty = Integer.parseInt(request.getParameter("qty"));
		// 檢查使用者所輸入的資料
		if (qty >= 1) {
			errorMessage.add("數量欄必須輸入");
		}
		// 讀取使用者所輸入，由瀏覽器送來的 price 欄位內的資料，注意大小寫
		int price = Integer.parseInt(request.getParameter("price"));
		// 檢查使用者所輸入的資料
		if (price >= 1) {
			errorMessage.add("數量欄必須輸入");
		}
		// 讀取使用者所輸入，由瀏覽器送來的 description 欄位內的資料
		String description = request.getParameter("description");
		// 檢查使用者所輸入的資料
		if (description == null || description.trim().length() == 0) {
			errorMessage.add("內容欄必須輸入");
		}

		String path = this.getServletContext().getRealPath("./") + "img\\";
		
		UserItemService service = new UserItemService();

		Part filePart = request.getPart("img");
        String header = filePart.getHeader("Content-Disposition");
        String filename = header.substring(
                header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
        //String filename = service.getRandomString(6);
        InputStream in = filePart.getInputStream();
        
        OutputStream out = new FileOutputStream(path + filename);
        byte[] buffer = new byte[1024];
        int length = -1;
        while ((length = in.read(buffer)) != -1) {
            out.write(buffer, 0, length);
        }
        in.close();
        out.close();
		// 讀取使用者所輸入，由瀏覽器送來的 img 欄位內的資料
		String img = "/project/img/" + filename;
		// 檢查使用者所輸入的資料
		if (img == null || img.trim().length() == 0) {
			errorMessage.add("圖片欄必須輸入");
		}
		

		// MemberBean 扮演封裝輸入資料的角色
		UserItemBean cb = new UserItemBean(itemId, memberId, name, description, qty, price, img);
		try {

			service.createItem(cb);
			// 依照執行的結果挑選適當的view元件，送回相關訊息
			// 產生 RequestDispatcher 物件 rd
			String context = request.getContextPath();
			response.sendRedirect(response.encodeRedirectURL(context+"/proj/ShowItems.do"));
//			RequestDispatcher rd = request.getRequestDispatcher("/proj/ShowItems.jsp");
//			// 請容器代為呼叫下一棒程式
//			rd.forward(request, response);
			
			return;
		} catch (Exception e) {
//			RequestDispatcher rd = request.getRequestDispatcher("/proj/ShowItems.do");
//			rd.forward(request, response);
//			return;
		}
	}

}
