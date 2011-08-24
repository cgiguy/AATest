AATestToolTips = {
	["Enter"] = function(frm, tltpStg)
		if frm and tltpStg then
			GameTooltip:SetOwner(frm, "ANCHOR_RIGHT", 5, 0)
			GameTooltip:ClearLines()
			GameTooltip:AddLine(tltpStg, 1,1,1,1)
			GameTooltip:Show()
		end
	end,
	["Leave"] = function()
		GameTooltip:Hide()
	end
}

function AATestFFS(self,arg1,arg2,checked)
  DEFAULT_CHAT_FRAME:AddMessage("FFS triggered" , 1,1,0)
  AATestFrameTestMenuButtonText:SetText(self:GetText());
  print("TSetting: " .. self:GetText());
  print("Frame: " .. self:GetName());
  CloseDropDownMenus();
end

function AATestPopulateComboBox(menuList, topBtn, menuFunc, topLabel)
  local btnInit =
    function(frm, lvl)
      local btnsPerMenuLevel = 50 -- change this to set the maximum number of menu buttons per level
      local btn

      if lvl then
	DEFAULT_CHAT_FRAME:AddMessage("BtnInit triggered at level: " .. lvl , 1,1,0)
      else
	DEFAULT_CHAT_FRAME:AddMessage("BtnInit triggered at level NONE!!" , 1,1,0)
      end
      local addBtn =
        function(tbl)
	  if lvl then
--	    btn = { ["text"] = tbl["text"], ["value"] = tbl["setting"], ["disabled"] = nil, ["notCheckable"] = 1,
	    btn = { ["text"] = tbl["text"], ["value"] = tbl["setting"], ["disabled"] = nil,
		    ["func"] = menuFunc
		  } 
--	    DEFAULT_CHAT_FRAME:AddMessage("Button " .. tbl["text"] .. ": level " .. lvl , 1,1,0)
	    -- Add any extra values that we need... if a value is tagged "NIL", we set it to nil (to effectively delete it)
	    if (tbl["extras"]) then
	      for k,v in pairs(tbl["extras"]) do
		if (v == "NIL") then
		  btn[k] = nil
		else
		  btn[k] = v
		end
	      end
	    end
	    UIDropDownMenu_AddButton(btn, lvl)
	  end
	end
      local addCascadeBtn =
	function()
	  if lvl then
	    btn = {
	      ["text"] = "More...",
	      ["hasArrow"] = 1,
	      ["notCheckable"] = 1,
	      ["disabled"] = nil,
	      ["value"] = "lvl" .. lvl,
	      ["func"] = function() end
	    }
	    UIDropDownMenu_AddButton(btn, lvl)
	  end
        end

      for i = 1, #menuList do
--	if lvl then
--	  DEFAULT_CHAT_FRAME:AddMessage("Index " .. i .. ": level " .. lvl , 1,1,0)
--	end
	if (floor(i / btnsPerMenuLevel) + 1) == lvl then
	  addBtn(menuList[i])
	end
	if (i % btnsPerMenuLevel == 0) and (i ~= #menuList) and (floor(i / btnsPerMenuLevel) == lvl) then
	  addCascadeBtn()
	end
      end
    end
  UIDropDownMenu_Initialize(topBtn, btnInit)
  if topLabel then
    _G[topBtn:GetName() .. "Text"]:SetText(topLabel)	
  end
end

function AATestPopulateComboBoxes()
  AATestPopulateComboBox(AATestComboBoxPairs["SliceAdmiralSounds"],
			 AATestFrameSelectComboButton,
			 function(self)	AATestFrameSelectComboButtonText:SetText(self:GetText()); print("CSetting: " .. self:GetText()); CloseDropdownMenus(); end)

  AATestPopulateComboBox(AATestComboBoxPairs["SliceAdmiralSounds"],
			 AATestFrameSelectMenuButton,
			 function(self)	AATestFrameSelectMenuButtonText:SetText(self:GetText()); print("MSetting: " .. self:GetText()); CloseDropDownMenus(); end)

  AATestPopulateComboBox(AATestComboBoxPairs["SliceAdmiralSounds"],
			 AATestFrameTestMenuButton,
			 AATestFFS,
			 "Select your sound, buddy..."
		       )
  UIDropDownMenu_SetWidth(AATestFrameTestMenuButton,225)

  AATestPopulateComboBox(AATestComboBoxPairs["SliceAdmiralSounds"],
			 AATestFrameTestMenuButton2,
			 function(self)
			   AATestFrameTestMenuButton2Text:SetText(self:GetText());
			   print("FTSetting: " .. self:GetText());
			   CloseDropDownMenus();
			 end,
			 "Select your sound..."
		       )

  AATestPopulateComboBox(AATestComboBoxPairs["SliceAdmiralSounds"],
			 AATestMenuFrameButton1,
			 function(self)
			   print("Frame: " .. self:GetName());
			   print("Parent: " .. self:GetParent():GetName());
			   AATestMenuFrameButton1Text:SetText(self:GetText());
			   UIDropDownMenu_SetSelectedName(AATestMenuFrameButton1,self:GetText());
			   local foo = UIDropDownMenu_GetSelectedID(AATestMenuFrameButton1);
			   if foo then
			     print("Menu ID: " .. foo);
			     print("Probable name: " .. AATestComboBoxPairs["SliceAdmiralSounds"][foo]["text"]);
			   end
			   print("NewSetting: " .. self:GetText());
			   CloseDropDownMenus();
			 end,
			 "Select your new sound..."
		       )
  UIDropDownMenu_SetWidth(AATestMenuFrameButton1,175)

--  UIDropDownMenu_SetWidth(AATestFrameTestMenuButton2,500)
--  AATestOptionsSoundFrameRAVButton:Show()
end

function AATestLoadOptionsFrames()
  AATestOptionsAboutFrame["name"] = "AA Test"
  InterfaceOptions_AddCategory(AATestOptionsAboutFrame);

  AATestOptionsFrame["name"] = "AA Test Options"
  AATestOptionsFrame["parent"] = "AA Test"
  InterfaceOptions_AddCategory(AATestOptionsFrame);
  
  AATestOptionsSoundFrame["name"] = "AA Test Sounds Frame"
  AATestOptionsSoundFrame["parent"] = "AA Test"
  InterfaceOptions_AddCategory(AATestOptionsSoundFrame);

  AATestMenuFrame["name"] = "AA Test Menu Frame"
  AATestMenuFrame["parent"] = "AA Test"
  InterfaceOptions_AddCategory(AATestMenuFrame);

  AATestPopulateComboBoxes()
  AATestSetUpAboutFrame();

end
