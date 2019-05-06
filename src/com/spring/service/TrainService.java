package com.spring.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.spring.dao.TrainCarMapper;
import com.spring.dao.TrainMapper;
import com.spring.dao.TrainOrderMapper;
import com.spring.dao.TrainStationMapper;
import com.spring.entity.Train;
import com.spring.entity.TrainCar;
import com.spring.entity.TrainOrder;
import com.spring.entity.TrainStation;
import com.spring.enums.TypeEnum;
import com.spring.resp.PageReq;
import com.spring.resp.TrainReq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TrainService {

	@Autowired
	private TrainMapper trainMapper;
	@Autowired
	private TrainCarMapper trainCarMapper;
	@Autowired
	private TrainStationMapper trainStationMapper;
	@Autowired
	private TrainOrderMapper trainOrderMapper;

	public PageInfo<Train> findByPage(PageReq page,Map<String, Object> map){
		List<Train> list = null;
		PageInfo<Train> pageList = null;
		if(map.isEmpty()){
			PageHelper.startPage(page.getPage(), page.getLimit(),true);
			list = trainMapper.findAllTrain();
			pageList=new PageInfo<>(list);
			for(Train train:list){
				train.setTypeMsg(TypeEnum.getMsgIndex(train.getType()));
				Map<String, Object> params = new HashMap<>();
				params.put("trainId", train.getId());
				params.put("start", train.getStartAddress());
				params.put("end", train.getEndAddress());
				Date date = new Date();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String nowDate = dateFormat.format(date);
				params.put("nowDate", nowDate);

				Map<String, String> numMap=getTrainNum(params);
				train.setSeatNum(numMap.get("zpNum"));
				train.setSleepNum(numMap.get("wpNum"));
				train.setStandNum(numMap.get("wzNum"));

				Map<String, BigDecimal> priceMap=getTrainStationPrice(params);
				train.setSleepPrice(priceMap.get("sleepPrice"));
				train.setSeatPrice(priceMap.get("seatPrice"));
				train.setStandPrice(priceMap.get("standPrice"));
			}
		}else{
			PageHelper.startPage(page.getPage(), page.getLimit(),true);
			list=trainMapper.findByPage(map);
			pageList=new PageInfo<>(list);
			for(Train train:list){
				train.setTypeMsg(TypeEnum.getMsgIndex(train.getType()));
				map.put("trainId", train.getId());
				Map<String, String> numMap=getTrainNum(map);
				train.setSeatNum(numMap.get("zpNum"));
				train.setSleepNum(numMap.get("wpNum"));
				train.setStandNum(numMap.get("wzNum"));
				if(!map.isEmpty()&&map.get("start")!=null){
					Map<String, BigDecimal> priceMap=getTrainStationPrice(map);
					train.setSleepPrice(priceMap.get("sleepPrice"));
					train.setSeatPrice(priceMap.get("seatPrice"));
					train.setStandPrice(priceMap.get("standPrice"));
				}
			}
		}

		return pageList;
	}
	
	@Transactional
	public void save(Train train,TrainReq req){
		trainMapper.insert(train);
		for(TrainCar car:req.getCars()){
			car.setTrainId(train.getId());
			trainCarMapper.insert(car);
		}
		for(TrainStation station:req.getStations()){
			station.setTrainId(train.getId());
			trainStationMapper.insert(station);
		}
	}
	
	
	
	public void delete(String[] ids){
		for(String id:ids){
			Train train=new Train();
			train.setId(Long.parseLong(id));
			train.setValid(0);
			trainMapper.updateByPrimaryKeySelective(train);
		}
	}
	
	
	public Map<String, BigDecimal> getTrainStationPrice(Map<String,Object> map){
		Map<String, BigDecimal> priceMap=new HashMap<>();
		List<TrainStation> list=trainStationMapper.findStationByMap(map);
		priceMap.put("sleepPrice", new BigDecimal(0));
		priceMap.put("seatPrice", new BigDecimal(0));
		priceMap.put("standPrice", new BigDecimal(0));
		if(CollectionUtils.isEmpty(list)){
			return priceMap;
		}
		for(TrainStation station:list){
			if(station.getAddress().equals(map.get("start").toString())){
				list.stream().filter(stations->stations.getSort()>station.getSort()).forEach(s->{
					priceMap.put("sleepPrice", priceMap.get("sleepPrice").add(s.getSleepPrice()));
					priceMap.put("seatPrice", priceMap.get("seatPrice").add(s.getSeatPrice()));
					priceMap.put("standPrice", priceMap.get("standPrice").add(s.getStandPrice()));
				});
				break;
			}
		}
		return priceMap;
	}
	
	
	
	
	private Map<String,String> getTrainNum(Map<String, Object> map){
		Map<String,String> numMap=new HashMap<>();
		if(map.get("start")==null||map.get("end")==null||map.get("nowDate")==null){
			numMap.put("wpNum", "--");
			numMap.put("zpNum", "--");
			numMap.put("wzNum", "--");
			return numMap;

		}
		List<TrainCar> carsList=trainCarMapper.selectByTrainId(Long.parseLong(map.get("trainId").toString()));
		int wpNum=0;
		int zpNum=0;
		int wzNum=0;
		for(TrainCar car:carsList){
			wzNum+=car.getNoMun();
			if(car.getType()==1){
				wpNum+=car.getSeatNum();
			}else if(car.getType()==2){
				zpNum+=car.getSeatNum();
			}
		}
		Map<String, Integer> bookMap=searchBookNum(map);
		wpNum=wpNum-bookMap.get("wpNum");
		zpNum=zpNum-bookMap.get("zpNum");
		wzNum=wzNum-bookMap.get("wzNum");
		numMap.put("wpNum", String.valueOf(wpNum));
		numMap.put("zpNum", String.valueOf(zpNum));
		numMap.put("wzNum", String.valueOf(wzNum));
		return numMap;
	}
	
	
	private Map<String, Integer> searchBookNum(Map<String, Object> map){
		Map<String,Integer> numMap=new HashMap<>();
		List<TrainOrder> list=trainOrderMapper.findOrderByMap(map);
		numMap.put("wpNum", 0);
		numMap.put("zpNum",0);
		numMap.put("wzNum", 0);
		if(CollectionUtils.isEmpty(list)){
			return numMap;
		} 
		int wpNum=0;
		int zpNum=0;
		int wzNum=0;
		for(TrainOrder order:list){
		   if(order.getTrainType()==3){
			   wzNum++;
			   numMap.put("wzNum", wzNum);
		   }else if(order.getTrainType()==2){
			   zpNum++;
			   numMap.put("zpNum",zpNum);
		   }else{
			   wpNum++;
			   numMap.put("wpNum", wpNum);
		   }
		}
		return numMap;
	}
	
}
