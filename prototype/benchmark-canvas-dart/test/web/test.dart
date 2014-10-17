import 'dart:html';
import 'dart:async';
import 'dart:math';

void main() {
  CanvasElement canvas = querySelector("#main-frame");
  scheduleMicrotask(new Window(canvas).initialize);
}

class Window {
  static final int IMG_NUMBER = 1000;
  
  static final int OBJ_WIDTH = 64;
  static final int OBJ_HEIGHT = 64;

  CanvasElement canvas;
  List<ImageObject> objectList;
  
  ImageElement image;
  
  int fps_number_last;
  int fps_number_current;
  
  int fps_average_total;
  int fps_average_number;

  Window(CanvasElement canvas) {
    this.canvas = canvas;
    fps_number_last = 0;
    fps_number_current = 0;
    fps_average_total = 0;
    fps_average_number = 0;
    
  }
  
  
  void initialize() {
    canvas.width =  window.innerWidth;
    canvas.height =  window.innerHeight;
   
   
    objectList = new List(IMG_NUMBER);
    Random rand = new Random();
    
		for(int i=0; i<IMG_NUMBER; i++) {
			objectList[i] = new ImageObject(this, rand.nextInt(canvas.width-OBJ_WIDTH), rand.nextInt(canvas.height-OBJ_HEIGHT), OBJ_WIDTH, OBJ_HEIGHT, rand.nextDouble()*PI, 2.0);
		}
		
		this.image = new ImageElement(src: "dart-logo.png");
    this.image.onLoad.listen((e) {
			draw();
    });
		
    computeFps();
  }
    
	void draw() {
		
		double start_time = window.performance.now();
		
		canvas.context2D..beginPath()
										..fillStyle = "#eee"
										..rect(0, 0, window.innerWidth, window.innerHeight)
										..fill();
		
		for(int i=0; i<IMG_NUMBER; i++) {
			objectList[i].anime();
			objectList[i].draw();
		}
		
		
		fps_number_current++;
	
		canvas.context2D..beginPath()
		   							..fillStyle = "#000"
										..fillText(fps_number_last.toString()+" fps (avg: "+(fps_average_number == 0 ? 0 : fps_average_total~/fps_average_number).toString()+")",20,20);
		
		new Future(draw);
	}
	
	void computeFps() {
		fps_number_last = fps_number_current;
		fps_number_current = 0;
		if(fps_number_last != 0) {
	    fps_average_total += fps_number_last;
	    fps_average_number++;
		}
		new Future.delayed(new Duration(seconds:1), computeFps);
	}
	
	ImageElement get getImage => this.image;
	
	CanvasElement get getCanvas => canvas;
}

class ImageObject {
  
	Window mainFrame;
  num x;
  num y;
  int width;
  int height;
  double angle;
  double speed;
  
  ImageObject(Window window, int x, int y, int width, int height, double angle, double speed) {
  	this.mainFrame = window;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.angle = angle;
    this.speed = speed;
  }
  
  void draw() {
  	mainFrame.getCanvas.context2D.drawImageScaled(mainFrame.getImage, x, y, width, height);
  }
  
  void anime() {
  	x += cos(angle)*speed;
  	y += sin(angle)*speed;

  	if(x < 0 || x+width > window.innerWidth) {
  		angle = -angle+PI;
  	}
  	if(y < 0 || y+height > window.innerHeight) {
  		angle = -angle;
  	}
  }
}