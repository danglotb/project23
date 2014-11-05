part of ui;

class ScreenMenuUnloggedHome extends Container {
	
	
	ScreenMenuUnloggedHome() : super(new BasicContainerStyle(backgroundColor: "#eee")){
		this.setLayout(new VerticalDivideLayout(leftPartFixed: true, leftPartSize: 400));
		
		Container logginPart = new Container();
		logginPart.setLayout(new CenterLayout(width: 400, height: 500));
		
		Container logginPartInner = new Container(new BasicContainerStyle(backgroundColor: "#ddd"));
		logginPart.addChild(logginPartInner);
		
		logginPartInner.setLayout(new VerticalPassifLayout());
		TextLabel loginL = new TextLabel("Nom de compte", new BasicTextLabelStyle());
		loginL.setSize(new utils.Vector2D(250, 50));
		TextField loginTF = new TextField(new BasicTextFieldStyle());
		loginTF.setSize(new utils.Vector2D(250, 50));
		logginPartInner.addChild(loginTF);
		TextField passwordTF = new TextField(new BasicTextFieldStyle());
		passwordTF.setSize(new utils.Vector2D(250, 50));
		logginPartInner.addChild(passwordTF);
		Button connectionB = new Button("Connexion", new BasicButtonStyle());
		connectionB.setSize(new utils.Vector2D(250, 50));
		logginPartInner.addChild(connectionB);
		
		this.addChild(logginPart);
		
		Container newsPart = new Container();
		newsPart.addChild(new Bidon(new BidonStyle()));
		
		this.addChild(newsPart);
	}
}