//
//  Calendar.swift
//  iClub
//
//  Created by TARUN on 14/11/26.
//



import SwiftUI

struct Calendar: View {

    @State var selectedDate = 24

    let days = Array(1...30)

    let columns = Array(
        repeating: GridItem(.flexible()),
        count: 7
    )

    var body: some View {

        VStack(alignment: .leading, spacing: 25) {

            // Heading
            Text("Calendar")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)

            // Month
            HStack {
                Button("<") { }
                    .foregroundColor(.white)

                Spacer()

                Text("September 2026")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)

                Spacer()

                Button(">") { }
                    .foregroundColor(.white)
            }

            // Week Days
            HStack {
                ForEach(
                    ["S", "M", "T", "W", "T", "F", "S"],
                    id: \.self
                ) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.gray)
                }
            }

            // Calendar
            LazyVGrid(columns: columns, spacing: 15) {

                ForEach(0..<2, id: \.self) { _ in
                    Text("")
                }

                ForEach(days, id: \.self) { day in

                    VStack(spacing: 5) {

                        Text("\(day)")
                            .frame(width: 35, height: 35)
                            .background(
                                selectedDate == day
                                ? Color.purple
                                : Color.clear
                            )
                            .clipShape(Circle())
                            .foregroundColor(.white)

                        if day == 24 || day == 27 {
                            Circle()
                                .fill(Color.purple)
                                .frame(width: 5, height: 5)
                        }
                    }
                    .onTapGesture {
                        selectedDate = day
                    }
                }
            }

            // Events
            Text("THIS MONTH")
                .font(.caption)
                .bold()
                .foregroundColor(.gray)

            if selectedDate == 24 {

                VStack(alignment: .leading, spacing: 10) {

                    Text("Intra-collegiate")
                        .foregroundColor(.green)

                    Text("Hack Night")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)

                    Text("CS Club · September 24 · 6:00 PM")
                        .foregroundColor(.gray)

                    Text("📍 Lab 204 · 38 going")
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
            }

            Spacer()
        }
        .padding()
        .background(Color.black)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    Calendar()
}
