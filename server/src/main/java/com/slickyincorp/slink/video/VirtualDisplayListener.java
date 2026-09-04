package com.slickyincorp.slink.video;

import com.slickyincorp.slink.control.PositionMapper;

public interface VirtualDisplayListener {
    void onNewVirtualDisplay(int displayId, PositionMapper positionMapper);
}
