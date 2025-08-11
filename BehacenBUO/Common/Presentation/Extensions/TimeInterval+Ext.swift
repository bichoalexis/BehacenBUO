    //
    //  TimeInterval+Ext.swift
    //  BehacenBUO
    //
    //  Created by Alexis Lomeli Mejia on 07/08/25.
    //

    import Foundation

    extension TimeInterval {
        func formattedTime() -> String {
            let totalSeconds = Int(self)
            if totalSeconds < 60 {
                return "\(totalSeconds) sec"
            }
            let totalMinutes = totalSeconds / 60
            let hours = totalMinutes / 60
            let minutes = totalMinutes % 60
            
            var components: [String] = []
            if hours > 0 {
                components.append("\(hours) h" + (hours == 1 ? "" : "s"))
            }
            if minutes > 0 {
                components.append("\(minutes) min" + (minutes == 1 ? "" : "s"))
            }
            return components.joined(separator: " ")
        }
    }
