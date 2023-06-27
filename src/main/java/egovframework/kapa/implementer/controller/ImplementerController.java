package egovframework.kapa.implementer.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.kapa.decision.service.DecisionService;
import egovframework.kapa.domain.Decision;
import egovframework.kapa.domain.Decision_Cityplan;
import egovframework.kapa.domain.Decision_ConsultationDate;
import egovframework.kapa.domain.Decision_File;
import egovframework.kapa.domain.Decision_Opinion;
import egovframework.kapa.domain.Decision_Target;
import egovframework.kapa.file.domain.DecisionFileVO;
import egovframework.kapa.file.domain.FileVO;
import egovframework.kapa.implementer.domain.ApplicationLand;
import egovframework.kapa.implementer.domain.ApplicationList;
import egovframework.kapa.implementer.dto.ApplicationDTO;
import egovframework.kapa.implementer.service.ImplementerService;
import egovframework.kapa.util.StrUtil;

@Controller
@RequestMapping("/implementer")
public class ImplementerController {

	
	@Autowired
	ImplementerService implementerService;
	
	@Autowired
	DecisionService decisionService;
	
	/*
	 * application
	 */
	@GetMapping("/application.do")
	public String applicationPage(HttpServletRequest request, Model model) {
		
		//current page
		model.addAttribute("currentPage", "application"); 

		return "implementer/application/list";
	}
	
	/*
	 * 재결접수
	 */
	@GetMapping("/decision/signup.do")
	public String decisionPage(HttpServletRequest request,Model model) {
		
		int masterId = Integer.parseInt(request.getParameter("masterId"));
		System.out.println(masterId); 
        model.addAttribute("masterId", masterId);
        
		//current page
		model.addAttribute("currentPage", "application");
		
		ApplicationList applicationVo = implementerService.getApplicationView(masterId);
		ApplicationDTO applicationDTO = implementerService.makeImplementerViewFormatter(applicationVo);
		List<Decision> csltList = implementerService.getLtisCslt(masterId);
		
        model.addAttribute("avo", applicationDTO);
		model.addAttribute("csltList", csltList);
		return "implementer/application/signup";
	}
	
