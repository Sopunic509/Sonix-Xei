package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.tweens.FlxTween;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;

using StringTools;

class GalleryState extends MusicBeatState
{
	#if ACHIEVEMENTS_ALLOWED
	var options:Array<String> = [];
	private var grpOptions:FlxTypedGroup<Alphabet>;
	private static var curSelected:Int = 0;
	private var achievementIndex:Array<Int> = [];
	private var descText:FlxText;
	private var artistText:FlxText;
	var txtbg:FlxSprite;

	var sprite1:FlxSprite;
	var sprite2:FlxSprite;
	var sprite3:FlxSprite;
    var sprite4:FlxSprite;
	var sprite5:FlxSprite;
    var sprite6:FlxSprite;
	var sprite7:FlxSprite;
	var sprite8:FlxSprite;
	var sprite9:FlxSprite;
	var sprite10:FlxSprite;
    var sprite11:FlxSprite;
	var sprite12:FlxSprite;
    var sprite13:FlxSprite;
    var sprite14:FlxSprite;
	var sprite15:FlxSprite;
    var sprite16:FlxSprite;
    var sprite18:FlxSprite;
	var sprite19:FlxSprite;
    var sprite20:FlxSprite;
    var sprite21:FlxSprite;
	var sprite22:FlxSprite;
    var sprite23:FlxSprite;
	var ui1:FlxSprite;
	var ui2:FlxSprite;

	override function create() {
		#if desktop
		DiscordClient.changePresence("Gallery Menu", null);
		#end

		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('fanarts/bg'));
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = ClientPrefs.globalAntialiasing;
		add(menuBG);

