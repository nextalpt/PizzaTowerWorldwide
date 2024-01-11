var _type = async_load[? "type"];
if (_type == "video_start") {
    displayVideo = true;
} else if (_type == "video_end") {
	if displayVideo {
		event_user(0);
		video_close();
	}
}