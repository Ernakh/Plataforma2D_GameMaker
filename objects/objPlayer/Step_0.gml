


//Lê as teclas
//var _keyRight = keyboard_check(ord("D"));
var _keyRight = keyboard_check(vk_right);

//var _keyLeft = keyboard_check(ord("A"));
var _keyLeft = keyboard_check(vk_left);

var _keyJump = keyboard_check_pressed(vk_space);

hsp = (_keyRight - _keyLeft) * (hsp_walk); // move horizontalmente

vsp = vsp + grv; //move verticalmente

if(_keyRight > _keyLeft)
{
	image_xscale=1;
}
else if (_keyRight < _keyLeft)
{
	image_xscale=-1;
}

//if(keyboard_check(vk_left) || keyboard_check(vk_right))
if(hsp > 0 || hsp < 0)
{
	sprite_index = sprtPlayerAndando;
}
else
{
	sprite_index = sprtPlayerParado;
}


//verifica se pode pular
if(can_jump-- > 0 && _keyJump)
{
	vsp = vsp_jump;
	can_jump = 0;
}

//move_and_collide(hsp, vsp, all);

//evita que ele consiga pular quando estiver no ar
if(place_meeting(x + hsp, y, objChao))
{
	//while(abs(hsp) > 0.1)
	{
		//hsp *= 0.5;
		
		if(!place_meeting(x + hsp, y, objChao))
		{
			x += hsp;
		}
	}
	
	//hsp = 0;
}


x += hsp;



if(place_meeting(x, y + vsp, objChao))
{
	if(vsp > 0)
		can_jump = 10;
	
	//while(abs(vsp) > 0.1)
	{
		vsp += 0.5;
		
		if(!place_meeting(x, y + vsp, objChao))
			y += vsp;
	}
	
	vsp = 0;
}

y += vsp;
