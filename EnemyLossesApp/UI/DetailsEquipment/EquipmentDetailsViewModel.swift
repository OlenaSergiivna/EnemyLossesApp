//
//  EquipmentDetailsViewModel.swift
//  EnemyLossesApp
//
//  Created by user on 26.08.2023.
//

import Foundation

class EquipmentDetailsViewModel {
    
    let equipmenData: Equipment
    
    var equipmentArray: [EquipmentData] = []
    
    
    init(equipmenData: Equipment) {
        self.equipmenData = equipmenData
        
        setUpDataForTableView()
    }
    
    
    func setUpDataForTableView() {
        
        equipmentArray.append(EquipmentData(equipmentType: "APC", lossesNumber: equipmenData.apc))
        
        equipmentArray.append(EquipmentData(equipmentType: "Drones", lossesNumber: equipmenData.drone))
        
        equipmentArray.append(EquipmentData(equipmentType: "MRL", lossesNumber: equipmenData.mrl))
        
        equipmentArray.append(EquipmentData(equipmentType: "Naval ships", lossesNumber: equipmenData.navalShip))
        
        if let cruiseMissilesLosses = equipmenData.cruiseMissiles {
            equipmentArray.append(EquipmentData(equipmentType: "Cruise missiles", lossesNumber: cruiseMissilesLosses))
        }
        
        if let fuelTankLosses = equipmenData.fuelTank {
            equipmentArray.append(EquipmentData(equipmentType: "Fuel tanks", lossesNumber: fuelTankLosses))
        }
        
        if let militaryAutoLosses = equipmenData.militaryAuto {
            equipmentArray.append(EquipmentData(equipmentType: "Military auto", lossesNumber: militaryAutoLosses))
        }
        
        equipmentArray.append(EquipmentData(equipmentType: "Anti aircraft warfare", lossesNumber: equipmenData.antiAircraftWarfare))
        
        if let mobileSRBMSystemLosses = equipmenData.mobileSRBMSystem {
            equipmentArray.append(EquipmentData(equipmentType: "Mobile SRBM systems", lossesNumber: mobileSRBMSystemLosses))
        }
        
        if let specialEquipmentShipLosses = equipmenData.specialEquipment {
            equipmentArray.append(EquipmentData(equipmentType: "Special equipment", lossesNumber: specialEquipmentShipLosses))
        }
        
        if let vehiclesAndFuelTanksLosses = equipmenData.vehiclesAndFuelTanks {
            equipmentArray.append(EquipmentData(equipmentType: "Vehicles and fuel tanks", lossesNumber: vehiclesAndFuelTanksLosses))
        }
    }
}
