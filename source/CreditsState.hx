package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import sys.FileSystem;
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = 1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Dynamic> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		trace("finding mod shit");
		if (FileSystem.exists(Paths.mods()))
		{
			trace("mods folder");
			if (FileSystem.exists(Paths.modFolders("data/credits.txt")))
			{
				trace("credit file");
				var firstarray:Array<String> = CoolUtil.coolTextFile(Paths.modFolders("data/credits.txt"));
				trace("found credit shit");

				for (i in firstarray)
				{
					var arr:Array<String> = i.split("::");
					trace(arr);
					creditsStuff.push(arr);
				}
			}
		}
		#end
		var pisspoop = [
			// Name - Icon name - Description - Link - BG Color
			['Applecore Psych Engine Port'],
			['Lego', 'none', 'Programming', '', '0xFFFFFFFF'],
			['Applecore Devs'],
			[
				'Grantare',
				'none',
				'Applecore Song and Programming',
				'https://www.youtube.com/channel/UCKbKOSJPbP4u81cpBpoSntw',
				'0xFFFFFFFF'
			],
			[
				'Lancey',
				'none',
				'Art',
				'https://www.youtube.com/c/Lancey170/about',
				'0xFFFFFFFF'
			],
			[
				'BezieAnims',
				'none',
				'Charting',
				'https://gamejolt.com/@BezieAnims',
				'0xFFFFFFFF'
			],
			[''],
			['VS Dave & Bambi Devs'],
			[
				'MoldyGH',
				'none',
				'Original Developer',
				'https://www.youtube.com/c/MoldyGH',
				'0xFFFFFFFF'
			],
			[
				'Missingtextureman101',
				'none',
				'Co-Developer',
				'https://gamebanana.com/members/1665049',
				'0xFFFFFFFF'
			],
			[
				'rapparep lol',
				'none',
				'Artist',
				'https://gamebanana.com/members/1664672',
				'0xFFFFFFFF'
			],
			[
				'TheBuilderXD',
				'none',
				'Distributor, Tristan Artist',
				'https://gamebanana.com/members/1679100',
				'0xFFFFFFFF'
			],
			[
				'CyndaquilDAC',
				'none',
				'Developer, Programmer, Menu Button Artist',
				'https://gamebanana.com/members/1654835',
				'0xFFFFFFFF'
			],
			[
				'Ezizur',
				'none',
				'Programmer & Asset Maker',
				'https://www.youtube.com/channel/UCdCAaQzt9yOGfFM0gJDJ4bQ',
				'0xFFFFFFFF'
			],
			[
				'T5mpler',
				'none',
				'Programmer',
				'https://www.youtube.com/channel/UCgNoOsE_NDjH6ac4umyADrw',
				'0xFFFFFFFF'
			],
			[
				'Marcello_TIMEnice30',
				'none',
				'mr bambi lamo',
				'https://gamebanana.com/members/1698319',
				'0xFFFFFFFF'
			],
			[
				'Stats45',
				'none',
				'Minor programming, cool, emotional support',
				'https://gamebanana.com/members/1691247',
				'0xFFFFFFFF'
			],
			['ToasterMike/Krispo', 'none', '3D Background', 'https://gamebanana.com/members/1843253', '0xFFFFFFFF'],
			[
				'Alexander Cooper 19',
				'none',
				'Composer of Mealie',
				'about::blank',
				'0xFFFFFFFF'
			],
			['ArchWk', 'none', 'Creater of Supernovae', 'about::blank', '0xFFFFFFFF'],
			[
				'The Boneyard',
				'none',
				'Creater of Glitch',
				'https://www.youtube.com/channel/UCQNWcijiQBHTzeu_6w8purw',
				'0xFFFFFFFF'
			],
			['OBVIOUS_NINJA', 'none', 'Boyfriend Harmor Preset', 'about::blank', '0xFFFFFFFF'],
			[
				'Kade Dev',
				'none',
				'Kade Engine',
				'https://gamebanana.com/members/1774971',
				'0xFFFFFFFF'
			],
			[''],
			['Psych Engine Team'],
			[
				'Shadow Mario',
				'shadowmario',
				'Main Programmer of Psych Engine',
				'https://twitter.com/Shadow_Mario_',
				'0xFFFFDD33'
			],
			[
				'RiverOaken',
				'riveroaken',
				'Main Artist/Animator of Psych Engine',
				'https://twitter.com/river_oaken',
				'0xFFC30085'
			],
			[''],
			['Engine Contributors'],
			[
				'shubs',
				'shubs',
				'New Input System Programmer',
				'https://twitter.com/yoshubs',
				'0xFF4494E6'
			],
			[
				'PolybiusProxy',
				'polybiusproxy',
				'.MP4 Video Loader Extension',
				'https://twitter.com/polybiusproxy',
				'0xFFE01F32'
			],
			[
				'gedehari',
				'gedehari',
				'Chart Editor\'s Sound Waveform base',
				'https://twitter.com/gedehari',
				'0xFFFF9300'
			],
			[
				'Keoiki',
				'keoiki',
				'Note Splash Animations',
				'https://twitter.com/Keoiki_',
				'0xFFFFFFFF'
			],
			[
				'SandPlanet',
				'sandplanet',
				'Mascot\'s Owner\nMain Supporter of the Engine',
				'https://twitter.com/SandPlanetNG',
				'0xFFD10616'
			],
			[
				'bubba',
				'bubba',
				'Guest Composer for "Hot Dilf"',
				'https://www.youtube.com/channel/UCxQTnLmv0OAS63yzk9pVfaw',
				'0xFF61536A'
			],
			[''],
			["Funkin' Crew"],
			[
				'ninjamuffin99',
				'ninjamuffin99',
				"Programmer of Friday Night Funkin'",
				'https://twitter.com/ninja_muffin99',
				'0xFFF73838'
			],
			[
				'PhantomArcade',
				'phantomarcade',
				"Animator of Friday Night Funkin'",
				'https://twitter.com/PhantomArcade3K',
				'0xFFFFBB1B'
			],
			[
				'evilsk8r',
				'evilsk8r',
				"Artist of Friday Night Funkin'",
				'https://twitter.com/evilsk8r',
				'0xFF53E52C'
			],
			[
				'kawaisprite',
				'kawaisprite',
				"Composer of Friday Night Funkin'",
				'https://twitter.com/kawaisprite',
				'0xFF6475F3'
			]
		];

		for (i in pisspoop)
		{
			creditsStuff.push(i);
		}

		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, creditsStuff[i][0], !isSelectable, false);
			optionText.isMenuItem = true;
			optionText.screenCenter(X);
			if (isSelectable)
			{
				optionText.x -= 70;
			}
			optionText.forceX = optionText.x;
			// optionText.yMult = 90;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if (isSelectable)
			{
				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;

				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
			}
		}

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);

		bg.color = Std.parseInt(creditsStuff[curSelected][4]);
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (controls.BACK)
		{
			if (colorTween != null)
			{
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		if (controls.ACCEPT)
		{
			CoolUtil.browserLoad(creditsStuff[curSelected][3]);
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do
		{
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		}
		while (unselectableCheck(curSelected));

		var newColor:Int = Std.parseInt(creditsStuff[curSelected][4]);
		if (newColor != intendedColor)
		{
			if (colorTween != null)
			{
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween)
				{
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if (!unselectableCheck(bullShit - 1))
			{
				item.alpha = 0.6;
				if (item.targetY == 0)
				{
					item.alpha = 1;
				}
			}
		}
		descText.text = creditsStuff[curSelected][2];
	}

	private function unselectableCheck(num:Int):Bool
	{
		return creditsStuff[num].length <= 1;
	}
}
