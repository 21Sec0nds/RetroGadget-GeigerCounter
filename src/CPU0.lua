local scale = gdt.Gauge0
local score = gdt.SegmentDisplay0
local butt = gdt.Knob0
local audio:AudioChip = gdt.AudioChip0
local sample:AudioSample = gdt.ROM.User.AudioSamples["Gaiger"]
local disp = gdt.SegmentDisplay0


function update()
	 
if butt.Value > -50 then
	gdt.Led0.State = true
	else
		gdt.Led0.State = false
end	
if butt.Value > 0 then
	gdt.Led1.State = true
	else
		gdt.Led1.State = false
end	
if butt.Value > 50 then
	gdt.Led2.State = true
	else
		gdt.Led2.State = false
end	
if butt.Value > 99 then
	gdt.Led3.State = true
	
	else
		gdt.Led3.State = false
end	 
    if butt.Value > 99 then
    disp:ShowDigit(1, 9)
    disp:ShowDigit(2, 9)
    disp:ShowDigit(3, 9)
    disp:ShowDigit(4, 9)
else
    disp:ShowDigit(1, (butt.Value - 1) / 10)
    disp:ShowDigit(2, butt.Value / 15)
    disp:ShowDigit(3, butt.Value / 25)
    disp:ShowDigit(4, butt.Value / 35)
end
gdt.Gauge0.Value = butt.Value

 if butt.Value > 50 then
 if not audio:IsPlaying(1) then
 audio:PlayLoop(sample, 1)
 isPlaying = true 
 end
    else
    if isPlaying then
    audio:Stop(1) 
    isPlaying = false  
    end
end
	


        
   
end
	