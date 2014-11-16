part of ui;

class ScreenMenuUnloggedHome extends Container {
	
	
	ScreenMenuUnloggedHome() : super(new BasicContainerStyle(backgroundColor: "#eee")){
		this.setLayout(new VerticalDivideLayout(leftPartFixed: true, leftPartSize: 400));
		
		Container logginPart = new Container();
		logginPart.setLayout(new CenterLayout(width: 380, height: 500));
		
		Container logginPartInner = new Container(new BasicContainerStyle(backgroundColor: "#fff"));
		logginPart.addChild(logginPartInner);
		
		logginPartInner.setLayout(new VerticalPassifLayout());
		
		Combobox cbtest = new Combobox(new BasicComboboxStyle());
		cbtest.setSize(new utils.Vector2D(250, 50));
		cbtest.setListChoice(['choice1', 'choice2', 'choice3']);
		logginPartInner.addChild(cbtest);
		
		Container logginField = new Container();
		logginField.setLayout(new VerticalPassifLayout());
		logginPartInner.addChild(logginField);
		
		Container loginLBorder = new Container();
		loginLBorder.setLayout(new BorderLayout(bottom : 5));
		
		TextLabel loginL = new TextLabel("Nom de compte", new BasicTextLabelStyle());
		loginL.setSize(new utils.Vector2D(250, 50));
		loginLBorder.addChild(loginL);
		loginLBorder.pack();

		logginField.addChild(loginLBorder);
		TextField loginTF = new TextField(new BasicTextFieldStyle());
		loginTF.setSize(new utils.Vector2D(250, 50));
		logginField.addChild(loginTF);
		logginField.pack();
		
		Container passwordField = new Container();
		passwordField.setLayout(new VerticalPassifLayout());
		logginPartInner.addChild(passwordField);		
		
		Container passwordLBorder = new Container();
		passwordLBorder.setLayout(new BorderLayout(bottom : 5));
		
		TextLabel passwordL = new TextLabel("Mot de passe", new BasicTextLabelStyle());
		passwordL.setSize(new utils.Vector2D(250, 50));
		passwordLBorder.addChild(passwordL);
		passwordLBorder.pack();
		
		passwordField.addChild(passwordLBorder);
		TextField passwordTF = new TextField(new BasicTextFieldStyle());
		passwordTF.setSize(new utils.Vector2D(250, 50));
		passwordField.addChild(passwordTF);
		
		passwordField.pack();
		
		Button connectionB = new Button("Connexion", new BasicButtonStyle());
		connectionB.setSize(new utils.Vector2D(250, 50));
		logginPartInner.addChild(connectionB);
		
		this.addChild(logginPart);
		
		Container newsPart = new Container();
		newsPart.addChild(new Bidon(new BidonStyle()));
		
		this.addChild(newsPart);
	}
}