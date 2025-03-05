-- uppercase dogshit  
local function capitalizeFirstLetter(message)
    return message:sub(1, 1):upper() .. message:sub(2)
end
local chatBar = game:GetService("CoreGui").ExperienceChat.appLayout.chatInputBar.Background.Container.TextContainer.TextBoxContainer.TextBox
chatBar:GetPropertyChangedSignal("Text"):Connect(function()
    if chatBar.Text ~= "" then
        chatBar.Text = capitalizeFirstLetter(chatBar.Text)
    end
end)
