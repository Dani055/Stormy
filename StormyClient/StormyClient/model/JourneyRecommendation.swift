//
//  JourneyRecommendation.swift
//  StormyClient
//
//  Created by Yordan Doykov on 03/04/2023.
//

import Foundation
import SwiftUI

struct JourneyRecommendation {
    let minimumPrecipation: Double
    let maximumPrecipation: Double
    let weatherDescription: String
    let stormyImage: String
    let gearRecommendations: [GearRecommendation]
}

struct GearRecommendation{
    let gearDescription: String
    let gearImage: Image
}

var gearInventory: [String: GearRecommendation] = [
    "Umbrella": GearRecommendation(gearDescription: "Taking an umbrella", gearImage: Image(systemName: "beach.umbrella")),
    "Jacket": GearRecommendation(gearDescription: "Wear a jacket", gearImage: Image("jacket")),
    "Layered clothing": GearRecommendation(gearDescription: "Wearing multiple layers of clothing", gearImage: Image(systemName: "tshirt")),
    "Raincoat": GearRecommendation(gearDescription: "Wear a poncho or raincoat", gearImage: Image("raincoat")),
    "Backpack": GearRecommendation(gearDescription: "If you are taking a backpack, make sure it is waterproof", gearImage: Image(systemName: "backpack")),
    "Boots": GearRecommendation(gearDescription: "Make sure you wear waterproof shoes/boots", gearImage: Image("boots")),
    "Socks": GearRecommendation(gearDescription: "Make sure you bring extra socks to swap out your wet ones", gearImage: Image("socks")),
    "Stop": GearRecommendation(gearDescription: "It is not advisable to go out, regardless of what you are wearing", gearImage: Image(systemName: "hand.raised.fill")),
    "Nothing": GearRecommendation(gearDescription: "You do not need any specific clothes to stay dry", gearImage: Image(systemName: "hand.thumbsup.fill"))
]


var journeyRecommendations = [
    JourneyRecommendation(minimumPrecipation: 0.0, maximumPrecipation: 0.2, weatherDescription: "No rain in sight! It is safe to go outside", stormyImage: "stormy", gearRecommendations: [gearInventory["Nothing"]!]),
    JourneyRecommendation(minimumPrecipation: 0.3, maximumPrecipation: 1, weatherDescription: "It would appear that you might be caught in a drizzle", stormyImage: "drizzle", gearRecommendations: [gearInventory["Jacket"]!]),
    JourneyRecommendation(minimumPrecipation: 1.1, maximumPrecipation: 2, weatherDescription: "A light rain is expected", stormyImage: "light-rain", gearRecommendations: [gearInventory["Layered clothing"]!,gearInventory["Jacket"]!,gearInventory["Umbrella"]!,gearInventory["Layered clothing"]!]),
    JourneyRecommendation(minimumPrecipation: 2.1, maximumPrecipation: 5, weatherDescription: "A moderate rain is expected", stormyImage: "light-rain", gearRecommendations: [gearInventory["Layered clothing"]!,gearInventory["Raincoat"]!,gearInventory["Umbrella"]!,gearInventory["Backpack"]!,gearInventory["Boots"]!]),
    JourneyRecommendation(minimumPrecipation: 5.1, maximumPrecipation: 10, weatherDescription: "You will be caught in heavy rain", stormyImage: "heavy-rain", gearRecommendations: [gearInventory["Layered clothing"]!,gearInventory["Raincoat"]!,gearInventory["Umbrella"]!,gearInventory["Backpack"]!,gearInventory["Socks"]!,gearInventory["Boots"]!]),
    JourneyRecommendation(minimumPrecipation: 10.1, maximumPrecipation: 1000, weatherDescription: "You will be caught in a very heavy rain/storm", stormyImage: "storm", gearRecommendations: [gearInventory["Stop"]!]),
]


