part of ressource_manager;


class SpriteManager{
	ImageElement _pic;
  LoaderManager _lm;
	
	SpriteManager(String spriteName, int sprite){
		this._lm = new LoaderManager();
		_pic = _lm.getImage(spriteName);
	}
	
	
}