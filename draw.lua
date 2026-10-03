function draw_game()
	cls()
	starfield()

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
	print(#bullet_arr,50,50)
	end
end