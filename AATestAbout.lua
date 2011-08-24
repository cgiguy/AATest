AATestDocumentationText = [==[
<html><body>
<br />
<br />

<p>Thanks for using AA Test, the addon that will make all your dreams come true. For detailed help and information on using AA Test, read the full description on the AATest download page at curse.com: |cff0070ddhttp://wow.curse.com/downloads/wow-addons/details/aat.aspx|r</p><br />

<h1>About AA Test</h1>
<br />
<p>AATest is a test harness designed to allow you to test some things. It serves a few purposes: for one, it gives you indicator bars to monitor various sets of data that are important to you, such as player health, target health, threat, energy, buff and debuff times remaining, cooldown times remaining, etc. Version 2.0 allows jsut about all components of these bars to be customized the the player's liking. AATest also displays an "Ability Suggestion Frame" which is designed to suggest abilities to use during combat. Obviously this suggestion is a guide only and cannot take the place of actual game play - it serves as a mere suggestion based only on the rotation conditions set by the user. Bars and the suggestion frame can be edited in the WoW Interface Options by expanding the plus sign by AA Test in the Addons Tab.</p><br />
<p>Most of the options are self-explanitory and option tool-tips can give more info if you mouse over the options. The ability suggestion rotations follow the priorities set in that option frame. AATest will go through the priorities in order and will display the first ability suggestion that meets all the conditions specified. To enable a given condition, check the box next to that condition and enter its details. For example, lets say you want to never suggest Rupture unless the player has 3 or more combo points. You would select Rupture as the ability for that priorty condition, then be sure the check box is checked to enable that priority condition, then check next to the combo points condition and enter "3" in the box to its right.</p>
<br />

<h1>Getting Started</h1>
<br />
<p>The very first time you start AATest 1.0  and the suggestion frame will be set to their default positions. Unfortounatly, if you had everything all set up from AATest 1, you'll have to re-position and reconfigure your bars. I just added and changed too much in version 2.0 to allow for settings being converted. Sorry. Anyway, once you get up and going, you'll probably notice that there are some bars you don't want to be displayed. Go to the options screen and select the bar you want to edit from the drop down and check the box next to hide for those. From there you can edit the other options for other bars.</p><br />
<p>Again, read the tooltips for more information on each setting. If you can't figure it out from there, check the Frame Maker download page at |cff0070ddcurse.com|r. You can post a comment there as well and I'll try to respond if I can. I hope you enjoy using AATest and I hope you find it useful!</p>
</body></html>
]==]

AATestSetUpAboutFrame = function()
	local AATestOptionsAboutHTML = CreateFrame("SimpleHTML", "AATestOptionsAboutHTML", AATestAboutScrollFrameScrollChild)
	AATestOptionsAboutHTML:SetSize(350, 385)
	AATestOptionsAboutHTML:SetPoint("TOPLEFT", AATestAboutScrollFrameScrollChild, "TOPLEFT")
	AATestOptionsAboutHTML:SetFont("Fonts\\FRIZQT__.TTF", 9)
	AATestOptionsAboutHTML:SetFontObject("h1", GameFontHighlightLarge)
	AATestOptionsAboutHTML:SetText(AATestDocumentationText)
end
