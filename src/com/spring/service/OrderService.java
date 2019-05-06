package com.spring.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

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
import com.spring.entity.User;
import com.spring.enums.TrainTypeEnum;
import com.spring.enums.TypeEnum;
import com.spring.exception.BusinessException;
import com.spring.resp.OrderReq;
import com.spring.resp.PageReq;
import com.spring.util.BusinessCodes;
import com.spring.util.DateUtil;

@Service
public class OrderService {

	@Autowired
	private TrainMapper trainMapper;
	@Autowired
	private TrainStationMapper trainStationMapper;
	@Autowired
	private TrainCarMapper trainCarMapper;
	@Autowired
	private TrainOrderMapper trainOrderMapper;
	
	
	
	public PageInfo<TrainOrder> findByPage(PageReq page,Map<String, Object> param){
		PageHelper.startPage(page.getPage(), page.getLimit(),true);
		List<TrainOrder> list=trainOrderMapper.findByPage(param);
		list.forEach(o->{
			if(o.getState()==0){
				o.setStateMsg("未支付");
			}else if(o.getState()==1){
				o.setStateMsg("已支付");
			}else if(o.getState()==2){
				o.setStateMsg("已退票");
			}else if(o.getState()==3){
				o.setStateMsg("已改签");
			}
			o.setTrainTypeMsg(TrainTypeEnum.getMsgIndex(o.getTrainType()));
			o.setTrainDateMsg(DateUtil.format(o.getTrainDate(),"yyyy-MM-dd"));
		});
		PageInfo<TrainOrder> pageList=new PageInfo<>(list);
		return pageList;
	}
	
	 
	public void update(TrainOrder order){
		trainOrderMapper.updateByPrimaryKeySelective(order);
	}
	
	
	public TrainOrder getOderObj(long id){
		return trainOrderMapper.selectByPrimaryKey(id);
	}
	
	
	public Train book(OrderReq req){
		Map<String, Object> param=new HashMap<>();
		param.put("trainId", req.getTrainId());
		param.put("start", req.getStart());
		param.put("end", req.getEnd());
		List<Train> list=trainMapper.findByPage(param);
		if(CollectionUtils.isEmpty(list)){
			throw new BusinessException(BusinessCodes.ERROR_CODE, "车次信息有误");
		}
		Train train=list.get(0);
		Map<String, String> numMap=getTrainNum(param);
		train.setSeatNum(numMap.get("zpNum"));
		train.setSleepNum(numMap.get("wpNum"));
		train.setStandNum(numMap.get("wzNum"));
		Map<String, BigDecimal> priceMap=getTrainStationPrice(param);
		train.setSleepPrice(priceMap.get("sleepPrice"));
		train.setSeatPrice(priceMap.get("seatPrice"));
		train.setStandPrice(priceMap.get("standPrice"));
		return train;
	}
	
	public synchronized void saveOrder(OrderReq req,User user){
		Train train=book(req);
		TrainCar car=this.getNextTrainCar(req);
		if(car==null){
			throw new BusinessException(BusinessCodes.ERROR_CODE, "票已卖光");
		}
		if(req.getOrderId()==null){
		TrainOrder to=new TrainOrder();
		to.setTrainDate(DateUtil.parseDate(req.getNowDate()));
		to.setTrainTime(train.getStartTime());
		to.setStartAddress(train.getStartAddress());
		to.setEndAddress(train.getEndAddress());
		to.setTrianId(train.getId());
		to.setUserId(user.getId().longValue());
		to.setTrainType(req.getTrainType());
		if(req.getTrainType()==1){
			to.setPrice(train.getSleepPrice());
		}else if(req.getTrainType()==2){
			to.setPrice(train.getSeatPrice());
		}else{
			to.setPrice(train.getStandPrice());
		}
		to.setCarNo(car.getCarNo());
		to.setSeatNum(car.getSeatNum());
		trainOrderMapper.insert(to);
		}else{
			TrainOrder order=this.getOderObj(req.getOrderId());
			order.setTrianId(train.getId());
			order.setTrainDate(DateUtil.parseDate(req.getNowDate()));
			order.setTrainTime(train.getStartTime());
			order.setTrainType(req.getTrainType());
			if(req.getTrainType()==1){
				order.setPrice(train.getSleepPrice());
			}else if(req.getTrainType()==2){
				order.setPrice(train.getSeatPrice());
			}else{
				order.setPrice(train.getStandPrice());
			}
			order.setCarNo(car.getCarNo());
			order.setSeatNum(car.getSeatNum());
			order.setState(3);
			trainOrderMapper.updateByPrimaryKeySelective(order);
		}
	}
	
	
	private Map<String,String> getTrainNum(Map<String, Object> map){
		Map<String,String> numMap=new HashMap<>();
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
	
	private Map<String, Integer> searchBookNum(Map<String, Object> map){
		Map<String,Integer> numMap=new HashMap<>();
		List<TrainOrder> list=trainOrderMapper.findOrderByMap(map);
		if(CollectionUtils.isEmpty(list)){
			numMap.put("wpNum", 0);
			numMap.put("zpNum",0);
			numMap.put("wzNum", 0);
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
	
	
	
	private TrainCar getNextTrainCar(OrderReq req){
		Map<String, Object> param=new HashMap<>();
		param.put("trainId", req.getTrainId());
		param.put("nowDate", req.getNowDate());
		param.put("trainType", req.getTrainType());
		List<TrainOrder> list=trainOrderMapper.findOrderByMap(param);
		List<TrainCar> carList=trainCarMapper.selectByTrainId(req.getTrainId());
		Integer trainType=req.getTrainType();
		if(CollectionUtils.isEmpty(list)){
			if(trainType==3){
				List<TrainCar> tcs=carList.stream().filter(car->car.getNoMun()>0).limit(1).collect(Collectors.toList());
				TrainCar tc=tcs.get(0);
				tc.setSeatNum(-1);
				return tc;
			}
			List<TrainCar> tcs=  carList.stream().filter(car->car.getType()==trainType).limit(1).collect(Collectors.toList());
			TrainCar tc=tcs.get(0);
			tc.setSeatNum(1);
			return tc;
		}else{
			for(TrainOrder order:list){
			   for(TrainCar car:carList){
				   if(order.getTrainType()==3){
					   if(order.getCarNo()<car.getCarNo()&&order.getSeatNum()<car.getNoMun()){
						   car.setSeatNum(-1);
						   return car;
					   }
				   }else{
					   if(order.getTrainType()==car.getType()){
						   if(order.getCarNo()<car.getCarNo()&&order.getSeatNum()<car.getSeatNum()){
							   car.setSeatNum(order.getSeatNum()+1);
							   return car;
						   }
					   }
				   }
			   }
			}
			 
		}
		return null;
	}
}
