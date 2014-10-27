part of ressource_manager;

final _SPRITES_FOLDER = 'sprites/';

class LoaderManager{
	var _values;
	Map<String, ImageObject> _map;
	ImageElement _pic;
	
	
	LoaderManager(){
		_map = new Map<String, ImageObject>();
		_pic = new ImageElement();
		HttpRequest.getString('sprites.json')
		.then(processString);
	}
	
	 processString(String fileContent){
		print(fileContent.toString());
		_values = JSON.decode(fileContent);
		print(_values.forEach());
		_values.forEach((k,v) => _map[k.toString()] = new ImageObject(50, 50,_SPRITES_FOLDER + v.toString()));
	}
	 
	ImageObject getImage(String imageName){
		return _map[imageName];
	}
	
}

class ImageObject{
	
	int _width;
	int _height;
	ImageElement _img;
	
	ImageObject(int width, int height, String src){
		this._width = width;
		this._height = height;
		this._img = new ImageElement(src: src);
	}
	
	int getWidth(){
		return this._width;
	}
	
	int getHeight(){
		return this._height;
	}
	
	ImageElement getImage(){
		return this._img;
	}
	
}