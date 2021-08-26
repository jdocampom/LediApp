//
//  RoomDetail.swift
//  RoomDetail
//
//  Created by Juan Diego Ocampo on 8/26/21.
//

import SwiftUI
import SwiftUICharts

struct RoomDetail: View {
    @State private var powerRating: Double = 5
    @State private var costPerWatt: Double = 0.652
    @State private var colourSelection: Double = 0
    @State private var colourArray: [UIColor] = [.systemYellow, .systemGray, .systemRed, .systemGreen, .systemBlue, .systemOrange, .systemPink, .systemPurple, .systemTeal]
    var room: Room
    var body: some View {
        ScrollView {
            MapView(coordinate: room.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage(image: room.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(room.name)
                    .font(.title)
                    .fontWeight(.semibold)
                
                HStack {
                    Text(room.location)
                        .font(.subheadline)
                    Spacer()
                    Text(room.city)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                HStack{
                    VStack(alignment: .leading){
                        Text("Colour")
                            .font(.title2)
                            .fontWeight(.medium)
                        Text("Set Ambient Lighting")
                            .font(.subheadline)
                    }
                    Spacer()
                    Image(systemName: "lightbulb.fill")
                        .foregroundColor(Color(colourArray[Int(colourSelection)]))
                        .font(.system(size: 40))
                }
                Slider(value: $colourSelection, in: 0...8).padding()
                Divider()
                Text("Summary")
                    .font(.title2)
                    .fontWeight(.medium)
                /// Tag: Get Power Comsumption Data
//                let day = Array(room.dailyUsage.keys)
                /// Tag: Create Axes Labels
                let hoursUsed = Legend(color: .orange, label: "Power Usage (W)")
                let dailyPrice = Legend(color: .green, label: "Cost (COP)")
                /// Tag: Format Power Comsumption Data for Plotting
                let dailyConsumption: [DataPoint] = [
                    .init(value: powerRating*Double(room.dailyUsage[0]), label: "Sun", legend: hoursUsed),
                    .init(value: powerRating*Double(room.dailyUsage[1]), label: "Mon", legend: hoursUsed),
                    .init(value: powerRating*Double(room.dailyUsage[2]), label: "Tue", legend: hoursUsed),
                    .init(value: powerRating*Double(room.dailyUsage[3]), label: "Wed", legend: hoursUsed),
                    .init(value: powerRating*Double(room.dailyUsage[4]), label: "Thu", legend: hoursUsed),
                    .init(value: powerRating*Double(room.dailyUsage[5]), label: "Fri", legend: hoursUsed),
                    .init(value: powerRating*Double(room.dailyUsage[6]), label: "Sat", legend: hoursUsed),
                ]
                let dailyCost: [DataPoint] = [
                    .init(value: powerRating*costPerWatt*Double(room.dailyUsage[0]), label: "Sun", legend: dailyPrice),
                    .init(value: powerRating*costPerWatt*Double(room.dailyUsage[1]), label: "Mon", legend: dailyPrice),
                    .init(value: powerRating*costPerWatt*Double(room.dailyUsage[2]), label: "Tue", legend: dailyPrice),
                    .init(value: powerRating*costPerWatt*Double(room.dailyUsage[3]), label: "Wed", legend: dailyPrice),
                    .init(value: powerRating*costPerWatt*Double(room.dailyUsage[4]), label: "Thu", legend: dailyPrice),
                    .init(value: powerRating*costPerWatt*Double(room.dailyUsage[5]), label: "Fri", legend: dailyPrice),
                    .init(value: powerRating*costPerWatt*Double(room.dailyUsage[6]), label: "Sat", legend: dailyPrice),
                ]
                //                var dailyConsumption = [DataPoint]()
                //                var dailyCost = [DataPoint]()
                Section(header: Text("Daily Consumption").font(.subheadline)){
                    BarChartView(dataPoints: dailyConsumption)
                        .padding()
                }
                Section(header: Text("Daily Cost").font(.subheadline)){
                    BarChartView(dataPoints: dailyCost)
                        .padding()
                    
                }
            }.padding()
            .navigationTitle(room.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
    
    
    struct RoomDetail_Previews: PreviewProvider {
        static var previews: some View {
            RoomDetail(room: rooms[0])
        }
    }

