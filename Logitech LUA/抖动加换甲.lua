-- 甲在盒子内的坐标
points = {
    {14924,42637,5},
    {14924,48225,5},
    {14924,47132,5}
}

EnablePrimaryMouseButtonEvents(true)
turn=0
down=0
function OnEvent(event, arg)
	local offset
	local recovery_offset
	local downcount
	local qwq = IsMouseButtonPressed(3)

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then
        -- 初始化：获取坐标
        x,y = GetMousePosition()
        OutputLogMessage("X: %d || Y: %d\n",x,y)
    end

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then
        -- 开盒子
        PressKey("e")
        Sleep(500)
        ReleaseKey("e")

        -- 点击事件
        for k, v in ipairs(points) do
            Sleep(1)
            MoveMouseTo(v[1], v[2]);
            Sleep(1)
            PressMouseButton(1)
            Sleep(v[3])
            ReleaseMouseButton(1)
        end

        -- 关闭界面
        Sleep(10)
        PressKey("tab")
        ReleaseKey("tab")
    end
    
	if(event== "MOUSE_BUTTON_PRESSED" and arg==1 and IsKeyLockOn("capslock") and qwq==true) then
		downcount=0
        repeat
      OutputLogMessage("%d\n",downcount)
            downcount=downcount+1
            if(downcount<=100 and IsKeyLockOn("capslock")) then
                MoveMouseRelative(0,1)
            end
      --[[
      offset对应抖动的幅度，可以根据自己的灵敏度调整，太小的话没有减少后坐力的效果
      --]]
            offset=math.random(10,11)
            recovery_offset = -offset
            Sleep(2)
            MoveMouseRelative(offset,offset)
            Sleep(2)
            MoveMouseRelative(recovery_offset,recovery_offset)
        until not IsMouseButtonPressed(1)
    end
    --[[
    arg的数字表示鼠标的按键4表示侧键的后退键，5表示前进键，可以设置自己喜欢的按键避免误触
    turn变量对应鼠标的抖动开关
    down变量对应鼠标的下压开关
    --]]
	-- if(event== "MOUSE_BUTTON_PRESSED" and arg==4) then 
	if(event== "MOUSE_BUTTON_PRESSED" and IsKeyLockOn("capslock")) then 
		if(turn==0)	then
			turn=1
		else
			turn=0	
		end
		if(down==0)	then
			down=1
		else
			down=0	
		end
	end

end
