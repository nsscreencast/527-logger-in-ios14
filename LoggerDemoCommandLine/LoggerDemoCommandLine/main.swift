import Foundation
import os.log

let logger = Logger(subsystem: "com.nsscreencast.loggingDemo", category: "demo")
logger.info("This is a log message")

let token = "123abasdfasdf"
// os_log("User logged in with: %{public}s", log: log, type: .info, token)
logger.info("User logged in with: \(token, privacy: .sensitive(mask: .hash))")

let connectionStatus = "connected"
logger.info("Connection status: \(connectionStatus, privacy: .public)")

extension String.StringInterpolation {
    mutating func appendInterpolation(date value: Date, using dateStyle: DateFormatter.Style = .long) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = .none
        let dateString = dateFormatter.string(from: value)
        appendLiteral(dateString)
    }
}

extension OSLogMessage.StringInterpolation {
    mutating func appendInterpolation(date value: Date, using dateStyle: DateFormatter.Style = .long) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = .none
        let dateString = dateFormatter.string(from: value)
        appendLiteral(dateString)
    }
}

let message = "The date is: \(date: Date(), using: .short)"
logger.error("\(message)")
