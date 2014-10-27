part of ressource_manager;

class LoaderManager{
	var _values;
	Map<String, ImageElement> _map;
	ImageElement _pic;
	
	LoaderManager(){
		_map = new Map<String, ImageElement>();
		_pic = new ImageElement();
		HttpRequest.getString('sprites.json')
		.then(processString);
	}
	
	 processString(String stringName){
		_values = JSON.decode(stringName);
		_values.forEach((k,v) => print(v.toString()));
		_values.forEach((k,v) => _pic.src = v.toString());
		_values.forEach((k,v) => _map[k.toString()] = _pic);
	}
	 
	ImageElement getImage(String imageName){
		return _map[imageName];
	}
	
	
	
	
}