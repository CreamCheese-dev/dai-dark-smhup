function update_game()
-- defaults
	spr_id=1
	spr(spr_id,xpos, ypos+7)

    for i=#buls,1,-1 do
        local mybul = buls[i]
        mybul.y = mybul.y - bspeed

        if mybul.y<-8 then
            del(buls, mybul)
        end
    end
	
-- score
	score=flr(rnd(128))
	
-- flame animate
	flame=flame+1
	if flame >= 8 then
		flame=4
	end
	
-- muzzle animate
    for i=1,#buls do
        local mybul = buls[i]

	    if mybul.muzzle > 0 then
            -- randomize muzzle flash
		    mybul.muzzle=mybul.muzzle-rnd(2)
        end
	end
	
-- bullet animate
    for i=1,#buls do
        local mybul = buls[i]

        -- cycle thru sprites
        mybul.spr=mybul.spr+1
        if mybul.spr==24 then
            mybul.spr=16
        end
        
    end

	-- bulletspr=bulletspr+1
	-- if bulletspr==24 then
	-- 	bulletspr=16
	-- end

-- fire bullets
    if btnp(❎) then

        local newbul = {}
        newbul.x=xpos
        newbul.y=ypos - 7
        newbul.muzzle=5
        newbul.spr=16
        add(buls, newbul)

	    -- muzzle=5			
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
    -- blink timer
    blink_t=blink_t+1
    if btnp(4) or btnp(5) then
        start_game()
    end
end

function update_over()
    if btnp(4) or btnp(5) then
        mode = "start"
    end

end

function update_splash()
    -- splash timer
    splash_t+=1

    if splash_t == 100 then
        mode = "start"
    end

end