		sprite1 = new FlxSprite();
		sprite1.loadGraphic(Paths.image('fanarts/fanart-collab'));
		sprite1.x = 200;
		sprite1.setGraphicSize(Std.int(sprite1.width * 0.7));
		sprite1.screenCenter();
		add(sprite1);
		sprite2 = new FlxSprite();
		sprite2.loadGraphic(Paths.image('fanarts/fanart-late'));
		sprite2.x = 1500;
		sprite2.setGraphicSize(Std.int(sprite2.width * 0.5));
		sprite2.screenCenter();
		add(sprite2);
		sprite3 = new FlxSprite();
		sprite3.loadGraphic(Paths.image('fanarts/fanart-old'));
		sprite3.setGraphicSize(Std.int(sprite3.width * 0.8));
		sprite3.screenCenter();
		sprite3.x = 1500;
		add(sprite3);
		sprite4 = new FlxSprite();
		sprite4.loadGraphic(Paths.image('fanarts/fanart-sus'));
		sprite4.setGraphicSize(Std.int(sprite4.width * 1));
		sprite4.screenCenter();
		sprite4.x = 1500;
		add(sprite4);
	    sprite5 = new FlxSprite();
		sprite5.loadGraphic(Paths.image('fanarts/fanart-knuckles'));
		sprite5.setGraphicSize(Std.int(sprite5.width * 0.16));
		sprite5.screenCenter();
		sprite5.x = 1500;
		add(sprite5);
		sprite6 = new FlxSprite();
		sprite6.loadGraphic(Paths.image('fanarts/fanart-fly'));
		sprite6.setGraphicSize(Std.int(sprite6.width * 0.5));
		sprite6.screenCenter();
		sprite6.x = 1500;
		add(sprite6);
		sprite7 = new FlxSprite();
		sprite7.loadGraphic(Paths.image('fanarts/fanart-irl'));
		sprite7.setGraphicSize(Std.int(sprite7.width * 0.5));
		sprite7.screenCenter();
		sprite7.x = 1500;
		add(sprite7);
		sprite8 = new FlxSprite();
		sprite8.loadGraphic(Paths.image('fanarts/fanart-cream'));
		sprite8.x = 1500;
		sprite8.setGraphicSize(Std.int(sprite8.width * 0.9));
		sprite8.screenCenter();
		add(sprite8);
		sprite9 = new FlxSprite();
		sprite9.loadGraphic(Paths.image('fanarts/fanart-prototype'));
		sprite9.setGraphicSize(Std.int(sprite9.width * 1));
		sprite9.screenCenter();
		sprite9.x = 1500;
		add(sprite9);
		sprite10 = new FlxSprite();
		sprite10.loadGraphic(Paths.image('fanarts/fanart-amy'));
		sprite10.setGraphicSize(Std.int(sprite10.width * 0.3));
		sprite10.screenCenter();
		sprite10.x = 1500;
		add(sprite10);
	    sprite11 = new FlxSprite();
		sprite11.loadGraphic(Paths.image('fanarts/fanart-sally'));
		sprite11.setGraphicSize(Std.int(sprite11.width * 0.6));
		sprite11.screenCenter();
		sprite11.x = 1500;
		add(sprite11);
		sprite12 = new FlxSprite();
		sprite12.loadGraphic(Paths.image('fanarts/fanart-sketch'));
		sprite12.setGraphicSize(Std.int(sprite12.width * 0.5));
		sprite12.screenCenter();
		sprite12.x = 1500;
		add(sprite12);
		sprite13 = new FlxSprite();
		sprite13.loadGraphic(Paths.image('fanarts/fanart-drama'));
		sprite13.setGraphicSize(Std.int(sprite13.width * 1));
		sprite13.screenCenter();
		sprite13.x = 1500;
		add(sprite13);
		sprite14 = new FlxSprite();
		sprite14.loadGraphic(Paths.image('fanarts/fanart-sonic-on-da-wii'));
		sprite14.setGraphicSize(Std.int(sprite14.width * 1));
		sprite14.screenCenter();
		sprite14.x = 1500;
		add(sprite14);
		sprite15 = new FlxSprite();
		sprite15.loadGraphic(Paths.image('fanarts/fanart-place-order'));
		sprite15.setGraphicSize(Std.int(sprite15.width * 0.5));
		sprite15.screenCenter();
		sprite15.x = 1500;
		add(sprite15);
		sprite16 = new FlxSprite();
		sprite16.loadGraphic(Paths.image('fanarts/fanarts-200-followers'));
		sprite16.setGraphicSize(Std.int(sprite16.width * 1));
		sprite16.screenCenter();
		sprite16.x = 1500;
		add(sprite16);
	    sprite18 = new FlxSprite();
		sprite18.loadGraphic(Paths.image('fanarts/fanart-bf'));
		sprite18.setGraphicSize(Std.int(sprite18.width * 0.6));
		sprite18.screenCenter();
		sprite18.x = 1500;
		add(sprite18);
		sprite19 = new FlxSprite();
		sprite19.loadGraphic(Paths.image('fanarts/fanart-chad'));
		sprite19.setGraphicSize(Std.int(sprite19.width * 0.5));
		sprite19.screenCenter();
		sprite19.x = 1500;
		add(sprite19);
		sprite20 = new FlxSprite();
		sprite20.loadGraphic(Paths.image('fanarts/fanart-xeno'));
		sprite20.setGraphicSize(Std.int(sprite20.width * 0.6));
		sprite20.screenCenter();
		sprite20.x = 1500;
		add(sprite20);
		sprite21 = new FlxSprite();
		sprite21.loadGraphic(Paths.image('fanarts/fanart-sexx'));
		sprite21.setGraphicSize(Std.int(sprite21.width * 0.6));
		sprite21.screenCenter();
		sprite21.x = 1500;
		add(sprite21);
		sprite22 = new FlxSprite();
		sprite22.loadGraphic(Paths.image('fanarts/fanart-sex'));
		sprite22.setGraphicSize(Std.int(sprite22.width * 0.7));
		sprite22.screenCenter();
		sprite22.x = 1500;
		add(sprite22);
		sprite23 = new FlxSprite();
		sprite23.loadGraphic(Paths.image('fanarts/fanart-uno'));
		sprite23.setGraphicSize(Std.int(sprite23.width * 1));
		sprite23.screenCenter();
		sprite23.x = 1500;
		add(sprite23);

