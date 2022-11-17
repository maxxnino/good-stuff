local common = require("common")
nanosec = 1000000
ID = 1


M = {
    head = {},
    tail = {},
    control = {},
    list = {},
    parts = {},
    input = {},
    total = 0,
}

function M.getTime()
    local input = vlc.object.input()
    if input then
        return vlc.var.get(input, "time")
    else
        return 0
    end
end

function M.timeToString(ns)
    local sec = ns / nanosec
    return common.durationtostring(sec)
end

-- Descriptor: VLC looks for this to provide meta info about our extension
function descriptor()
    return {
        title = "Edit video",
        version = "0.1",
        author = "verghost",
        url = 'https://github.com/maxxnino',
        description = "edit video",
        capabilities = {}
    }
end

local function changeHead()
    M.head.time = M.getTime()
    M.head.lable:set_text(M.timeToString(M.head.time))
    M.head.name = vlc.input.item():name()
end

local function changeTail()
    M.tail.time = M.getTime()
    M.tail.lable:set_text(M.timeToString(M.tail.time))
end

local function rebuildList()
    M.list:clear()
    for k, v in pairs(M.parts) do
        M.list:add_value(v.text, k)
    end
end

local function appendTime(is_above)
    if M.head.time and M.tail.time and M.head.time < M.tail.time then
        local value = {}
        value.extra_sec = M.tail.time - M.head.time
        value.text = string.format("%s: %s - %s - %ss", M.head.name, M.head.lable:get_text(), M.tail.lable:get_text(),
            common.durationtostring(value.extra_sec / nanosec))
        value.head = M.head.time
        value.tail = M.tail.time
        value.name = M.head.name

        local seleted = M.list:get_selection()
        local count = 0
        local seleted_id = nil
        for k, _ in pairs(seleted) do
            count = count + 1
            seleted_id = k
        end

        if count == 1 then
            if is_above then
                table.insert(M.parts, seleted_id, value)
            else
                table.insert(M.parts, seleted_id + 1, value)
            end
            rebuildList()
        else
            table.insert(M.parts, ID, value)
            M.list:add_value(value.text, ID)
        end

        ID = ID + 1
        M.total = M.total + value.extra_sec
        M.control.total_lable:set_text(common.durationtostring(M.total / nanosec))
    end
end

local function delete()
    local seleted = M.list:get_selection()
    for k, _ in pairs(seleted) do
        M.total = M.total - M.parts[k].extra_sec
        M.control.total_lable:set_text(common.durationtostring(M.total / nanosec))
        M.parts[k] = nil
    end
    rebuildList()
end

local function seek(is_begin)
    local input = vlc.object.input()
    if input then
        local seleted = M.list:get_selection()
        for k, _ in pairs(seleted) do
            local position
            if is_begin then
                position = M.parts[k].head
            else
                position = M.parts[k].tail
            end
            vlc.var.set(input, "time", position)
        end
    end
end

local function preciseSeek(is_back)
    local position = M.getTime()
    local amount = tonumber(M.control.pSeekInput:get_text()) * 1000
    if is_back then
        position = position - amount
    else
        position = position + amount
    end
    vlc.var.set(vlc.object.input(), "time", position)
end

local function getValue(line)
    local value = {}
    local count = 1
    for word in string.gmatch(line, "([^,]+)") do
        if count == 1 then
            value.name = word
        elseif count == 2 then
            value.head = tonumber(word)
        else
            value.tail = tonumber(word)
            break
        end
        count = count + 1
    end
    value.extra_sec = value.tail - value.head
    value.text = value.name ..
        ": " .. common.durationtostring(value.head / nanosec) .. " - " .. common.durationtostring(value.tail / nanosec)
    return value
end

local function loadFile()
    local text = M.input.text:get_text()
    if text and text ~= "" then
        for line in io.lines(text) do
            if line:sub(1, 1) ~= "=" then
                local value = getValue(line)
                table.insert(M.parts, ID, value)
                M.list:add_value(value.text, ID)
                M.total = M.total + value.extra_sec
                ID = ID + 1
            end
        end
        M.control.total_lable:set_text(common.durationtostring(M.total / nanosec))
    end
end

local function saveFile()
    local text = M.input.text:get_text()
    if text and text ~= "" then
        local file = io.open(text, "a+")
        if file == nil then return end

        file:write(os.date("=========== %x %X ==========\n"))
        for _, v in pairs(M.parts) do
            file:write(string.format("%s,%d,%d\n", v.name, v.head, v.tail))
        end
        file:close()
    end
end

function activate()
    M.main_dlg = vlc.dialog("Edit Video")
    M.input.load = M.main_dlg:add_button("Load", loadFile, 1, 1)
    M.input.load = M.main_dlg:add_button("Save", saveFile, 2, 1)
    M.input.text = M.main_dlg:add_text_input("", 3, 1, 2)

    M.control.above = M.main_dlg:add_button("Above", function() appendTime(true) end, 1, 2)
    M.head.change = M.main_dlg:add_button("[", changeHead, 2, 2)
    M.head.lable = M.main_dlg:add_label("---", 3, 2)

    M.control.below = M.main_dlg:add_button("Below", function() appendTime(false) end, 1, 3)
    M.tail.change = M.main_dlg:add_button("]", changeTail, 2, 3)
    M.tail.lable = M.main_dlg:add_label("---", 3, 3)


    M.control.seekBegin = M.main_dlg:add_button("Jump [", function() seek(true) end, 1, 4)
    M.control.seekEnd = M.main_dlg:add_button("Jump ]", function() seek(false) end, 2, 4)
    M.control.pSeekBack = M.main_dlg:add_button("<<", function() preciseSeek(true) end, 3, 4)
    M.control.pSeekForward = M.main_dlg:add_button(">>", function() preciseSeek(false) end, 4, 4)

    M.control.delete = M.main_dlg:add_button("Delete", delete, 1, 5)
    M.control.total_lable = M.main_dlg:add_label("00:00:00", 2, 5)
    M.control.pSeekInput = M.main_dlg:add_text_input("100", 3, 5, 2)

    M.list = M.main_dlg:add_list(1, 6, 4)

    M.main_dlg:show() -- Once we've finished setting up our dialog, we make it visible
end

-- Called when the dialog window is closed
function close()
    vlc.deactivate() -- call deactivate() here, assuming that the extension should also be deactivated when the main dialog box closes
end

-- Called when the extension is deactivated.
-- Deactivation closes the menu and stops the extension script entirely
function deactivate()
    M.main_dlg:delete() -- if we're deactivating, we should destroy our dialog
end