	/*
	 * 재결 정보 확인
	 */
	@GetMapping("/decision/view.do")
	public String decisionSignUp(HttpServletRequest request,Model model) {
		
	  	boolean decisionCheck = false;
	  	
		int masterId = Integer.parseInt(request.getParameter("masterId"));
		
	
		List<Decision_File> decisionFiles = decisionService.getDecisionFileList(Long.parseLong(request.getParameter("masterId")));
		List<DecisionFileVO> fileList = new ArrayList();
		List<Decision> csltList = implementerService.getLtisCslt(masterId);
		model.addAttribute("csltList", csltList);
		for (int i=0; i<decisionFiles.size(); i++) {
			FileVO file = decisionService.getFileByDeicisionFileSeq(decisionFiles.get(i).getFileSeq());	
			DecisionFileVO fileVO = new DecisionFileVO();
			fileVO.setFileDescription(decisionFiles.get(i).getFileDescription());
			fileVO.setSeqNo(decisionFiles.get(i).getFileSeq());
			fileVO.setFileType(decisionFiles.get(i).getFileType());
			fileVO.setFileNameOri(file.getFileNameOri());
			fileList.add(fileVO);
		}	
		
	    model.addAttribute("masterId", masterId);
	     
		//current page
		model.addAttribute("currentPage", "application");
		
		ApplicationList applicationVo = implementerService.getApplicationView(masterId);
		ApplicationDTO applicationDTO = implementerService.makeImplementerViewFormatter(applicationVo);
		Long decisionId = applicationDTO.getDecisionId();
		
        model.addAttribute("avo", applicationDTO);
        
        List<String> consultList = implementerService.getApplicationConsultList(masterId);
     	
        String consult = "";
        int rank = 1;
        for(String appName:consultList) {
        	consult+=appName;
        	if(rank<consultList.size())consult+=",";
        	rank++;
        }
        model.addAttribute("consult", consult);
        
        
        if(decisionId!=0L) {
        	
        	decisionCheck = true;
            model.addAttribute("decisionCheck", decisionCheck);
            
        	try {
        	  	
      			List<Decision_Cityplan> cityPlans = decisionService.getCityPlan(decisionId);
      			List<Decision_ConsultationDate> consultationDates =  decisionService.getConsultationDate(decisionId);
      			List<Decision_Target> targets = decisionService.getTarget(decisionId);
      			Decision decision = decisionService.getDecisionView(decisionId);
      			
      			model.addAttribute("groupEstablishedDate", decision.getGroupEstablishedDate());
      		
      			//합계 통계

      			Long amountA = decision.getAmountA();
      			Long amountB = decision.getAmountB();
      			Long amountC = decision.getAmountC();
      			Long landCnt = decision.getLandCnt();
      			Long landArea = decision.getLandArea();
      			Long landPrice = decision.getLandPrice();
      			Long objCnt = decision.getObjCnt();
      			Long objPrice = decision.getObjPrice();
      			Long goodwillCnt = decision.getGoodwillCnt();
      			Long goodwillPrice = decision.getGoodwillPrice();
      			
      			
      			double average = (amountA+amountB+amountC);
      			
      			DecimalFormat dc = new DecimalFormat("###,###,###,###.##");
      		    String amountAstr = dc.format(amountA);
      		    String amountBstr = dc.format(amountB);
      		    String amountCstr = dc.format(amountC);
      		    String landCntStr = dc.format(landCnt);
      		    String landAreaStr = dc.format(landArea);
	      		String landPriceStr = dc.format(landPrice);
	      		String objCntStr = dc.format(objCnt);
	      		String objPriceStr = dc.format(objPrice);
	      		String goodwillCntStr = dc.format(goodwillCnt);
	      		String goodwillPriceStr = dc.format(goodwillPrice);
      		    
      		    
      		    model.addAttribute("amountA", amountAstr);
      		    model.addAttribute("amountB", amountBstr);
      		    model.addAttribute("amountC", amountCstr);
      		    model.addAttribute("landCnt", landCntStr);
      		  model.addAttribute("landArea", landAreaStr);
      		model.addAttribute("landPrice", landPriceStr);
      		model.addAttribute("objCnt", objCntStr);
      		model.addAttribute("objPrice", objPriceStr);
      		model.addAttribute("goodwillCnt", goodwillCntStr);
      		model.addAttribute("goodwillPrice", goodwillPriceStr);
      		    
      		    
      			    
      			model.addAttribute("averageAmount", average);
      						
      			
      			model.addAttribute("avo", applicationDTO);
      			model.addAttribute("cityPlans", cityPlans);
      			model.addAttribute("consultationDates", consultationDates);
      			model.addAttribute("targets", targets);
      			model.addAttribute("decision", decision);
      			model.addAttribute("decisionFiles", fileList);
      			
      			
      		}catch (Exception e) {
      			e.printStackTrace();
      		}
      		
      		//
        	
        }
        
  	
      		
		
		  //필지 수 
          int landCount = implementerService.getApplicationLandCount(masterId);
		  model.addAttribute("landCount", landCount);
		  
		  //면적 
		  int totalAreaAmot = 0;
		  
		  //종전금액합계 
		  int totalCost = 0; 
		  String totalHitsStr = "";
		  
		  if(landCount>0) { //값 넣기 
			  List<ApplicationLand> landList = implementerService.getLandInfo(masterId);
		  
		  for(ApplicationLand applicationLand:landList) { 
			  int area_amot = applicationLand.getArea(); 
			  Long bef_unit_cost = applicationLand.getPriceK();
		  
		  totalAreaAmot+=area_amot;
		  
		  totalCost+=bef_unit_cost; }
		  
		  } model.addAttribute("totalAreaAmot", totalAreaAmot);
		  
		  //필지 소유자 수 
		  int landRightCount = implementerService.getApplicationLandRightCount(masterId);
		  model.addAttribute("landRightCount", landRightCount);
		  
		  //지장물 수 
		  int objectCount = implementerService.getApplicationObjectCount(masterId);
		  model.addAttribute("objectCount", objectCount);
		  
		  if(objectCount>0) { //값 넣기 
			  List<ApplicationLand> goodsList = implementerService.getGoodsInfo(masterId);
		  
		  for(ApplicationLand applicationLand:goodsList) { Long bef_unit_cost =
		  applicationLand.getPriceK(); totalCost+=bef_unit_cost; }
		  
		  }
		  
		  //지장물 소유자 수
		  int objectRightCount = implementerService.getApplicationObjectRightCount(masterId);
		  model.addAttribute("objectRightCount", objectRightCount);
		  
		  if(totalCost>0) { totalHitsStr = Integer.toString(totalCost); totalHitsStr =
		  StrUtil.convertToDecimalFormat(totalHitsStr); }
		  
		  model.addAttribute("totalCost", totalHitsStr);
		 
        
		return "implementer/application/view";
	}
		
