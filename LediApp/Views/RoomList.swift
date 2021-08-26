//
//  RoomList.swift
//  RowList
//
//  Created by Juan Diego Ocampo on 8/26/21.
//

import SwiftUI

struct RoomList: View {
    var body: some View {
        NavigationView {
            List(rooms) { room in
                NavigationLink(destination: RoomDetail(room: room)) {
                    RoomRow(room: room)
                }
            }
            .navigationTitle("LediApp")
        }
    }
}


struct RoomList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 12 Pro Max"], id: \.self) { deviceName in
            RoomList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
