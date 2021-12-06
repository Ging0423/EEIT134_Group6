package loop.ecpay.service;

import java.text.SimpleDateFormat;
import java.util.Hashtable;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import loop.ecpay.payment.integration.AllInOne;
import loop.ecpay.payment.integration.domain.AioCheckOutALL;
import loop.item.allItem.service.AllItemService;
import loop.item.allItem.service.ItemImgService;
import loop.order.model.OrderDataBean;
import loop.order.model.OrderItemBean;

@Service
public class PayementService {
	
	@Autowired
	private AllItemService allItemService;
	
	@Autowired
	private ItemImgService itemImgService;
	
	private final static Logger log = Logger.getLogger(PayementService.class.getName());
	
	public String prepareECPayData(OrderDataBean ob, HttpServletResponse response ) {
		AllInOne aio = new AllInOne("");
		// 使用信用卡
		AioCheckOutALL aioCheck = new AioCheckOutALL();
		/* 特店編號 測試時必須要填: 2000132 */ 
		aioCheck.setMerchantID("2000132");    
		/* 特店交易時間，格式為 yyyy/MM/dd HH:mm:ss，請複製下面四行 */
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdf.setLenient(false);
		String merchantTradeDate = sdf.format(ob.getOrderDate());
		aioCheck.setMerchantTradeDate(merchantTradeDate);
		
		aioCheck.setNeedExtraPaidInfo("N");
		/* 交易金額：必須為整數組成的字串，不能有小數點，否則當掉 */		
		int totalAmount = ob.getTotal();
		aioCheck.setTotalAmount(String.valueOf(totalAmount));
		
		/* 交易描述：說明性質的資料，自己填 */		
		aioCheck.setTradeDesc(ob.getRecipient() + "-" +ob.getOrderId() +  "-" + ob.getOrderDate());
		
		String itemName = "";
		
		for(OrderItemBean oib :ob.getOrderItem()) {
			itemName += allItemService.getItemName(oib.getItemId()) + "#";
		}
		itemName = itemName.substring(0, itemName.length() - 1 );
		/* 填入商品名稱，可用#隔開，可以抓你的商品名稱也可自填 */	
		aioCheck.setItemName(itemName);
		String s = itemImgService.getRandomString(3);
		/* 特店交易編號，不能超過20個符號，也不能重複(一個編號只能用一次)，否則當掉，可自填 */
		aioCheck.setMerchantTradeNo("loop" + s + ob.getOrderId());
		
		/* 付款完成通知回傳網址：不瞭解此網址的作用 */
		aioCheck.setReturnURL("https://eeit13428loop.southeastasia.cloudapp.azure.com:8080/loop/ecpaycheck");

		aioCheck.setOrderResultURL("https://eeit13428loop.southeastasia.cloudapp.azure.com:8080/loop/order/myorder");

		// 輸出畫面
		String htmlContent = aio.aioCheckOut(aioCheck, null);
		
		return htmlContent;
	}
	
	public Boolean compareCheckMacValue(Hashtable<String, String> params) {
		AllInOne all = new AllInOne("");
		return all.compareCheckMacValue(params);
	}
	
}
