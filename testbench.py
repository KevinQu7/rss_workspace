import rosbag
from cv_bridge import CvBridge
import cv2

def rosbag_img():
    bag = rosbag.Bag("rgb.bag")
    bridge = CvBridge()

    for topic, msg, t in bag.read_messages(topics="/rgb_camera/image_raw"):
        cv_image = bridge.imgmsg_to_cv2(msg, desired_encoding="bgr8")
        cv2.imshow("img",cv_image)
        cv2.waitKey(0)
        break
    bag.close()
    
def rosbag_data():
    bag = rosbag.Bag("simple_twist_mission.bag")
    
    for topic,msg,t in enumerate(bag.read_messages()):
        position = msg.pose.pose.position
        print(position)

        
if __name__ == "__main__":
    rosbag_data()


