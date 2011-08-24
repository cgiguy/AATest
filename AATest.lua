function AATestAddonLoadedFunc()
  AATestLoadOptionsFrames() -- add the options window to the Blizzard Interface Options
  AATestInitialized = true
  DEFAULT_CHAT_FRAME:AddMessage("AA Test Loaded", 1,1,0)
end

function AATestOnEvent(frame, event, addonName)
  if (event == "ADDON_LOADED") then
    if (addonName == "AATest" or addonName == "AA Test") and (not AATestInitialized) then
      AATestAddonLoadedFunc()
    end
  end
end

function AATestInit()
  AATestDummyFrame = CreateFrame("Frame")
  AATestDummyFrame:SetPoint("BOTTOMLEFT", 0, 0) -- I need the frame to be visible for tracking OnUpdate events for cooldown expiration notifications...
  AATestDummyFrame:SetSize(1, 1)
  AATestDummyFrame:SetBackdrop({}) -- blank backdrop - or should I use: {bgFile = nil, edgeFile = nil, tile = nil, tileSize = nil, edgeSize = nil, insets = { left = nil, right = nil, top = nil, bottom = nil } }
  AATestDummyFrame:Show()
  AATestDummyFrame:RegisterEvent("ADDON_LOADED")

  AATestDummyFrame:SetScript("OnEvent",AATestOnEvent)
  SlashCmdList["AATEST"] = function(msg)
    if msg == "reloadUI" then
      ReloadUI()
    else
      print("Message: " .. msg)
    end
  end
  SLASH_AATEST1 = "/aatest"
  SLASH_AATEST2 = "/AATEST"
end

function AATestResetAllVariables()
  DEFAULT_CHAT_FRAME:AddMessage("AA Test Variables RESET!!", 1,1,0)
end

AATestInit()
