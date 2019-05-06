package com.spring.resp;

import java.util.List;

import com.spring.entity.TrainCar;
import com.spring.entity.TrainStation;

public class TrainReq {

	List<TrainCar> cars;
	List<TrainStation> stations;
	public List<TrainCar> getCars() {
		return cars;
	}
	public void setCars(List<TrainCar> cars) {
		this.cars = cars;
	}
	public List<TrainStation> getStations() {
		return stations;
	}
	public void setStations(List<TrainStation> stations) {
		this.stations = stations;
	}
	
}
