var viewport_width;
var viewport_height;

var nb_object = 1000;

var list_object = new Array();

var current_sum_fps = 0;
var current_nb_fps = 0;
var last_computed_fps = 0;


function init_canvas() {
	var canvas = document.createElement('canvas');

	viewport_width = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
	viewport_height = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);

	canvas.width = viewport_width;
	canvas.height = viewport_height;

	document.body.appendChild(canvas);

	var canvas_context = canvas.getContext("2d");


	var img = new Image;
	img.onload = function() {
	    	draw_canvas(canvas_context, img, viewport_width, viewport_height);
	}
	img.src = 'dart-logo.png';

	for(var i =0; i < nb_object; i++)
		list_object[i] = {id: i, x: Math.random()*(viewport_width-64), y: Math.random()*(viewport_height-64), angle:  Math.random()*Math.PI*2, speed: 2, width: 64, height: 64};

	setInterval(function(){ 
		last_computed_fps = current_sum_fps/current_nb_fps;
		current_sum_fps = 0;
		current_nb_fps = 0;
	}, 1000);
}

function draw_canvas(context, img) {

	
	var start = performance.now();

	context.fillStyle = "#eee";
	context.fillRect(0, 0, viewport_width, viewport_height); 
	
	for(var i =0; i < nb_object; i++) {
		compute_obj(context, img, list_object[i]);
		draw_obj(context, img, list_object[i]);
	}

	var time = performance.now()-start; 
	
	current_sum_fps = 1000/time;
	current_nb_fps++;
	
	context.fillStyle = "#000";
	context.fillText(last_computed_fps+" fps",20,20);

	setTimeout(function(){ draw_canvas(context, img, viewport_width, viewport_height) }, 10);
}

function compute_obj(context, img, obj) {
	obj.x += Math.cos(obj.angle)*obj.speed;
	obj.y += Math.sin(obj.angle)*obj.speed;

	if(obj.x < 0 || obj.x+obj.width > viewport_width) {
		obj.angle = -obj.angle+Math.PI;
	}
	if(obj.y < 0 || obj.y+obj.height > viewport_height) {
		obj.angle = -obj.angle;
	}
/*
	for(var i =0; i < nb_object; i++) {
		if(obj.id != i) {

			if(obj.x > list_object[i].x+list_object[i].width ||  obj.x+obj.width < list_object[i].x || obj.y > list_object[i].y+list_object[i].height ||  obj.y+obj.height < list_object[i].y) {
				continue;
			}

			if(obj.y > list_object[i].y+list_object[i].height && obj.y+obj.height < list_object[i].y) {
				console.log('x collision');
				obj.angle = -obj.angle+Math.PI;
				list_object[i].angle = -list_object[i].angle+Math.PI;
			}
			else {
				console.log('y collision');
				obj.angle = -obj.angle;
				list_object[i].angle = -list_object[i].angle;
			}
		}
	}*/
}

function draw_obj(context, img, obj) {
	context.drawImage(img, obj.x, obj.y, obj.width, obj.height);
}
