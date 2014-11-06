part of ui;

class ScreenMenuUnlogged extends Container {
	
	static const int SCREEN_HOME = 1;
	static const int SCREEN_SIGNUP = 2;
	
	int _currentScreen;
	
	
	Button _homeButton;
	Button _signupButton;
	
	ScreenMenuUnlogged() : super(new BasicContainerStyle(backgroundColor: "#444")) {
		setScreen(SCREEN_HOME);
	}
		

	
	void setScreen(int screen) {
		this._currentScreen = screen;
		
		//clear
		this.clearChild();
		
		this.setLayout(new VerticalDivideLayout(leftPartFixed: true, leftPartSize: 200));
		
		//left part : button list
		Container mainLeftPart = new Container();
		mainLeftPart.setLayout(new VerticalGapLayout());
		
		Container upButtonMenu = new Container();
		upButtonMenu.setLayout(new VerticalLayout());
		
		this._homeButton = new Button("Accueil", new MenuButtonStyle(screen == SCREEN_HOME));
		this._homeButton.addClickListener((source) {
			if(this._currentScreen != SCREEN_HOME)
			setScreen(SCREEN_HOME);
		});
		upButtonMenu.addChild(this._homeButton);
		this._signupButton = new Button("Inscription", new MenuButtonStyle(screen == SCREEN_SIGNUP));
		this._signupButton.addClickListener((source) {
			if(this._currentScreen != SCREEN_SIGNUP)
			setScreen(SCREEN_SIGNUP);
		});
		upButtonMenu.addChild(this._signupButton);
		
		mainLeftPart.addChild(upButtonMenu);
		
		Container downButtonMenu = new Container();
		downButtonMenu.setLayout(new VerticalLayout());
		downButtonMenu.addChild(new Button("Aide", new MenuButtonStyle(false)));
		downButtonMenu.addChild(new Button("A propros", new MenuButtonStyle(false)));
		mainLeftPart.addChild(downButtonMenu);
		
		
		addChild(mainLeftPart);
		
		switch(screen) {
			case SCREEN_HOME:
				addChild(new ScreenMenuUnloggedHome());
				break;
		}
		
		validate();
	}
}