	////////////////////////
	
	/*
	 * opinion
	 */
	@GetMapping("/opinion.do")
	public String opinionPage(Model model) {
		
		//current page
		model.addAttribute("currentPage", "opinion");
		
		return "implementer/opinion/list";
	}
	
	/* 재결의견작성 */
	@GetMapping("/opinion/write.do")
	public String opinionDetailWrite(HttpServletRequest request,Model model) {
	  	boolean opinionCheck = true;
	  	System.out.println("============================================");
	  	System.out.println(request.getParameter("decisionId"));
	  	System.out.println("============================================");

		Long decisionId = Long.parseLong(request.getParameter("decisionId"));
		System.out.println(decisionId); 
	    model.addAttribute("decisionId", decisionId);
	    
		//current page
		model.addAttribute("currentPage", "opinion");
		
	    Decision decison = decisionService.getDecisionView(decisionId);  //첫번째 로직
        System.out.println(decison);
        
        if(decison.getDecisionState()>=5) {
        	opinionCheck = false;
        }
 
        model.addAttribute("opinionCheck", opinionCheck);
        
        int masterId = decison.getMasterID();
        model.addAttribute("masterId", masterId);
        
		ApplicationList applicationVo = implementerService.getApplicationView(masterId); //두번째 로직
		ApplicationDTO applicationDTO = implementerService.makeImplementerViewFormatter(applicationVo);
        model.addAttribute("avo", applicationDTO);
		
		
		// 필지 수 
        int landCount = implementerService.getApplicationLandCount(masterId);
		model.addAttribute("landCount", landCount);

		// 면적 
		int totalAreaAmot = 0;

		// 종전금액합계 
		int totalCost = 0; 
		String totalHitsStr = "";

		if (landCount > 0) { // 값 넣기 
			List<ApplicationLand> landList = implementerService.getLandInfo(masterId);

			for (ApplicationLand applicationLand : landList) {
				int area_amot = applicationLand.getArea();
				Long bef_unit_cost = applicationLand.getPriceK();

				totalAreaAmot += area_amot;

				totalCost += bef_unit_cost;
			}

		}
		model.addAttribute("totalAreaAmot", totalAreaAmot);

		// 필지 소유자 수 
		int landRightCount = implementerService.getApplicationLandRightCount(masterId);
		model.addAttribute("landRightCount", landRightCount);

		// 지장물 수
		int objectCount = implementerService.getApplicationObjectCount(masterId);
		model.addAttribute("objectCount", objectCount);

		if (objectCount > 0) { // 값 넣기 
			List<ApplicationLand> goodsList = implementerService.getGoodsInfo(masterId);

			for (ApplicationLand applicationLand : goodsList) {
				Long bef_unit_cost = applicationLand.getPriceK();
				totalCost += bef_unit_cost;
			}

		}

		// 지장물 소유자 수 
		int objectRightCount = implementerService.getApplicationObjectRightCount(masterId);
		model.addAttribute("objectRightCount", objectRightCount);

		if (totalCost > 0) {
			totalHitsStr = Integer.toString(totalCost);
			totalHitsStr = StrUtil.convertToDecimalFormat(totalHitsStr);
		}

		model.addAttribute("totalCost", totalHitsStr);
		 
        
        //공통된 소유자 수 검색
		/*
		 * List<OwnerInfo> ownerList = implementerService.getOnwerInfoList(masterId);
		 * List<OwnerInfoDTO> formatterOwnerList =
		 * implementerService.getOwnerListFormatter(masterId,ownerList);
		 * 
		 * model.addAttribute("ownerList", formatterOwnerList);
		 */
        
      
        
		return "implementer/opinion/write";
	}
	
	
	/* 재결의견작성 완료*/
	@GetMapping("/opinion/view.do")
	public String opinionDetail(HttpServletRequest request,Model model) {
	  	boolean opinionCheck = true;
	  	System.out.println("============================================");
	  	System.out.println(request.getParameter("decisionId"));
	  	System.out.println("============================================");

		Long decisionId = Long.parseLong(request.getParameter("decisionId"));
		System.out.println(decisionId); 
	    model.addAttribute("decisionId", decisionId);
	    
		//current page
		model.addAttribute("currentPage", "opinion");
		
	    Decision decison = decisionService.getDecisionView(decisionId);  //첫번째 로직
        System.out.println(decison);
        
        if(decison.getDecisionState()>=5) {
        	opinionCheck = false;
        }
 
        model.addAttribute("opinionCheck", opinionCheck);
        
        int masterId = decison.getMasterID();
        model.addAttribute("masterId", masterId);
        
		ApplicationList applicationVo = implementerService.getApplicationView(masterId); //두번째 로직
		ApplicationDTO applicationDTO = implementerService.makeImplementerViewFormatter(applicationVo);
        model.addAttribute("avo", applicationDTO);
		
		
		  //필지 수 
		  int landCount = implementerService.getApplicationLandCount(masterId);
		  model.addAttribute("landCount", landCount);
		  
		  //면적 
		  int totalAreaAmot = 0;
		  
		  //종전금액합계 
		  int totalCost = 0; 
		  String totalHitsStr = "";
		  
		  if(landCount>0) { //값 넣기 
			  List<ApplicationLand> landList = implementerService.getLandInfo(masterId);
		  
		  for(ApplicationLand applicationLand:landList) { 
			  int area_amot = applicationLand.getArea(); 
			  Long bef_unit_cost = applicationLand.getPriceK();
		  
			  totalAreaAmot+=area_amot;
		  
			  totalCost+=bef_unit_cost; 
		  }
		  
		  } model.addAttribute("totalAreaAmot", totalAreaAmot);
		  
		  //필지 소유자 수
		  int landRightCount = implementerService.getApplicationLandRightCount(masterId);
		  model.addAttribute("landRightCount", landRightCount);
		  
		  //지장물 수 
		  int objectCount = implementerService.getApplicationObjectCount(masterId);
		  model.addAttribute("objectCount", objectCount);
		  
		  if(objectCount>0) { //값 넣기
			  List<ApplicationLand> goodsList = implementerService.getGoodsInfo(masterId);
		  
		  for(ApplicationLand applicationLand:goodsList) { 
			  
			  Long bef_unit_cost = applicationLand.getPriceK(); 
			  totalCost+=bef_unit_cost; 
			  
			  }
		  
		  }
		  
		  //지장물 소유자 수 
		  int objectRightCount = implementerService.getApplicationObjectRightCount(masterId);
		  model.addAttribute("objectRightCount", objectRightCount);
		  
		  if(totalCost>0) { totalHitsStr = Integer.toString(totalCost); totalHitsStr =
		  StrUtil.convertToDecimalFormat(totalHitsStr); }
		  
		  model.addAttribute("totalCost", totalHitsStr);
		 
        
        //공통된 소유자 수 검색
		
		/*
		 * List<OwnerInfo> ownerList = implementerService.getOnwerInfoList(masterId);
		 * List<OwnerInfoDTO> formatterOwnerList =
		 * implementerService.getOwnerListFormatter(masterId,ownerList);
		 * 
		 * model.addAttribute("ownerList", formatterOwnerList);
		 */
		 
        
        
       List<Decision_Opinion> decisionOpinionList =  decisionService.getDecisionOpinionList(decisionId);
       model.addAttribute("decisionOpinionList", decisionOpinionList); 
      
        
		return "implementer/opinion/view";
	}
	

	
}
