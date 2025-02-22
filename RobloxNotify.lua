local Notifications = {}

local function createNotification(title, content, closebuttontext)
    game.CoreGui.CallDialogScreen.Enabled = true
    game.CoreGui.CallDialogScreen.CallDialog.AlertContents.TitleContainer.TitleArea.Title.Size = UDim2.new(0, 100, 0, 30)
    game.CoreGui.CallDialogScreen.CallDialog.AlertContents.TitleContainer.TitleArea.Title.Text = title
    game.CoreGui.CallDialogScreen.CallDialog.AlertContents.MiddleContent.Content.BodyText.Text = content
    game.CoreGui.CallDialogScreen.CallDialog.AlertContents.MiddleContent.Content.BodyText.TextScaled = true
    game.CoreGui.CallDialogScreen.CallDialog.AlertContents.Footer.Buttons["1"].ButtonContent.ButtonMiddleContent.Text.Text = closebuttontext
    
    local connection
    connection = game.CoreGui.CallDialogScreen.CallDialog.AlertContents.Footer.Buttons["1"].MouseButton1Click:Connect(function()
        game.CoreGui.CallDialogScreen.Enabled = false
        connection:Disconnect()
    end)
end

function Notifications:Create(title, content, closebuttontext)
    createNotification(title, content, closebuttontext)
end

return Notifications
