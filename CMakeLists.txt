cmake_minimum_required(VERSION 3.8)
project(ass_msgs)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
# uncomment the following section in order to fill in
# further dependencies manually.
# find_package(<dependency> REQUIRED)

find_package(std_msgs REQUIRED)
find_package(trajectory_msgs REQUIRED)
find_package(moveit_msgs REQUIRED)
find_package(rosidl_default_generators REQUIRED)

set(msg_files
  "msg/Hold.msg"
  "msg/PoseIteration.msg"
  "msg/Preset.msg"
  "msg/Robot2UI.msg"
  "msg/UIAction.msg"
  "msg/UI2Robot.msg"
  "msg/ArmMasterCommInt.msg"
  "msg/TrajectoryPoint.msg"
  "msg/TrajectoryExecution.msg"
  "msg/TrajectoryEnabled.msg"
  "msg/DXLCommand.msg"
  "msg/ManualVolt.msg"
)
set(srv_files
  "srv/RequestPlan.srv"
)
set(action_files
  "action/RequestExecution.action"
)

rosidl_generate_interfaces(${PROJECT_NAME}
  ${msg_files}
  ${srv_files}
  ${action_files}
  DEPENDENCIES builtin_interfaces std_msgs moveit_msgs trajectory_msgs
)
install(
  FILES master_bridge_mapping_rule.yaml
  DESTINATION share/${PROJECT_NAME})

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # comment the line when a copyright and license is added to all source files
  set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # comment the line when this package is in a git repo and when
  # a copyright and license is added to all source files
  set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()