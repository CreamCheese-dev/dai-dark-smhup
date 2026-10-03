function update_game()

-- defaults
	spr_id=1
	spr(spr_id,xpos, ypos+7)

	buly=buly-bspeed
	
-- score
	score=flr(rnd(128))
	
-- flame animate
	flame=flame+1
	if flame >= 8 then
		flame=4
	end
	
-- muzzle animate
	if muzzle > 0 then
		muzzle=muzzle-2
	end
	
-- bullet animate
	bulletspr=bulletspr+1
	if bulletspr==24 then
		bulletspr=16
	end

-- fire bullets
    if btnp(❎) then
	    bulx=xpos
	    buly=ypos-7
	    muzzle=5			
	    bulletspr=16
	    bullet_sfx=sfx(0)
    end
	
-- controls
	if btn(⬆️) then
		ypos-=2
	end
	if btn(⬇️) then
		ypos+=2
	end
	if btn(⬅️) then
		xpos-=2
		spr_id=2
	end
	if btn(➡️) then
		xpos+=2
		spr_id=3
	end

-- bomb
	if btnp(🅾️) then
		bombs=bombs-1
	end
	
-- border check
	if xpos > 120 then
		xpos=120
	end
	if xpos < 0 then
		xpos=0
	end
	if ypos > 120 then
		ypos=120
	end
	if ypos < 0 then
		ypos=0
	end

end

function update_start()
    if btnp(4) then
        start_game()
    end
end