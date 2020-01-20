//
//  Temperature.swift
//  Converter
//
//  Created by Thomas DURAND on 20/01/2020.
//  Copyright © 2020 Thomas DURAND. All rights reserved.
//

import Foundation

protocol Converter {
    associatedtype T: Dimension
    var name: String { get }
    var units: [T] { get }
}

struct Duration: Converter {
    let name = "Duration"
    let units = [UnitDuration.seconds, .minutes, .hours] // There is no days :'(
}

struct Length: Converter {
    let name = "Length"
    let units = [UnitLength.meters, .kilometers, .feet, .yards, .miles, .lightyears]
}

struct Mass: Converter {
    let name = "Mass"
    let units = [UnitMass.kilograms, .grams, .pounds, .carats, .ounces]
}

struct Pressure: Converter {
    let name = "Pressure"
    let units = [UnitPressure.bars, .hectopascals, .millimetersOfMercury, .newtonsPerMetersSquared]
}

struct Speed: Converter {
    let name = "Speed"
    let units = [UnitSpeed.metersPerSecond, .kilometersPerHour, .milesPerHour, .knots]
}

struct Temperature: Converter {
    let name = "Temperature"
    let units = [UnitTemperature.celsius, .fahrenheit, .kelvin]
}

struct Volume: Converter {
    let name = "Volume"
    let units = [UnitVolume.milliliters, .liters, .cups, .pints, .gallons]
}
