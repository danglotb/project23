part of ui;

class FormatedLabel extends Label {
	
	FormatedLabel(String text, FormatedLabelStyle style) : super(style) {
		//parse(text);
	}
	
	List<FormatedUnit> parse(String text) {
		bool protectedCharacter = false;
		bool inTag = false;
		bool inWord = false;
		int begWord;
		
		RegExp regexAlpha = new RegExp(r"[a-zA-Z]");
		
		for(int i=0; i<text.length; i++) {
			if(protectedCharacter) {
				//do smth
			}
			
			if(text[i] == '\\') {
				protectedCharacter = true;
			}
			else if(regexAlpha.firstMatch(text[i]) != null) {
				if(!inWord) {
					begWord = i;
					inWord = true;
				}
			}
			else {
				if(inWord) {
					//do smth
					inWord = false;
				}
				
				if(text[i] == '[') {
  				if(inTag)
  					throw "Unexpected '['";
  				inTag = true;
  			}
  			else if(text[i] == ']') {
  				if(inTag)
  					throw "Unexpected ']'";
  				inTag = false;
  			}
			}
		}
	}
}

abstract class FormatedUnit {
	
}

class FormatedUnitText {
	
}

class FormatedUnitTextRender {
	
}