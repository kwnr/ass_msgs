std_msgs/Header header

int16 pump_act_rpm
int16 pump_des_rpm
float32 pump_des_cur
float32 pump_temp

int32 track_left_state
int32 track_right_state

float32[16] arm_state
float32[16] ref_state
float32[16] cmd_voltage

float32[16] err
float32[16] err_i
float32[16] err_d

float32 err_norm

float32[3] freq