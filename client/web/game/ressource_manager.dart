part of game;

class LoaderManager{
	
	LoaderManager(){
		var dir = new Directory('./web/game/sprites');
		List<html.ImageElement> liste = new List<html.ImageElement>();
		html.ImageElement pic;
		dir.list(recursive: true, followLinks: false)
			.listen((FileSystemEntity entity){
			pic = new html.ImageElement();
			pic.src = entity.path;
			liste.add(pic);
			print(entity.path);
		});
		}
}


class SpriteManager{
	
	
	
}
//
//class RessourceManager{
//	final tile_size = 50;
//	final tileset_width = 200;
//	final tilset_height = 300;
//	
//	List<int> tileset;
//	ImageElement pic;
//	
//	RessourceManager(){
//			this.pic = new ImageElement();
//			pic.src = './Tiles.png';
//			querySelector("p").append(pic);
//			
//	}
//	
//	
//	String toString(){
//		return "toto";
//	}
//	
//}



void main(){
	//RessourceManager rm = new RessourceManager();
	LoaderManager lm = new LoaderManager();
	
}