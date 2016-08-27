package hbi.core.sale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.hand.hap.core.IRequest;
import com.hand.hap.system.dto.DTOStatus;

import hbi.core.sale.dto.OmOrderLines;
import hbi.core.sale.mapper.OmOrderLinesMapper;
import hbi.core.sale.service.IOmOrderLinesService;
@Service
public class OmOrderLinesImpl implements IOmOrderLinesService{

	@Autowired
	OmOrderLinesMapper omOrderLinesMapper;
	
	@Override
	public List<OmOrderLines> batchUpdate(IRequest reIRequest, List<OmOrderLines> orderLines) {
		// TODO Auto-generated method stub
		for(OmOrderLines orderLine:orderLines){
			if(orderLine.get__status()!= null){
				switch (orderLine.get__status()) {
				case DTOStatus.ADD:
					omOrderLinesMapper.insertOrderLine(orderLine);
					break;
				case DTOStatus.DELETE:
					omOrderLinesMapper.deleteByPrimaryKey(orderLine.getLineNumber());
					break;			
				case DTOStatus.UPDATE:
					omOrderLinesMapper.updateOrderLine(orderLine);
					break;
				default:
					break;
				}
			}
		}
		
		
		return orderLines;
	}

	@Override
	public List<OmOrderLines> queryOrder(IRequest requestContext, int page, int pagesize, OmOrderLines omOrderLines) {
		PageHelper.startPage(page, pagesize);
		// TODO Auto-generated method stub
		return omOrderLinesMapper.queryOrder(omOrderLines);
	}

}
