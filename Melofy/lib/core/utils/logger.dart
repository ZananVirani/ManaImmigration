// Define a Logger class to handle logging
class Logger {
  // Static variable to hold the current logging mode
  static LogMode _logMode = LogMode.debug;

  // Static method to initialize the logging mode
  static void init(LogMode mode) {
    Logger._logMode = mode;
  }

  // Static method to log data
  static void log(dynamic data, {StackTrace? stackTrace}) {
    // Check if the current logging mode is debug
    if (_logMode == LogMode.debug) {
      // Print the error message along with the stack trace if available
      print("Error: $data$stackTrace");
    }
  }
}

// Enum to define the logging modes
enum LogMode { debug, live }
