SHELL:= /bin/bash
.PHONY:	configure


build: configure
	ROS_LANG_DISABLE=genlisp:gennodejs:geneus cd catkin_ws && catkin build

install:
	$(RM) -rf catkin_ws/install/share/{catkin_tools_prebuild,roseus}
	install -d $(DESTDIR)/opt/ros/kinetic/
	cp -p -r catkin_ws/install/lib $(DESTDIR)/opt/ros/kinetic
	cp -p -r catkin_ws/install/share $(DESTDIR)/opt/ros/kinetic
	cp -p -r catkin_ws/install/include $(DESTDIR)/opt/ros/kinetic

configure:
	mkdir -p catkin_ws/src
	cd catkin_ws && catkin init --workspace . >/dev/null
	cd catkin_ws && catkin config --install
	cp -r dji_sdk dji_sdk_demo catkin_ws/src

clean:
	$(RM) -rf catkin_ws 

