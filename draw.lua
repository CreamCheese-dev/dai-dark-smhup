function draw_game()
    cls()

	animate_stars()

	-- draw ship
	spr(spr_id,xpos,ypos)
	spr(flame,xpos, ypos+8)
    spr(bulletspr,xpos,buly)

	if muzzle>0 then
		circfill(xpos+3,ypos-2,muzzle,7)
	end
	
	--using a bomb
	if btnp(🅾️) and bombs>0 then
		circfill(xpos,ypos,bombs+68,rnd(16))
	end
	
	--hearts ui
	for i=1,4 do
		if lives >= i then
		spr(9,i*9,1)
		else
				spr(10,i*9,1)		
		end
	end
	print("score:"..score,51,1)
	
	--bomb ui
	for i=1,4 do
		if bombs >= i then
		spr(11,i*9+85)
		else
			spr(12,i*9+85)
		end
	end
end

function draw_start()
	cls(1)
	print("dai dark",50,33,rnd(16))
	print("press any key to begin",23,53,blink())
end

function draw_over()
    cls(1)
	print("game over",50,33,rnd(16))
	print("press any key to start again",11,53,rnd(16))
end

function draw_splash()
    cls()
    print("A kabojima productions",20,33, rnd(16))

    -- place holder when making unique splash scrn
    animate_stars()
end

function starfield()
	stars = {}
	for i=1,100 do
		-- create star obj
		local newstar = {}
		newstar.x=rnd(128)
		newstar.y=rnd(128)
		newstar.spd=rnd(1.5)+0.5
		-- add star to arr
		add(stars, newstar)
	end
end

function animate_stars()
    for i=1, #stars do
    local mystar = stars[i]
    local scol = 6

    -- assign color
    if mystar.spd < 1 then
        scol = 1
    elseif mystar.spd >= 1.5 then
        scol = rnd(16)
    end

    -- return star exceeding 128
    if mystar.y > 128 then
        mystar.y = mystar.y - 128
    end

    -- draws star vert
    pset(stars[i].x, stars[i].y, scol)
    mystar.y = mystar.y + mystar.spd
    end
end

function blink()
    local blink_arr = {5,5,6,6,7,7,6,6,5,5}

    if blink_t>#blink_arr then
        blink_t=1
    end

    return blink_arr[blink_t]
end