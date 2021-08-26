//
//  RoomRow.swift
//  RoomRow
//
//  Created by Juan Diego Ocampo on 8/26/21.
//

import SwiftUI

struct RoomRow: View {
    var room: Room
    var body: some View {
        HStack {
            room.icon
//            Image(systemName: "bed.double")
                .resizable()
                .frame(width: 32, height: 32)
                .cornerRadius(10)
            Text(room.name)
            
            Spacer()
        }
    }
}

struct RoomRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RoomRow(room: rooms[0])
            RoomRow(room: rooms[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
