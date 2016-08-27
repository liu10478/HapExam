package hbi.core.sale.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.ResponseData;

import hbi.core.sale.dto.OmOrderHeaders;
import hbi.core.sale.dto.OmOrderLines;
import hbi.core.sale.dto.OrgCompany;
import hbi.core.sale.service.IArCustomersService;
import hbi.core.sale.service.IInvInventoryItemsService;
import hbi.core.sale.service.IOmOrderHeadersService;
import hbi.core.sale.service.IOmOrderLinesService;
import hbi.core.sale.service.IOrgCompanyService;

@Controller
public class SaleController extends BaseController{
	
	@Autowired
	IOmOrderHeadersService OmOrderHeadersService;
	
	@Autowired
	IOmOrderLinesService omOrderLinesService;
	
	@Autowired
	IOrgCompanyService orgCompanyService;
	
	@Autowired
	IArCustomersService arCustomersService;
	
	@Autowired
	IInvInventoryItemsService invInventoryItemsService;
	
	@RequestMapping("/sale/showallorder")
	@ResponseBody
	public ResponseData showallorder(OmOrderHeaders omOrderHeaders,BindingResult result,@RequestParam(defaultValue = DEFAULT_PAGE) int page,
            @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize, HttpServletRequest request){
	//	return new ResponseData(OmOrderHeadersService.queryAllOrder(createRequestContext(request),page, pagesize));
		return new ResponseData(OmOrderHeadersService.queryItemsByClass(createRequestContext(request),page, pagesize,omOrderHeaders));
		
	}
	
	@RequestMapping("/company/query")
	@ResponseBody
	public ResponseData querycompany(@RequestParam(defaultValue = DEFAULT_PAGE) int page,
            @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize, HttpServletRequest request){
		return new ResponseData(orgCompanyService.queryAllConpany(createRequestContext(request),page, pagesize));
		
	}
	
	@RequestMapping(value="/customer/query",method=RequestMethod.POST)
	@ResponseBody
	public ResponseData querycustomer(String id, @RequestParam(defaultValue = DEFAULT_PAGE) int page,
            @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize, HttpServletRequest request){
		System.out.println(id);
		return new ResponseData(arCustomersService.queryAllCustomer(createRequestContext(request),page, pagesize));
		
	}
	
	@RequestMapping(value="/item/query")
	@ResponseBody
	public ResponseData querycustomer(@RequestParam(defaultValue = DEFAULT_PAGE) int page,
            @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize, HttpServletRequest request){
		return new ResponseData(invInventoryItemsService.queryAllItems(createRequestContext(request),page, pagesize));
		
	}
	
	@RequestMapping("/order/topage")
	public ModelAndView changpage(String id){		
		ModelAndView view=new ModelAndView(getViewPath()+"/sale/sales_detail");
		System.out.println(id);
		view.addObject("id", id);
		return view;
				
	}
	
	//页面1标题栏总查询
	@RequestMapping(value="/sale/queryByClass")
	@ResponseBody
	public ResponseData queryByClass(OmOrderHeaders omOrderHeaders,@RequestParam(defaultValue = DEFAULT_PAGE) int page,
            @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize, HttpServletRequest request){
		return new ResponseData(OmOrderHeadersService.queryItemsByClass(createRequestContext(request),page, pagesize,omOrderHeaders));
		
	}


	//表2尾查询
	@RequestMapping(value="/sale/attachs")
	@ResponseBody
	public ResponseData queryDetailOrder(OmOrderLines omOrderLines,String id,@RequestParam(defaultValue = DEFAULT_PAGE) int page,
            @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize, HttpServletRequest request){
		Long s1=(long) Integer.parseInt(id);
		omOrderLines.setHeaderId(s1);
		
		return new ResponseData(omOrderLinesService.queryOrder(createRequestContext(request),page, pagesize,omOrderLines));		
	}
	
	//表2尾插入
	@RequestMapping("/sale/OrderLinesubmit")
	@ResponseBody
	public ResponseData filmsubmit(@RequestBody List<OmOrderLines> orderline,BindingResult result,String id,HttpServletRequest request){
		 getValidator().validate(orderline, result);
	        if (result.hasErrors()) {
	            ResponseData rd = new ResponseData(false);
	            rd.setMessage(getErrorMessage(result, request));
	            return rd;
	        }	
	        
	        Long s1=(long) Integer.parseInt(id);
	      
	        OmOrderHeaders om=OmOrderHeadersService.querysomeOrder(s1);
	      
	        for(OmOrderLines s:orderline){
	        	s.setHeaderId(s1);
	        	s.setCompanyId(om.getCompanyId());
	        	s.setLineNumber(s1);
	        }
			return new ResponseData(omOrderLinesService.batchUpdate(createRequestContext(request), orderline));
	}
}
