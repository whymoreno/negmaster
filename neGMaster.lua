script_name('neGMaster')
script_author('Juuzou_Hurricane')
require 'lib.moonloader'
local dlstatus = require ('lib.moonloader').download_status
local inicfg = require 'inicfg'

local directIni = "moonloader\\neGMaster.ini"
local neGMasterIni = inicfg.load(nil, directIni)

update_state = false

local script_vers = 1
local script_vers_text = '1.00'

local update_url = "https://raw.githubusercontent.com/whymoreno/negmaster/main/neGMaster.ini"
local update_path = getWorkingDirectory() .. "/negmaster.ini"

local script_url = ""
local script_path = thisScript().path 


local ffi = require("ffi") -- dysaflyingcomponent
ffi.fill(ffi.cast(ffi.typeof('void*'), 0x6A85CC), 5, 0x90) -- dysaflyingcomponent

function main()
    if not isSampLoaded() and not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(0) end 

    sampAddChatMessage('neGMaster ver.1 loaded', -1)

    wait(0)

    downloadUrlToFile(update_url, update_path, function(id, status)
        if status == dlstatus.STATUS_ENDDOWNLOADDATA then
            neGMasterini = inicfg.load(nil, update_path)
                if tonumber(neGMasterini.info.vers) > script_vers then
                sampAddChatMessage('Åñòü îáíîâà. Âåðñèÿ: ' .. neGMasterini.info.vers_text, -1)
                update_state = true
                end
            os.remove(update_path)
        end
    end)

    while true do

        wait(0)

        if isKeyJustPressed(VK_L) and not sampIsCursorActive() then
            sampSendChat('/lock')
        end

        wait(0)

        if isKeyJustPressed(VK_U) and not sampIsCursorActive() then
            sampSendChat('/fixcar')
        end

        wait(0)

        if isKeyJustPressed(VK_B) and not sampIsCursorActive() then
            sampSendChat('/sleep')
        end

        downloadUrlToFile(update_url, update_path, function(id, status)
            if status == dlstatus.STATUS_ENDDOWNLOADDATA then
                
        end)

    end
end


    