		var uibg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('fanarts/ui1'));
		uibg.setGraphicSize(Std.int(uibg.width * 1.1));
		uibg.updateHitbox();
		uibg.screenCenter();
		uibg.antialiasing = ClientPrefs.globalAntialiasing;
		add(uibg);
		var arrbg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('fanarts/ui2'));
		arrbg.setGraphicSize(Std.int(arrbg.width * 1.1));
		arrbg.updateHitbox();
		arrbg.screenCenter();
		arrbg.antialiasing = ClientPrefs.globalAntialiasing;
		add(arrbg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...options.length) {
			var achieveName:String = Achievements.achievementsStuff[achievementIndex[i]][2];
			var optionText:Alphabet = new Alphabet(0, (100 * i) + 210, Achievements.isAchievementUnlocked(achieveName) ? Achievements.achievementsStuff[achievementIndex[i]][0] : '?', false, false);
			optionText.isMenuItem = true;
			optionText.x += 280;
			optionText.xAdd = 200;
			optionText.targetY = i;
			grpOptions.add(optionText);

		}

		descText = new FlxText(150, 650, 980, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);
		changeSelection();

		artistText = new FlxText(150, 50, 980, "", 32);
		artistText.setFormat(Paths.font("vcr.ttf"), 46, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		artistText.scrollFactor.set();
		artistText.screenCenter(X);
		artistText.borderSize = 2.4;
		add(artistText);

		super.create();
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (controls.UI_LEFT_P) {
			curSelected -= 1;
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		}
		if (controls.UI_RIGHT_P) {
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			curSelected += 1;
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		if (curSelected == 0){
			FlxTween.tween(sprite1, { x: 0}, 0.5);
			FlxTween.tween(sprite2, { x: 1500}, 0.5);
			FlxTween.tween(sprite23, { x: 1500}, 0.01);
			FlxTween.tween(sprite8, { x: 1500}, 0.01);
			artistText.text = "Made by : Explo";
			descText.text = "Epic Collab";
			if (controls.UI_LEFT_P) {
				curSelected = 12;
			}
		}
		if (curSelected == 1){
			FlxTween.tween(sprite1, { x: 1500}, 0.5);
			FlxTween.tween(sprite2, { x: -350}, 0.5);
			FlxTween.tween(sprite3, { x: 1500}, 0.5);
			artistText.text = "Made by : Yaboijak";
			descText.text = "Not Too Late";
		}
		if (curSelected == 2){
			FlxTween.tween(sprite2, { x: 1500}, 0.5);
			FlxTween.tween(sprite3, { x: 150}, 0.5);
			FlxTween.tween(sprite4, { x: 1500}, 0.5);
			artistText.text = "Made by : Explo";
			descText.text = "Old Thumbnail";
		}
		if (curSelected == 3){
			FlxTween.tween(sprite3, { x: 1500}, 0.5);
			FlxTween.tween(sprite4, { x: 450}, 0.5);
			FlxTween.tween(sprite5, { x: 1500}, 0.5);
			artistText.text = "Made by : The Reda Show";
			descText.text = "When The Knuckles Is Sus !!??";
		}
		if (curSelected == 4){
			FlxTween.tween(sprite4, { x: 1500}, 0.5);
			FlxTween.tween(sprite5, { x: -800}, 0.5);
			FlxTween.tween(sprite6, { x: 1500}, 0.5);
			artistText.text = "Made by : NeonZeneration";
			descText.text = "Old Knuckles.Exe";
		}
		if (curSelected == 5){
			FlxTween.tween(sprite5, { x: 1500}, 0.5);
			FlxTween.tween(sprite6, { x: -100}, 0.5);
			FlxTween.tween(sprite7, { x: 1500}, 0.5);
			artistText.text = " ";
			descText.text = "Fly-Away Concept";
		}
		if (curSelected == 6){
			FlxTween.tween(sprite6, { x: 1500}, 0.5);
			FlxTween.tween(sprite7, { x: -150}, 0.5);
			FlxTween.tween(sprite8, { x: 1500}, 0.5);
			artistText.text = "Made by : The Reda Show";
			descText.text = "IRL SMV5 ???";
		}
		if (curSelected == 7){
			FlxTween.tween(sprite7, { x: 1500}, 0.5);
			FlxTween.tween(sprite8, { x: 250}, 0.5);
			FlxTween.tween(sprite9, { x: 1500}, 0.5);
			artistText.text = "Made by : Casanova";
			descText.text = "Cream.Exe teaser";
		}
		if (curSelected == 8){
			FlxTween.tween(sprite8, { x: 1500}, 0.5);
			FlxTween.tween(sprite9, { x: 300}, 0.5);
			FlxTween.tween(sprite10, { x: 1500}, 0.5);
			artistText.text = " ";
			descText.text = "Tails.Exe prototype";
		}
		if (curSelected == 9){
			FlxTween.tween(sprite9, { x: 1500}, 0.5);
			FlxTween.tween(sprite10, { x: -250}, 0.5);
			FlxTween.tween(sprite11, { x: 1500}, 0.5);
			artistText.text = " ";
			descText.text = "Amy prototype";
		}
		if (curSelected == 10){
			FlxTween.tween(sprite10, { x: 1500}, 0.5);
			FlxTween.tween(sprite11, { x: 300}, 0.5);
			FlxTween.tween(sprite12, { x: 1500}, 0.5);
			artistText.text = " ";
			descText.text = "Sally Beta";
		}
		if (curSelected == 11){
			FlxTween.tween(sprite11, { x: 1500}, 0.5);
			FlxTween.tween(sprite12, { x: 0}, 0.5);
			FlxTween.tween(sprite13, { x: 1500}, 0.5);
			artistText.text = "Made by : Toxxen Z";
			descText.text = "Volcano Valley ????";
		}
		if (curSelected == 12){
			FlxTween.tween(sprite12, { x: 1500}, 0.5);
			FlxTween.tween(sprite13, { x: 500}, 0.5);
			FlxTween.tween(sprite14, { x: 1500}, 0.5); 
			artistText.text = "Made by : Explo";
			descText.text = "SMV5 when he see a new fnf drama";
		}
		if (curSelected == 13){
			FlxTween.tween(sprite13, { x: 1500}, 0.5);
			FlxTween.tween(sprite14, { x: 500}, 0.5);
			FlxTween.tween(sprite15, { x: 1500}, 0.5);
			artistText.text = "Made by : Junin";
			descText.text = "Yo wanna play Wii ?";
		}
		if (curSelected == 14){
			FlxTween.tween(sprite14, { x: 1500}, 0.5);
			FlxTween.tween(sprite15, { x: 0}, 0.5);
			FlxTween.tween(sprite16, { x: 1500}, 0.5);
			artistText.text = "Made by : Junin";
			descText.text = "Place order logo";
		}
		if (curSelected == 15){
			FlxTween.tween(sprite15, { x: 1500}, 0.5);
			FlxTween.tween(sprite16, { x: 300}, 0.5);
			FlxTween.tween(sprite18, { x: 1500}, 0.5);
			artistText.text = "Made by : .me8udonik.";
			descText.text = "Thx for 200 followers !!";
		}
		if (curSelected == 16){
			FlxTween.tween(sprite16, { x: 1500}, 0.5);
			FlxTween.tween(sprite18, { x: 0}, 0.5);
			FlxTween.tween(sprite20, { x: 1500}, 0.5);
			artistText.text = "Made by : Explo";
			descText.text = "Mobian Bf Exe";
		}
		if (curSelected == 17){
			FlxTween.tween(sprite18, { x: 1500}, 0.5);
			FlxTween.tween(sprite20, { x: 0}, 0.5);
			FlxTween.tween(sprite21, { x: 1500}, 0.5);
			artistText.text = "Made by : Explo";
			descText.text = "Good bye XENOPHANES";
		}
		if (curSelected == 18){
			FlxTween.tween(sprite20, { x: 1500}, 0.5);
			FlxTween.tween(sprite21, { x: 0}, 0.5);
			FlxTween.tween(sprite22, { x: 1500}, 0.5);
			artistText.text = "Made by : MoonyExclipsy";
			descText.text = "Exeller version sexy";
		}
		if (curSelected == 19){
			FlxTween.tween(sprite21, { x: 1500}, 0.5);
			FlxTween.tween(sprite22, { x: 400}, 0.5);
			FlxTween.tween(sprite23, { x: 1500}, 0.5);
			artistText.text = "Made by : Kyleig";
			descText.text = "Yo, wanna sex ?";
		}
		if (curSelected == 20){
			FlxTween.tween(sprite22, { x: 1500}, 0.5);
			FlxTween.tween(sprite23, { x: 200}, 0.5);
			artistText.text = "Made by : FleetwayMoon";
			descText.text = "Wanna play Uno ?";
		}
		if (curSelected == 21){
			curSelected = 0;
		}
	}

	function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptions.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0) {
				item.alpha = 1;
			}
		}

		descText.text = Achievements.achievementsStuff[achievementIndex[curSelected]][1];
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
	}
	#end
}