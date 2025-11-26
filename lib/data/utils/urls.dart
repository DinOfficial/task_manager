class Urls {
  static const String _baseUrl = 'http://35.73.30.144:2005/api/v1';
  static String registration = '$_baseUrl/Registration';
  static String signIn = '$_baseUrl/Login';
  static String createTask = '$_baseUrl/createTask';
  static String profileDetails = '$_baseUrl/ProfileDetails';
  static String newTaskList = '$_baseUrl/listTaskByStatus/New';
  static String progressTaskList = '$_baseUrl/listTaskByStatus/Progress';
  static String cancelledTaskList = '$_baseUrl/listTaskByStatus/Cancelled';
  static String completedTaskList = '$_baseUrl/listTaskByStatus/Completed';
  static String taskCountList = '$_baseUrl/taskStatusCount';

  static String updateTaskStatus(String statusId, String status) =>
      '$_baseUrl/updateTaskStatus/$statusId/$status';
}
