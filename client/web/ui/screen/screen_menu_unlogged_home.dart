part of ui;

class ScreenMenuUnloggedHome extends Container {
	
	
	ScreenMenuUnloggedHome() : super(new BasicContainerStyle(backgroundColor: "#eee")){
		this.setLayout(new VerticalDivideLayout(leftPartFixed: true, leftPartSize: 400));
		
		Container logginPart = new Container();
		logginPart.setLayout(new CenterLayout(width: 380, height: 500));
		
		Container logginPartInner = new Container(new BasicContainerStyle(backgroundColor: "#fff"));
		logginPart.addChild(logginPartInner);
		
		logginPartInner.setLayout(new VerticalPassifLayout());
		
		/*
		Combobox cb = new Combobox(new BasicComboboxStyle());
		cb.setListChoice(['c1', 'c2', 'c3']);
		cb.setSize(new utils.Vector2D(250, 50));
		logginPartInner.addChild(cb);
		*/
		/*
		ScrollBar sb1 = new HorizontalScrollBar(new BasicHorizontalScrollBarStyle());
		sb1.setSize(new utils.Vector2D(250, 20));
		logginPartInner.addChild(sb1);
		
		ScrollBar sb2 = new VerticalScrollBar(new BasicVerticalScrollBarStyle());
		sb2.setSize(new utils.Vector2D(20, 100));
		logginPartInner.addChild(sb2);*/
		
		Container sub1 = new Container();
		sub1.setLayout(new VerticalLayout());
		sub1.setSize(new utils.Vector2D(300, 300));
		TextField tf1 = new TextField(new BasicTextFieldStyle());
		sub1.addChild(tf1);
		
		ScrollPane sp = new ScrollPane(new BasicScrollPaneStyle());
		sp.setContent(sub1);
		sp.setSize(new utils.Vector2D(200, 200));
		logginPartInner.addChild(sp);
		
		
		
		Container logginField = new Container();
		logginField.setLayout(new VerticalPassifLayout());
		logginPartInner.addChild(logginField);
		
		Container loginLBorder = new Container();
		loginLBorder.setLayout(new BorderLayout(bottom : 5));
		
		TextLabel loginL = new TextLabel("Nom de compte", new BasicTextLabelStyle());
		loginL.setTextSize(TextLabel.H2);
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
		passwordL.setTextSize(TextLabel.H2);
		passwordL.setSize(new utils.Vector2D(250, 50));
		passwordLBorder.addChild(passwordL);
		passwordLBorder.pack();
		
		passwordField.addChild(passwordLBorder);
		TextField passwordTF = new TextField(new BasicTextFieldStyle());
		passwordTF.setSize(new utils.Vector2D(250, 50));
		passwordField.addChild(passwordTF);
		
		passwordField.pack();
		
		Button connectionB = new Button.text("Connexion", new BasicButtonStyle());
		connectionB.setSize(new utils.Vector2D(250, 50));
		logginPartInner.addChild(connectionB);
		
		logginPartInner.addChild(new FormatedLabel("Mot de passe oublié ? [url=]récuperer son mot de passe[/url]", new BasicFormatedLabelStyle()));
		
		this.addChild(logginPart);
		
		Container newsPart = new Container();
		newsPart.addChild(new Bidon(new BidonStyle()));
		
		this.addChild(newsPart);
	}
}