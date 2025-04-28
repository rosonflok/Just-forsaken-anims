-- LocalScript to play walk animation only when walking

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://616156119" -- Replace with your animation ID

local animTrack

-- Function to play the walk animation
local function playWalkAnimation()
    if not animTrack then
        animTrack = humanoid:LoadAnimation(animation)
    end
    if humanoid.MoveDirection.Magnitude > 0 then  -- Only play when moving
        if not animTrack.IsPlaying then
            animTrack:Play()
        end
    else
        if animTrack.IsPlaying then
            animTrack:Stop()
        end
    end
end

-- Connect the function to the humanoid's running event
humanoid.Running:Connect(function(speed)
    playWalkAnimation()
end)
