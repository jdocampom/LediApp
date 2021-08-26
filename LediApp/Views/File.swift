////
////  ContentView.swift
////  LediApp
////
////  Created by Juan Diego Ocampo on 8/25/21.
////
//
//import SwiftUI
//import SwiftUICharts
//
//struct File: View {
//    /// Tag: Variables
//    @State private var powerRating: Double = 5
//    @State private var costPerWatt: Double = 0.652
//    @State private var colourSelection: Double = 0
//    @State private var colourList: [String] = ["Yellow", "White", "Red", "Green", "Blue", "Orange", "Pink", "Purple", "Teal"]
//
//
//
//    @State private var colourArray: [UIColor] = [.systemYellow, .systemGray, .systemRed, .systemGreen, .systemBlue, .systemOrange, .systemPink, .systemPurple, .systemTeal]
//    /// Tag: Main View
//    var body: some View {
//        VStack {
//            MapView()
//                .ignoresSafeArea(edges: .top)
//                .frame(height: 300)
//
//            CircleImage()
//                .offset(y: -130)
//                .padding(.bottom, -130)
//
//            VStack(alignment: .leading) {
//                Text("Master Bedroom")
//                    .font(.largeTitle)
//                    .fontWeight(.semibold)
//
//                HStack {
//                    Text("Home")
//                    Spacer()
//                    Text("Bogotá")
//                }
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//                Divider()
//                ScrollView{
//                    VStack(alignment: .leading){
//                        HStack{
//                            VStack(alignment: .leading){
//                                Text("Colour")
//                                    .font(.title2)
//                                    .fontWeight(.medium)
//                                Text("Set Ambient Lighting")
//                                    .font(.body)
//                            }
//                            Spacer()
//                            Image(systemName: "lightbulb.fill")
//                                .foregroundColor(Color(colourArray[Int(colourSelection)]))
//                                .font(.system(size: 40))
//                        }
//                        Slider(value: $colourSelection, in: 0...8)
//                        Divider()
//                        Spacer()
//                        VStack(alignment: .leading){
//                            Text("Summary")
//                                .font(.title2)
//                                .fontWeight(.medium)
//                            // Legend (Graph)
//                            let hoursUsed = Legend(color: .orange, label: "Power Consumption (in W)")
//                            let dailyPrice = Legend(color: .green, label: "Cost (in COP)")
//                            // Data Points (Graph)
//                            let dailyConsumption: [DataPoint] = [
//                                .init(value: powerRating * 7.3, label: "Sun", legend: hoursUsed),
//                                .init(value: powerRating * 6.7, label: "Mon", legend: hoursUsed),
//                                .init(value: powerRating * 8.2, label: "Tue", legend: hoursUsed),
//                                .init(value: powerRating * 7.0, label: "Wed", legend: hoursUsed),
//                                .init(value: powerRating * 9.4, label: "Thu", legend: hoursUsed),
//                                .init(value: powerRating * 8.0, label: "Fri", legend: hoursUsed),
//                                .init(value: powerRating * 6.1, label: "Sat", legend: hoursUsed),
//                            ]
//                            let dailyCost: [DataPoint] = [
//                                .init(value: powerRating*7.3*costPerWatt, label: "Sun", legend: dailyPrice),
//                                .init(value: powerRating*6.7*costPerWatt, label: "Mon", legend: dailyPrice),
//                                .init(value: powerRating*8.2*costPerWatt, label: "Tue", legend: dailyPrice),
//                                .init(value: powerRating*7.0*costPerWatt, label: "Wed", legend: dailyPrice),
//                                .init(value: powerRating*9.4*costPerWatt, label: "Thu", legend: dailyPrice),
//                                .init(value: powerRating*8.0*costPerWatt, label: "Fri", legend: dailyPrice),
//                                .init(value: powerRating*6.1*costPerWatt, label: "Sat", legend: dailyPrice),
//                            ]
//                            // Graphs
//                            /*
//                             BarChartView(data: ChartData(values: [
//                             (powerRating * 7.3 * 0.56, 1),
//                             (powerRating * 7.3 * 0.56, 1),
//                             (powerRating * 7.3 * 0.56, 1),
//                             (powerRating * 7.3 * 0.56, 1),
//                             (powerRating * 7.3 * 0.56, 1),
//                             (powerRating * 7.3 * 0.56, 1),
//                             (powerRating * 7.3 * 0.56, 1),
//                             ]
//                             ), title = "Test")
//                             */
//                            Section(header: Text("Daily Consumption")){
//                                BarChartView(dataPoints: dailyConsumption)
//                                    .padding()
//                            }
//                            Spacer()
//
//                            Section(header: Text("Daily Cost")){
//                                BarChartView(dataPoints: dailyCost)
//                                    .padding()
//                            }
//                        }
//                    }
//                }
//
//            }
//            .padding()
//            Spacer()
//        }
//    }
//}
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
