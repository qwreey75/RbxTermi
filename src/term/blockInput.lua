-- block inputs when cursor is on output
-- and move cursor to input pos

local module = {};
local strLen = utf8.len();

function module:init(textbox,stdio)
    -- update editable status
    local function update()
        local outBufferSize = strLen(stdio.outBuffer);
        local selectionStart = textbox.SelectionStart;
        textbox.TextEditable = (textbox.CursorPosition > outBufferSize) and
        (selectionStart == -1 or (textbox.SelectionStart > outBufferSize));
    end

    -- sync event
    textbox:GetPropertyChangedSignal("CursorPosition"):Connect(update)
    textbox:GetPropertyChangedSignal("SelectionStart"):Connect(update)
    return;
end

return module;