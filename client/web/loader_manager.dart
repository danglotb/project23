part of ressource_manager;

final String _SPRITES_FOLDER = 'sprites/';

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
		_values = fileContent.split('\n');
		List<String> elem;
	for(var sprite in _values){		
		if(!sprite.startsWith("#") && sprite.length > 2){
				elem = sprite.split(';');
				print("0 : " + elem[0] + '  1 : ' + elem[1] + " 2 :" + elem[2]);	
				_map[elem[0]] = new ImageObject(elem[1].toString(), elem[2].toString(), elem[0].toString());
        		
		}
			
	}

		/*_values = JSON.decode(fileContent);
		print(_values.forEach());
		_values.forEach((k,v) => _map[k.toString()] = new ImageObject(50, 50,_SPRITES_FOLDER + v.toString()));*/
	}
	 
	ImageObject getImage(String imageName){
		return _map[imageName];
	}
	
}

class ImageObject{
	
	String _width;
	String _height;
	ImageElement _img;
	
	ImageObject(String width, String height, String src){
		this._width = width;
		this._height = height;
		this._img = new ImageElement(src: src);
	}
	
	String getWidth(){
		return this._width;
	}
	
	String getHeight(){
		return this._height;
	}
	
	ImageElement getImage(){
		return this._img;
	}
	
}