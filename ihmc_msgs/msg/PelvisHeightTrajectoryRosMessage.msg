## PelvisHeightTrajectoryRosMessage
# This mesage commands the controller to move the pelvis to a new height in the trajectory frame while
# going through the specified trajectory points. Sending this command will not affect the pelvis
# horizontal position. To control the pelvis 3D position use the PelvisTrajectoryMessage instead. A
# message with a unique id equals to 0 will be interpreted as invalid and will not be processed by the
# controller. This rule does not apply to the fields of this message.

# List of trajectory points (in taskpsace) to go through while executing the trajectory.
ihmc_msgs/EuclideanTrajectoryPointRosMessage[] taskspace_trajectory_points

# Frame information for this message.
ihmc_msgs/FrameInformationRosMessage frame_information

# Flag that tells the controller whether the use of a custom control frame is requested.
bool use_custom_control_frame

# Pose of custom control frame. This is the frame attached to the rigid body that the taskspace
# trajectory is defined for.
geometry_msgs/Transform control_frame_pose

# When OVERRIDE is chosen:  - The time of the first trajectory point can be zero, in which case the
# controller will start directly at the first trajectory point. Otherwise the controller will prepend
# a first trajectory point at the current desired position.  When QUEUE is chosen:  - The message must
# carry the ID of the message it should be queued to.  - The very first message of a list of queued
# messages has to be an OVERRIDE message.  - The trajectory point times are relative to the the last
# trajectory point time of the previous message.  - The controller will queue the joint trajectory
# messages as a per joint basis. The first trajectory point has to be greater than zero.
uint8 execution_mode

# Only needed when using QUEUE mode, it refers to the message Id to which this message should be
# queued to. It is used by the controller to ensure that no message has been lost on the way. If a
# message appears to be missing (previousMessageId different from the last message ID received by the
# controller), the motion is aborted. If previousMessageId == 0, the controller will not check for the
# ID of the last received message.
int64 previous_message_id

# A unique id for the current message. This can be a timestamp or sequence number. Only the unique id
# in the top level message is used, the unique id in nested messages is ignored. Use
# /output/last_received_message for feedback about when the last message was received. A message with
# a unique id equals to 0 will be interpreted as invalid and will not be processed by the controller.
int64 unique_id


# This message utilizes "enums". Enum value information for this message follows.

# "execution_mode" enum values:
uint8 OVERRIDE=0 # This message will override the previous.
uint8 QUEUE=1 # The previous message will first be executed before executing this message. When sending a series of queued messages, the very first has to be declared as OVERRIDE.

