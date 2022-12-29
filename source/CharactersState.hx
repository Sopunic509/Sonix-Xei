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

class CharactersState extends MusicBeatState
{
	#if ACHIEVEMENTS_ALLOWED
	var options:Array<String> = [];
	private var grpOptions:FlxTypedGroup<Alphabet>;
	private static var curSelected:Int = 0;
	private static var exeversion:Int = 0;
	private var achievementIndex:Array<Int> = [];
	private var descText:FlxText;
	private var topText:FlxText;
	private var pose:FlxText;
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
	var spriteui1:FlxSprite;
	var spriteui2:FlxSprite;
	var spriteui3:FlxSprite;
    var spriteui4:FlxSprite;
	var spriteui5:FlxSprite;
	var ui:FlxSprite;
    var ui1:FlxSprite;
	var ui2:FlxSprite;
    var bg:FlxSprite;

	override function create() {
		#if desktop
		DiscordClient.changePresence("Gallery Menu", null);
		#end

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('char/bg'));
		bg.setGraphicSize(Std.int(bg.width * 1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		var ui:FlxSprite = new FlxSprite().loadGraphic(Paths.image('char/ui'));
		ui.setGraphicSize(Std.int(ui.width * 1));
		ui.updateHitbox();
		ui.screenCenter();
		ui.antialiasing = ClientPrefs.globalAntialiasing;
		add(ui);

		var ui2:FlxSprite = new FlxSprite().loadGraphic(Paths.image('char/ui2'));
		ui2.setGraphicSize(Std.int(ui2.width * 0.45));
		ui2.updateHitbox();
		ui2.screenCenter();
		ui2.antialiasing = ClientPrefs.globalAntialiasing;
		add(ui2);

		var ui1:FlxSprite = new FlxSprite().loadGraphic(Paths.image('char/ui1'));
		ui1.setGraphicSize(Std.int(ui1.width * 0.55));
		ui1.updateHitbox();
		ui1.screenCenter();
		ui1.antialiasing = ClientPrefs.globalAntialiasing;
		add(ui1);

		sprite1 = new FlxSprite();
		sprite1.loadGraphic(Paths.image('char/tailschar'));
		sprite1.setGraphicSize(Std.int(sprite1.width * 0.45));
		sprite1.screenCenter();
		add(sprite1);
		sprite2 = new FlxSprite();
		sprite2.loadGraphic(Paths.image('char/bfchar'));
		sprite2.setGraphicSize(Std.int(sprite2.width * 0.45));
		sprite2.screenCenter();
		add(sprite2);
		sprite3 = new FlxSprite();
		sprite3.loadGraphic(Paths.image('char/knuckleschar'));
		sprite3.setGraphicSize(Std.int(sprite3.width * 0.45));
		sprite3.screenCenter();
		add(sprite3);
		sprite4 = new FlxSprite();
		sprite4.loadGraphic(Paths.image('char/eggmanchar'));
		sprite4.setGraphicSize(Std.int(sprite4.width * 0.45));
		sprite4.screenCenter();
		add(sprite4);
	    sprite5 = new FlxSprite();
		sprite5.loadGraphic(Paths.image('char/exellerchar'));
		sprite5.setGraphicSize(Std.int(sprite5.width * 0.45));
		sprite5.screenCenter();
		add(sprite5);
		sprite6 = new FlxSprite();
		sprite6.loadGraphic(Paths.image('char/tailscharexe'));
		sprite6.setGraphicSize(Std.int(sprite6.width * 0.45));
		sprite6.screenCenter();
		add(sprite6);
		sprite7 = new FlxSprite();
		sprite7.loadGraphic(Paths.image('char/bfcharexe'));
		sprite7.setGraphicSize(Std.int(sprite7.width * 0.45));
		sprite7.screenCenter();
		add(sprite7);
		sprite8 = new FlxSprite();
		sprite8.loadGraphic(Paths.image('char/knucklescharexe'));
		sprite8.setGraphicSize(Std.int(sprite8.width * 0.45));
		sprite8.screenCenter();
		add(sprite8);
		sprite9 = new FlxSprite();
		sprite9.loadGraphic(Paths.image('char/eggmancharexe'));
		sprite9.setGraphicSize(Std.int(sprite9.width * 0.45));
		sprite9.screenCenter();
		add(sprite9);
		sprite9.visible = false;
		sprite8.visible = false;
		sprite7.visible = false;
		sprite6.visible = false;
		sprite5.visible = false;
		sprite4.visible = false;
		sprite3.visible = false;
		sprite2.visible = false;
		sprite1.visible = false;

		spriteui1 = new FlxSprite();
		spriteui1.loadGraphic(Paths.image('char/tails'));
		spriteui1.setGraphicSize(Std.int(spriteui1.width * 0.45));
		spriteui1.screenCenter();
		add(spriteui1);
		spriteui2 = new FlxSprite();
		spriteui2.loadGraphic(Paths.image('char/bf'));
		spriteui2.setGraphicSize(Std.int(spriteui2.width * 0.45));
		spriteui2.screenCenter();
		add(spriteui2);
		spriteui3 = new FlxSprite();
		spriteui3.loadGraphic(Paths.image('char/knuckles'));
		spriteui3.setGraphicSize(Std.int(spriteui3.width * 0.45));
		spriteui3.screenCenter();
		add(spriteui3);
		spriteui4 = new FlxSprite();
		spriteui4.loadGraphic(Paths.image('char/eggman'));
		spriteui4.setGraphicSize(Std.int(spriteui4.width * 0.45));
		spriteui4.screenCenter();
		add(spriteui4);
	    spriteui5 = new FlxSprite();
		spriteui5.loadGraphic(Paths.image('char/exeller'));
		spriteui5.setGraphicSize(Std.int(spriteui5.width * 0.45));
		spriteui5.screenCenter();
		add(spriteui5);
		spriteui5.visible = false;
		spriteui4.visible = false;
		spriteui3.visible = false;
		spriteui2.visible = false;
		spriteui1.visible = false;

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

		descText = new FlxText(0, 0, 980, "", 16);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);

		pose = new FlxText(950, 210, 980, "", 16);
		pose.setFormat(Paths.font("vcr.ttf"), 46, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		pose.borderSize = 2.4;
		add(pose);
		pose.text = "EXE";

		topText = new FlxText(550, 650, 980, "", 32);
		topText.setFormat(Paths.font("vcr.ttf"), 46, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		topText.scrollFactor.set();
		topText.borderSize = 2.4;
		add(topText);

		changeSelection();

		super.create();
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (controls.UI_DOWN_P) {
			curSelected -= 1;
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		}
		if (controls.UI_UP_P) {
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			curSelected += 1;
		}
		if (controls.UI_RIGHT_P) {
			exeversion = 1;
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		}
		if (controls.UI_LEFT_P) {
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			exeversion = 0;
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		if (curSelected == 0){
			sprite1.visible = true;
			sprite2.visible = false;
			spriteui1.visible = true;
			spriteui2.visible = false;
			topText.text = "TAILS";
			descText.text = "Tails is a nine year old fox who has an iq above 300 and assists Sonic by building tech and machines to defeat docter Eggman.";
			if (exeversion == 0) {
			sprite6.visible = false;
			sprite1.visible = true;
			}
			else {
			sprite6.visible = true;
			sprite7.visible = false;
			sprite1.visible = false;
			}
		}
		if (curSelected == 1){
			sprite2.visible = true;
			sprite1.visible = false;
			sprite3.visible = false;
			spriteui2.visible = true;
			spriteui1.visible = false;
			spriteui3.visible = false;
			topText.text = "BOYFRIEND.XML";
			descText.text = "A nineteen year old bunny. Born in Planet Mobian. Loves to rap battle with Mobians. Never met Exeller.";
			if (exeversion == 0) {
			sprite6.visible = false;
			sprite7.visible = false;
			sprite2.visible = true;
			sprite8.visible = false;
			}
			else {
			sprite6.visible = false;
			sprite7.visible = true;
			sprite2.visible = false;
			sprite8.visible = false;
			}
		}
		if (curSelected == 2){
			sprite3.visible = true;
			sprite2.visible = false;
			sprite4.visible = false;
			spriteui3.visible = true;
			spriteui2.visible = false;
			spriteui4.visible = false;
			topText.text = "KNUCKLES";
			descText.text = "Knuckles is a 16 Year old echidna who spends his life protecting the master emerald and angle island. He is not the sharpest tool in the shed.";
			if (exeversion == 0) {
			sprite8.visible = false;
			sprite3.visible = true;
			sprite9.visible = false;
			sprite7.visible = false;
			}
			else {
			sprite8.visible = true;
			sprite3.visible = false;
			sprite9.visible = false;
			sprite7.visible = false;
			}
		}
		if (curSelected == 3){
			sprite4.visible = true;
			sprite3.visible = false;
			sprite5.visible = false;
			spriteui4.visible = true;
			spriteui3.visible = false;
			spriteui5.visible = false;
			topText.text = "EGGMAN";
			descText.text = "Eggman is a evil genius that wants to take over mobius with his army of badniks and is Sonic's biggest threat.";
			if (exeversion == 0) {
			sprite9.visible = false;
			sprite4.visible = true;
			sprite8.visible = false;
			}
			else {
			sprite8.visible = false;
			sprite9.visible = true;
			sprite4.visible = false;
			}
		}
		if (curSelected == 4){
			sprite5.visible = true;
			sprite4.visible = false;
			spriteui5.visible = true;
			spriteui4.visible = false;
			topText.text = "EXELLER";
			descText.text = "After killing the king and his pupils, and taking over the body of sonic, he hunts down the main cast and the inhabitants of mobius.";
			if (exeversion == 0) {
			sprite9.visible = false;
			sprite7.visible = false;
			}
			else {
			sprite9.visible = false;
			sprite4.visible = false;
			}
		}
		if (curSelected > 4){
			curSelected = 4;
		}
		if (curSelected < 0){
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