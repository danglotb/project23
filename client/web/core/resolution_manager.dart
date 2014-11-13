part of core;

class ResolutionManager {
	
	static const num RESOLUTION_16_9 = 16/9;
	static const num RESOLUTION_4_3 = 4/3;
	
	static ResolutionManager _instance;
	
	
	utils.Vector2D _scale;
	num _fontSizeRatio;
	num resolutionType;
	
	
	_ResolutionManager() {
		
	}
	
	static utils.Vector2D initialize(utils.Vector2D screenSize) {
		_instance = new ResolutionManager();
		
		num currentRatio = screenSize.x/screenSize.y;
		
		List<num> ratio = [RESOLUTION_16_9, RESOLUTION_4_3];
		
		num bestRatioValue = (currentRatio-ratio.first).abs();
		num bestRatio = ratio.first;
		
		for(int i=1; i<ratio.length; i++) {
			if((currentRatio-ratio.first).abs() < bestRatioValue) {
				bestRatioValue = (currentRatio-ratio.first).abs();
				bestRatio = ratio[i];
			}
		}
		
		_instance.resolutionType = bestRatio;
		
		if(_instance.resolutionType == RESOLUTION_16_9) {
			
		}
		else if(_instance.resolutionType == RESOLUTION_4_3) {
			
		}
		
		return currentRatio < bestRatio ? new utils.Vector2D(screenSize.x, screenSize.x~/bestRatio) : new utils.Vector2D((screenSize.y*bestRatio).toInt(), screenSize.y);
		
	}
	
}