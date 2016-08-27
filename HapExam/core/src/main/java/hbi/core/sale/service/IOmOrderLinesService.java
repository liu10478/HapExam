package hbi.core.sale.service;

import java.util.List;

import com.hand.hap.core.IRequest;
import com.hand.hap.core.annotation.StdWho;
import hbi.core.sale.dto.OmOrderLines;

public interface IOmOrderLinesService {
	

	public List<OmOrderLines> batchUpdate(IRequest reIRequest,@StdWho List<OmOrderLines> orderLines);
	
	public List<OmOrderLines> queryOrder(IRequest requestContext,int page,int pagesize,OmOrderLines omOrderLines);
	
}
