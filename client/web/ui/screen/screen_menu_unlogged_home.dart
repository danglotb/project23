part of ui;

class ScreenMenuUnloggedHome extends Container {
	
	
	ScreenMenuUnloggedHome() : super(new BasicContainerStyle(backgroundColor: "#eee")){
		this.setLayout(new VerticalDivideLayout(leftPartFixed: true, leftPartSize: 400));
		
		Container logginPart = new Container();
		logginPart.setLayout(new CenterLayout(width: 380, height: 500));
		
		Container logginPartInner = new Container(new BasicContainerStyle(backgroundColor: "#fff"));
		logginPart.addChild(logginPartInner);
		
		logginPartInner.setLayout(new VerticalPassifLayout());
		
		ScrollPane sc = new ScrollPane(new BasicScrollPaneStyle());
		
		TextArea ta = new TextArea("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a diam dictum, posuere velit quis, posuere augue. Quisque sem nulla, facilisis a hendrerit quis, porta ac metus. Suspendisse vulputate facilisis eros, dapibus malesuada neque dignissim sit amet. Aliquam eleifend velit arcu, vitae suscipit massa faucibus ac. Ut dictum dui ac finibus tempor. Praesent pretium tristique convallis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam congue pretium suscipit. Phasellus id lectus non ligula convallis sollicitudin. Duis tincidunt ligula non molestie eleifend. Duis imperdiet felis vitae leo fermentum feugiat. Donec non lectus sem. Sed eu lorem a augue viverra efficitur non nec neque.", new BasicTextAreaStyle());
		ta.setSize(new utils.Vector2D(220, 500));
		sc.setContent(ta);
		sc.setSize(new utils.Vector2D(250, 200));
		logginPartInner.addChild(sc);
		
		
		Container logginField = new Container();
		logginField.setLayout(new VerticalPassifLayout());
		logginPartInner.addChild(logginField);
		
		Container loginLBorder = new Container();
		loginLBorder.setLayout(new BorderLayout(bottom : 5));
		
		Text loginL = new Text("Nom de compte", new BasicTextStyle(textSize: BasicTextStyle.TEXT_SIZE_H2));
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
		
		Text passwordL = new Text("Mot de passe", new BasicTextStyle(textSize: BasicTextStyle.TEXT_SIZE_H2));
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

		this.addChild(newsPart);
	}
}