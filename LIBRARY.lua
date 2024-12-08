--// SERVICES

local players = game:GetService("Players")
local TS = game:GetService("TweenService")
local RS = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")

--// VARIBLES
local lp = players.LocalPlayer
local mouse = lp:GetMouse()
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local Library = {}

function Library:Validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:tween(object, goal, callback)
	local tween = TS:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

--// MAIN UI
function Library:new(options)
	options = Library:Validate({
		name = "UI LIBRARY TEST"
	}, options or {})
	
	local GUI = {
		CurrentTab = nil
	}
	
	--//MAIN 
	do 
		-- StarterGui.MSRLibrary
		GUI["1"] = Instance.new("ScreenGui", RS:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreGui);
		GUI["1"]["Name"] = [[MSRLibrary]];
		GUI["1"]["IgnoreGuiInset"] = true


		-- StarterGui.MSRLibrary.Main
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BorderSizePixel"] = 0;
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(54, 54, 54);
		GUI["2"]["AnchorPoint"] = Vector2.new(0, 0);
		GUI["2"]["Size"] = UDim2.new(0, 550, 0, 400);
		GUI["2"]["Position"] = UDim2.fromOffset((viewport.X/2) - (GUI["2"].Size.X.Offset / 2), (viewport.Y/2) - (GUI["2"].Size.Y.Offset / 2));
		GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["2"]["Name"] = [[Main]];
		GUI["2"]["BackgroundTransparency"] = 0.1;


		-- StarterGui.MSRLibrary.Main.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);
		GUI["3"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.MSRLibrary.Main.DropShadowHolder
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["ZIndex"] = 0;
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["4"]["Name"] = [[DropShadowHolder]];
		GUI["4"]["BackgroundTransparency"] = 1;


		-- StarterGui.MSRLibrary.Main.DropShadowHolder.DropShadow
		GUI["5"] = Instance.new("ImageLabel", GUI["4"]);
		GUI["5"]["ZIndex"] = 0;
		GUI["5"]["BorderSizePixel"] = 0;
		GUI["5"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["5"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["5"]["ImageTransparency"] = 0.5;
		GUI["5"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["5"]["Image"] = [[rbxassetid://6014261993]];
		GUI["5"]["Size"] = UDim2.new(1, 47, 1, 47);
		GUI["5"]["BackgroundTransparency"] = 1;
		GUI["5"]["Name"] = [[DropShadow]];
		GUI["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


		-- StarterGui.MSRLibrary.Main.TopBar
		GUI["6"] = Instance.new("Frame", GUI["2"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
		GUI["6"]["Size"] = UDim2.new(1, 0, 0, 30);
		GUI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["6"]["Name"] = [[TopBar]];


		-- StarterGui.MSRLibrary.Main.TopBar.UICorner
		GUI["7"] = Instance.new("UICorner", GUI["6"]);
		GUI["7"]["CornerRadius"] = UDim.new(0, 6);


		-- StarterGui.MSRLibrary.Main.TopBar.Extension
		GUI["8"] = Instance.new("Frame", GUI["6"]);
		GUI["8"]["BorderSizePixel"] = 0;
		GUI["8"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
		GUI["8"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["8"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		GUI["8"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["8"]["Name"] = [[Extension]];


		-- StarterGui.MSRLibrary.Main.TopBar.Title
		GUI["9"] = Instance.new("TextLabel", GUI["6"]);
		GUI["9"]["BorderSizePixel"] = 0;
		GUI["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["TextSize"] = 14;
		GUI["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		GUI["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["BackgroundTransparency"] = 1;
		GUI["9"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		GUI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["9"]["Text"] = options["name"];
		GUI["9"]["Name"] = options["name"];
		GUI["9"]["Position"] = UDim2.new(0, 30, 0, 0);


		-- StarterGui.MSRLibrary.Main.TopBar.Title.UIPadding
		GUI["a"] = Instance.new("UIPadding", GUI["9"]);
		GUI["a"]["PaddingTop"] = UDim.new(0, 1);
		GUI["a"]["PaddingLeft"] = UDim.new(0, 8);


		-- StarterGui.MSRLibrary.Main.TopBar.ExitButton
		GUI["b"] = Instance.new("ImageLabel", GUI["6"]);
		GUI["b"]["BorderSizePixel"] = 0;
		GUI["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["b"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["b"]["Image"] = [[rbxassetid://82293485624803]];
		GUI["b"]["Size"] = UDim2.new(0, 22, 0, 22);
		GUI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["b"]["BackgroundTransparency"] = 1;
		GUI["b"]["Name"] = [[ExitButton]];
		GUI["b"]["Position"] = UDim2.new(1, -4, 0, 4);


		-- StarterGui.MSRLibrary.Main.TopBar.Icon
		GUI["c"] = Instance.new("ImageLabel", GUI["6"]);
		GUI["c"]["BorderSizePixel"] = 0;
		GUI["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["c"]["AnchorPoint"] = Vector2.new(0, 0.5);
		GUI["c"]["Image"] = [[rbxassetid://116664688073165]];
		GUI["c"]["Size"] = UDim2.new(0, 22, 0, 22);
		GUI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["c"]["BackgroundTransparency"] = 1;
		GUI["c"]["Name"] = [[Icon]];
		GUI["c"]["Position"] = UDim2.new(0, 6, 0.5, 0);


		-- StarterGui.MSRLibrary.Main.TopBar.Minimize
		GUI["d"] = Instance.new("ImageLabel", GUI["6"]);
		GUI["d"]["BorderSizePixel"] = 0;
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["d"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["d"]["Image"] = [[rbxassetid://138342019845391]];
		GUI["d"]["Size"] = UDim2.new(0, 22, 0, 22);
		GUI["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["d"]["BackgroundTransparency"] = 1;
		GUI["d"]["Name"] = [[Minimize]];
		GUI["d"]["Position"] = UDim2.new(1, -30, 0, 4);


		-- StarterGui.MSRLibrary.Main.TopBar.Line
		GUI["e"] = Instance.new("Frame", GUI["6"]);
		GUI["e"]["BorderSizePixel"] = 0;
		GUI["e"]["BackgroundColor3"] = Color3.fromRGB(85, 85, 85);
		GUI["e"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["e"]["Size"] = UDim2.new(1, 0, 0, 1);
		GUI["e"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["e"]["Name"] = [[Line]];
		
		
		-- StarterGui.MSRLibrary.Main.ContentContainer
		GUI["1d"] = Instance.new("Frame", GUI["2"]);
		GUI["1d"]["BorderSizePixel"] = 0;
		GUI["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["1d"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["1d"]["Size"] = UDim2.new(1, -162, 1, -42);
		GUI["1d"]["Position"] = UDim2.new(1, -6, 0, 36);
		GUI["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["1d"]["Name"] = [[ContentContainer]];
		GUI["1d"]["BackgroundTransparency"] = 1;

	end

	--//NAVIGATION
	do
		-- StarterGui.MSRLibrary.Main.Navigation
		GUI["f"] = Instance.new("Frame", GUI["2"]);
		GUI["f"]["BorderSizePixel"] = 0;
		GUI["f"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
		GUI["f"]["Size"] = UDim2.new(0, 150, 1, -31);
		GUI["f"]["Position"] = UDim2.new(0, 0, 0, 30);
		GUI["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["f"]["Name"] = [[Navigation]];


		-- StarterGui.MSRLibrary.Main.Navigation.UICorner
		GUI["10"] = Instance.new("UICorner", GUI["f"]);
		GUI["10"]["CornerRadius"] = UDim.new(0, 6);


		-- StarterGui.MSRLibrary.Main.Navigation.Hide
		GUI["11"] = Instance.new("Frame", GUI["f"]);
		GUI["11"]["BorderSizePixel"] = 0;
		GUI["11"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
		GUI["11"]["Size"] = UDim2.new(1, 0, 0, 20);
		GUI["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["11"]["Name"] = [[Hide]];


		-- StarterGui.MSRLibrary.Main.Navigation.Hide2
		GUI["12"] = Instance.new("Frame", GUI["f"]);
		GUI["12"]["BorderSizePixel"] = 0;
		GUI["12"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
		GUI["12"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["12"]["Size"] = UDim2.new(0, 20, 1, 0);
		GUI["12"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["12"]["Name"] = [[Hide2]];


		-- StarterGui.MSRLibrary.Main.Navigation.ButtonHandler
		GUI["13"] = Instance.new("Frame", GUI["f"]);
		GUI["13"]["BorderSizePixel"] = 0;
		GUI["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["13"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["13"]["Name"] = [[ButtonHandler]];
		GUI["13"]["BackgroundTransparency"] = 1;


		-- StarterGui.MSRLibrary.Main.Navigation.ButtonHandler.UIPadding
		GUI["14"] = Instance.new("UIPadding", GUI["13"]);
		GUI["14"]["PaddingTop"] = UDim.new(0, 8);
		GUI["14"]["PaddingBottom"] = UDim.new(0, 8);


		-- StarterGui.MSRLibrary.Main.Navigation.ButtonHandler.UIListLayout
		GUI["15"] = Instance.new("UIListLayout", GUI["13"]);
		GUI["15"]["Padding"] = UDim.new(0, 2);
		GUI["15"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		
		-- StarterGui.MSRLibrary.Main.Navigation.Line
		GUI["1c"] = Instance.new("Frame", GUI["f"]);
		GUI["1c"]["BorderSizePixel"] = 0;
		GUI["1c"]["BackgroundColor3"] = Color3.fromRGB(85, 85, 85);
		GUI["1c"]["Size"] = UDim2.new(0, 1, 1, 0);
		GUI["1c"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["1c"]["Name"] = [[Line]];

	end
	
	--// ELEMENTS
	function GUI:CreateTab(options)
		options = Library:Validate({
			name = "Preview Tab",
			icon = "rbxassetid://90482668544864"
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false
		}


		--// RENDER
		do
			-- StarterGui.MSRLibrary.Main.Navigation.ButtonHandler.Inactive
			Tab["19"] = Instance.new("TextLabel", GUI["13"]);
			Tab["19"]["BorderSizePixel"] = 0;
			Tab["19"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["19"]["BackgroundColor3"] = Color3.fromRGB(93, 93, 93);
			Tab["19"]["TextSize"] = 14;
			Tab["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Tab["19"]["TextColor3"] = Color3.fromRGB(172, 172, 172);
			Tab["19"]["BackgroundTransparency"] = 1;
			Tab["19"]["Size"] = UDim2.new(1, 0, 0, 30);
			Tab["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["19"]["Text"] = options["name"];
			Tab["19"]["Name"] = [[Inactive]];


			-- StarterGui.MSRLibrary.Main.Navigation.ButtonHandler.Inactive.UIPadding
			Tab["1a"] = Instance.new("UIPadding", Tab["19"]);
			Tab["1a"]["PaddingLeft"] = UDim.new(0, 28);


			-- StarterGui.MSRLibrary.Main.Navigation.ButtonHandler.Inactive.Icon
			Tab["1b"] = Instance.new("ImageLabel", Tab["19"]);
			Tab["1b"]["BorderSizePixel"] = 0;
			Tab["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["1b"]["ImageColor3"] = Color3.fromRGB(172, 172, 172);
			Tab["1b"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Tab["1b"]["Image"] = options["icon"];
			Tab["1b"]["Size"] = UDim2.new(0, 20, 0, 20);
			Tab["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1b"]["BackgroundTransparency"] = 1;
			Tab["1b"]["Name"] = [[Icon]];
			Tab["1b"]["Position"] = UDim2.new(0, -24, 0.5, 0);
			
			
			-- StarterGui.MSRLibrary.Main.ContentContainer
			Tab["1d"] = Instance.new("Frame", GUI["2"]);
			Tab["1d"]["BorderSizePixel"] = 0;
			Tab["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["1d"]["AnchorPoint"] = Vector2.new(1, 0);
			Tab["1d"]["Size"] = UDim2.new(1, -162, 1, -42);
			Tab["1d"]["Position"] = UDim2.new(1, -6, 0, 36);
			Tab["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1d"]["Name"] = [[ContentContainer]];
			Tab["1d"]["BackgroundTransparency"] = 1;
			Tab["1d"]["Visible"] = false;
		
			-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab
			Tab["1e"] = Instance.new("ScrollingFrame", Tab["1d"]);
			Tab["1e"]["BorderSizePixel"] = 0;
			Tab["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["1e"]["Name"] = [[HomeTab]];
			Tab["1e"]["ScrollBarImageTransparency"] = 1;
			Tab["1e"]["Selectable"] = false;
			Tab["1e"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["1e"]["ScrollBarThickness"] = 0;
			Tab["1e"]["BackgroundTransparency"] = 1;
			
			-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.UIPadding
			Tab["25"] = Instance.new("UIPadding", Tab["1e"]);
			Tab["25"]["PaddingTop"] = UDim.new(0, 1);
			Tab["25"]["PaddingRight"] = UDim.new(0, 1);
			Tab["25"]["PaddingLeft"] = UDim.new(0, 1);
			Tab["25"]["PaddingBottom"] = UDim.new(0, 1);
			
			-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.UIListLayout
			Tab["2c"] = Instance.new("UIListLayout", Tab["1e"]);
			Tab["2c"]["Padding"] = UDim.new(0, 6);
			Tab["2c"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		end
		
		
		--// METHODS
		function Tab:Activate()
			if Tab.Active == false then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end
				
				Tab.Active = true
				Library:tween(Tab["19"], {TextColor3 = Color3.fromRGB(255,255,255)})
				Library:tween(Tab["1b"], {ImageColor3 = Color3.fromRGB(255,255,255)})
				Library:tween(Tab["19"], {BackgroundTransparency = .8})
				Tab["1d"].Visible = true
				
				GUI.CurrentTab = Tab
				
			end
		end
		
		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				Library:tween(Tab["19"], {TextColor3 = Color3.fromRGB(200,200,200)})
				Library:tween(Tab["1b"], {ImageColor3 = Color3.fromRGB(200,200,200)})
				Library:tween(Tab["19"], {BackgroundTransparency = 1})
				Tab["1d"].Visible = false
			end
		end
		
		
		--// LOGIC
		do
			Tab["19"].MouseEnter:Connect(function()
				Tab.Hover = true

				if not Tab.Active then
					Library:tween(Tab["19"], {TextColor3 = Color3.fromRGB(255,255,255)})
					Library:tween(Tab["1b"], {ImageColor3 = Color3.fromRGB(255,255,255)})
				end
			end)

			Tab["19"].MouseLeave:Connect(function()
				Tab.Hover = false

				if not Tab.Active then
					Library:tween(Tab["19"], {TextColor3 = Color3.fromRGB(200,200,200)})
					Library:tween(Tab["1b"], {ImageColor3 = Color3.fromRGB(200,200,200)})
				end
			end)

			UIS.InputBegan:Connect(function(input, gpe)
				if gpe then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						Tab:Activate()
					end
				end
			end)


			if GUI.CurrentTab == nil then
				Tab.Activate()
			end
		end

		--// BUTTON
		function Tab:Button(options)
			options = Library:Validate({
				name = "Button",
				callback = function() end
			}, options or {})
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			--// RENDER
			do
				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Button
				Button["1f"] = Instance.new("Frame", Tab["1e"]);
				Button["1f"]["BorderSizePixel"] = 0;
				Button["1f"]["BackgroundColor3"] = Color3.fromRGB(69, 69, 69);
				Button["1f"]["Size"] = UDim2.new(1, 0, 0, 32);
				Button["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["1f"]["Name"] = [[Button]];


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Button.UICorner
				Button["20"] = Instance.new("UICorner", Button["1f"]);
				Button["20"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Button.UIStroke
				Button["21"] = Instance.new("UIStroke", Button["1f"]);
				Button["21"]["Color"] = Color3.fromRGB(94, 94, 94);


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Button.Title
				Button["22"] = Instance.new("TextLabel", Button["1f"]);
				Button["22"]["BorderSizePixel"] = 0;
				Button["22"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["22"]["TextSize"] = 14;
				Button["22"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Button["22"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["22"]["BackgroundTransparency"] = 1;
				Button["22"]["Size"] = UDim2.new(1, -30, 1, 0);
				Button["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["22"]["Text"] = options["name"];
				Button["22"]["Name"] = [[Title]];


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Button.UIPadding
				Button["23"] = Instance.new("UIPadding", Button["1f"]);
				Button["23"]["PaddingTop"] = UDim.new(0, 6);
				Button["23"]["PaddingRight"] = UDim.new(0, 6);
				Button["23"]["PaddingLeft"] = UDim.new(0, 6);
				Button["23"]["PaddingBottom"] = UDim.new(0, 6);


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Button.Icon
				Button["24"] = Instance.new("ImageLabel", Button["1f"]);
				Button["24"]["BorderSizePixel"] = 0;
				Button["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["24"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Button["24"]["Image"] = [[rbxassetid://140292528888396]];
				Button["24"]["Size"] = UDim2.new(0, 20, 0, 20);
				Button["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["24"]["BackgroundTransparency"] = 1;
				Button["24"]["Name"] = [[Icon]];
				Button["24"]["Position"] = UDim2.new(1, 0, 0.5, 0);

			end
			
			--// METHODS
			function Button:SetText(text)
				Button["22"].Text = text
				options.name = text
			end
			
			function Button:SetCallBack(fn)
				options.callback = fn
			end
			
			--// LOGIC
			do
				Button["1f"].MouseEnter:Connect(function()
					Button.Hover = true
					Library:tween(Button["21"], {Color = Color3.fromRGB(102,102,102)})
					
				end)
				
				Button["1f"].MouseLeave:Connect(function()
					Button.Hover = false
					
					if not Button.MouseDown then
						Library:tween(Button["21"], {Color = Color3.fromRGB(94,94,94)})
					end
				end)
				
				UIS.InputBegan:Connect(function(input, gpe)
					if gpe then return end
					
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Library:tween(Button["1f"], {BackgroundColor3 = Color3.fromRGB(92,92,92)})
						Library:tween(Button["21"], {Color = Color3.fromRGB(200,200,200)})
						options.callback()
					end
				end)
				
				UIS.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false
						
						if Button.Hover then
							--// HOVER STATE
							Library:tween(Button["21"], {Color = Color3.fromRGB(94,94,94)}) 
							Library:tween(Button["1f"], {BackgroundColor3 = Color3.fromRGB(69,69,69)})
						else
							--// RESET
							Library:tween(Button["1f"], {BackgroundColor3 = Color3.fromRGB(69,69,69)})
							Library:tween(Button["21"], {Color = Color3.fromRGB(84,84,84)})
						end
					end
				end)
			end
			
			
			return Button
			
		end
		
		--// LABEL
		function Tab:Label(options)
			options = Library:Validate({
				message = "Preview Label",
			}, options or {})
			
			local Label = {}
			
			--// RENDER
			do
				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Label
				Label["26"] = Instance.new("Frame", Tab["1e"]);
				Label["26"]["BorderSizePixel"] = 0;
				Label["26"]["BackgroundColor3"] = Color3.fromRGB(69, 69, 69);
				Label["26"]["Size"] = UDim2.new(1, 0, 0, 32);
				Label["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["26"]["Name"] = [[Label]];


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Label.UICorner
				Label["27"] = Instance.new("UICorner", Label["26"]);
				Label["27"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Label.UIStroke
				Label["28"] = Instance.new("UIStroke", Label["26"]);
				Label["28"]["Color"] = Color3.fromRGB(94, 94, 94);


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Label.Title
				Label["29"] = Instance.new("TextLabel", Label["26"]);
				Label["29"]["BorderSizePixel"] = 0;
				Label["29"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Label["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["29"]["TextSize"] = 14;
				Label["29"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Label["29"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Label["29"]["BackgroundTransparency"] = 1;
				Label["29"]["AnchorPoint"] = Vector2.new(1, 0);
				Label["29"]["Size"] = UDim2.new(1, -30, 1, 0);
				Label["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["29"]["Text"] = options["message"];
				Label["29"]["Name"] = [[Title]];
				Label["29"]["Position"] = UDim2.new(1, 0, 0, 0);
				Label["29"]["TextWrapped"] = true;
				Label["29"]["TextYAlignment"] = Enum.TextYAlignment.Top


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Label.UIPadding
				Label["2a"] = Instance.new("UIPadding", Label["26"]);
				Label["2a"]["PaddingTop"] = UDim.new(0, 6);
				Label["2a"]["PaddingRight"] = UDim.new(0, 6);
				Label["2a"]["PaddingLeft"] = UDim.new(0, 6);
				Label["2a"]["PaddingBottom"] = UDim.new(0, 6);


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Label.Icon
				Label["2b"] = Instance.new("ImageLabel", Label["26"]);
				Label["2b"]["BorderSizePixel"] = 0;
				Label["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["2b"]["AnchorPoint"] = Vector2.new(0, 0.5);
				Label["2b"]["Image"] = [[rbxassetid://80347955748035]];
				Label["2b"]["Size"] = UDim2.new(0, 20, 0, 20);
				Label["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["2b"]["BackgroundTransparency"] = 1;
				Label["2b"]["Name"] = [[Icon]];
				Label["2b"]["Position"] = UDim2.new(0, 0, 0.5, 0);

			end
			
			--// METHODS
			
			function Label:SetText(text)
				options.message = text
				Label:_update()
			end
			
			function Label:_update()
				Label["29"].Text = options.message
				
				Label["29"].Size = UDim2.new(Label["29"].Size.X.Scale, Label["29"].Size.X.Offset, 0, math.huge)
				Label["29"].Size = UDim2.new(Label["29"].Size.X.Scale, Label["29"].Size.X.Offset, 0, Label["29"].TextBounds.Y)
				Label["26"].Size = UDim2.new(Label["26"].Size.X.Scale, Label["26"].Size.X.Offset, 0, Label["29"].TextBounds.Y + 12)
			end
			
			
			Label:_update()
			return Label
		end
		
		--// TOGGLE
		function Tab:Toggle(options)
			options = Library:Validate({
				name = "Preview Toggle",
				callback = function() end
			}, options or {})


			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}
			
			--// RENDER
			do
				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.ToggleInactive
				Toggle["49"] = Instance.new("Frame", Tab["1e"]);
				Toggle["49"]["BorderSizePixel"] = 0;
				Toggle["49"]["BackgroundColor3"] = Color3.fromRGB(69, 69, 69);
				Toggle["49"]["Size"] = UDim2.new(1, 0, 0, 32);
				Toggle["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["49"]["Name"] = [[ToggleInactive]];


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.ToggleInactive.UICorner
				Toggle["4a"] = Instance.new("UICorner", Toggle["49"]);
				Toggle["4a"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.ToggleInactive.UIStroke
				Toggle["4b"] = Instance.new("UIStroke", Toggle["49"]);
				Toggle["4b"]["Color"] = Color3.fromRGB(94, 94, 94);


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.ToggleInactive.Title
				Toggle["4c"] = Instance.new("TextLabel", Toggle["49"]);
				Toggle["4c"]["BorderSizePixel"] = 0;
				Toggle["4c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["4c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["4c"]["TextSize"] = 14;
				Toggle["4c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Toggle["4c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["4c"]["BackgroundTransparency"] = 1;
				Toggle["4c"]["Size"] = UDim2.new(1, -36, 1, 0);
				Toggle["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["4c"]["Text"] = options["name"];
				Toggle["4c"]["Name"] = [[Title]];


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.ToggleInactive.UIPadding
				Toggle["4d"] = Instance.new("UIPadding", Toggle["49"]);
				Toggle["4d"]["PaddingTop"] = UDim.new(0, 6);
				Toggle["4d"]["PaddingRight"] = UDim.new(0, 6);
				Toggle["4d"]["PaddingLeft"] = UDim.new(0, 6);
				Toggle["4d"]["PaddingBottom"] = UDim.new(0, 6);


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.ToggleInactive.ToggleHolder
				Toggle["4e"] = Instance.new("Frame", Toggle["49"]);
				Toggle["4e"]["BorderSizePixel"] = 0;
				Toggle["4e"]["BackgroundColor3"] = Color3.fromRGB(72, 72, 72);
				Toggle["4e"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Toggle["4e"]["Size"] = UDim2.new(0, 20, 0, 20);
				Toggle["4e"]["Position"] = UDim2.new(1, -5, 0.5, 0);
				Toggle["4e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["4e"]["Name"] = [[ToggleHolder]];


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.ToggleInactive.ToggleHolder.UICorner
				Toggle["4f"] = Instance.new("UICorner", Toggle["4e"]);
				Toggle["4f"]["CornerRadius"] = UDim.new(0, 5);


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.ToggleInactive.ToggleHolder.UIStroke
				Toggle["50"] = Instance.new("UIStroke", Toggle["4e"]);
				Toggle["50"]["Color"] = Color3.fromRGB(94, 94, 94);
			end
			
			--// METHODS
			do
				function Toggle:Toggle(b)
					if b == nil then
						Toggle.State = not Toggle.State
					else
						Toggle.State = b	
					end
					
					if Toggle.State then
						Library:tween(Toggle["4e"], {BackgroundColor3 = Color3.fromRGB(52, 255, 126)})
					else
						Library:tween(Toggle["4e"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
					end
					
					options.callback(Toggle.State)
				end
			end
			
			--// LOGIC
			do
				Toggle["49"].MouseEnter:Connect(function()
					Toggle.Hover = true
					Library:tween(Toggle["4b"], {Color = Color3.fromRGB(102,102,102)})

				end)

				Toggle["49"].MouseLeave:Connect(function()
					Toggle.Hover = false

					if not Toggle.MouseDown then
						Library:tween(Toggle["4b"], {Color = Color3.fromRGB(94,94,94)})
					end
				end)

				UIS.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
						Toggle.MouseDown = true
						Library:tween(Toggle["49"], {BackgroundColor3 = Color3.fromRGB(92,92,92)})
						Library:tween(Toggle["4b"], {Color = Color3.fromRGB(200,200,200)})
						Toggle:Toggle()
					end
				end)

				UIS.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Toggle.MouseDown = false

						if Toggle.Hover then
							--// HOVER STATE
							Library:tween(Toggle["4b"], {Color = Color3.fromRGB(102,102,102)})
							Library:tween(Toggle["49"], {BackgroundColor3 = Color3.fromRGB(69, 69, 69)})
						else
							--// RESET
							Library:tween(Toggle["49"], {BackgroundColor3 = Color3.fromRGB(69, 69, 69)})
							Library:tween(Toggle["4b"], {Color = Color3.fromRGB(94, 94, 94)})
						end
					end
				end)
			end
			
			return Toggle
		end
		
		--// SLIDER
		function Tab:Slider(options)
			options = Library:Validate({
				name = "Slider Preview",
				min = 0,
				max = 100,
				default = 50,
				callback = function(v) print(v) end
			}, options or {})

			local Slider = {
				MouseDown = false,
				Hover = false,
				Connection = nil
			}
			
			--// RENDER
			
			do
				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Slider
				Slider["2d"] = Instance.new("Frame", Tab["1e"]);
				Slider["2d"]["BorderSizePixel"] = 0;
				Slider["2d"]["BackgroundColor3"] = Color3.fromRGB(69, 69, 69);
				Slider["2d"]["Size"] = UDim2.new(1, 0, 0, 42);
				Slider["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["2d"]["Name"] = [[Slider]];


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Slider.UICorner
				Slider["2e"] = Instance.new("UICorner", Slider["2d"]);
				Slider["2e"]["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Slider.UIStroke
				Slider["2f"] = Instance.new("UIStroke", Slider["2d"]);
				Slider["2f"]["Color"] = Color3.fromRGB(94, 94, 94);


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Slider.Title
				Slider["30"] = Instance.new("TextLabel", Slider["2d"]);
				Slider["30"]["BorderSizePixel"] = 0;
				Slider["30"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["30"]["TextSize"] = 14;
				Slider["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Slider["30"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["30"]["BackgroundTransparency"] = 1;
				Slider["30"]["Size"] = UDim2.new(1, -44, 1, -10);
				Slider["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["30"]["Text"] = options["name"];
				Slider["30"]["Name"] = [[Title]];


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Slider.UIPadding
				Slider["31"] = Instance.new("UIPadding", Slider["2d"]);
				Slider["31"]["PaddingTop"] = UDim.new(0, 6);
				Slider["31"]["PaddingRight"] = UDim.new(0, 6);
				Slider["31"]["PaddingLeft"] = UDim.new(0, 6);
				Slider["31"]["PaddingBottom"] = UDim.new(0, 6);


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Slider.Value
				Slider["32"] = Instance.new("TextLabel", Slider["2d"]);
				Slider["32"]["BorderSizePixel"] = 0;
				Slider["32"]["TextXAlignment"] = Enum.TextXAlignment.Right;
				Slider["32"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["32"]["TextSize"] = 14;
				Slider["32"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Slider["32"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["32"]["BackgroundTransparency"] = 1;
				Slider["32"]["AnchorPoint"] = Vector2.new(1, 0);
				Slider["32"]["Size"] = UDim2.new(0, 24, 1, -10);
				Slider["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["32"]["Text"] = tostring(options["default"]);
				Slider["32"]["Name"] = [[Value]];
				Slider["32"]["Position"] = UDim2.new(1, 0, 0, 0);


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Slider.SliderBack
				Slider["33"] = Instance.new("Frame", Slider["2d"]);
				Slider["33"]["BorderSizePixel"] = 0;
				Slider["33"]["BackgroundColor3"] = Color3.fromRGB(32, 32, 32);
				Slider["33"]["AnchorPoint"] = Vector2.new(0, 1);
				Slider["33"]["Size"] = UDim2.new(1, 0, 0, 4);
				Slider["33"]["Position"] = UDim2.new(0, 0, 1, 0);
				Slider["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["33"]["Name"] = [[SliderBack]];


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.UICorner
				Slider["34"] = Instance.new("UICorner", Slider["33"]);



				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.UIStroke
				Slider["35"] = Instance.new("UIStroke", Slider["33"]);
				Slider["35"]["Color"] = Color3.fromRGB(94, 94, 94);


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.Draggable
				Slider["36"] = Instance.new("Frame", Slider["33"]);
				Slider["36"]["BorderSizePixel"] = 0;
				Slider["36"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["36"]["Size"] = UDim2.new(0.5, 0, 1, 0);
				Slider["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["36"]["Name"] = [[Draggable]];


				-- StarterGui.MSRLibrary.Main.ContentContainer.HomeTab.Slider.SliderBack.Draggable.UICorner
				Slider["37"] = Instance.new("UICorner", Slider["36"]);

			end
			
			--// METHODS
			
			function Slider:SetValue(v)
				if v == nil then
					local percentage = math.clamp((mouse.X - Slider["33"].AbsolutePosition.X) / (Slider["33"].AbsoluteSize.X), 0, 1)
					local value = math.floor(((options.max - options.min) * percentage) + options.min)

					Slider["32"].Text = tostring(value)
					Slider["36"].Size = UDim2.fromScale(percentage, 1)
				else
					Slider["32"].Text = tostring(v)
					Slider["36"].Size = UDim2.fromScale(((v - options.min) / (options.max - options.min)), 1)
				end	
				options.callback(Slider:GetValue())
			end
			
			function Slider:GetValue()
				return tonumber(Slider["32"].Text)
			end
			
			--// LOGIC
			do
				Slider["2d"].MouseEnter:Connect(function()
					Slider.Hover = true
					
					Library:tween(Slider["2f"], {Color = Color3.fromRGB(102,102,102)})
					Library:tween(Slider["35"], {Color = Color3.fromRGB(102,102,102)})
				end)

				Slider["2d"].MouseLeave:Connect(function()
					Slider.Hover = false

					if not Slider.MouseDown then
						Library:tween(Slider["2f"], {Color = Color3.fromRGB(94,94,94)})
						Library:tween(Slider["35"], {Color = Color3.fromRGB(94,94,94)})
					end
				end)

				UIS.InputBegan:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
						Slider.MouseDown = true
						Library:tween(Slider["2d"], {BackgroundColor3 = Color3.fromRGB(92,92,92)})
						Library:tween(Slider["2f"], {Color = Color3.fromRGB(200,200,200)})
						Library:tween(Slider["35"], {Color = Color3.fromRGB(200,200,200)})
						
						if not Slider.Connection then
							Slider.Connection = RS.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)

				UIS.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.MouseDown = false

						if Slider.Hover then
							--// HOVER STATE
							Library:tween(Slider["2f"], {Color = Color3.fromRGB(94,94,94)}) 
							Library:tween(Slider["2d"], {BackgroundColor3 = Color3.fromRGB(69,69,69)})
						else
							--// RESET
							Library:tween(Slider["2d"], {BackgroundColor3 = Color3.fromRGB(69,69,69)})
							Library:tween(Slider["2f"], {Color = Color3.fromRGB(84,84,84)})
						end
						
						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil	
					end
				end)
				
			end
			
			return Slider
		end
		
		
		return Tab
	end
		
	return GUI
end