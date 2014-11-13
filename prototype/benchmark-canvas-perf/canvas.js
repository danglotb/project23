

function init_canvas() {
	var nb_object_x = 100;
	var nb_object_y = 100;

	var viewport_width;
	var viewport_height;

	var canvas_context;

	var object_width;
	var object_height;
	
	var canvas = document.getElementByID('canvas');

	viewport_width = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
	viewport_height = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);

	canvas.width = viewport_width;
	canvas.height = viewport_height;
	
	object_width = (viewport_width/nb_object_x) | 0;
	object_height = (viewport_height/nb_object_y) | 0;

	document.body.appendChild(canvas);

	canvas_context = canvas.getContext("2d");
	
	console.log("START");
}

function test_base() {
	canvas_context.fillStyle = "#f00";
	canvas_context.strokeStyle = "#000";
	canvas_context.lineWidth = 1;
	for(var i=0; i<nb_object_x; i++) {
		for(var j=0; j<nb_object_y; j++) {
			canvas_context.rect(object_width*i, object_height*j, object_width, object_height);
			canvas_context.fill();
			canvas_context.stroke();
		}
	}
}

function test_clip() {
	canvas_context.fillStyle = "#f00";
	canvas_context.strokeStyle = "#000";
	canvas_context.lineWidth = 1;
	for(var i=0; i<nb_object_x; i++) {
		for(var j=0; j<nb_object_y; j++) {
			canvas_context.save();
			canvas_context.rect(object_width*i, object_height*j, object_width, object_height);
			canvas_context.clip();
			canvas_context.fill();
			canvas_context.stroke();
			canvas_context.restore();
		}
	}
}

