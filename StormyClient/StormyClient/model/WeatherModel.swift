//
//  WeatherModel.swift
//  StormyClient
//
//  Created by Yordan Doykov on 30/03/2023.
//

import Foundation
import SwiftUI

struct WeatherResponse: Codable {
    let data: WeatherData
}

struct WeatherData: Codable {
    let timelines: [WeatherTimelines]
}

struct WeatherTimelines: Codable {
    let intervals: [WeatherIntervals]
}

struct WeatherIntervals: Codable {
    let startTime: String
    let values: WeatherValue
}

struct WeatherValue: Codable {
    var temperature: Double
    var precipitationIntensity: Double
    var windSpeed: Double
    var precipitationProbability: Int
    var precipitationType: Int
    var weatherCode: Int
}



enum WeatherCode: String, Codable {
    case clear = "1000"
    case mostlyClear = "1100"
    case partlyCloudy = "1101"
    case mostlyCloudy = "1102"
    case cloudy = "1001"
    case fog = "2000"
    case lightFog = "2100"
    case lightWind = "3000"
    case wind = "3001"
    case strongWind = "3002"
    case drizzle = "4000"
    case rain = "4001"
    case lightRain = "4200"
    case heavyRain = "4201"
    case snow = "5000"
    case flurries = "5001"
    case lightSnow = "5100"
    case heavySnow = "5101"
    case freezingDrizzle = "6000"
    case freezingRain = "6001"
    case lightFreezingRain = "6200"
    case heavyFreezingRain = "6201"
    case icePellets = "7000"
    case heavyIcePellets = "7101"
    case lightIcePellets = "7102"
    case thunderstorm = "8000"
    
    var name: String {
        switch self {
        case .clear:
            return "Clear"
        case .cloudy:
            return "Cloudy"
        case .mostlyClear, .partlyCloudy, .mostlyCloudy:
            return "Partly Cloudy"
        case .fog, .lightFog:
            return "Foggy"
        case .lightWind, .wind, .strongWind:
            return "Windy"
        case .drizzle:
            return "Drizzle"
        case .lightRain, .rain:
            return "Light rain"
        case .heavyRain:
            return "Heavy rain"
        case .snow, .flurries, .lightSnow, .heavySnow, .freezingDrizzle, .freezingRain, .lightFreezingRain, .heavyFreezingRain:
            return "Snowy"
        case .icePellets, .heavyIcePellets, .lightIcePellets:
            return "Hail"
        case .thunderstorm:
            return "Thunderstorm"
            
        }
    }
    
    var image: Image {
        switch self {
        case .clear:
            return Image("sunny-weather")
        case .cloudy:
            return Image("cloudy-weather")
        case .mostlyClear, .partlyCloudy, .mostlyCloudy:
            return Image("partly-cloudy")
        case .fog, .lightFog:
            return Image("foggy-weather")
        case .lightWind, .wind, .strongWind:
            return Image("windy-weather")
        case .drizzle:
            return Image("drizzle")
        case .lightRain, .rain:
            return Image("light-rain")
        case .heavyRain:
            return Image("heavy-rain")
        case .snow, .flurries, .lightSnow, .heavySnow, .freezingDrizzle, .freezingRain, .lightFreezingRain, .heavyFreezingRain:
            return Image("snowy-weather")
        case .icePellets, .heavyIcePellets, .lightIcePellets:
            return Image("cloud.hail.fill")
        case .thunderstorm:
            return Image("thunderstorm-weather")
            
        }
    }
    
    
    var nightImage: Image {
        switch self {
        case .clear:
            return Image("moon")
        case .cloudy:
            return Image("cloudy-weather")
        case .mostlyClear, .partlyCloudy, .mostlyCloudy:
            return Image("cloudy-moon")
        case .fog, .lightFog:
            return Image("foggy-weather")
        case .lightWind, .wind, .strongWind:
            return Image("windy-weather")
        case .drizzle:
            return Image("drizzle")
        case .lightRain, .rain:
            return Image("light-rain")
        case .heavyRain:
            return Image("heavy-rain")
        case .snow, .flurries, .lightSnow, .heavySnow, .freezingDrizzle, .freezingRain, .lightFreezingRain, .heavyFreezingRain:
            return Image("snowy-weather")
        case .icePellets, .heavyIcePellets, .lightIcePellets:
            return Image("cloud.hail.fill")
        case .thunderstorm:
            return Image("thunderstorm-weather")
            
        }
    }
    
    var systemIcon: Image {
        switch self {
        case .clear:
            return Image(systemName: "sun.max")
        case .cloudy:
            return Image(systemName: "cloud")
        case .mostlyClear, .partlyCloudy, .mostlyCloudy:
            return Image(systemName: "cloud.sun")
        case .fog, .lightFog:
            return Image(systemName: "cloud.fog")
        case .lightWind, .wind:
            return Image(systemName: "wind")
        case .strongWind:
            return Image(systemName: "tornado")
        case .drizzle:
            return Image(systemName: "cloud.drizzle")
        case .lightRain, .rain:
            return Image(systemName: "cloud.rain")
        case .heavyRain:
            return Image(systemName: "cloud.heavyrain")
        case .snow, .flurries, .lightSnow, .heavySnow:
            return Image(systemName: "snow")
        case .freezingDrizzle:
            return Image(systemName: "thermometer.snowflake")
        case .freezingRain, .lightFreezingRain, .heavyFreezingRain:
            return Image(systemName: "cloud.rain")
        case .icePellets, .heavyIcePellets, .lightIcePellets:
            return Image(systemName: "cloud.hail")
        case .thunderstorm:
            return Image(systemName: "cloud.bolt")
        }
    }
    
    var nightSystemIcon: Image {
        switch self {
        case .clear:
            return Image(systemName: "moon")
        case .cloudy:
            return Image(systemName: "cloud")
        case .mostlyClear, .partlyCloudy, .mostlyCloudy:
            return Image(systemName: "cloud.moon")
        case .fog, .lightFog:
            return Image(systemName: "cloud.fog")
        case .lightWind, .wind:
            return Image(systemName: "wind")
        case .strongWind:
            return Image(systemName: "tornado")
        case .drizzle:
            return Image(systemName: "cloud.drizzle")
        case .lightRain, .rain:
            return Image(systemName: "cloud.rain")
        case .heavyRain:
            return Image(systemName: "cloud.heavyrain")
        case .snow, .flurries, .lightSnow, .heavySnow:
            return Image(systemName: "snow")
        case .freezingDrizzle:
            return Image(systemName: "thermometer.snowflake")
        case .freezingRain, .lightFreezingRain, .heavyFreezingRain:
            return Image(systemName: "cloud.rain")
        case .icePellets, .heavyIcePellets, .lightIcePellets:
            return Image(systemName: "cloud.hail")
        case .thunderstorm:
            return Image(systemName: "cloud.bolt")
        }
    }
}

