-- Tabs
-- Modern, Anime, Classical, Gaming, Emotional, Seasonal, More

loadstring(game:HttpGet("https://pastebin.com/raw/8N7KC86c"))()

local Open6 = Instance.new("ScreenGui")
local OpenFrame = Instance.new("Frame")
local Open7 = Instance.new("ImageButton")
local Open = Instance.new("ImageButton")

Open6.Name = "Tools"
Open6.Parent = game.CoreGui
Open6.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

OpenFrame.Name = "OpenFrame"
OpenFrame.Parent = Open6
OpenFrame.BackgroundColor3 = Color3.fromRGB(83, 83, 83)
OpenFrame.Position = UDim2.new(0.858712733, 0, 0.0237762257, 0)
OpenFrame.Size = UDim2.new(0, 50, 0, 100)
OpenFrame.Active = true
OpenFrame.Draggable = true

Open7.Name = "Open7"
Open7.Parent = OpenFrame
Open7.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Open7.Position = UDim2.new(0, 0, 0, 0)
Open7.Size = UDim2.new(0, 50, 0, 50)
Open7.Image = "rbxassetid://123456789"
Open7.ImageColor3 = Color3.fromRGB(255, 255, 255)
Open7.ScaleType = Enum.ScaleType.Fit
Open7.MouseButton1Click:Connect(function()
    game.CoreGui:FindFirstChild("arizon").Enabled = not game.CoreGui:FindFirstChild("arizon").Enabled
end)

Open.Name = "Open"
Open.Parent = OpenFrame
Open.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Open.Position = UDim2.new(0, 0, 0, 50)
Open.Size = UDim2.new(0, 50, 0, 50)
Open.Image = "rbxassetid://987654321"
Open.ImageColor3 = Color3.fromRGB(255, 255, 255)
Open.ScaleType = Enum.ScaleType.Fit
Open.MouseButton1Click:Connect(function()
    game.CoreGui:FindFirstChild("customsheet").Enabled = not game.CoreGui:FindFirstChild("customsheet").Enabled
end)

-- Shift

local isPaused = false
local currentIteration = 0

local function UseShiftKeys()

shared.stop = true
wait(1)
shared.stop = false

shared.nospacedelay = shared.nospacedelay or false

local str = shared.scr or "qw[er]ty"
local FinishTime = shared.ftime or 10
local tempo = shared.tempo or 120
local vim = game:GetService("VirtualInputManager")

local nstr = string.gsub(str,"[[%]\n]","")

local delay = tempo and (6 / tempo) or shared.delay or FinishTime / (string.len(nstr) / 1.05)

print("Finishing in",math.floor((delay*#nstr)/60),"minute/s",tostring(tonumber(tostring((delay*#nstr)/60):sub(3,8))*60):sub(1,2),"second/s")

local shifting = false

local function doshift(key)
    if key:upper() ~= key then return end
    if tonumber(key) then return end
    
    vim:SendKeyEvent(true, 304, false, nil)
    shifting = true
end

local function endshift()
    if not shifting then return end

    vim:SendKeyEvent(false, 304, false, nil)
    shifting = false
end

local queue = ""
local rem = true
currentIteration = currentIteration + 1
local iteration = currentIteration

for i = 1, #str do
if shared.stop == true or currentIteration ~= iteration then return end

if isPaused then
repeat
wait()
until not isPaused or currentIteration ~= iteration
end

local c = str:sub(i, i)

if c == "[" then
    rem = false
    continue
elseif c == "]" then
    rem = true
    if string.find(queue, " ") then
        local keys = {}  -- Create an empty table to store the keys
        for ii = 1, #queue do
            local cc = queue:sub(ii, ii)
            doshift(cc)
            table.insert(keys, string.byte(cc:lower()))
        end
        pcall(function()
            vim:SendKeyEvents(true, keys, false, nil)
            vim:SendKeyEvents(false, keys, false, nil)  -- Release the keys simultaneously
        end)
        endshift()
    else
        for ii = 1, #queue do
            local cc = queue:sub(ii, ii)
            pcall(function()
                doshift(cc)
                vim:SendKeyEvent(true, string.byte(cc:lower()), false, nil)
                endshift()
            end)
            wait()
        end
        wait()
        for ii = 1, #queue do
            local cc = queue:sub(ii, ii)
            pcall(function()
                doshift(cc)
                vim:SendKeyEvent(false, string.byte(cc:lower()), false, nil)
                endshift()
            end)
            wait()
        end
    end
    queue = ""
    continue
    elseif c == " " or string.byte(c) == 10 then
        if shared.nospacedelay then continue end
        wait(delay)
        continue
    elseif c == "|" or c == "-" then
        wait(delay * 2)
        continue
    elseif c == "\n" then
        continue
    elseif c == "!" then
        doshift(c)
        vim:SendKeyEvent(true, 49, false, nil)
        wait()
        vim:SendKeyEvent(false, 49, false, nil)
        endshift()
    elseif c == "@" then
        doshift(c)
        vim:SendKeyEvent(true, 50, false, nil)
        wait()
        vim:SendKeyEvent(false, 50, false, nil)
        endshift()
    elseif c == "$" then
        doshift(c)
        vim:SendKeyEvent(true, 52, false, nil)
        wait()
        vim:SendKeyEvent(false, 52, false, nil) 
        endshift()
    elseif c == "%" then
        doshift(c)
        vim:SendKeyEvent(true, 53, false, nil)
        wait()
        vim:SendKeyEvent(false, 53, false, nil)
        endshift()
    elseif c == "^" then
        doshift(c)
        vim:SendKeyEvent(true, 54, false, nil)
        wait()
        vim:SendKeyEvent(false, 54, false, nil)
        endshift()
    elseif c == "*" then
        doshift(c)
        vim:SendKeyEvent(true, 56, false, nil)
        wait()
        vim:SendKeyEvent(false, 56, false, nil)
        endshift()
    elseif c == "(" then
        doshift(c)
        vim:SendKeyEvent(true, 57, false, nil)
        wait()
        vim:SendKeyEvent(false, 57, false, nil)
        endshift()
    end

    if not rem then
        queue = queue .. c
        continue
    end

    pcall(function()
        doshift(c)
        vim:SendKeyEvent(true, string.byte(c:lower()), false, nil)
        wait()
        vim:SendKeyEvent(false, string.byte(c:lower()), false, nil)
        endshift()
    end)

    wait(delay)
end
end

-- UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Madness676/sharedlol/main/new.lua"))()

local win = Library:Create({
    Name = "Auto Piano 3.5 | Panda Hub"
})

local Settings = win:Tab('Settings')
local Settings2 = Settings:Section('Adjust Speed | Stop | FPS')

local Speedo = ""
local Speedo2 = Speedo

Settings2:Textbox('Adjust Speed', function(tempov)
    local Speedo3 = tempov

    if Speedo3 == "" then
        Speedo2 = ""
    else
        Speedo2 = Speedo3
    end
end)

Settings2:Button('Stop', function()
    shared.scr = [[  ]]
    UseShiftKeys()
end)

Settings2:Button('Pause (Click again to unpause)', function()
isPaused = not isPaused
end)
Settings2:Button('FPS Booster', function()

local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 1
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end

end)

local Modern = win:Tab('Modern')
local Modern2 = Modern:Section('Modern | Memes | Movies')

Modern2:Button("Ballin' (Meme)", function()
if Speedo2 == "" or Speedo2 == nil then
shared.tempo = 47
else
shared.tempo = Speedo2
end

shared.scr = [[ kkkk l-kj-hk-zzzzk zzzzzzzx-zzzzz x-zj-hh-zzzzz x-zj-hhkkkkjhh j jhj k-l kkkjh j jhz k-kkkkkjh j jhz k-zzx k j jjhz k ]]

UseShiftKeys()
end)

Modern2:Button("He's a pirate - Pirates of the Caribbean", function()
if Speedo2 == "" or Speedo2 == nil then
shared.tempo = 80
else
shared.tempo = Speedo2
end

shared.scr = [[ y y y y y y y y y y y y y y y [2y] y [9y] y [2y] y [9y] e t [2y] y 9 y u [^i] i ^ i o [6u] u 6 y t [2t] y 9 e t [^y] y ^ y u [4i] i 4 i o [6u] u 6 y t [2y] 9 e t [2y] y 9 y i [^o] o ^ o p [5P] P 5 p o [2p] y 9 y u [^i] i ^ o [2p] y 9 y i [6u] u 6 i y [T6u] 6 p s [2d] d 9 d f [^g] g ^ g h [6f] f 6 d s [2s] d 9 p s [^d] d ^ d f [4g] g 4 g h [1f] f 8 d s [2d] 9 p s [2d] d 9 d g [^h] h ^ h j [5J] J 5 j h [2j] d 9 d f [^g] g ^ h [2j] d 9 d g [6f] f 6 d P [2d] 9 [2p] 9 [2ui] 9 9 9 [9y] ]]

UseShiftKeys()

end)

Modern2:Button("Fly Me To The Moon - Frank Sinatra", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for Rondo Alla Turca by Wolfgang Amadeus Mozart

    
    shared.tempo = 53 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ S d-j-[ysj]----
[Ys]--jkl k-
[oasf]--[oasf]----
[Soaf]--[Soaf]--H-
j-s-[yips]----
[wi]-[wi]--as d-
s-[8uOP]--[O0ya]--
[ud][eol]-[eok]-[eoj]-[eoh]-
g [ys]-[ys]-h [ysj]-[ysl]-
[wij]Jk [wij]-[wih]-[wig]-
[ta]-[ta]-[tP]-[tP]-
[ip]-j [iph]-[ipg]-[ipf]-
d [rp]-[rp]-f [rpg]-[rpj]-
H [uO]-[Oug]-fgf-[Oud]-s
[eo]-[eo]-[yI]-[yI]-S
[ysd]-j [ysj]-[ys]-y-
[Ys]-[Ys]-[Ysj]l-[Ysk]-
[ud]-[ud]-[ud]-[ud]-
[pS]-[pS]-[pS]-[pS]-a
[yps]-g [ys]-g [ys]-[ys]-
[wi]-[wi]-s [gj]-a [fh]-p
[tdg]--[toaf]----
[rpdj]-rpdgj[udOH]-j-k-
[fl]-[fl] [dk]-[8sj]-[0ah]-
[pg] 9-0-h [qj]-h [el]-
[wdk]-[dk] [esj]-[rah]-[ypg]-
t-8 9-0-w-
Q q-j [wh]-[eg]-[tf]-
d r-t-f [yg]-[ij]-
H u-H [Yg]-[yf]gf-[rd]-
s e-e r-t-T-
y-d [9s]-j q-e-
(-Q-[ej]Jkl [tk]-
0-w-E-y-
T-T E-e-e fw-
f-s-s-[qety]--
[etQY]----D-
f-s-s-[wrtu]--
[Twru]--u o-p s-
f9-s 0-s q-Q-
[wi]-[wi]--a[8s] [9d]-
[8s]-[8uOP]--[O0ya]--
[tuo]--[9tuI]--[Eyi]----
[P8gj]-[P8gj]--
jJkl[asf]-k j-[Saf]-
h g-[ipf]-h j-[pID]-
l k-[iOD]-j h-[Oid]-
g f-[uOS]-[ops]----
q ajh0-g9-h f8-
d--8-f g9-jq-
H 0-g f(-d 9-P a-
s----8--
f [el]flkfokjfj[afh]-
[psg] y--[qh] jJkl-
Q [wk]lkjkjh-[Oag]-
[oaf] 8--P-P p--
[isfj] [usfh]-[isfg]-[sf]-
[Od] 0--[Qsf] [Wdg]-[sfj]-
[dH] r-[Odg]-[Sof]-0 Sd
s e--r t-T-
y-t O-[Ytp]-0 q-
Q w-O-[qp] [Yps]-[Oya]-
[oaf]-0-w E-W-
pe-ar ST--[Pof]-
f-s-[qtyps]--
[tQY]-I p-s [pD]y-[iD]W-
fw-s-[rtuos]--
[Tru]-[Tru]-u o-p s-
i9psfs 0-[is] q-Q-
w-hhhh----
r t y-t--[sf]-
t-[sg]-y-[sG]-
Y-[sh]-GQ hw-[sf]8--
6 ]]

UseShiftKeys()

end)

Modern2:Button("Let Her Go - Passenger", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 32 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ papo
[8y]u[wo] tu aa--[Q9ep]apo
[0y]u[ro] 0ua [Q9ep]-papo
[8y]u[wo] tu oda-[Q9eo]p a
0 Q w r 0--[Q9ep]apo
[8y]u[wo] tu aa--[Q9ep]apo
[0y]u[ro] 0ua--[Q9ep]-papo
[8y]u[wo] tu oda--[Q9eo]p a
0 Q w r 0--[Q9ep]apo
[29a] 6 9 6 [30] aapapo
[18o] [5o]u[8o]u[5ro] [5w]-papo
[29p] [6p]o[9a] [6p]p[30]o-papo
[18p]o[5u]u[8u]y[5o] [5w]--
[29] 6 9 6 [29] aaa po
[18o] [5o]u[8o]u[5o] [5w]-papo
[29p] [6p]o[9a] [6p]p[30]o-papo
[18p]o[5u]u[8u]y[5o] [5w] 9 w 9 
[9y] e y e [29] poap p
[3uo] 7 [0I] o [1uo] 5 8 [Ip] 
[2yI] 6 [9u]-[7yI] $ 7-
[3wu] 7 [0eI] o [1uo] 5 [8I] u 
[29yI]----
[3a]a[7a]a[0wa]poo[1o] 5s[80]a a
2p6p[Q9p]oI [7I] $I[7a] [Qp] 
[3o] [7u]u[0wa] po[1u] 5 [80]-
2 6 9 0 Q--a
[3uoa][oa][7oa][oa][0woa] [Ip][uo][1yuo] 5[ps][80][oa] [oa]
[I2p][Ip]6[Ip][QI9p][uo][yI] [7yI] $ [7ya][ya][Qya][ya]
[3oa] 7[ro][0w]o[Ip][uo]1 5 [80]-
2 6 9 0 Q aapapo
[18o] [5o]u[8o]u[5o] [5w]-papo
[29p] [6p]o[9a] [6p]p[30]o-papo
[18p]o[5u]u[8u]y[5o] [5w]--
[29] 6 9 6 [29] [oa][oa][oa] [Ip][uo]
[18tuo] [5uo][tu][8uo][tu][5ro] [5w]-[Ip][oa][Ip][uo]
[I29p] [I6p][uo][9oa] [I6p][Ip][30][ro]-[Ip][oa][Ip][uo]
[18p]o[5u]u[8u]y[5ro] [5w] 9 w 9 
[9y] e y e [29]--
[3a]a[7a]a[0wa]poo[1o] 5s[80]a a
2p6p[9Q]oII[7I] $y[7a] [Qp] 
[3o] [7u]u[0wa] po[1u] 5 [80]-
2 6 9 0 Q--dd
[I3d][Id][I7d][Id][I0wd][us] [ya][1us] [5tu][of][80][Id][Id][Id]
2 [I6p] [QI9p][uo][Ip][ya]7 [$a] [7a]a[Qa]a
[3oa] [7wu][wu][0woa] [Ip][uo]1[tu]5 [80]-
2 6 9 0 Q aapapo
[18o] [5o]u[8o]u[5o] [5w]-papo
[29p] [6p]o[9a] [6p]p[30]o-papo
[18p]o[5u]u[8u]y[5o] [5w]--
[29] 6 9 6 [29] aaa po
[18s] [5s]a[8s]a[5d]a[5w]-dddd
[29d] [6p]p[9s] [6s]s[30]a-papo
[18p]o[5u]u[8u]y[5o] [5w] 9 w 9 
[9y] e y e [29] aaap-
[30a] 7 0 [7p]a[18s] 5 8 [5a] 
[29I] 6 9 6 [29] aaap-
[30a] 7 0 [7p]a[18s] 5 8 [5a] 
[29I] 6 9 6 [29] ddda-
[3f] [7d] [0wa]-1 5 [80]-
2 6 [9Q]-7 $ 7 Q 
[30] 7 0 7 [18] 5 7 5 
[29] 6 9 6 [29] ddddsa
[18s] [5s]a[8s]a[5d]a[5w]-dddd
[29d] [6p]p[9s] [6a]s[30a]-dddd
[18d]s[5s]s[8s]a[5d]a[5w]--
[29] 6 9 6 [29] ddd dd
[18f] [5d]d[8p]o[5a]a[5w]-dddd
[29d] [6p]p[9s] [6s]s[30]a-dddd
[18d]s[5s]s[8s]a[5d]a[5w] 9 w 9 
[9y] e y e [29] aapapo
[80wo] ououo [79w]-papo
[Q9ep] poa pp[0wr]o-papo
[80wp]ouuuyo [79w]--
[Q9e]----aaa po
[80wo] ououo [79w]-papo
[Q9ep] poa pp[0wr]o-papo
[80wp]ouuuyo [79w]--
[Q9e]----yyap p
3ou ]]

UseShiftKeys()

end)

Modern2:Button("Beach House - Space Song", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 43 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [(D]hJ-Y-y-t-w 
[D8shl]-Y-y-t-o 
[qsgH]-Y-y-t-w 
[dh^PJ]-w-q ^ [^E] ^ 
[h(DJ] ( [EY] (E[(y]E[h(DJ]t[hEDJ] [wh(DJ]E
[D8hl] 8 [wY] 8w[8y]w[D8hl]t[Dwhl] [D8ohl]w
[qsgH] q [tY] qt[qy]t[qsgH]t[tsgH] [qwsgH]t
[dh^J] ^ [qw] ^q[^q]q[dh^J] [qdhEJ] [dh^J]q
[@Poh]5^(wEYo[@P]5[s^OH]([Pwoh]E[YOig]o
[1oh]@58(tYo[1o]@[O5ig]8[o(YD]t[Yig]o
[4oh]%8qWtiO[4s]%[8OH]q[Woh]t[ig]O
[2oh]4^9qEyo[2d]4[^ig]9[qYD]E[yd]o
[@Poh]5^(wEYo[@P]5[s^OH]([Pwoh]E[YOig]o
[1oh]@58(tYo[1o]@[O5ig]8[o(YD]t[Yig]o
[4oh]%8qWtiO[4s]%[8OH]q[Woh]t[ig]O
[2oh]4^9qEyo[2d]4[^ig]9[qYD]E[yd]o
[(oh] ( [oEYD] [wo(YD][EY][(wyid][EY][(w][Yts][EY]s[(wto][EY]
[8o] 8 [wtoYD] 8[wt][8yid][wt]8[Yts][wt] [D8oh][wt]
q q [ti] q[ti]q[ti]q [ti] q[ti]
[^dg] ^ [qE] ^[qE]^[qE][^E] [^E] [^E] 
( ( [oEYD] [wo(YD][EY][(wyid][EY][(w][Yts][EY] [(wto][EY]
8 8 [wtoYD] 8[wt][8yid][wt]8[Yts][wt] [D8oh][wt]
q q [ti] q[ti]q[ti]q [ti] q[ti]
[^dg] ^ [qE] ^[qE]^[qE][^E] [^E] [^E] 
( ( [ohEYDZ] [wo(YD][EY][(wyid][EY][(w][Yts][hEYZ] [(wto][EY]
8 8 [YDwtol] 8[wt][8yid][wt]8[Yts][wtl] [D8oh][wt]
q q [tioYD] [qoYD][ti][qyid][ti]q[Yts][tiDH] [qwto][ti]
^ ^ [Eqwoh] ^[qE][^qi][qE][^E] [^EPh] [^E] 
[@Poh]5^(wEYo[@P]5[s^OH]([Pwoh]E[YOig]o
[1oh]@58(tYo[1o]@[O5ig]8[o(YD]t[Yig]o
[4oh]%8qWtiO[4s]%[8OH]q[Woh]t[ig]O
[2oh]4^9qEyo[2d]4[^ig]9[qYD]E[yd]o
[vYZB]o[vPZB]D[hvZB]J[vZB]v[vYZB]o[vPZB]D[hvZB]J[vZB]v
[tzvm]Y[ozvm]s[Dzvm]l[Zzvm]v[tzvm]Y[ozvm]s[Dzvm]l[Zzvm]v
[Ziv]OsgHlcV[izv]OsgHlcV
[ycV]iPdgJzv[Zyv]iPdgJzv
[vYB]oPDhJZv[YJz]oPDhJZv
[tlZ]YosDlZv[Jtz]YosDlZv
[Ziv]OsgHlcV[izv]OsgHlcV
[ylZ]iPdgJzv[Jyz]iPdgJzv
[YJZhv][Yo][yP][tD][Eh][YJ][yZ][tv][EYJz][Yo][yP][tD][Eh][YJ][yZ][tv]
[tlEZ][Yo][io][Ys][yD][ol][iZ][Yv][Jtyz][Yo][io][Ys][yD][ol][iZ][Yv]
[Zyiv][iO][Ys][sg][yH][il][Yc][PV][yizv][iO][Ys][Pg][yH][il][Yc][OV]
[ylZ][Yi][yP][td][Eg][YJ][yz][tv][EJyz][Yi][yP][td][Eg][YJ][yz][tv]
[YJZohv]oPDhJZv[YJz]o[OP]D[oh]J[iZ]v
[tolZ]YosDlZv[Jtz]Y[io]s[YD]l[iZ]v
[Ziov]OsgHlcV[izv]O[Os]g[oH]l[ic]V
[yolZ]iPdgJzv[Jyz]i[iP]d[Yg]J[yz]v
[YJZohv]oPDhJZv[YJz]o[OP]D[oh]J[iZ]v
[tolZ]YosDlZv[Jtz]Y[io]s[YD]l[iZ]v
[Ziov]OsgHlcV[izv]O[Os]g[oH]l[ic]V
[yolZ]iPdgJzv[Jyz]i[iP]d[Yg]J[yz]v ]]

UseShiftKeys()

end)

Modern2:Button("Interstellar Main Theme - Hans Zimmer", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 80 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [48qe] - u - q - [qe] - u - q - [59wr] - u - w - [wr] - u - w - [60et] - u - e - [et] -
u - e - [59wy] - u - w - [wy] - u --- [48qe] - u - q - [qe] - u - q - [59wr] - u -
w - [wr] - u - w - [60et] - u - e - [et] - u - e - [59wy] - u - w - [wy] - u |
[6e] u 0 t 0 e 0 u 0 t 0 e 0 u 0 t 0 e 0 u 0 t -
[48qeup] - f - q - [eup] - f - q - [59wrua] - f - w - [rua] - f - w -
[60etus] - f - e - [tus] - f - e - [59wyd] - f - w - [yd] - f - w -
[4qeup] - f - 8 - [qeup] - f - q - [5wrua] - f - 9 - [wrua] - f - w -
[6etus] - f - 0 - [etus] - f - e - [5wyd] - f - 9 - [wyd] - f |
[4qeup] 8 [uf] q 8 q [4qeup] 8
[uf] q 8 q [5wrua] 9 [uf] w 9 w [5wrua] 9 [uf] w 9 w
[6etus] 0 [uf] e 0 e [6etus] 0 [uf] e 0 e [5wyd] 9 [uf] w
9 w [9yd] w [uf] 9 [ra] - [4qeup] 8 [quf] 8 q 8 [4qeup] 8
[quf] 8 q 8 [5wrua] 9 [wuf] 9 w 9 [5wrua] 9 [wuf] 9 w 9
[6etus] 0 [euf] 0 e 0 [6etus] 0 [euf] 0 e 0 [5wyd] 9 [wuf] 9
w 9 [5wyd] 9 [wuf] 9 [wra] 9 [4qeup] 8 [qfx] 8 q 8 [4qeup] 8
[qfx] 8 q 8 [5wrua] 9 [wfx] 9 w 9 [5wrua] 9 [wfx] 9 w 9
[6etus] 0 [efx] 0 e 0 [6etus] 0 [efx] 0 e 0 [5wyd] 9 [wfx] 9
w 9 [5wyd] 9 [wfx] 9 [wra] 9 [4qeup] 8 [qfx] 8 q 8 [4qeup] 8
[qfx] 8 q 8 [5wrua] 9 [wfx] 9 w 9 [5wrua] 9 [wfx] 9 w 9
[6etus] 0 [efx] 0 e 0 [6etus] 0 [efx] 0 e 0 [5wyd] 9 [wfx] 9
w 9 [5wyd] 9 [wfx] 9 [wak] 9 [4qpfj] 8 [qfx] 8 q 8 [4qpfj] 8
[qfx] 8 q 8 [5wafk] 9 [wfx] 9 w 9 [5wafk] 9 [wfx] 9 w 9
[6esfl] 0 [efx] 0 e 0 [6esfl] 0 [efx] 0 e 0 [5wdz] 9 [wfx] 9
w 9 [5wdz] 9 [fx] - [5ra] -
[48qe] - x - q - [qe] - x - q -
[59wr] - x - w - [wr] - x - w -
[60et] - x - e - [et] - x - e -
[59wy] - x - w - [wy] - x - r -
[6e] - u - t - [6e] - u 6 t - [6e] - u 6 t 6 e - u - t -
[4qe] - u q t q e q u q t q
[5wr] - u w t w r w u w t w
[6et] - u e t e t e u e t e
[5wy] - u w r w y w u w r w
[4qe] - u q t q e q u q t q
[5wr] - u w t w r w u w t w
[6et] - u e t e t e u e t e
[5wy] - u w r w y w u w r w
[4qeup] 8 [uf] q [ts] [8q] [4qeup] 8 [uf] q [ts] [8q] [5wrua] 9 [uf] w
[ts] [9w] [5wrua] 9 [uf] w [ts] [9w] [6etus] 0 [uf] e [ts] [0e] [6etus] 0
[uf] e [ts] [0e] [5wyd] 9 [uf] w [ra] [9w] [5wyd] 9 [uf] w [ra] [9w]
[4qeup] 8 [uf] q [ts] [8q] [4qeup] 8 [uf] q [ts] [8q] [5wrua] 9 [uf] w
[ts] [9w] [5wrua] 9 [uf] w [ts] [9w] [6etus] 0 [uf] e [ts] [0e] [6etus] 0
[uf] e [ts] [0e] [5wyd] 9 [uf] w [ra] [9w] [5wyd] 9 [uf] w [ra] [9w]
[4qeup] 8 [qfx] 8 [qsl] 8 [4qeup] 8 [qfx] 8 [qsl] 8 [5wrua] 9 [wfx] 9
[wsl] 9 [5wrua] 9 [wfx] 9 [wsl] 9 [6etus] 0 [efx] 0 [esl] 0 [6etus] 0
[efx] 0 [esl] 0 [5wyd] 9 [wfx] 9 [wak] 9 [5wyd] 9 [wfx] 9 [wak] 9
[4qeup] 8 [qfx] 8 [qsl] 8 [4qeup] 8 [qfx] 8 [qsl] 8 [5wrua] 9 [wfx] 9
[wsl] 9 [5wrua] 9 [wfx] 9 [wsl] 9 [6etus] 0 [efx] 0 [esl] 0 [6etus] 0
[efx] 0 [esl] 0 [5wyd] 9 [wfx] 9 [wak] 9 [5wyd] 9 [wfx] 9 [wak] 9
[4qpfj] 8 [qfx] 8 [qsl] 8 [4qpfj] 8 [qfx] 8 [qsl] 8 [5wafk] 9 [wfx] 9
[wsl] 9 [5wafk] 9 [wfx] 9 [wsl] 9 [6esfl] 0 [efx] 0 [esl] 0 [6esfl] 0
[efx] 0 [esl] 0 [5wdz] 9 [wfx] 9 [wak] 9 [5wdz] 9 [wfx] 9 [wak] 9
[4qpfj] 8 [qfx] 8 [qsl] 8 [4qpfj] 8 [qfx] 8 [qsl] 8 [5wafk] 9 [wfx] 9
[wsl] 9 [5wafk] 9 [wfx] 9 [wsl] 9 [6esfl] 0 [efx] 0 [esl] 0 [6esfl] 0
[efx] 0 [esl] 0 [5wdz] 9 [wfx] 9 [wak] 9 [5wdz] - [9fx] w [9ak] w
[5wdz] 9 [fx] w p 9 [6p] 0 [ef] t [es] 0 [6p] 0 [ef] t
[es] 0 [6p] 0 [ef] t [es] 0 [6p] 0 [ef] t s - [4p] 8
[qf] e [qs] 8 [4p] 8 [qf] e [qs] - [5a] 9 [wf] r [ws] 9
[5a] 9 [wf] r [ws] - [6s] 0 [ef] t [es] 0 [6s] 0 [ef] t
s - [5d] 9 [wf] r [wa] 9 [5d] 9 [wf] r a - [4j] 8
[qx] e [ql] 8 [4j] 8 [qx] e [ql] - [5k] 9 [wx] r [wl] 9
[5k] 9 [wx] r [wl] - [6l] 0 [ex] t [el] 0 [6l] 0 [ex] t
l - [5z] 9 [wx] r [wk] 9 [5z] 9 [wx] r k - [6ej] 0
e t e 0 [6epj] ]]

UseShiftKeys()

end)

Modern2:Button("Night Changes - One Direction", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 62 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ D O P O D O P O 
D O P O D O P O 
[WJ] [Ol] [Pl] [OJ] [Dl] O P [OJ] 
D [Ol] [Pl] [OH] [DJ] [Ol] [Pl] O 
q O [PZ] O [DJ] [OH] P [OZ] 
D [OZ] [PZ] [OZ] [DJ] [OH] [PH] O 
[tJ] [Ol] [Pl] [OJ] [Dl] O [PJ] [Ol] 
D O P [OJ] [Dl] [OJ] [PH] [OJ] 
Y O P O D O P O 
D O P O D O P O 
[WJ] [Ol] [Pl] O [Dl] O P [OJ] 
D [Ol] [Pl] [OH] [DJ] [Ol] [Pl] O 
q O [PZ] O [DJ] [OH] [PH] [OZ] 
D [OZ] [PZ] [OZ] [DJ] [OH] [PH] O 
[tJ] [Ol] [Pl] [OJ] [Dl] O [PJ] [Ol] 
D [Ol] P [OJ] [Dl] [OJ] [PH] [OJ] 
Y O P O D O P O 
[Dh]----
* [qi] [WS] [TS] [iS] s-P 
( w [Eo] [YO] o P--
* [qi] [WS] [TS] [iS] s s P 
( w [Eo] [YO] o P--
* q [WS] [TS] [iS] s-P 
( w [Eo] [YO] o P--
[Ws] Y [Os]-[wD] Y [OD] O 
q Y O s ( [YP] O-
* q [WS] [TS] [iS]-s P 
[(P] [wo] E [YO] o P--
* q [WS] [TS] [iS]-s-
[(P] w [Eo] [YO] o P--
* q [WS] [TS] [iS] s s P 
( w [Eo] [YO] o P--
[Ws] Y [Os] Y [wD] Y [OD] [YO] 
q Y O [Ys] ( [YP] O-
* W [TS] [iS] [OS] s-P 
( E Y o O O-O 
[%Y] W E W Y W E W 
Y W E W Y W E W 
[%P] [Ws] [Es] [WP] [Ys] W E [WP] 
Y [Ws] [Es] [WO] [YP] [Ws] [Es] W 
4 W [ED] W [YP] [WO] E [WD] 
Y [WD] [ED] [WD] [YP] [WO] [EO] W 
[8P] [Ws] [Es] [WP] [Ys] W [Es] [WP] 
[Ys] [WP] [Es] W [Ys] [WP] [EO] [WP] 
( W E W Y W E W 
Y W E W Y W E W 
[%P] [Ws] [Es] W [Ys] W E [WP] 
Y [Ws] [Es] [WO] [YP] [Ws] [Es] W 
4 W [ED] W [YP] [WO] E [WD] 
Y [WD] [ED] [WD] [YP] [WO] [EO] W 
[8P] [Ws] [Es] [WP] [Ys] W [EP] [Ws] 
Y [Ws] E [WP] [Ys] [WP] [EO] [WP] 
( W E W Y W E W 
i W E W io--
! [%i] [*S] [qS] [WS] [qs] * [%P] 
@ ^ [(o] [wO] E [wP] ( ^ 
! [%i] [*S] [qS] [WS] [qs] [*s] [%P] 
@ ^ [(o] [wO] E [wP] ( ^ 
! % [*S] [qS] [WS] [qs] * [%P] 
@ ^ [(o] [wO] E [wP] ( ^ 
[%s] ( [Ws] ( [5D] ( [WD] [(O] 
4 ( W [(s] @ [(P] [WO] [(o] 
[!i] % [*S] [qS] [WS] q [*s] [%P] 
[@P] [^o] ( [wO] E [wP] ( ^ 
[!i] % [*S] [qS] [WS] q [*s] % 
[@P] ^ [(o] [wO] E [wP] ( ^ 
[!i] % [*S] [qS] [WS] [qs] [*s] [%P] 
@ ^ [(o] [wO] E [wP] ( ^ 
[%s] ( [Ws] ( [5D] ( [WD] [(O] 
4 ( W [(s] @ [(P] [WO] [(o] 
[!i] % [*S] [qS] [WS] [qs] * [%P] 
@ ^ ( w [EO] O-p 
[^P] E t E [ip] E t E 
[io] E t E i [Eo] [tp] [Eo] 
5 E t E i E t E 
[yi] E t E [iP] [Ep] [to] [Ep] 
[(o] E t E i E t E 
[qy] e t i [tp]--
[El] [Pz] [sz] [Pl] [gz] P s [Pl] 
g [Pz] [sz] [PJ] [gl] [Pz] [sz] P 
w P [sc] P [gl] [PJ] s [Pc] 
g [Pc] [sc] [Pc] [gl] [PJ] [sJ] [Pl] 
[yl] [Pz] [sz] [Pl] [gz] P [sl] [Pz] 
g [Pl] [sz] [Pl] [gz] P [sl] [Pl] 
i P s g j--
@ [^o] [(D] [wD] [ED] [wd] ( [^s] 
4 8 [qp] [eP] t [es] q 8 
@ [^o] [(D] [wD] [ED] [wd] [(d] [^s] 
4 8 [qp] [eP] t [es] q 8 
@ ^ [(D] [wD] [ED] [wd] ( [^s] 
4 8 [qp] [eP] t [es] q 8 
[^d] q [Ed] q [6g] q [Eg] [qP] 
5 q E [qd] 4 [qs] [EP] [qp] 
[@o] ^ [(D] [wD] [ED] w [(d] [^s] 
[4s] [8p] q [eP] t [es] q 8 
[@o] ^ [(D] [wD] [ED] w [(d] ^ 
[4s] 8 [qp] [eP] t [es] q 8 
[@o] ^ [(D] [wD] [ED] [wd] [(d] [^s] 
4 8 [qp] [eP] t [es] q 8 
[^d] q [Ed] q [6g] q [Eg] [qP] 
5 q E [qd] 4 [qs] [EP] [qp] 
[@o] ^ [(D] [wD] [ED] [wd] ( [^s] 
4 8 q [eP] t [es] q 8 
[@o] ^ [(D] [wD] [Eg] [wg] ( [^d] 
[4s] 8 q [eP] t [es] q 8 
[@o] ^ [(D] [wD] [ED] [Yd] o [Ps] 
q t i p P P-P 
[^Eqyi] ]]

UseShiftKeys()

end)

Modern2:Button("Faded - Alan Walker",  function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 50 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [6s] 0 [ts] e [us] t [of] - [4j] 8 [ej] q [tj] e [yh] -
[8f] w [uf] t [of] u [tf] w [5a] 9 [ra] w [ya] r [wp] -
[6etup] s [eus] p [eus] p [eus] d [6qipd]-f - [qs] s [qo] f q - d-
[8tuo] - t - t s [tus] s [5wyoa] p w a [wya] p [wys] -
[6etu] s [eus] p [eus] p [eus] d [4qipf] - [qs] s [qoh] f q -
[8tuo] - t - t s [tus] d [5wyoa] - [wyoa] - [wyoa] f f f
[6ups] 0 [ts] e [us] t [of] - [4sgj] 8 [ej] q [tj] [ef] [yfh] f
[8osf] w [uf] t [of] u [tf] w [5yoa] 9 [ra] w [ya] [rf] [wpf] f
[6upsf] 0 t e [ud] [td] [od] d f [4ipd] [8s] [es] q t [ef] [yf] f
[8osf] w u t o [us]-s-[ts] [ws]-d-[5yoa] [9a] [ra] [ws] |
f f f [6ef] u [ps] e 6 [ups]-e-[ups]-e-[ups] [4qtp] o - q
4 s-q-[ish]-q-[ish]-f-[18] u o 8 1 s-8-[osh]-8-[osh]-f-[5w] u o [wd]
5 [oaf]-w-[oaf]-w-[oaf] [6ef] u [ps] e 6 [us]-e-[us]-[ep]-p-g-[4q] u [ps] q
4 [ps]-q-[os]-q-h-f-[18osf] h [osf] [8h] [1osf] h-8-[of]-d-d-g-[5oa] - w p
g w-f-[of] w-d-[6ups] 0 [ts] e [us] [tf] [osfl] k [4sgj] 8 [ej] [qp]
[tgj] e-f-[yfh] - d-[8osf] w [uf] t [oh] [ug] [tf]-d-[ws]-a-[5yoa] 9 r [wo]
[yoag] r-f-[wof] - d-[6ups] 0 [ts] e [us] [tf] [osfl] k [4sgj] 8 [ej] [qp]
[tgj] e-f-[yfh] - d-[8osf] w [uf] t [oh] [ug] [tf]-d-[ws]-a-[5yoa] 9 r [wo]
[yoag] r-f-[wof] - d-6 [0s] [tus] p [us] p [5wus] d [4ipf] 8 [ws] [es]
o f y t 8 w y o - s [tus] s [5ya] 9 r a
[ya] p [ws] 5 [6ps] 0 t u [ps] u [5wps] d [4ipf] 8 w [es] -
t w t [8uosf] w y u u s [wus] d [5yoa] 9 w y -
f f f [6psf] [0j] t e p u e 6 [4is] 8 e q
p [tf] [qof] [4f] [8psf] [wj] u t o u t w [5oa] 9 w y -
s h h-f-6 [0s] [th] [eh]-f-p [us] [eh] [6h] f [4d] [8s] [es] [qf]
p [ts] [qh] [4h] f 8 w u t o [us] [th] [wh]-f-[5d] 9 r w
o y [ws] 5 6-s-0-d-[ts] [es]-h-[pf]-d-[us]-a-[es] [6d] [4s]-s-8-d-[es] [qs]-h-
[pf]-d-[ts]-a-q-a-4-a-[8s]-s-w-d-[us] [ts]-h-[of]-d-[us]-a-[ts] [ws] [5s]-s-9-d-[rs] [ws]-h-[of] y w 5 - f f f [6ef] u [ps] e 6 [ups]-e-[ups]-e-[ups]
[4qtp] o - q 4 s-q-[ish]-q-[ish]-f-[18] u o 8 1 s-8-[osh]-8-[osh]-f-
[5w] u o [wd] 5 [oaf]-w-[oaf]-w-[oaf] [6ef] u [ps] e 6 [us]-e-[us]-[ep]-p-g-
[4q] u [ps] q 4 [ps]-q-[os]-q-h-f-[18osf] h [osf] [8h] [1osf] h-8-[of]-d-d-g-
[5oa] - w p g w-f-[of] w-d-[6ups] 0 [ts] e [us] [tf] [osfl] k
[4sgj] 8 [ej] [qp] [tgj] e-f-[yfh] - d-[8osf] w [uf] t [oh] [ug] [tf]-d-[ws]-a-
[5yoa] 9 r [wo] [yoag] r-f-[wof] - d-[6ups] 0 [ts] e [us] [tf] [osfl] k
[4sgj] 8 [ej] [qp] [tgj] e-f-[yfh] - d-[8osf] w [uf] t [oh] [ug] [tf]-d-[ws]-a-
[5yoa] 9 r [wo] [yoag] r-f-[wof] - d-[6s] 0 [ts] e [us] t [of] -
[4j] 8 [ej] q [tj] e [yh] - [8f] w [uf] t [of] u [tf] w
[5a] 9 e 9 w

 ]]

UseShiftKeys()

end)

Modern2:Button("Unity - TheFatRat",  function()

if Speedo2 == "" or Speedo2 == nil then

    shared.tempo = 125 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [0f]-0 u-0 y-9 u-0-
0 u-0 y-9 u-0 
8-8 u-8 y-8 u-9 
h-9 [eG]-w [Qf]-w [Qd]-9 
[0f]-0 u-0 y-9 u-0-
0 [ud]-[0f] [uh]-[0f] [uh]-[0j] 
[G9ydk]-[G9ydk]-[G9ydk]-[G9ydk]-
[(YDGk]--
a p-o u-y 
[0u]-r-a [up]-o u-y 
[8u]-w-a [up]-o u-y 
[9u]-[eo]-[Ip]-a-
[6p]-0-a [Tp]-o u-y 
[0u]-r-a [up]-o u-y 
[8u]-w-u [uo]-p a-d 
[9f]-[ed]-[If]-h-
[6j]-0-k [Tj]-h f-d 
[0f]-r-k [uj]-h f-d 
[8f]-w-k [uj]-h f-d 
[9f]-[eh]-[Ij]-k-
[6j]-0-k [Tj]-h f-d 
[0f]-r-k [uj]-h f-d 
[8f]-w-f [uh]-j k-z 
[9x]-[ez]-[Ix]-v-
[6b]-0-T-0-6 
[8d]f-[wf]-[tf]-[uf]-[td] 
f-[oh] [uf]-[td]-[wa]-
[9d]f-[ef]-[yf]-[If]-[yd] 
f-[px] [Iz]-[yk]-[ej]-
[0j]k-[rk]-[uk]-[ok]-[uj] 
k-[az] [ok]-[uj]-[rh]-
[5j]k-[9k]-[wk]-[rk]-[wj] 
k-[yz] [rk]-[wj]-[9h]-
[8d]f-[wf]-[tf]-[uf]-[td] 
f-[oh] [uf]-[td]-[wa]-
[*d]f-[wf]-[Tf]-[uf]-[Td] 
f-[px] [uz]-[Tk]-[wj]-
[9j]k-[wk]-[rk]-j [rh]-[wj] 
[9k]-[wk]-[rk]-j [rh]-[wj] 
[QG9edk]-[QG9edk]-[QG9edk]-[QG9edk]-
[(QDGrk]--
a p-o u-y 
[0u]-r-a [up]-o u-y 
[8u]-w-a [up]-o u-y 
[9u]-[eo]-[Ip]-a-
[6p]-0-a [Tp]-o u-y 
[0u]-r-a [up]-o u-y 
[8u]-w-u [uo]-p a-d 
[9f]-[ed]-[If]-h-
[6j]-0-k [Tj]-h f-d 
[0f]-r-k [uj]-h f-d 
[8f]-w-k [uj]-h f-d 
[9f]-[eh]-[Ij]-k-
[6j]-0-k [Tj]-h f-d 
[0f]-r-k [uj]-h f-d 
[8f]-w-f [uh]-j k-z 
[9x]-[ez]-[Ix]-v-
[6b]-0-T-0-6 
[8d]f-[wf]-[tf]-[uf]-[td] 
f-[oh] [uf]-[td]-[wa]-
[9d]f-[ef]-[yf]-[If]-[yd] 
f-[px] [Iz]-[yk]-[ej]-
[0j]k-[rk]-[uk]-[ok]-[uj] 
k-[az] [ok]-[uj]-[rh]-
[5j]k-[9k]-[wk]-[rk]-[wj] 
k-[yz] [rk]-[wj]-[9h]-
[8d]f-[wf]-[tf]-[uf]-[td] 
f-[oh] [uf]-[td]-[wa]-
[*d]f-[wf]-[Tf]-[uf]-[Td] 
f-[px] [uz]-[Tk]-[wj]-
[9j]k-[wk]-[rk]-j [rh]-[wj] 
[9k]-[wk]-[rk]-j [rh]-[wj] 
[QG9edk]-[QG9edk]-[QG9edk]-[QG9edk]-
[(QDGrk]----
[0f]-r-[uf]--
f-[tG]-[wh]-[yG]-
[9G]-e-[yf]-d-
f-I-u-y-
[0a]-r-[ua]--
a-[tp]-[wo]-[yp]-
[6p]-0-[Tp]-o-
[up]-y-T-e-
[0f]-r-[uf]--
f-[tG]-[wh]-[yG]-
[9G]-e-[yf]-d-
f-I-[uk]-y-
[tl]-w-[8k]-j-
[Tk]-w-[*j]-h-
[ej]-Q-9--
k-(-Q-e-
[0f]-r-[uf]--
f-[tG]-[wh]-[yG]-
[9G]-e-[yf]-d-
f-I-u-y-
[0a]-r-[ua]--
[8a]-[wp]-[uo]--
[9d]-e-[yf]-d-
[pS]-o-I-y-
[0f]-r-[uf]--
f-[tG]-[wh]-[yG]-
[9G]-e-[yf]-d-
f-I-[uk]-y-
[tl]-w-[8k]-j-
[Tk]-w-[*j]-h-
[ej]-Q-9--
k-(-Q-e-
[8d]f-[wf]-[tf]-[uf]-[td] 
f-[oh] [uf]-[td]-[wa]-
[9d]f-[ef]-[yf]-[If]-[yd] 
f-[px] [Iz]-[yk]-[ej]-
[0j]k-[rk]-[uk]-[ok]-[uj] 
k-[az] [ok]-[uj]-[rh]-
[5j]k-[9k]-[wk]-[rk]-[wj] 
k-[yz] [rk]-[wj]-[9h]-
[8d]f-[wf]-[uf]-[uf]-[td] 
f-[oh] [uf]-[td]-[wa]-
[*d]f-[wf]-[Tf]-[uf]-[Td] 
f-[px] [uz]-[Tk]-[wj]-
[9j]k-[wk]-[rk]-j [rh]-[wj] 
[9k]-[wk]-[rk]-j [rh]-[wj] 
[QG9edk]-[QG9edk]-[QG9edk]-[QG9edk]-
[(QDGrk]--a p-o u-y 
[0u]-r-a [up]-o u-y 
[8u]-w-a [up]-o u-y 
[9u]-[eo]-[Ip]-a-
[6p]-0-a [Tp]-o u-y 
[0u]-r-a [up]-o u-y 
[8u]-w-u [uo]-p a-d 
[9f]-[ed]-[If]-h-
[6j]-0-k [Tj]-h f-d 
[0f]-r-k [uj]-h f-d 
[8f]-w-k [uj]-h f-d 
[9f]-[eh]-[Ij]-k-
[6j]-0-k [Tj]-h f-d 
[0f]-r-k [uj]-h f-d 
[8f]-w-f [uh]-j k-z 
[9x]-[ez]-[Ix]-v-
[6b]-0-T--
[8d]f-[wf]-[tf]-[uf]-[td] 
f-[oh] [uf]-[td]-[wa]-
[9d]f-[ef]-[yf]-[If]-[yd] 
f-[px] [Iz]-[yk]-[ej]-
[0j]k-[rk]-[uk]-[ok]-[uj] 
k-[az] [ok]-[uj]-[rh]-
[5j]k-[9k]-[wk]-[rk]-[wj] 
k-[yz] [rk]-[wj]-[9h]-
[8d]f-[wf]-[uf]-[uf]-[td] 
f-[oh] [uf]-[td]-[wa]-
[*d]f-[wf]-[Tf]-[uf]-[Td] 
f-[px] [uz]-[Tk]-[wj]-
[9j]k-[wk]-[rk]-j [rh]-[wj] 
[9k]-[wk]-[rk]-j [rh]-[wj] 
[QG9edk]-[QG9edk]-[QG9edk]-[QG9edk]-
[(QDGrk]----
a 
p-o u-y 
[0u]-r u-a p-[ro] [0u]-[ry] 
[8u]-w u-a p-[wo] [8u]-[wy] 
[9u]-e [Io]-p-e [9a]-e 
[6p]-0 T-a p-[0o] [6u]-[0y] 
[0u]-r u-a p-[ro] [0u]-[ry] 
[8u]-w u-u o-[wp] [8a]-[wd] 
[9f]-e [Id]-f-e [9h]-e 
[6j]-0 T-k j-[0h] [6f]-[0d] 
[0f]-r u-k j-[rh] [0f]-[rd] 
[8f]-w u-k j-[wh] [8f]-[wd] 
[9f]-e [Ih]-j-e [9k]-e 
[6j]-0 T-k j-[0h] [6f]-[0d] 
[0f]-r u-k j-[rh] [0f]-[rd] 
[8f]-w u-f h-[wj] [8k]-[wz] 
[9x]-e [Iz]-x-e [9v]-e 
[6b]-0 T--0 6-0 
[8d]f-[wf]-[tf]-[uf]-[td] 
f-[oh] [uf]-[td]-[wa]-
[9d]f-[ef]-[yf]-[If]-[yd] 
f-[px] [Iz]-[yk]-[ej]-
[0j]k-[rk]-[uk]-[ok]-[uj] 
k-[az] [ok]-[uj]-[rh]-
[5j]k-[9k]-[wk]-[rk]-[wj] 
k-[yz] [rk]-[wj]-[9h]-
[8d]f-[wf]-[uf]-[uf]-[td] 
f-[oh] [uf]-[td]-[wa]-
[*d]f-[wf]-[Tf]-[uf]-[Td] 
f-[px] [uz]-[Tk]-[wj]-
[9j]k-[wk]-[rk]-j [rh]-[wj] 
[9k]-[wk]-[rk]-j [rh]-[wj] 
[QG9edk]-[QG9edk]-[QG9edk]-[QG9edk]-
[(QDGrk] ]]

UseShiftKeys()

end)

Modern2:Button("Bad Apple! - Touhou", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 85 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ e e p p o p
e e p p o p
d s d s p s
e e p p o p
e e p p o p
e e p p o p
s p s d s d
e e p p o p
e e p p o p
e e p p o p
[yd] [ts] [yd] [ts] [ep] [ts]
[ep] [ua] [es] [ud]
[ef] u [ej] [uh]
[ef] u [ep] u
[ef] [ud] [es] [ua]
[qp] [ta] [qs] [td]
[qf] t [qd] [ts]
[wa] [yp] [wa] [ys]
[Wa] [up] [WO] [ua]
[ep] [ua] [es] [ud]
[ef] u [ej] [uh]
[ef] u [ep] u
[ef] [ud] [es] [ua]
[qp] [ta] [qs] [td]
[qf] t [qd] [ts]
[wa] y [ws] y
[Wrud] [Wruf]
[eup] [uoa] [eps] [uad]
[esf] u [efj] [udh]
[esf] u [eup] u
[esf] [uad] [eps] [uoa]
[qip] [toa] [qps] [tad]
[qsf] t [qad] [tps]
[woa] [yip] [woa] [yps]
[Wa] [up] [WO] [uoa]
[eup] [uoa] [eps] [uad]
[esf] u [efj] [udh]
[esf] u [eup] u
[esf] [uad] [eps] [uoa]
[qip] [toa] [qps] [tad]
[qsf] t [qad] [tps]
[woa] y [wps] y
[Wruad] [Wrusf]
[qh] [tj] [qf] [td]
[qf] t [qd] [tf]
[wh] [yj] [wf] [yd]
[wf] y [wd] [yf]
[ed] [us] [ea] [uo]
[ep] u [eo] [up]
[ea] [us] [ed] [uf]
[ep] u [wf] [yh]
[qh] [tj] [qf] [td]
[qf] t [qd] [tf]
[wh] [yj] [wf] [yd]
[wf] y [wd] [yf]
[ed] [us] [ea] [uo]
[ep] u [eo] [up]
[ea] [us] [ed] [uf]
[etup] [wryf] h
[qh] [tj] [qf] [td]
[qf] t [qd] [tf]
[wh] [yj] [wf] [yd]
[wf] y [wd] [yf]
[ed] [us] [ea] [uo]
[ep] u [eo] [up]
[ea] [us] [ed] [uf]
[ep] u [wf] [yh]
[qh] [tj] [qf] [td]
[qf] t [qd] [tf]
[wh] [yj] [wf] [yd]
[wf] y [wj] [yk]
[el] [uk] [ej] [uh]
[ef] u [ed] [uf]
[ed] [us] [ea] [uo]
[etup] [wryf] h
h j f d
f d f
[wh] r y j f d
f d f
[ed] t u s a o
p o p
a s d f
p [579f] h
h j f d
f d f
[5h] 7 9 j f d
f d f
[ed] t u s a o
p o p
a s d f
p [579f] h
h j f d
f d f
[5h] 7 9 j f d
f d f
d s a o
p o p
[tua] s d f
p [wryf] h
h j f d
f d f
[wh] r y j f d
f j k
l k j h
f d f
[etud] s a o
[yp] t
[ed] [us] [ea] [uo]
[etup] g H
H J g D
g D g
[Hf] h k J g D
g D g
D S s O
P O P
[rtus] S D g
P [wryg] H
H J g D
g D g
[Hw] r y J g D
g D g
[De] t u S s O
P O P
[ts] S D g
P [wryg] H
H J g D
g D g
[WH] t Y J g D
g D g
[ED] T i S s O
P O P
s S D g
P [WYtg] H
H J g D
g D g
[WH] t Y J g D
g J l
L l J H
g D g
D S [ts] [WO]
[EP] ]]

UseShiftKeys()

end)

Modern2:Button("Stay – The Kid LAROI,Justin Bieber", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 130 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ 4 r t o - t - 5 - r t - w - 6 r 
t o - t - 3 - r t - w e 4 r t o - t - 5 - r t - w - 
6 r t o - t - 3 - r t r w e - [4t] t t [ro] - r r 
[5r] r r r r t t - [6t] t t [ro] - r r [3r] r r r 
r t t - [4t] t t [ro] - r r [5r] r r r r t t t [6r] 
t t [ro] - u u [3u] [ya] - [ro] - [tp] 4 e [8qu] - 
[4y] - [8q] y 5 y [9w] t [5y] - [9wy] - [6e] e [0eu] - 
[6y] - [0et] y 3 y [70] t [3y] - [70y] - [4e] e [8qu] - 
[4y] - [8qt] y 5 y [9w] t [5y] - [9wy] - [6oh] - [0euf] - 
[6oh] - [0euf] - [3yd] [yd] [70yd] [uf] [3yd] - [70ts] - 
[4s] - [8q] - 4 p [8quf] - 5 - [9w] - 5 - [9w] - [6s] - 
[0e] - 6 p [0euf] - 3 - [70] - 3 - [70] - [4s] - [8q] - 
4 p [8quf] - 5 - [9w] - 5 - [9w] - [6oh] - [0euf] - 
[6oh] - [0euf] - [3yd] [yd] [yd] [uf] [yd] - [ts] - 
[4t] t [8qt] [ro] 4 - [8qr] r [5r] r [9wr] r [5r] 
t [9wt] - [6t] t [0et] [ro] 6 - [0er] r [3r] r [70r] 
r [3r] t [70t] - [4t] t [8qt] [ro] 4 - [8qr] r [5r] 
r [9wr] r [5r] t [9wt] t [6r] t [0et] [ro] 6 - [0eu] 
u [3u] [ya] [70] - [3ro] - [70] [tp] [4s] s [8qs] 
[ah] 4 - [8qa] a [5a] a [9wa] a [5a] s [9ws] - [6s] 
s [0es] [ah] 6 - [0ea] a [3a] a [70a] a [3a] s [70s] - 
[4s] s [8qs] [ah] 4 - [8qa] a [5a] a [9wa] a [5a] 
s [9ws] s [6a] s [0es] [ah] 6 - [0ef] f [3f] [dk] 
[70] - [3ah] - [70] [sj] 4 u u u u t t t t y y - 5 - 
5 - 6 - [0eu] u [6u] t [0et] t [3t] y [70y] - 3 - 
[70] - 4 e [8qu] u [4u] t [8qt] t [5t] y [9wy] - 5 - 
[9w] - 6 e [0eu] u [6u] t [0et] t [3t] y [70y] - 3 
t [70y] t 4 [ya] [8qya] [us] 4 y [8qy] t [5y] - [9wy] 
t [5y] - [9wu] - 6 y [0ey] t [6y] y [0ey] t [3y] - 
[70u] - [3r] - [70t] e 4 t [8qu] y 4 t [8qu] y 5 t 
[9wu] y 5 t [9wu] y 6 t [0e] - 6 t [0et] t [3t] y 
[70t] a [3p] [uo] [70] - [4s] - [8q] - 4 p [8quf] - 
5 - [9w] - 5 - [9w] - [6s] - [0e] - 6 p [0euf] - 3 - 
[70] - 3 - [70] - [4s] - [8q] - 4 p [8quf] - 5 - [9w] - 
5 - [9w] - [6oh] - [0euf] - [6oh] - [0euf] - [3yd] 
[yd] [yd] [uf] [yd] - [ts] - [4qt] t t [ro] - [4qr] 
r [5wr] r r r r t t - [6et] t t [ro] - r r r r r r 
[30r] t t - [4qt] t t [ro] - [4qr] r [5wr] r r r r 
t t t [6er] t t [ro] - u u u [ya] - [30ro] - [30] 
[tp] [4ts] [ts] [8qts] [4oah] - [8qra] [ra] [5ra] 
[ra] [9wra] [5ra] [ra] [ts] [9wts] - [6ts] [ts] [0ets] 
[6oah] - [0era] [ra] [3ra] [ra] [70ra] [3ra] [ra] 
[ts] [70ts] - [4ts] [ts] [8qts] [4oah] - [8qra] [ra] 
[5ra] [ra] [9wra] [5ra] [ra] [ts] [9wts] [ts] [6ra] 
[ts] [0ets] [6oah] - [0euf] [uf] [3uf] [adk] [70] 
3 [oah] - [70] [psj] 4 r t o - t - 5 - r t - w - 6 
r t o - t - 3 - r t - w e 4 r t o - t - 5 - r t - 
w - 6 r t o - t - 3 [dk] r t [rah] w e [sj] ]]

UseShiftKeys()

end)

Modern2:Button("Fujii Kaze - Shinunoga E-WA",  function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 38 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [5G]k[9j]h[wj]h[ef] [rj]kjhjhf 
[7j]k[Qj]h[wj]h[ef] [yj]kjhjhf 
[8u]osd9 0 w t--
[(o]sDh-[8o]sD-[5od]-[5os]-
[5p]a[9p]o[wp]o[eu] [rp]apopou 
[7p]a[Qp]o[wp]o[eu] [yp]apopou 
[8t]uop9 0 w t--
[oad] w [os] w [oa] w o w 
[57wj]kj[5h][9j]h[5f][5h]j[7k][5j]h[9j]hfh
[Q7j]kj[7h][wj]h[7f][7h]j[9k][7j]h[wj]hfh
[68a] p6w 66 6[6d]f[wh]fdf
[46a] p4q 44 64 [8q] 4 
[57wj]kj[5h][9j]h[5f][5h]j[7k][5j]h[9j]hfh
[Q7j]kj[7h][wj]h[7f][7h]j[9k][7j]h[wj]hfh
[68a] p6w 66 6[6d]f[wh]fdf
[46a] p4q 44 64 [8q] 4 
[E9wh]Jhghg[9d][qeg]h[9J][qeh]gh[^9g]-
[(Ewh]Jhghg[(wd][Eg]h[w(J][Eh]gh[Ewg]dP
[(Ews]dDhz [(tl][Ewh]h [qe]-[wE]-
[8qes]dDhz [El][qeG]G [9wh]GfG[Qe]-
[E9wh]Jhghg[9d][qeg]h[9J][qeh]gh[^9g]-
[(Ewh]Jhghg[wd][Eg]h[wJ][Eh]gh[Ewg]dP
[(Ews]dDhz [(tl][Ewh]h [qe]-[wE]-
[8qes]dDhz [El][qeG]G [9wh]GfG[Qe]-
[57wj]kk[5k][9j]j[5j][5j]h[7h][5h]h[9f] d 
[Q7j]kk[7k][wj]j[7j][7j]h[9h][7h]h[wf]dfh
[68a] p6w 66 6[6d]f[wh]fdf
[46a] p4q 44 64 [8q] 4 
[57wk]kk[5k][9j]j[5j][5j]h[7h][5h]h[9f] d 
[Q7j]kk[7k][wz]l[7k][7l]k[9j][7h]k[wj]kjhf
[68k] j6wh[6f]6 6[6j]k[wz]kjh
[46k] j4qh[4f]4 6[4h]j[68qJ]j[4h]g
[E9wh]Jhghg[9d][qeg]h[9J][qehJ][gj][hJ][^9gj]Jl
[wh(EJ]Jhghg[(wd][Eg]h[w(J][Eh][gj][hJ][Ewgl][dz][Pg]
[(Ews]dDhz [(tl][Ewh][sh]d[qeD]hz[wE]lh
[8qes]dDhz [El][qeG][dG]D[9wdh]G[sf][dG][Qes]Pp
[E9wh]Jhghg[9d][qeg][hJ][J9z][qehJ][gj][hJ][^9gj]dg
[wh(EJ][Jz][hJ][gj][hJ][gj][wdg][Egj][hJ][Jwz][hEJ][gj][hJ][Ewgj]dP
[(Ews]dDhz [(tl][Ewh][sh]d[qeD]hz[wE]ZZ
[8qesz]dDhz [El][Gqec]GZ[9whz]G[fZ]G[Gz][eQZ]zlk
[57wl]k [5y]oa9 5[5d] [7s][5a]s[9a]-p
[7Q]fd[7P][wp]o[7o][7p][oa][9ps][7oa][ps][woa]-p
[68y]uo6[wp]ap[6o][6p]a[6s][6d]a[wp]-o
[46d]sa[4s][qa]p[4ad][O4s][oa][O6s][4oa][Yp][8qo]Y[4y] 
[57w]-[5y]oa9 5[5d] [7s][5a]p[9s]-a
[7Q]hG[7h][wd]s[7a][7p]o[9p][7a]s[wa]-p
[68y]uo6[wp]ap[6o][6p]a[6s][6d]a[wp]-
[46o]po[4p][qP]s[4P][4s]d[6D][4d]g[8qh] 4 
[E9wh]Jhghg[9d][qeg]h[9J][qehJ][gj][hJ][^9gj]Jl
[wh(EJ]Jhghg[(wd][Eg]h[w(J][Eh][gj][hJ][Ewgl][dz][Pg]
[(Ews]dDhz [(tl][Ewh][sh]d[qeD]hz[wE]lh
[8qes]dDhz [El][qeG][dG]D[9wdh]G[sf][dG][Qes]Pp
[E9wh]Jhghg[9d][qeg][hJ][J9z][qehJ][gj][hJ][^9gj]dg
[wh(EJ][Jz][hJ][gj][hJ][gj][wdg][Egj][hJ][Jwz][hEJ][gj][hJ][Ewgj]dP
[(Ews]dDhz [(tl][Ewh][sh]d[qeD]hz[wE]ZZ
[8qesz]dDhz [El][Gqec]GZ[9whz]G[fZ]G[Gz][eQZ]zlk
[57wj]kk[5k][9j]j[5j][5j]h[7h][5h]h[9f] d 
[Q7j]kk[7k][wj]j[7j][7j]h[9h][7h]h[wf]dfh
[8uoa] [9p] 0 w 80wtdfhfdf
[4tia] [5p] 6 8 468q ]]

UseShiftKeys()

end)

Modern2:Button("Kimi no toriko",  function()

if Speedo2 == "" or Speedo2 == nil then

shared.tempo = 60 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ j j G k j G d 
[wf]-[ryf] [9d] [wf] f [ryd] f 
e f [Tu] [0d] [ek] j [uTG] d 
[Qf]-[Tef] * [Qf] f [eTG] f 
r d [yI] [Qk] 7 j [yIG] d 
[uf]-[oaf] r [uf]-[oad] f 
e G [Tu] [0f] e d [Tu] G 
y-[Ip] e y-[Ip]-
y j [Ipsj] G [ek] [yj] [psIG] d 
[wf]-[ryf] [9f] [wf]-[ryd] f 
e f [Tu] [0d] [ek] j [uTG] d 
[Qf] f [Tef] [*f] [Qf] f [Tef] G 
[rh] G [yI] Q r d [Iyf] G 
u d [oaf] [rG] u G [oah] j 
e G [Tu] [0d] e f [Tu] d 
[yI] ]]

UseShiftKeys()

end) 

Modern2:Button("Let her go",  function()

if Speedo2 == "" or Speedo2 == nil then

shared.tempo = 35 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ jkjh
[tod]fh [to]f k[tto--[ypj]kjh
[uad]fh [ua]fk [ypj]--[ypj]kjh
[tod]fh [to]f h[toz]k--[yph]j k
[ua]-[ua]-[ua]-[ypj]kjh
[tod]fh [to]f k[to]-[ypj]kjh
[uad]fh [ua]fk [ypj]-[ypj]kjh
[tod]fh [to]f h[toz]k-[yph]j k
[ua]-[ua]-[ua] aapapo
[8wo]-u[8wo]uo [59y]-y[59p]apo
[9ep] po[9ea] pp[0r]o-[0rp]apo
[8wp]ouu[8wu]yo [59]-[59]-
[9eyI]-[yI] e [yI] aaa po
[8wo] ou[8wo]uo [59]-[59p]apo
[9ep] po[9ea] pp[0r]o-[0rp]apo
[8wp]ouu[8wu]yo [59]-[59]-
[9eyI]-[yI] e [yI] poap p
[0r]ou [0r] w [8tu] w [tu] w 
[9yI] e [yI] e [7ry] Q [ry] Q 
[0uo] r [uo] r [8tu] w [tu] w 
[9yI] e [yI] e [yI] e [yI]-
[0a] [ra] [ua]poo8 wstaw 
[9p] ep[yp]oI [7I] Qy[ra] [Qp] 
[0o] ru[ua] po[8u] w t w 
[9yI] e [yI] e [yI] e [yI]-a
[0a] [ra] [ua]poo8 wstaw 
[9p] ep[yp]oI [7I] Qy[ra] [Qa] 
[0a] rou po8 w t w 
[9eyI]-[yI] e [yI] aaa po
[8wo] ou[8wo]uo [59]-[59p]apo
[9ep] po[9ea] pp[0r]o-[0rp]apo
[8wp]ouu[8wu]yo [59]-[59]-
[9eyI]-[yI] e [yI] aaa po
[8wo] ou[8wo]uo [59]-[59p]apo
[9ep] po[9ea] pp[0r]o-[0rp]apo
[8wp]ouu[8wu]yo [59]-[59]-
[9eyI]-[yI] e [yI] e o p 
[0a] r u [rp]a[8s] w [ta] w 
[9p] e [yI] e [yI] e o p 
[0a] r u [rp]a[8s] w [ta] w 
[9p] e [yI] e [yI] e d s 
[0a] r u [rp]a[8s] w [tu] w 
[9I] e [yI] e [yI] e [yI]-
[0o] r u r 8 w t [wp] 
[9eyI]-[yI] e [yI]-k jh
[toh] hf[toh]fh [wy]-[wyj]kjh
[ypj] jh[ypk] jj[ua]h-[uaj]kjh
[toj]hff[tof]dh [wy]-[wy]-
[ypdG]-[dG] p [dG]-k jh
[toh] hfhfh [wy]-jkjh
[ypj] jhk jj[ua]h-jkjh
[toj]hfffdh [wy]--
[ypdG]-[dG] p [dG] yyap p
3o[7u] 0 ]]

UseShiftKeys()

end) 

Modern2:Button("Toxic - BoyWithUke", function()

if Speedo2 == "" or Speedo2 == nil then

shared.tempo = 80 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ O P P P 
[%a]-[WO]-[rD]--O 
[$S]-[Qa]-[EP]-a-
3-[0O]-[WP]-a-
[@P]-[(O]-[5o]-[(o]-
[%O]-[WO]-[rD]-D D 
[$S]-[Qa]-[EP]-P-
[3a]-[7O]-[0a]-[Wa]-
[@P]-[(a]-[5P]-[(a]-
[0ruWO]-[W0r] O [0rWOG] [OG] [W0r] [aH] 
[(Qr]-[r(QD]-[r(QS] D [(Qr] [oPD] 
[(WE]-[o(WED] S [(WED] S [(WED] S 
[rWYOD] S [rWYOD] S [QETID] S [QETID] S 
[W0r] [Oa] [W0r] O [0rWOG] [OG] [W0r] [aH] 
[(Qr]-[r(QD] S [(Qr] D [(Qr] [oPD] 
[w(E]-[wo(ED] S [w(ED] S [w(ED] S 
[rWYOD] S [rWYOD] S [QETID] S [QETID] S 
[W0r] [Oa] [W0r]-[0rWO]-[0rWD] S 
[(Qr] [Ia] [(Qr]-[r(QD] f [(Qr] [oPD] 
[w(E]-[(Ewa] S [w(E] a [w(E] f 
[rWY] D [rWY]-[WYra]-[rWYS]-
[0rWO]-[0rWD] S [W0r] a [W0r] I 
[(Qr]-[r(QID] S [(Qr] a [(Qr] f 
[(wr] [oPD] [(wr]-[(wr]-[(wr]-
[PD5wh]-[@(]-[!*]-7-
[WOa]-Y-[Oa]--
fHkZ----
[QIP]-T-[IP]-J-
J-k-J-k-
[H0kx]-f-[Hkx]--
uOa-[GC]-[fx]-[DZ]-
r-D-[kZ]-[ak]-
[oEYPJ]-[ak]-[PJ]-[ak]-
[%Oa]-[(Y]-[WOa]-r-
[YD]HkZ r-W-r-
[$IP]-[*T]-[QIP]-[EPJ]-
[TPJ]-[Eak]-[QPJ]-[Eak]-
[3f]Hkx 7-0-W-
r-[WGC]-[0fx]-[WDZ]-
7-Q-r-[Yak]-
[5PJ]-[(ak]-[wPJ]-[Eak]-
[%WOH]--[rO]-[YD]-[YD]-[YD]-
[rWTYS]-[ra]-[ra]-[YD]-[YD]-[YD]-
[$QTS]-[ra]-[ra]-[YD]-[YD]-[YD]-
[QETYD]-[YD]-[YD]-[YD]-[YD]-[YD]-
[30S]--[ra]-[YD]-[YD]-[YD]-
[0rWTS]-[ra]-[ra]-[YD]-[YD]-[YD]-
[7TS]-[ra]-[ra]-[YD] [YD] [YD]-
[@(YD] [YD] [YD]-[5wYD] [YD] [YD]-
[%WTS]-([ra]-[rYD]-[YD]-[YD]-
[rWTYS]-[ra]-[ra]-[YD]-[YD]-[YD]-
[$QTS]-[ra]*[ra]-[EYD] [YD] [YD]-
[QETYD] [YD] [YD]-[YD] [YD] [YD]-
[30TS]-7[ra]-[WYD]-[YD]-[YD]-
[0rWTS]--[ra]-[YD]-[YD]-[YD]-
[7rTS]-Q[ra]-[YD] [YD] [YD]-
[5wYD] [YD] [@(YD]-[!*YD] [YD] [7YD]-
[0ruWO]-[W0r] O [0rWOG] [OG] [W0r] [aH] 
[(Qr]-[r(QD]-[r(QS] D [(Qr] [oPD] 
[(WE]-[o(WED] S [(WED] S [(WED] S 
[rWYOD] S [rWYOD] S [QETID] S [QETID] S 
[W0r] [Oa] [W0r] O [0rWOG] [OG] [W0r] [aH] 
[(Qr]-[r(QD] S [(Qr] D [(Qr] [oPD] 
[w(E]-[wo(ED] S [w(ED] S [w(ED] S 
[rWYOD] S [rWYOD] S [QETID] S [QETID] S 
[W0r] [Oa] [W0r]-[0rWO]-[0rWD] S 
[(Qr] [Ia] [(Qr]-[r(QD] f [(Qr] [oPD] 
[w(E]-[(Ewa] S [w(E] a [w(E] f 
[rWY] D [rWY]-[WYra]-[rWYS]-
[0rWO]-[0rWD] S [W0r] a [W0r] I 
[(Qr]-[r(QID] S [(Qr] a [(Qr] f 
[(wr] [oPD] [(wr]-[(wr]-[(wr]-
[PD5wh]-[@(]-[!*]-7-
%-[(Y]-[WT]-[(Y]-
[rI]-[(Y]-[WT]-[(r]-
$-[*T]-[QY]-T-
o-* O Q-[rWY]--
[(WY]-[QT]-Y-
[WI]-[7Y]-[0T]-[7r]-
[7Q]-[rQY]-[rY]-[QT]-
[w^EY]-( [WEY] w-[(Y]-
%-[(Y]-[WT]-[(Y]-
[rI]-[(Y]-[WT]-[(r]-
$-[(Y]-[QY]-[(T]-
I--O Q-[rWY]-
3-[7WY]-[0T]-Y-
I-[3Y]-[7T]-r-
[7Q]-[r$Y]-[7Y]-[$T]-
[w@EY]-^ [WEY] (-[^YD]-
[OH]--[IG]--
[TS]--[ra]--
[0ruWO]-[W0r] O [0rWOG] [OG] [W0r] [aH] 
[(Qr]-[r(QD]-[r(QS] D [(Qr] [oPD] 
[(WE]-[o(WED] S [(WED] S [(WED] S 
[rWYOD] S [rWYOD] S [QETID] S [QETID] S 
[W0r] [Oa] [W0r] O [0rWOG] [OG] [W0r] [aH] 
[(Qr]-[r(QD] S [(Qr] D [(Qr] [oPD] 
[w(E]-[wo(ED] S [w(ED] S [w(ED] S 
[rWYOD] S [rWYOD] S [QETID] S [QETID] S 
[W0r] [Oa] [W0r]-[0rWO]-[0rWD] S 
[(Qr] [Ia] [(Qr]-[r(QD] f [(Qr] [oPD] 
[w(E]-[(Ewa] S [w(E] a [w(E] f 
[rWY] D [rWY]-[WYra]-[rWYS]-
[0rWO]-[0rWD] S [W0r] a [W0r] I 
[(Qr]-[r(QID] S [(Qr] a [(Qr] f 
[(wr] [oPD] [(wr]-[(wr]-[(wr]-
[(EPDwh]-[w(E]-[w(E]-[w(E]-
[0ruWO]-[W0r] O [0rWOG] [OG] [W0r] [aH] 
[(Qr]-[r(QD]-[r(QS] D [(Qr] [oPD] 
[(WE]-[o(WED] S [(WED] S [(WED] S 
[rWYOD] S [rWYOD] S [QETID] S [QETID] S 
[W0r] [Oa] [W0r] O [0rWOG] [OG] [W0r] [aH] 
[(Qr]-[r(QD] S [(Qr] D [(Qr] [oPD] 
[w(E]-[wo(ED] S [w(ED] S [w(ED] S 
[rWYOD] S [rWYOD] S [QETID] S [QETID] S 
[W0r] [Oa] [W0r]-[0rWO]-[0rWD] S 
[(Qr] [Ia] [(Qr]-[r(QD] f [(Qr] [oPD] 
[w(E]-[(Ewa] S [w(E] a [w(E] f 
[rWY] D [rWY]-[WYra]-[rWYS]-
[0rWO]-[0rWD] S [W0r] a [W0r] I 
[(Qr]-[r(QID] S [(Qr] a [(Qr] f 
[(wr] [oPD] [(wr]-[(wr]-[(wr]-
[PD5wh]-[@(]-[!*]-7-
[YH][Ok]a ]]

UseShiftKeys()

end)

Modern2:Button("Bones - Imagine Dragons", function()

if Speedo2 == "" or Speedo2 == nil then

shared.tempo = 59 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ ^----
[ETS]|S|SSP|P|i|i-
[qts]|s|s|p|p|i|i-
[(Ws]|sss|O|O|Y|Y-
[(w]----
[ETS]|S|S|P|P|i|i-
[qts]s|ss|p|p|i|i-
[(Ws]|s|s|O|O|Y|Y-
[(w]----i|
[ETY]-i-i|Y-i-i|
[qti]-i-i|Y-i-i|
[(WY]-i-i|Y-i-i|
[wp]-i-i|Y-i--
[EP]|S|[iP]|S|[Tg]-D|S|
[WD]|D|[iD]|D|[tg]-D|S|
[wD]|D|[YD]|D|[tg]-D|D|
[wD]|D|[YP]|P|[ES]--
[EP]|S|[iP]|S|[Tg]-D|S|
[WD]|D|[iD]|D|[tg]-D|S|
[wD]|D|[YD]|D|[tg]-D|D|
[wD]|D|[YP]|P|[ES]--
[ETS]|S|SSP|P|i|i-
[qts]|s|s|p|p|i|i-
[(Ws]|sss|O|O|Y|Y-
[(w]----
[ETS]|SSS|P|P|i|i-
[qts]s|ss|s|s|S|s-
[(WD]|D|D|S|g|D|D-
[w(D]|DDD|S|g|D-i|
[ETY]-i-i|Y-i-i|
[qti]-i-i|Y-i-i|
[(WY]-i-i|Y-i-i|
p-i-i|Y-i--
[EP]|S|[iP]|S|[Tg]-D|S|
[WD]|D|[iD]|D|[tg]-D|S|
[wD]|D|[YD]|D|[tg]-D|D|
[wD]|D|[YP]|P|[ES]-P|P|
[EP]|S|[iP]|S|[Tg]-D|S|
[WD]|D|[iD]|D|[tg]-D|S|
[wD]|D|[YD]|D|[tg]-D|D|
[wD]|D|[YP]|P|[ES]--
E-i-T--
W-i-t--
w-Y-t-D|D|
[wD]|D|[YP]|P|[ES]--
[ES]|s|[is]|P|[TP]-PPPs
W|P|[iP]|p|[tp]-PPPg
w|D|[YS]|S|[ts]|s|s|s|
[wS]|sPY-E-ii|S
E|s|[is]|P|[TP]-PPPs
W|P|[iP]|p|[tp]-PPPg
w|D|[YS]|S|[ts]|s|s|s|
[wS]|sPY-E--i|
[EY]-i-i|Y-i-i|
[ei]-i-i|Y-i-i|
[WY]-i-i|Y-i-P|
[wEYP]-[wEYP]-P|[wEYS]-[wEYP]--
[EP]|S|[iP]|S|[Tg]-D|S|
[WD]|D|[iD]|D|[tg]-D|S|
[wD]|D|[YD]|D|[tg]-D|D|
[wD]|D|[YP]|P|[ES]-P|P|
[EP]|S|[iP]|S|[Tg]-D|S|
[WD]|D|[iD]|D|[tg]-D|S|
[wD]|D|[YD]|D|[tg]-D|D|
[wD]|D|[YP]|P|[ES]|S|S|s|
[Ei]-T-E-[TP]-
[Wi]-t-W|s|[ts]|P|
[Wi]|I|[ri]-W-r-
w-[ES]-[wS]-[Es]-
[Ei]-T-E-[TP]-
[Wi]-t-W|s|[ts]|P|
[Wi]|I|[ri]-W-[rD]|D|
[wD]|D|P|P|S ]]

UseShiftKeys()

end)

Modern2:Button("Payphone - Maroon 5", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 120 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ u-i-o-d-4-8-[qs]-
s-a-o-i-8-w-[ti]-i-u-t-i-6-
[0u]-e-y-t-u-y-5-9-w-u-i-o-
d-4-8-[qs]-s-a-o-i-8-w-[ti]-
i-u-t-i-6-[0u]-e-y-t-u-y-5-
9-w--t-t-[4q]-t-[4qu]o-o[4q]u-y
[4qu]-y-[8t]-t-[8tu]o-o[8t]u-y[8tu]-
[6e]-t-[6eu]o-o[6e]u-y[6eu]-y-[5w]-
t-[5wu]o-o[5w]p-u[5wy]-u-[4q]-t-
[4qu]o-o[4q]u-y[4qu]-y-[8t]-t-[8tu]
o-o[8t]u-y[8tu]-[6e]-t-[6eu]o-o[6e]
u-y[6eu]-y-[5wi]-u-t-i-u-y-[4u]-
8-[qu]-e-[tu]-euq-y-[8u]-w-[tu]-
u-[uo]-uut-y-[6u]-0-[eu]-t-u-t
ue-y-[5y]-9-[wr]-r-[ry]-rtw-o-
[4u]-8-[qu]-e-[tu]-euq-y-[8u]-w-
[tu]-u-[uo]-uut-y-[6u]-0-[eu]-t-
u-tue-y-[5y]-9-w-u-i-o-d-[48]-
q-[48s]-q-[48s]-[qa]-[48o]-[qi]-[8w]-
t-[8wi]-t-[8wi]-[tu]-[8wt]-[ti]-[60]-
[eu]-[60]-[ey]-[60]-[et]-[60u]-[ey]-
[59]-w-[59]-w-[59u]-[wi]-[59o]-[wd]-
[48]-q-[48s]-q-[48s]-[qa]-[48o]-[qi]-
[8w]-t-[8wi]-t-[8wi]-[tu]-[8wt]-[ti]-
[60]-[eu]-[60]-[ey]-[60]-[et]-[60u]-
[ey]-[59]-w-[59]-[ws]-[59f]-[wg]-[59f]-
[wd]-[48d]-qs[48]-[qs]-[48]-[qd]-[48f]-
q-[8w]-t-[8w]-t-[8wf]-[tg]-[8wf]-[td]-
[60d]-es[60]-[es]-[60]-[eh]-[60d]-e-
[59]-w-[59]-w-[59uf]-[wig]-[59uf]-[wyd]-
[48yd]-q[ts][48]-[qts]-[48]-[qyd]-[48uf]-
q-[8wt]---[8wtuf]-[ig]-[8wtuf]-[yd]-[60eyd]-
[ts][60e]-[ts]-[60e]-[oh]-[60eyd]-[59wya]|
[8wts] ]]

    UseShiftKeys()

end)

Modern2:Button("Giga Chad (Meme only)", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 50 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [as]-a-a-d-s
[pa]-a u a-d-s
[Oa]-a-a-d-s
a a u a auuua-
[as]-a-a-d-s
[pa]-a u a-d-s
[ua]-a-a-d-s
a a u a auuua- ]]

    UseShiftKeys()

    end)

Modern2:Button("Lupang Hinirang (Our Beloved Homeland)", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 30 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ d Sfd p
fGhGfG d
d Sfd p
fGhGf[yd]-
d Sfd p
fGhGfG d
d Sfd p
fGhGfd dSd
ffppffpp
Ghjkj dSd
ffppffpp
GhGfGf[yd] dSd
ffppffpp
Ghjkj dSd
ffppffpp
GhGfGfy yry
o o p p
apopa sap
a o p II
[roa]--dad
h h j j
kjhjk----lkj
k--h--
j--z--
z [wydz] ]]

    UseShiftKeys()

    end)

Modern2:Button("After Dark - Mr. Kitty", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 54 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ D-D z-z J-
D-D z-z J-
h-h z-z J-
h-h z-z J l
D-D z-z J-
D-D z-z J-
h-h z-z J-
h-h c-c Z z
[YD] P [dD] [Dz]-z J-
[YD] P D z-z J-
[oh] d h [Jdz]-z J-
[oh] d h [Jdz]-z J l
[YD] P [dD] [Dz]-z J-
[YD] P D z-z J-
[oh] d h [Jz]-z J-
[oh]-h c-c Z z
(----E [EP] s-d Y E
(----E [YP] s-d Y E
w----E [yP] s-d y E
w----E [yP] s-d y E
[(d]----E [EP] s-d Y E
(----E [YP] s-d Y E
w----E [yP] s-d y E w-P D-d--(----E [YP] s-d Y E (----E [YP] s-d Y E 5 9 [wP] [Es]-d Y-5 9 [wP] [Es]-d Y-[(d]----E [YP] s-d Y E (----E [YP] s-
d Y E 5 9 [wP] [Es]-d Y-[wyo]-P D-d--[@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [5h] w
[Eh] [ydz] ^ [8dz] [9J] d [5h] w
[Eh] [ydz] ^ [8dz] [9J] [dl] [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [5h] w
[Eh] [ydz] ^ [8dz] [9J] d [5h] w
[Eh] [ygc] ^ [8gc] [9gZ] z [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [5h] w
[Eh] [ydz] ^ [8dz] [9J] d [5h] w
[Eh] [ydz] ^ [8dz] [9J] [dl] [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [5h] w
[Eh] [ydz] ^ [8dz] [9J] d [odh]-
h c-c Z z @ ( [(P]
s E-d--[Ei] P [@o] ( [(P]
s E E d--[Yi] o [5d] 9 [wP] [Es]-d--[yi] P [5d] 9 [wP] [Es]-d--
[yi] P [@od] ( [(P] s E E d--
[Yi] o [@od] ( [(P] s E E d--
[Yi] o [5d] 9 [wP] [Es]-d--[yi] P [5d] 9 [wP] [ED]-d y-@ ( [o(P] [ps]
E s [Pd]--[Yi]-P-[@o] ( [o(P] [ps]
E s [Pd]--[Yi]-P-[5o] 9 [woP] [Eps] s [Pd]--[yi] P [P5d] 9 [woP] [Eps]-[Pd]--
[yi] P [@o] ( [o(P] [ps] E [Eps] [Pd]--
[Yi] P [@od] ( [o(P] [ps] E [Eps] [Pd]--
[Yi] P [5wod]-[oP] [ps]-[Pd]--[P5wd]-P D d--[@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [5h] w
[Eh] [ydz] ^ [8dz] [9J] d [5h] w
[Eh] [ydz] ^ [8dz] [9J] [dl] [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [5h] w
[Eh] [ydz] ^ [8dz] [9J] d [^oh]-
[oh] [gc] ^ [gc] [DZ] [dz] [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [5h] w
[Eh] [ydz] ^ [8dz] [9J] d [5h] w
[Eh] [ydz] ^ [8dz] [9J] [dl] [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [5h] w
[Eh] [ydz] ^ [8dz] [9J] d [woh]-
[oh] [gc]-[gc] [DZ] [dz] [(YPJ]-
P [DJ]-P [DJ]-[(YPJ]-
P [DJ]-P [DJ] P [5wdJ]-
P [dJ]-P [dJ]-[5wdj]-
p [dj]-p [dg]-[(YPJ]-
P [DJ]-P [DJ]-[(YPJ]-
P [DJ] D P [DJ] P [5wdJ]-
P [dJ]-P [dJ]-[5wdj]--
[dj] [dg] p d g [@DJ] (
P [(P]-[@DJ] [(P] [(P] [DJ] E [gDJ]-P [PD] [Pg]
[5dJ] w P [wP]-[5dj] [wp] [wd] [dj] o [dg] p
d g [@DJ] ( P [(P]-[g@DJ] ( P [g(PDJ] [gDJ] E [DJ] P [gDJ] P [5wdhJ]-
P P----[pdj]--
[pdg]--[@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [5h] w
[Eh] [ydz] ^ [8dz] [9J] d [5h] w
[Eh] [ydz] ^ [8dz] [9J] [dl] [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [5h] w
[Eh] [ydz] ^ [8dz] [9J] d [^oh]-
[oh] [gc] ^ [gc] [DZ] [dz] [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [5h] w
[Eh] [ydz] ^ [8dz] [9J] d [5h] w
[Eh] [ydz] ^ [8dz] [9J] [dl] [tD] s
[sD] [dhz] y [Ydz] [odJ] P [@D] (
[(D] [Edz] 4 [5dz] [d^J] 9 [5h] w
[Eh] [ydz] ^ [8dz] [9J] d [5woh]-
[oh] [gc] ^ [gc] [DZ] [dz] [5D]-
[5D] [qz]-[qz] [9J]-[5D]-
[5D] [qz]-[qz] [9J]-[oh]-
[oh] [dz]-[dz] [PJ]-[oh]-
[oh] [dz]-[dz] [PJ] [sl] [YD]-
[YD] [dz]-[dz] [PJ]-D-
D z-z J-h-
h z-z J-h-
h c-c Z z ]]

    UseShiftKeys()

    end)

Modern2:Button("Hedwig's Theme - Harry Potter Theme", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 58 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ a|fu-hG|fu-
k|[uj]--uG--uf-
hG|Du-g|ua-o|a-
a|uf-hG|[uf]-k|
uz-L|[ul]-H|lu-k|
uj-a-h-f-o|a-
h|uk-h|[uk]-h|[ul]-
k|Ju-G|uh-kJ|P-
a|k----h|ku-
h|ku-h|zu-L|lu-
H|lu-kJ|P-h|f-
o|a--kkkkkkJ
kl|kJk|h-j-jHj|s|
a|fhJJJ|kkkkkkJk
z|lkl|g|l|kJk-f|h--
D--ffffffDf
g|fDf|s|d|dSd-i|
u|psDDD-ffffffD
fh|gfg-a|g|fDf|p|
s-P ]]

    UseShiftKeys()

    end)

Modern2:Button("Heat Waves", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 40 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ 9dgydgyd8sftsfts
6psepsep5oawoawo
9dgydgyd8sftsfts
6psepsep5oa--
9 y [qy]t-8yyy[0y]t-
[6y] y [0y] t [5y]yy[5u][wy]t-
9 y [qy]t-8yyy[0y]t-
[6y] y [0y] t [5y]yy[5u]--
2 y [6t] tt[1u]uyy[5y]-
6 y [0t] tt[5u]uy5y 9
2 y [6t] t [1u]ut [5y]-
6 y [0t] t [5u]ut5y 9
2 y [6t] tt[1u]uyy[5y]-
6 y [0t] tt[5u]uy5y 9
2 y [6t] t [1u]ut [5y]-
6 y [0t] t [5u]ut5y-
9dgydgyd8sftsfts
6psepsep5oawoawo
9dgydgyd8sftsfts
6psepsep5oa ]]

    UseShiftKeys()

    end)

Modern2:Button("Super Idol (Meme)", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 42 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ f f g f d f p-
d s p-s-d-
d d f d s d f-
s p s-s-p-
f f g f d s f d-
f p-p s a-
a-f-f-s ]]

    UseShiftKeys()

    end)

Modern2:Button("Dandelions", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 30 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [48j]hff-d[60f]-ds-
[8wj]hff-d[59d]-sd-s
[48p]sdfds[60f]-j-
[8wo]sdfds[59d]--
[48p]sssdf[60j]-h-
[8wf]-d-[59]--
[48p]sssdf[60j]-h-
[8wf]-d-[59]ssfds
[48p]-fds[60s]ssfds
[8w]f--[59]ssfds
[48p]-fds[60s]ssfds
[8w]f--[59]-s-
[48g]hgfds[60f]-fds
[8wd]-f-[59d]--
[48g]hgfds[60f]-fds
[8wf]--[59d]--
[48j]hff-d[60f]-ds-
[8wj]hff-d[59d]-sd-s
[48p]sdfds[60f]-j-
[8wo]sdfds[59d] ]]

    UseShiftKeys()

    end)

Modern2:Button("World's Smallest Violin",  function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 120 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ 180w0wtwtutuouososfsfhfh-l-[sl]-[sl]-[qts] s s s s P p-[Qys] s s s s Pp--[wyd] d d d ds P--[wyd] d [eyd] d [Eyd] s P--[qts] s s s sP p-P [Qys] s s s sP p-s [wyd] d d d ds P-s [wyd] d [eyd] d [Eyd]s P[ty]-[^Pid] [EPqid] [^Pid] [Eqd] [^d]s[qE]g^ [qE] [4ips] [qeips] [4ips] [qes] [4s] [qes]g4 [qe] [5P] [wEP]P5 [wEP] [5P] [wEP] [5s] [wEP] [4p] [qe] [5P] [qe] [6s] [qe] 4 [qe]i [3o] [0wo] [3o] [0wo] [3o] [0wo] [3p] [0wo] [2i] [9q] [2o] [9q] [2p] [9q] 2 [9q]p [5a] [wra] [5a] [wra] [5a] [wra] [5s] [wrd] [1f]d[80s] 2 [80] @ [80] 3 [80ts] [4ts] [qe] [4ts] [qets] [4ts] [qeEP][ep]4 [qe] [$ts] [Qets] [$ts] [Qets] [$ts] [eQEP][ep]$ [Qets] [^yd] [Eyig] [^ig] [Eyd] [^ig] [Eyd] [^ig] [Eyoh] [*pj] [Tu] * [TLujx] [6jL] [TLeujx] [6jL] [Teupj] [^oh] [^9ig] [^yd] [^9ig] [7oh] [79ig][ig]7 [79oh] [1pj] [8qsl] [1sl] [8qpj] [2dz] [Q9sl][sl]2 [Q9pj] [5pj] [Ewig] [5ig] [Ewpj] [^pj] [Etig][ig]^[ig][Et] [4ig] [qe] [4ipsg] [qe] [4gjlc] [qe] [4cbm] [qe] [Eqz] z [^z] z [^z] lc^- [8qel] l [4l] l [4l] Jc4- [9wEJ] J [5J] J [5J] j [5l] J [4j] [qe] [5J] [qe] [%k] [qe] [6l] [qe] [*eh] h [6h] h [6h] h [6j] h [9eg]-[2g]GhHjJ[2k]lLZx[2c]- [Ewc] c [^c] c [^x] z [^l] j [wth]-[8osfh]-[8uosf]-[8tuos] s [qts] s [4s] s [4s] P [4p] P [Qys] s [$s] s [$s] Pp$-[wyd] d [5d] d [5d] sP5-[wyd] d [eyd] d [Eyd] sP5 w [qts] s [4s] s [4s] Pp4-[Qys] s [$s] s [$s] Pp$-[wyd] d [5d] d [5d]s P5-[wyd] d [eyd] d [Eyd]s P[ty]-[^Pid] [EPqid] [^Pid] [EPqd] [^Pd]s[qE][Pdg]^ [qE] [4ips] [qeips] [4ips] [qeps] [4ps]s[qe][psg]4 [qe] [5oP] [woEP][oP]5 [woEP] [5oP] [woEP] [5os] [woEP] [4ip] [qe] [5oP] [qe] [6ps] [qe] [4gjlc] [qe]i [3uo] [0wo] [3uo] [0wo] [3uo] [0wo] [T3up] [0wo] [2yi] [9q] [2uo] [9q] [2ip] [9q] 2 [9q]p [5oa] [wroa] [5oa] [wroa] [5oa] [wroa] [5os] [wrod] [1uosf]d[80s] [2i] [80] [@I] [80] [3o] [80ts] [4ts] [qe] [4ts] [qets] [4ts] [qeEP][ep]4 [qe] [$ts] [Qets] [$ts] [Qets] [$ts] [eQEP][ep]$ [Qets] [^yd] [Eyig] [^ig] [Eqyd] [^ig] [Eqyd] [^ig] [Eqoh] [6pj] [Tu] 6 [TLujx] [6jL] [TLeujx] [6jL] [Teupj] [^oh] [^9ig] [^yd] [^9ig] [7oh] [79ig][ig]7 [79oh] [1pj] [8qsl] [1sl] [8qpj] [2dz] [Q9sl][sl]2 [Q9pj] [5pj] [Ewig] [5ig] [Ewpj] [^pj] [Etig][ig]^[ig][Et] [4ig] [qe] [4ipsg] [qe] [4gjlc] [qe] [4cbm] [qe] [Eqz] z [^z] z [^z] lc^- [8qel] l [4l] l [4l] Jc4- [9wEJ] J [5J] J [5J] J [5J]l J [4j] [qe] [5j]HG[qe]fd%sP[qep]OoI[6i] [qe] [*Teuo] [Tuo] [T6uo] o [6o] o [6o]p o [9ei]-2IopPsSdDf2GhjJlLzZx[2c]- [Ewc]vcvcvcvc^vcvc [^x] z [^l] j [wth] sf[8h]lhl[8x]vxv[8m]- [qts] s [4s] s [4s] Pp4- [Qys] s [$s] d [$s]P p$-[wyd] d [5d] d [5d] sP5-[wyd] d [eyd] d [Eyd] sP5 [ws] [qts]-[4s] s [4s] Pp4- [Qys] s [$s] s [$s] Pp$ s [wyd] g [5g] d [5g] d [5g] h [T0ej] eTupSfjLxb---- p- [^Eqo] i [^Eqy] i [7wro] i [7wri] o [8etp] s [8ets] p [9eyd] s [9eys] p [^Eqo] i [^Eqy] i [7wro] i [7wri] o [8etp] s [8ets] p [9eyd] s [9eys] p [^Eqo] i [^Eqy] i [7wro] i [7wri] o [8etp] s [8ets] p [9eyd] s [9eys] p [^Eqo] i [^Eqy] i [7wro] i [7wri] o [8etp] s [8ets] p [9eyd] s [9eys] [pj] [^Eqoh] [ig] [^Eqyd] [ig] [7wroh] [ig] [7wrig] [oh] [8etpj] [sl] [8etsl] [pj] [9eydz] [sl] [9eysl] [pj] [^Eqoh] [ig] [^Eqyd] [ig] [7wroh] [ig] [7wrig] [oh] [8etpj] [sl] [8etsl] [pj] [9eydz] [sl] [9eysl] [pj] [59wpj]-[59wig]-[59wig]-[59wpj]- [8wtpj]-[8wtig]-[8wtig]-[8wtig]- [4qgjlc]-4 ]]

    UseShiftKeys()

    end)

Modern2:Button("Build a B*tch - Bella Poarch", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 50 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ p a
[6s] 8a[0p] f [2pd] 6 [9o] p
[5a] [7a] [9a] p [3uO] % [7p] a
[6s] [8s] [0s] a [I2p] 6 [9o] p
[5a] [7a] [9a] s [O3d] % [7p] a
[6s] 8a[0p] f [2pd] 6 [9o] p
[5a] [7a] [9a] p [3uO] % [7p] a
[6s] [8s] [0s] a [2I] [6y] [9I] p
[5o]-w-5--
[6p] s a p6[2o] I [9y]-
[5p] s a p5[3a]-[3u]-
[6p] s a p6[2o] I [9y]-
[5p] a p o5[3p]-[3a]-
[6f]-ds a6[2s] a [9p]-
[5o] a p o5[3p]-[3u]-
[6p] s a p6[2o] I [9y]-
5 y o-o-p a
[6s] 8a[0p] f [2pd] 6 [9o] p
[5a] [7a] [9a] p [3uO] % [7p] a
[6s] [8s] [0s] a [I2p] 6 [9o] p
[5a] [7a] [9a] s [O3d] % [7p] a
[6s] 8a[0u] f [2pd] 6 [9o] p
[5a] [7a] [9a] p [3uO] % [7p] a
[6s] [8s] [0s] a [2p] [6y] [9I] p
[5o]-w-5--
6-8[0s] a [2p] o6[9I]-
[5a] a7[9a] p [3O]-70-
6-8[0s] a [2I] y6[9o] p
[5a] a7[9a] s [3d]-70-
[Iep] [ps] [oa] [Ip] [9uo] [yI] y-
[wuo] [oa] [Ip] [uo] [0ua]-u-
[6p] s a p6[2o] I [9y]-
[5o] a p o5[3a]-[3d]-
[6f]-ds a6[2s] a [9p] o
[5a] a a s5[3a]-[3p] o
[6p] s a p6[2o] I [9y]-
5 y o o y-p a
[6s] 8a[0p] f [2pd] 6 [9o] p
[5a] [7a] [9a] p [3uO] % [7p] a
[6s] [8s] [0s] a [I2p] 6 [9o] p
[5a] [7a] [9a] s [O3d] % [7p] a
[6s] 8a[0u] f [2pd] 6 [9o] p
[5a] [7a] [9a] p [3uO] % [7p] a
[6s] [8s] [0s] a [2p] [6y] [9I] p
[5o]--w 5--
6-8[0s] a [2p] o6[9I]-
[5a] a7[9a] p [3O]-70-
6-8[0s] a [2I] y6[9o] p
[5a] a7[9a] s [3d]-70-
6-8[0f] d [2s] a6[9p]-
[5a] a7[9a] p [3O]-7[0a]-
[6s] s8[0s] a [2I] y6[9I] p
[5o] ]]

    UseShiftKeys()

    end)

Modern2:Button("Snap - Rosa Linn", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 60 -- delay overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ 6 0 e t 6 0 e t
6 0 e t 5 9 w r
8 w t u 8 w t u
8 w t u [5s] 9srf9
[6f] 0 e t 6 0 e t
6 0 t [0s] [4g] 8gef8
[8f] w u [ws] 8 w t u
8 w t u [5s] 9drs9
[6f] 0 t [0f] [6f] 0 t [0d]
[6d] 0 t [0d] [4d] [8s] [es] 8
8 w t u 8 w t u
8 w u [ws] [5s] 9srd9
[6f] 0 e t 6 0 e t
6 [0s] t [0s] [4g] [8g] e [8f]
[8f] w u [ws] 8 w t u
8 w u [ws] [5s] 9drs9
[6j] 0hth0 [6f] 0fef0
[6d] 0dtd0 [4s] 8 [es] [8s]
8 w t u 8 w t u
8 w t u 5 9 w r
[qtipd]--[qt]--
[qt]--[qts] f--
[wyf] d s d [wy]--
[wy]----s d
[6f]-[0e]-[3f]-[0e]-
4-[et]-[8f] g [et]-
[1f]-[wt]-5-[wt]-
8-[wt] s [8j]-h7h-
[6f] d [0es] d [3f] g [0ef]-
4 d [ets] d [8f] g [etf]-
1-[wt]-5-[wt]-
8-[wt]-7-[rs] d
[6f]-[0e]-[3f]-[0e] s
[4g]-g[et]g-[8g] f [etf]-
1-[wt]-5-[wt]-
8-[wt] s [8j]-h7h-
[6h] g [0ef] g [3h] j [0eh]-
4 g [etf] g [8h] j [eth]-
1-[wt]-8-[wt]-
1-[wt] s [8s] s [wt]-
5-o----
s s-s-d-
[6sf] 0 e t 6 0 e t
6 0 t [0s] [4sg] 8[sg]e[sf]8
[8sf] w u [ws] 8 w t u
8 w t u [5s] 9srf9
[6sf] 0 t 0 [6sf] 0 t [0d]
[6d] 0 t [0d] [4d] [8s] [es] 8
8 w t u 8 w t u
8 w u [ws] [5s] 9srd9
[6sf] 0 t [0s] 6 0 e t
6 0 t [0s] [4sg] 8[sg]e[sf]8
[8sf] w u [ws] 8 w t u
8 w t u 5 9srs9
[6sj] 0[sh]t[sh]0 [6sf] 0[sf]e[sf]0
[6ad] 0[ad]t[ad]0 [4g] [8f] [es] 8
8 w t u 8 w t u----
s s s d
[6sf]-[0e]-[3sf]-[0e]-
4-[et]-[8sf] [sg] [et]-
[1sf]-[wt]-5-[wt]-
8-[wt] s [8sj]-[sh]7[sh]-
[6sf] [ad] [0eps] [ad] [3sf] [dg] [0esf]-
4 [ad] [etps] [ad] [8sf] [dg] [etsf]-
1-[wt]-5-[wt]-
8-[wt]-7-[rps] [ad]
[6sf]-[0e]-[3sf]-[0e] s
[4sg]-[sg][et][sg]-[8sg] [sf] [etsf]-
1-[wt]-5-[wt]-
8-[wt] s [8sj]-[sh]7[sh]-
[6fh] [dg] [0esf] [dg] [3fh] [gj] [0efh]-
4 [dg] [etsf] [dg] [8fh] [gj] [etfh]-
1-[wt]-8-[wt]-
1-[wt] s [8s] s [wt]-
[6sl]-[0e]-[3ak]-[0e]-
[4pj]-[et]-[8oh]-[et]-
[1uf]-[wt]-5-[wt]-
8-[wtoh]-[8pj]-[7ak]-
[6sl] f [0ej] l [3ak] f [0eh] k
[4pj] s [etg] j [8oh] s [etf] h
[1uf]-[wt]-5-[wt]-
8-9-0-w s
[is]-j-j-[pj]-j-j-
[fj]-j-k-[sl]-k-h-
o--d--
h----s
[id]-f-f-[pf]-f-f-
[df]-d-d-[sd]-s-
[os]--f--
a----s-
d-f-f-f-f-f-
d-d-d-d s s--
o----
[sl] [dz]
[fx]--[fx]----
[fx] [gc]--
[1fx]-[wt]-5-[wt]-
8-[wt] [sl] [18jb]-[hv]7[hv]-
[6fx] [dz] [0esl] [dz] [3fx] [gc] [0efx]-
4 [dz] [etsl] [dz] [8fx] [gc] [etfx]-
1-[wt]-5-[wt]-
8-[wt]-7-[rsl] [dz]
[6fx?]-[0e]-[3fx]-[0e] [sl]
[4gc]-[gc][et][gc]-[8gc] [fx] [etfx]-
1-[wt]-5-[wt]-
8-[wt] [sl] [18jb]-[hv]7[hv]-
[6hv] [gc] [0efx] [gc] [3hv] [jb] [0ehv]-
4 [gc] [etfx] [gc] [8hv] [jb] [ethv]-
1-[wt]-8-[wt]-
1-[wt] s [8s] s [wt]-
[6lm?]-[0ekn]-[3kn]-[0ejb]-
[4jb]-[ethv]-8-[etgc]-
[1fx]-[wt]-5-[wt]-
8-[wt] s [18s] s 7-
[6lm]-[0ekn]-[3kn]-[0ejb]-
[4jb]-[ethv]-8-[etgc]-
[1fx] [dz] [wtsl]-5-[wt]-
8-[wt] [hv] [8hv]-[jb]7[kn]-
[6lm] x [0eb] m [3kn] x [0ev] n
[4jb] l [etc] b [8hv] l [etx] v
[1dz] h [wtk] z [5fx] h [wtl] x
8-[wthv]-[8jb]-[7kn]-
[6lm] x [0eb] m [3kn] x [0ev] n
[4jb] l [etc] b [8hv] l [etx] v
[1dz]-[wt]-[8fx]-[wt]-
1-[wt] s [8s] s [wt]--
o ]]

    UseShiftKeys()

    end)

Modern2:Button("Golden Hour - JVKE", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 120 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [pG] [SH] [fk] [SL] [fk] [SH] [pG] [SH] [fk] [SL] [fk] [SH]
[pG] [SH] [fk] [SL] [fk] [SH] [pG] [SH] [fk] [SL] [fk] [SH]
[Of] [aH] [Dk] [aL] [Dk] [aH] [Of] [aH] [Dk] [aL] [Dk] [aH]
[Of] [aH] [Dk] [aL] [Dk] [aH] [of] [aH] [Dk] [aL] [Dk] [aH]
[If] [pG] [Sj] [pk] [Sj] [pG] [If] [pG] [Sj] [pk] [Sj] [pG]
[If] [pG] [Sj] [pk] [Sj] [pG] [If] [pG] [Sj] [pk] [Sj] [pG]
[uD] [Of] [aG] [OH] [aG] [Of] [uD] [Of] [aG] [OH] [aG] [Of]
[uD] [Of] [aG] [OH] [aG] [Of] [uD] [Of] [aG] [OH] [aG] [Of]
[6eO] [TO] [uO] [TO] [uO] [TI] [6eV] T u T u T
[6eO] [TO] [uO] [TO] [uO] T [6eO] [TO] [uO] [TO] [uO] T
[%WO] [rO] [YO] [rO] [YO] [rI] [%WV] r Y r Y r
[%WO] [rO] [YO] [rO] [YO] r [5wO] [rO] [YO] [rO] [YO] r
[$QO] [eO] [TO] [eO] [TO] [eI] [$QC] e T e T e
[$QO] [eO] [TO] [eO] [TO] [eI] [$QC] e T e T e
[30O] [WO] [rO] [WO] [rO] W [30OD] [WO] [rO] [WO] [rO] W
[O30f] W [rO] W [rO] [WI] [30uG] W [rO] W [ra] W
[6eu] p S T u T u T [6e] T [uS] T [upD] T
[S6epf] T u T u T [6e] T [upS] T [Ouf] T
[%WOD] r [YS] r [YOa] r [%WOa] r Y r [YO] r
[a%WYOD] r [YS] r [YOa] r [5wYOD] r [YS] r [YOa] r
[$QIa] [Iep] T e T e [$Q] e T e T e
[$Q] e T e [uTS] e [$QTIua] e [TIp] e [TIO] e
[t%WYO] [%W] [%W] [%WTOS] [%W] [%W]
[(WOuf] % [(W] % [(W] % [tsYIOG]
[6xHLV] H k L k H [uWTG] H k L k H
[fOSG] H k L k H [uTOG] H k L k H
[6fSHL] [60WDHZ]
[6kx] 0 n t [kx] n [kx] n [kx] n [kx] n [kx] n [etujQC] b [jC] b [jC] b [jC] b [jC] b [jC] b
[3xHZV] f G H [30G] f [rWYD] f G H G f
[aOD] f G H G f [rYOD] f G H G f
[3D] f G H [30G] f [rWYDZ] f G H G f
[$fx] f G H G f [%GC] f G H G f
[6xHLV] H k L k H [uWTG] H k L k H
[fOSG] H k L k H [uTOG] H k L k H
[6fSHL] 6 6 6 [60WDHZ]
[6kx] 0 n t [kx] n [kx] n [kx] 6 n [kx] [0t] n [kx] 6 n [etujQC] b [jC] b [jC] b [jC] b [jC] b [jC] b
[3xHZV] f G H [30G] f [rWYD] f G H G f
[aOD] f G H G f [rYOD] f G H G f
[3D] f [3G] H [30G] f [rWYD] f G H G f
[$d] f G [6$*QH] G f [%d] f G [%(QWH] G f
[6e*O] [eTO] [uTO] [eTO] [uTO] [eTI] [6e*HV] [eT] [Tu] [eT] [Tu] [eT]
[6e*O] [eTO] [uTO] [eTO] [uTO] [eT] [6e*O] [eTO] [uTO] [eTO] [uTO] [eT]
[7%WO] [rWO] [rYO] [rWO] [rYO] [rWI] [7%WHV] [Wr] [rY] [Wr] [rY] [Wr]
[7%WO] [rWO] [rYO] [rWO] [rYO] [Wr] [57wO] [wrO] [rYO] [wrO] [rYO] [wr]
[6$QO] [eQO] [eTO] [eQO] [eTO] [eQI] [6$QGC] [Qe] [eT] [Qe] [eT] [Qe]
[6$QO] [eQO] [eTO] [eQO] [eTO] [eQI] [6$QGC] [Qe] [eT] [Qe] [eT] [Qe]
[30%O] [0WO] [rWO] [0WO] [rWO] [0W] [30%OD] [0WO] [rWO] [0WO] [rWO] [0W]
[%O30f] [0W] [rWO] [0W] [rWO] [0WI] [30u%G] [0W] [rWO] [0W] [Wra] [0W]
[6u] p S 0 e T e 0 6 0 [euS] T [epD] 0
[S6pf] 0 e T e 0 6 0 [epf] T [eOG] 0
[%OD] ( [WS] r [WOa] ( [%Oa] ( W r [WYO] (
[a%YOD] ( [WS] r [WOa] ( [5YOD] ( [WS] r [WOa] (
[$Ia] [*Ip] Q e Q * $ * Q e Q *
$ * Q e [uQTS] * [$TIua] * [QTIp] e [QTIO] [ru*O]
3 7 0 W 0 7 3 7 0 W 0 7
3 7 0 W [0I] 7 [3u] 7 [0O] W [0a] 7
[6u] p S 0 e T e 0 6 0 [euS] T [epD] 0
[S6pf] 0 e T e 0 6 0 [epf] T [eOG] 0
[%OD] ( [WS] r [WOa] ( [%Oa] ( W r [WYO] (
[a%YOD] ( [WS] r [WOa] ( [5YOD] ( [WS] r [WOa] (
[$Ia] [*Ip] Q e Q * $ * Q e Q *
[$Ip] * Q e [uQTS] * [$TIua] * [QTIp] e [QTIO] *
[t%YO] [(W] [(W] [%TOS] [(W] [(W]
[(WOuf] % [(W] % [(W] % [tsYIOG]
[6xHLV] H k L k H [uWTG] H k L k H
[fOSG] H k L k H [uTOG] H k L k H
[6fSHL] [60WDHZ]
[6kx] 0 n t [kx] n [kx] n [kx] n [kx] n [kx] n [etujQC] b [jC] b [jC] b [jC] b [jC] b [jC] b
[3xHZV] f G H [30G] f [rWYD] f G H G f
[aOD] f G H G f [rYOD] f G H G f
[3D] f G H [30G] f [rWYDZ] f G H G f
[@$fx] f G H G f [2%GC] f G H G f
[6xHLV] H k L [6ek] H [uWTG] H k L k H
[fOSG] H k L k H [uTOG] H k L k H
[6fSHL] 6 6 6 [60WDHZ]
[6kx] 0 n t [kx] n [kx] n [kx] 6 n [kx] [0t] n [kx] 6 n [etujQC] b [jC] b [jC] b [jC] b [jC] b [jC] b
[37xHZV] f G H [30G] f [rWYD] f G H G f
[aOD] f G H G f [rYOD] f G H G f
[3D] f [3G] H [30G] f [rWYD] f G H G f
[$fx] f G [6$*QH] G f [%GC] f G [%(QWH] G f
[6H] L x V * 0 W T u [euTO]
[6SL] [DZ]
[0kn] Q e t [jb]
[3HV]
[0rWY]
3 [DZ]
[W0ryfx] [GC]
[6H] L x V
[euTO]
[6SL] [DZ]
[0kn] Q e t [jb]
[3H] k x V
[0rWY]
3
[W0ry]
[euTH] V f x
S L
[rWYH] V D Z
a k
[wryG] C d z
S L p j
[euTG] C d z
S L
[0wrf] x a k
f x h v
[QETG] C P T I P
G S J G L  ]]

    UseShiftKeys()

    end)

Modern2:Button("This is what falling in love feels like", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 60 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ G-D-a-I-
o-D-S--
[r(QYI]-O-P-a S D f
[0wrG]-k-L-Z-x-
C----
[7rYIP]--DI-D-
[YI18tp]--SD-I-
[!*TOua]--I DI-D-
[uoa$QS]--I SD-I-
[7rYIP]-O[(Qra]aO[(Qra]aO[(Qra]-
[YI18tp]OO[(Qta]aO[(Qta]aO[(Qta]-
[!*Ouaf]-[0ruaWOD]-[WO0rua]-[0ruWO]-
[$Quoaf]-[uoa$QD]-[$Quoa]-O-I
[aDGJ]-[aDGJ]-a[aDGJ]-[aDGJ]-
[DGsj]-[DGsj]-s[DGsj]-[DGsj]-
[fSH]-[fSH]-S[fSH]-[fSH]-
[Sfh]-[Sfh]-S[Sfh]-Q[WSfh]-Q
[aYDGJ]-T[aYDGJ]-Q[aDGJ]-[aWDGJ]-Q
[YDGsj]-T[YDGsj]-Q[DGsj]-T[YDGsj]-T
[fYSH]-T[fYSH]-T[fYSH]-T[fYSH]-T
[YSfh]-T[YSfh]-Q[Sfh]-IO-a
[7aDGJ]-[7aDGJ]-[7aDGJ]-I[7O]-[7s]
[DG8sj]-[DG8sj]-[DG8sj]-I[8O]-[8D]
*-f[*D]-S[*a]-*-[*D]
Q-f[QD]-S[Qa]-I[QO]-a
[7aD]-[7aD]-[7aD]-G[7aDH]-[7l]
[8sD]-[8sD]-[8sD]-G[8sDH]-[8Z]
[f*H]-x [f*HZ]-L [*Hfk]-G [f*H]-[*Z]
[Qfh]-x [fhQZ]-L [fhQL]-Z[Qfh]-
C----
[7rYIP]--DI-D-
[YI18tp]--SD-I-
[!*TOua]--IDI-D-
[uoa$QS]--ISD-I-
[7rYIP]-7OaaO[7a]aO[7a]-7
[YI18tp]O[18]OaaO[18a]aO[8a]-[!*]
[!*Ouaf]-[0ruaWOD]-[WO0rua]-[u!*O][!*][@(]
[30uoaf]-[30uoaD]-[$Quoa]-[u$QO]-
[7rYIP]-7O[(Qra]aO[(Q7ra]aO[(Q7ra]-7
[YI18tp]O8O[t(QS]SS[8t(QD]GD[8t(QS]a8
[!*Ouaf]-[0ruaWOD]-[WO0rua]-[0ruWO]-
[uoaf]-[uoaD]-[uoaS]-[uoaD]-
[7kGC]-7 [r(QDZ]-7[(Q7rak]-7 [7r(QIG]-7
[18paDH]-8 [t(QDZ]-8[8t(QSL]-8[(Qt]-8
[!*Ouaf]-*[0ruaWOD]-* [*WO0rua]-*[0ruWO]-*
[30uoaf]-[30uoaD]-[$Quoa]-[u$QO]-
[7kGC]-7 [r(QDZ]-7[(Q7rak]-7 [7r(QIG]-7
[18psDH]-8 [t(QDZ]-8[8t(QSL]-8 [(Qt]-8
[!*Ouaf]-*[0ruaWOD]-* [*WO0rua]-*[0ruWO]-*
[30uoaf]-[30uoaD]-[$Quoa]-O-I
[aDGJ]-[aDGJ]-a [aDGJ]-[aDGJ]-
[DGsj]-[DGsj]-s [DGsj]-[DGsj]-
[fSH]-[fSH]-S [fSH]-[fSH]-
[Sfh]-[Sfh]-S [Sfh]-[Sfh]-
[DGak] ]]

    UseShiftKeys()

    end)

Modern2:Button("Xue Hua Piao Piao (Chorus)", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 50 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [e$QTI] * e * [$r] [*T] [eu] [*T]
[p$QISG] [*G] e [*f] [TS]f[*S]f[Gej] *
[30afOH] [7a] [Wa] [7S]f[S6pf]a[0S] T r
[$QTep]I[*u]I0*7*[$p]I[*u]Ie [*G]
[u!*OS] [%a] [0S] [%a] [!S] [%f] [0j] [%H]
[p$QISG] [*G] e [*f] [TS]f[*S]f[Gej] *
[30afOH] [7a] [Wa] [7S]f[S6pf]a[0S] T r
[$QTep]I[*u]I[ep] [*I] [6upTS]a[0S] [Ta] [0f]G
[u*TO]S[Wa] [uS] W [*S]a[WS]f[uj]H[WG]f
[p$QISG] [*G] e [*f] [TS]f[*S]f[Gej] *
[30afOH] [7a] [Wa] [7S]f[S6pf]a[0S] T r
[$QTep]I[*u]Ie * [$Ip][TI][*ru][TI]e *
[u*TOS]a[WS] u W [*Lx][HL][WGk][HL]u W
[%T][*u]W--S [0uWTOS] f-u
[$u] [*I] [eG]G[*f] [$SG] [*a] [ep] [*O] ]]

    UseShiftKeys()

    end)

Modern2:Button("Xue Hua Piao Piao (Meme)", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 40 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ Q I-u TuTuI-
u r r TuTrT--
eQ0Q--eQ0Q-I
TrT-r T u p O
Q I-u TuTuI-
u r r TuTrT--
eQ0Q--eQ0Q-I
TrT-r T u p O ]]

    UseShiftKeys()

    end)

Modern2:Button("Rick Roll (Meme)", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 60 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [4ips]-4 [oad] 5-5-
[3oad]-3 [psf] 6-[6h]gf
[4ips]-4 [oad] 5-5-
[3oa]-3-6 o [6p]s-
[4ips]-4 [oad] 5-5-
[3oad]-3 [psf] 6-[6h]gf
[4ips]-4 [oad] 5-5-
[3oa] s [ps]-6--
4-p s 4 s d a
5po--5-$-
4 p p a [4s] p-o
[5h]-h d 5-$-
4 p p a [4s] p s d
5 a p o 5-$-
4 p p a [4s] p o-
[5d] d d f [5d]-$-
[4s]-4-4 d [4f] s
[5d] d [5d] f [5d]-[5o]-
4-4-[4p] a [4s] p
5 d [5f] d 5-opsp
[4f]-[4f]-[5d]--opsp
[3d]-[3d]-[6s]-ap opsp
[4s]-d [5a]-po-o
[3d]-s 6--opsp
[4f]-[4f]-[5d]--opsp
[3h]-a [6s]-ap opsp
[4s]-d [5a]-po-o
[3d]-[6s] ]]

    UseShiftKeys()

    end)

Modern2:Button("Super Idol (Full)", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 60 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ d d D d s d
[(o] [EYs] [(P] o (
[EYP] ( [qs] [tis] [qs]
d [qs] [tiP] [qs] [9d]
[eyP] [9o] o [9P] [eyo] [9P]
[wo] [yod] [wd] D [wd]
[yos] [wP] [(d] s [EY] [(d]
o ( [EYo] [(P] [qp]
[tip] [qp] d q [tid] q
[^P] q E Y y
i p d
c ^ i [@(g]
[EYd] [(s] P [(s] [EYd] [(P]
[4qips] [et] [qi] o [qi]
[etu] [qi] [29d] [qeyd] [9s]
d 9 [qeyo] 9 [wi]
[Ey] [5w] w [Eyi] w
[@(g] [EYd] [(s] P [(s]
[EYd] [(P] [4qs] [et] [qi]
o [qi] [etu] [qi] [^d]
[Eqd] [^S] d ^ [EJ] q
[^j] e [qg] 9 [^o] 9
[4p] ^ [@P] [w(P] [^p]
P ^ [(d] @ [4qips]
[ets] [qP] s q [etp] q
[29iP] [qeyP] [9p] P 9
[qeyi] 9 [wo] [Ey] [5w]
w [Eyo] [wp] [@(YP]
[EYP] [(p] P ( [EYd] (
[4qs] s [ets] [qP] s [qP]
[etp] [qs] [^P] q E t
y i p s g j l c
d d D d [^s] d
[@(o] [EYs] [(P] o (
[EYP] ( [4qs] [ets] [qs]
d [qs] [etP] [qs] [29d]
[qeyP] [9o] o [9P] [qeyo] [9P]
[5wo] [Eyd] [wd] D [wd]
[Eys] [wP] [@(d] s [EY] [(d]
o ( [EYo] [(P] [4qp]
[etp] [qp] d q [etd] q
[^P] [qE] y [^i] p y i [^p] d
[Eqi] P [qd] g [^PJ] [Eqd] [^d]
D [^d] [Eqs] [^d] [@(o]
[EYs] [(P] o ^ [(P] @
[4qis] [ets] [qs] d [8s]
[qP] [4s] [29ipd] [qeyP] [9o]
o [6P] [9o] [2P] [5wo]
[Eyd] [wd] D [9d] [ws] [5P]
[@(id] s [EY] [(d] o ^
[(o] [@P] [4qip] [etp] [qp]
d 8 [qd] 4 [yi^P]
[qEP] ^ J ^ [qEP] ^
[^J] [Eqg] [^d] g [^d]
[Eqs] [^P] [@(o] [EYs] [(P]
o ^ [(P] @ [4qis]
[ets] [qs] d [8s] [qP] [4s]
[29ipd] [qeyP] [9o] o [6P]
[9o] [2P] [5wo] [Eyd] [wd]
D [9d] [ws] [5P] [@(id] s
[EY] [(d] o ^ [(o] [@P]
[4qp] [etp] [qp] d 8
[qd] 4 [yi^P] [qEP] ^
J ^ [qEP] ^ [^J]
[qEP] ^ J ^ [qEP] ^
[@P] D J ^ ( q w
[(h] ^ [4p] s g 8 q [wh]
[ed] [qs] [4P] [29]
[qeyP] 9 J 9 [qeyP] 9
[5wJ] [yEP] w J 9
[wP] 5 [@P] D J ^ ( q
w [(h] ^ [4p] s g 8
q [wh] [ed] [qs] [4P]
^ P J
P J [q^E] [q^E] [q^E]
[q^E] P o h [(Ey]
d s P [(Eys] [(Eyd] P
s [qet] [qet] i o [qeti]
u [qeti] d [qet] [qetd] s
d [qet] o [qet] i [Ewy]
[Ewy] w [Eyi] w
[(g] [Eyd] [(s] P [(s]
[Eyd] [(P] [qs] [et] [qi]
o [qi] [etu] [qi] [^d]
[Eqd] [^S] d ^ [EJ] q
[^j] e [qg] 9 [^o] 9
[4p] ^ [@YP] [w(P] [^p]
P ^ [(d] @ [4qips]
[ets] [qP] s 8 [qp] 4
[29yiP] [qeyP] [9p] P 6
[9i] 2 [5wyo] [Ey] w
9 [wo] [5p] [@(YP]
[w(P] [^p] P ^ [(d] @
[4qips] s [ets] [qP] g [8P]
[qp] [4s] P ^ ^ ^
[^Y] u i I o O p P a s S d ^ D f g G h H j J k l L ^ z Z x c C v V b B n m L ^ z Z x c C v V b B n [^?]
d d D d [^s] d
[@(o] [EYs] [(P] o (
[EYP] ( [4qs] [ets] [qs]
d [qs] [etP] [qs] [29d]
[qeyP] [9o] o [9P] [qeyo] [9P]
[5wo] [Eyd] [wd] D [wd]
[Eys] [wP] [@(d] s [EY] [(d]
o ( [EYo] [(P] [4qp]
[etp] [qp] d q [etd] q
[^P] [qE] y [^i] p y i [^p] d
[Eqi] P [qd] g [^PJ] [Eqd] [^d]
D [^d] [Eqs] [^d] [@(o]
[EYs] [(P] o ^ [(P] @
[4qis] [ets] [qs] d [8s]
[qP] [4s] [29ipd] [qeyP] [9o]
o [6P] [9o] [2P] [5wo]
[Eyd] [wd] D [9d] [ws] [5P]
[@(id] s [EY] [(d] o ^
[(o] [@P] [4qip] [etp] [qp]
d 8 [qd] 4 [yi^P]
[qEP] ^ J ^ [qEP] ^
[^J] [Eqg] [^d] g [^d]
[Eqs] [^P] [@(o] [EYs] [(P]
o ^ [(P] @ [4qis]
[ets] [qs] d [8s] [qP] [4s]
[29ipd] [qeyP] [9o] o [6P]
[9o] [2P] [5wo] [Eyd] [wd]
D [9d] [ws] [5P] [@(id] s
[EY] [(d] o ^ [(o] [@P]
[4qp] [etp] [qp] d 8
[qd] 4 [yi^P] [qEP] ^
J ^ [qEP] ^ [^J]
[qEP] ^ J ^ [qEP] ^
[@P] D J ^ ( q w
[(h] ^ [4p] s g 8 q [wh]
[ed] [qs] [4P] [29]
[qeyP] 9 J 9 [qeyP] 9
[5wJ] [yEP] w J 9
[wP] 5 [@P] D J ^ ( q
w [(h] ^ [4p] s g 8
q [wh] [ed] [qs] [4P]
[^E] P J
P J P
J P [(J] w E y
h
[qg] w e t Y h p
s [^P] q E t y  ]]

    UseShiftKeys()

    end)
    
local Anime = win:Tab('Anime')
local Anime2 = Anime:Section('Anime | Cartoons')

Anime2:Button("Island Song (Come along with me)",  function()
if Speedo2 == "" or Speedo2 == nil then
shared.tempo = 60
else
shared.tempo = Speedo2
end
shared.scr = [[ I o p--d--a---- d f G f-d-f-f- d----d f G f-d-f-a- d----a- p d-d-I-u---- I o p--d--a---- d f G f-d-f-f- d----d f G f-d-f-a- d----p a a d-S-f-d-- [dG]--[dG]-- [dG]---- G G-G-f-f- d----o a-d d--y I---- I G G-G-f-f- d----o a d-d-G-G-- f--I o p--d--a---- d f G f-d-f-f f d----d G f-d-f-a- d----o a d d S-f-f- d---- G G-G-f d f- d----o a-d d--y I---- d G G-G-f-f- d----p p d-d-G-G-- f--I o p--d--a---- d f G f-d-f-f- d----d G f-d-f-a- d----f G f-d-f-f- d---- a d d S-f-d ]]

UseShiftKeys()
end)

Anime2:Button("Krusty Krab Theme - Spongebob Squarepants",  function()
if Speedo2 == "" or Speedo2 == nil then
shared.tempo = 67
else
shared.tempo = Speedo2
end

shared.scr = [[ zLl k-h d-h k-h z-k vCvbvCv-z k-h G-f G-h j-k lkj z-L z-x C-z l-j k-h d-h k-h z-k vCvbvCv-z k-h klzv-z l-j G-h j-h h-G h---- zLl k-h d-h k-h z-k vCvbvCv-z k-h G-f G-h j-k lkj z-L z-x C-z l-j k-h d-h k-h z-k vCvbvCv-z k-h klzv-z l-j G-h j-h h-G h ]]

UseShiftKeys()
end)

Anime2:Button("Pearl White Story - Kimi ni Todoke S2 OST",  function()

if Speedo2 == "" or Speedo2 == nil then

    shared.tempo = 65

        else
        shared.tempo = Speedo2
    end

shared.scr = [[ w - [8u] - w t p-o[7y] - w r p-o[6t] - 0 t r t [5y] - [0u] - r - [4e] - 8 r t y [38w] -- [9qt] y [0wu] i [qeu] t [5tyo] 9 [wr] - w [8u] 0 w t [up]-o[7y] 9 w r [yp]-o[6t] 8 0 [et] [ry] [tu] [5us] 0 [wa] t [uo] - [4p] 8 q r t y [3o] 5 8 t y u [qei] o [wru] i [W0y] u [80t] -- o - [8f] w y [us] [oj] sh[7d] w r [ya] [oj] ah[6s] 0 e [ts] [ua] s [5d] 0 [wf] t [uoa] - [4tip] 8 q [wp] [ea] s [3uo] 8 0 w t - [9is] [ed] [0of] [tg] [qpf] [ts] [wosdh] y [oa] -- o [8of] w t [us] [oj]-h[7od] w r [ya] [oj]-h[6us] 0 e [ts] [ud] [5hl] 0 [wfk] t [ush]-f[4sgj] 8 q [wsj] [eh] g [3sfh] 8 w h [S6epg]-f[9id] [qS] [ed] f [yg] h [5sdgj] 9 r o [dgk] - fh[8l] w y u o s fh[8wul] - [EP0wof] - [^P0wod] - [4ips] 8 q [wtia] [eis] [qid] [4oad] 9 [wadj] e [radh] y [3oad] 7 0 [ruo] [rup] [rua] [6ups] 0 [epd] [ts] [woa] [to] [4ip] 8 q w [esgj] t [4adj] 9 [wadh] r [yoad] o [8oaf] w t y u o [P8og] w [Ptof] u [Ptod] w [4ips] 8 q [wtia] [eis] [qid] [4oad] 9 [wadj] e [rdhk] y [3adh] 7 0 w [roaf] u [S6fj] 0 [Seph] T [Supg] [Tf] [2psg] 6 9 q [tip] s [5ips] 9 w e [roa] s [8uos] w t u o s [8ip] e [oa] t [ip] t [8tuo] w t u o s [8ip] e [oa] t [ip] t [8tuo] w t u o s [8ip] e [oa] t [ip] t [5wtyo] [5wtyo] [5wtyo] [5wtyo] [5wtyo] [5wtyo] [5wtyo] [5wtyo] [5wryo] | o - [8f] w y [us] [oj] sh[7d] w r [ya] [oj] ah[6s] 0 e [ts] [ua] s [5d] 0 [wf] t [uoa] - [4tip] 8 q [wp] [ea] s [3uo] 8 0 w t - [9is] [ed] [0of] [tg] [qpf] [ts] [wosdh] y [oa] - o [8of] w t [us] [oj]-h[7od] w r [ya] [oj]-h[6us] 0 e [ts] [ud] [5hl] 0 [wfk] t [ush]-f[4sgj] 8 q [wsj] [eh] g [3sfh] 8 w h [S6epg]-f[9id] [qS] [ed] f [yg] h [5sdgj] 9 r o [dgk] - fh[8l] w y u o s fh[8wul] - [EP0wof] - [^P0wod] - [4ips] 8 q [wtia] [eis] [qid] [4oad] 9 [wadj] e [radh] y [3oad] 7 0 [ruo] [rup] [rua] [6ups] 0 [epd] [ts] [woa] [to] [4ip] 8 q w [esgj] t [4adj] 9 [wadh] r [yoad] o [8oaf] w t y u o [P8og] w [Ptof] u [Ptod] w [4ips] 8 q [wtia] [eis] [qid] [4oad] 9 [wadj] e [rdhk] y [3adh] 7 0 w [roaf] u [S6fj] 0 [Seph] T [Supg] [Tf] [2psg] 6 9 q [tip] s [5ips] 9 w e [roa] s [1uos] 5 8 9 0 w [wuo*EP] --- j h g f ps[9g] q e y [ip] s ip[5s] 9 w e [ra] s uo[1s] 5 8 9 0 w [5t] y u o s d hlz[1x] ]]

UseShiftKeys()
end)

Anime2:Button("Blue Bird - Naruto Op 3",  function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 80 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ f j k [el] t u p [wk] r y [oj] e t u p
s f j k [el] t u p [wz] r [yl] [oz] 0 [Wx] r u
O f j k [el] t u p [wk] r y [oj] e y I p
d j x z 9 [qj] [ex] [yz] 0 [wh] r [uh] 6 [8j] [0j] e
t e t u p |
f j k [el] [tf] [ul] [pk] w [rj] [yh] [oj] 8 [0s] [wd] [tf]
u [of] [sf] f [qg] [eh] [tj] [ih] p [sh] [gh] h [0j] [Wk] [rl] [uk]
O [af] [fj] k [el] [tf] [ul] [pk] w [rj] [yh] [oj] 8 [0s] [wd] [tf]
u [of] [sf] f [qg] e [tl] i [wk] [rj] y [oh] e [th] [uj] p
s f j k [ql] e t i p s [fl] - [wk] r-l-y-k-o
a [fg] [hk] l [0z] w r u o a [fz] [el] t-k-u-j-p
s [fj] [jl] z [9x] q [ej] [yl] i [pz] d x q e t [ix]
[pv] s [gc] x [W0ru] | [W0ru] - [W0ru] - [W0ru] [W0ru] |
[Vxn] f j k [el] t u p [wk] r y [oj] e t u p
s f j k [el] t u p [wz] r [yl] [oz] 0 [Wx] r u
O f j k [el] t u p [wk] r y [oj] e y I p
d j x z 9 [qj] [ex] [yz] 0 [wh] r [uh] 6 [8j] [0j] e
t [ef] [tj] [uk] [el] t u p [wk] r y [oj] e t u p
s f j k [el] t u p [wz] r [yl] [oz] 0 [Wx] r u
O f j k [el] t u p [wk] r y [oj] e y I p
d j x z 9 [qj] [ex] [yz] 0 [wh] r [uh] 6 [8j] [0j] e
t [ej] [tx] [uz] 9 [qj] [ex] [yz] 0 [wh] r [uh] 6 [8j] [0j] e
t [ej] [tx] [uz] q [ej] [tx] [iz] w [rh] y [oh] - [etupj] [etupj] ]]

UseShiftKeys()

end)

Anime2:Button("Unravel (Easy)",  function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 60 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ J l-J-j h-
l-J-j-h-
h g--D D-g 
d----
d [(d]-d d ( z z-
w--w--
J [qj]-j j q J J-
9--9--
J [^(l]-J-[^(j] h-
l [9w] J-j [9w] h-
h [8qg]--D [8qD]-g 
d [^9]--[^9]--
d [^(d]-d d [^(] z z-
[9w]--[9w]--
J [8qj]-j j [8q] J J-
[5w]----
d-s-P d-s-
P [5w][5w] [5w] [5w][5w] [5w][5w] [5w][5w]-
[wd]J d[qh] d ( d [9s]d-
[wd]J d[qh] d ( J 9j-
[wd]J d[qh] d ( d [9s]d-
[wd]J d[qh] d ( J Qj-
E-w-t E-w-
[tp] [yP]-P-[tP]--P 
d [qd]-s-s--
P [qs]-P-[tp]-i-
y t--E--
i [Ei] y[ey]-[ey] [Et] y[ey]-
[ei] [Ei] y[ey]-[ey] [Et] y[ey]-
[ei] [Ei] y[ey]-[Ey] [et]-[Ey]-
[Ey]--y d-s 
s [@^(d]-s s s-P-
p [48q] P-p-i-
i [59wd]-s s-P-
P [269p]-P-g-p-
P [@^(h]-g d-P-
P [48qP]-p o-p-
P [59w]----
J [269j]-J-j-g-
i [@^(d] ss-s s PP-
P [48qp]-P-p-i-
i [59wd] ss-s s PP-
P [269p]-P-g-p-
P [@^(h]-g d P--
P [48qP]-p o-p-
P [59w] ]]

    UseShiftKeys()

end) 

Anime2:Button("Black Rover",  function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 90 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ G I G I H I H I 
g I g I G I G I 
D I D I g I g I 
s I s I S I S I 
d I d I f I f I 
a I a [@I] [^(S] @ 7 [@(TI]-
[@O] [^(SH] [@O] [@i] [^(] [TI]-
7 [7Y] [r*QID] D [7GZ] [7D] [(Q] [yi^P]-
[^P] [qdEJ] P [^i] ^ [Eqy]-
^ [^y] [Eqid] d [^gz] [^d] [qE] [7rYI]-
[7I] [ra(QG] I [7S] 7 [(QYIP]-
7 [7P] [r(QDJ] J [7ZB] [7J] [r(QDJ] P 
[%YP]-[%YP]-[%YP]-[%YOS]-[(W]-
[!*TI] % q * [%Ti] ! !-
[@(TI]-[QE] (-( [QES]-
[(S]-S[QE]S( S (a[QE][YIP]-
[$7]-[QEO] (-( [QES]-
[(S]-S[QE]S( S (D[QE]-[OS]
%-[QEP] (-( [QEP]-
[(P]-[QEa] ( P ( [QES]-
[4yi^O]-[qW] 9 S 9 [qW]-
[9I]-[qW] ^ [Eqi] ^ [4^] ^ 
[@EYI]-( ^ [@IPG] ^ [QIPG] ^ 
[@IPG] ^ [(IPG] [^IPG] @ [^Oig] Q [IPDG] 
7-E Q [7IPG] Q [YIPG] Q 
[7IPG] Q [EIPG] Q 7 Q [Yig] [IPDG] 
%-E ( [%IPG] ( [rIPG] ( 
[%YD] [(ig] [EIG] [(IG] % [(ig] [rYD]-
[^Oyid]-I [Wqyi] O ^I--i 
[yi]^ E q [9I] ^ [^i]-
[7rQY]-7-[7rY]-[7Y] [ryi] 
^-[^ryi]-[^E] [yi] [^W]-
[@(QYI]-@ I [@EYI]-[@I] [YIa] 
@-[@a] [YIa] @ [YIP] @-
[7YIS]-7-[YI7a]-7-
[yi^P]-^-[yi^O]-^-
[@(YIa]-@-[@YIP]-@-
[QYO]-@-[(YI]-@-
[30rup]--O--
I--3 [70SL] 3 ^ [@PDGJ]-
@ [^(SL]-[@PJ] @ [^(]-
[7aIDG]-[r(QSL]-[7PJ] 7 [r(QSL] [g!*PSJ]-
* [qWTSL]-[*PJ] * [qWT]-
[$IPSG]-[*QPJ]-[OS4ig]-[q*PJ] [@YD]-
@ [^(PDGJ]-[@PDGJ] @ [^(] [!*] 
[7PDGJ]-[(Qrak]-[7PJ] 7 [(Qrak] [g!*OSH]-
[*S] [qgWTL] L [*Lc] [*L] [qgWTL] S 
[dg^HL] 4 ^ ^ [qdgEHL] ^ ^ [h@DJZ]-
@ [^(SL]-[@PJ] @ [^(]-
[7aIDG]-[r(QSL]-[7PJ] 7 [r(QSL] [g!*PSJ]-
[*PJ] [WTqak]-[*OH] * [qWTIG]-
[$IPSG]-[*QPJ]-[OS4ig]-[q*PJ] [@YD]-
@ [^(PDGJ] @ [@PDGJ]-[^(] [!*] 
[7PDGJ]-[(Qrak]-[7PJ] 7 [(Qrak] [g!*OSH]-
[*S] [qgWTL] L [*Lc] [*L] [0qgWTL] S 
[dg^HL] 4 ^ ^ [qdgEHL] ^ ^ [4DGJZ] 
7-[$7] 7 [7a$ID] 7 [7$D] [7adg] 
[4^] ^ [^4adg] ^ [4^P] [^dg] [4^O] ^ 
[@^(IDG]-[^(] [@G] [^(PDG] @ [^(] [@DGk] 
[^(] @ [^(k] [@DGk] [^(] [@DGJ] [^(] @ 
[7DGL]-[$7] 7 [$DG7k] 7 [$7] 7 
[4dg^J] ^ [4^] ^ [4dg^H] ^ [4^] ^ 
[@(DGk]-[^(] @ [^(DGJ] @ [^(] @ 
[^(PDH] @ [^(] @ [^(PDG] @ [^(] @ 
[DG7pj]--[OH]--
[!IOSG]--! [*SL] % ! [@PDGJ]-
[@O] [^(SH] [@O] [@i] [^(] [TI]-
7 [7Y] [r*QID] D [7GZ] [7D] [(Q] [yi^P]-
[^P] [qdEJ] P [^i] ^ [Eqy]-
^ [^y] [Eqid] d [^gz] [^d] [qE] [7rYI]-
[7I] [ra(QG] I [7S] 7 [(QYIP]-
7 [7P] [r(QDJ] J [7ZB] [7J] [r(QDJ] P 
[%YP]-[%YP]-[%YP]-[%YOS]-[(W]-
[!*TI] % q * [%Ti] ! !-
[@(TI]-[QE] (-( [QES]-
[(S]-S[QE]S( S (a[QE][YIP]-
[$7]-[QEO] (-( [QES]-
[(S]-S[QE]S( S (D[QE]-[OS]
%-[QEP] (-( [QEP]-
[(P]-[QEa] ( P ( [QES]-
[4yi^O]-[qW] 9 S 9 [qW]-
[9I]-[qW] ^ [Eqi] ^ [4^] ^ 
[@EYI]-( ^ [@IPG] ^ [QIPG] ^ 
[@IPG] ^ [(IPG] [^IPG] @ [^Oig] Q [IPDG] 
7-E Q [7IPG] Q [YIPG] Q 
[7IPG] Q [EIPG] Q 7 Q [Yig] [IPDG] 
%-E ( [%IPG] ( [rIPG] ( 
[%YD] [(ig] [EIG] [(IG] % [(ig] [rYD]-
[^Oyid]-I [Wqyi] O ^I--i 
[yi]^ E q [9I] ^ [^i]-
[7rQY]-7-[7rY]-[7Y] [ryi] 
^-[^ryi]-[^E] [yi] [^W]-
[@(QYI]-@ I [@EYI]-[@I] [YIa] 
@-[@a] [YIa] @ [YIP] @-
[7YIS]-7-[YI7a]-7-
[yi^P]-^-[yi^O]-^-
[@(YIa]-@-[@YIP]-@-
[QYO]-@-[(YI]-@-
[30rup]--O--
I--3 [70SL] 3 ^ [@PDGJ]-
@ [^(SL]-[@PJ] @ [^(]-
[7aIDG]-[r(QSL]-[7PJ] 7 [r(QSL] [g!*PSJ]-
* [qWTSL]-[*PJ] * [qWT]-
[$IPSG]-[*QPJ]-[OS4ig]-[q*PJ] [@YD]-
@ [^(PDGJ]-[@PDGJ] @ [^(] [!*] 
[7PDGJ]-[(Qrak]-[7PJ] 7 [(Qrak] [g!*OSH]-
[*S] [qgWTL] L [*Lc] [*L] [qgWTL] S 
[dg^HL] 4 ^ ^ [qdgEHL] ^ ^ [h@DJZ]-
@ [^(SL]-[@PJ] @ [^(]-
[7aIDG]-[r(QSL]-[7PJ] 7 [r(QSL] [g!*PSJ]-
[*PJ] [WTqak]-[*OH] * [qWTIG]-
[$IPSG]-[*QPJ]-[OS4ig]-[q*PJ] [@YD]-
@ [^(PDGJ] @ [@PDGJ]-[^(] [!*] 
[7PDGJ]-[(Qrak]-[7PJ] 7 [(Qrak] [g!*OSH]-
[*S] [qgWTL] L [*Lc] [*L] [0qgWTL] S 
[dg^HL] 4 ^ ^ [qdgEHL] ^ ^ [4DGJZ] 
7-[$7] 7 [7a$ID] 7 [7$D] [7adg] 
[4^] ^ [^4adg] ^ [4^P] [^dg] [4^] [^O] 
[@^(IDG]-[^(] [@G] [^(PDG] @ [^(] [@DGk] 
[^(] @ [^(k] [@DGk] [^(] [@DGJ] [^(] @ 
[7DGL]-[$7] 7 [$DG7k] 7 [$7] 7 
[4dg^J] ^ [4^] ^ [4dg^H] ^ [4^] ^ 
[@(DGk]-[^(] @ [^(DGJ] @ [^(] @ 
[^(PDH] @ [^(] @ [^(PDG] @ [^(] @ 
[DG7pj]--[OH]--
[!IOSG]--! [*SL] % ! [PDGJ] 
[@(] G [(L] [QEY] l g-[@^(] 
[@^(] [@^(] [@^(]-[@^(] [@^(]-[@(DGJ]-
k [(J] [QEY] g L-[@^(] 
[@^(] [@^(] [@^(]-[@^(] [@^(]-[@(IPD]-
f [(h] [QEY] f D-[@Q] 
@ @ @ q @ @-[@(Q] ]]

    UseShiftKeys()

end) 

Anime2:Button("Demon Slayer 2 OP",  function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 250 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ [!CV]-a-
[0uO]-Y-[TYO]-r-[QIS]--
[o@(PSD]----
[%DH]--[ETI]-[rYO]-[ETI]-
[rYO]-[rYO]-[ETI]-[YO] 
[%WIS]-[IP]-[0TI]-[rYO]-[QTIP]-
[EIa] [rIS] [TID]----
[a%OD]-% [3IPS]-[aG] 3 [$Sf]-
[aD] [$Q] [PS] [$Q] [Ia] [$Q]-
[a%D] [Oa] % [3OS]-[uO] 3 [$k]L
[GZ] [Gk] [$Q] [GL] [$Q] [SH] [$Q]-
[a%OD]-% [3IPS]-[aG] 3 [$Sf]-
[aD] [$Q] [PS] [$Q] [Ia] [$Q]-
[a%D] [Oa] % [3OS]-[uO] 3 [$TI]-
[TO]-[$Ia]-[@(IP]--
[%YO]-[%H] % [%D] [%S] [%S] [%a] 
[3a] 3 [3S] 3 [3O] 3 3 3 
! * [!H] * [!D] [*S] [!S] [*a] 
[$a] $ [$D] $ [5P] 5 [5D] 5 
% [%P] [%GJ] [%DH] [%GJ] %[GJ]% [%DH] 
[3GJ] 3 [H3k] 3 [3DH] 3 [3kZ] 3 
[!JL] * [k!Z] * [!JL] * [!DH] [*DH] 
[@Hk] @[GJ]@ [@DH] [@Dh]--
[0k]ruL Z-C-Z L 
L-Z-k--
[7k]QrL Z-C-Z L 
L L C-Z--Z 
[QV]TI-C-Z V-C-Z 
V-C-Z L-k-
[k%Z](W--[Lx] [k%Z](W--[Lx] 
[k%(WZ]--O O-P-
[!Oa] * [!PS] * [a@D] ( [@af] ( 
[3aG] 0 [3a] 0 [O4a] q [4PS] q 
[@PS] ( @ ( @ ( [@(Pf] [@(PD]-
[@(] [@(] [@(] [Hk] [GJ] [DH] [SG] 
[%DH] % [%HZ] % [%Hk] [%GJ] [%DH] [%SG] 
[3DH] [3DH] [3HZ] 3 [3DH] 3 3 [3SG] 
[$SG] $ $ [$PS] [$PS] $ [$SG] $ 
[7af] 7 7 [7aD] [7aD] 7 7 7 
[!DH] * [!DG] [a*D] [!DH] * [!DG] [a*D] 
[@DH] ( [@DG] [a(D] [@OS] ( @ [(Oa] 
[O3a] 0 [3PS] 0 [3aD] 0 [H3k] 0 
[$QGJ] [$Q]--[Hk] [GJ] [DH] [SG] 
[%DH] [%DH] [%HZ] % [%Hk] [%GJ] [%DH] [%SG] 
[3DH] [3DH] [3HZ] 3 [3DH] 3 3 [3SG] 
[$SG] $ $ [$PS] [$PS] $ [$SG] $ 
[7af] 7 7 [7aD] [7aD] 7 7 7 
[!DH] * [!DG] [a*D] [!DH] * [!DG] [a*D] 
[@DH] ( [@DG] [a(D] [@OS] ( @ ( 
[%DH] W [%DG] [aWD] [%DH] W [%DG] [aWD] 
[4qDH]-[4qfk]-[4qHL]-[4q]-
[O3a] 0 [3PS] 0 [3aD] 0 [H3k] 0 
[@(GJ] [@(]--[DG]-[DH]-
[a%OD]-% [3IPS]-[aG] 3 [$Sf]-
[aD] [$Q] [PS] [$Q] [Ia] [$Q]-
[a%D] [Oa] % [3OS]-[uO] 3 [$k]L
[GZ] [Gk] [$Q] [GL] [$Q] [SH] [$Q]-
[a%OD]-% [3IPS]-[aG] 3 [$Sf]-
[aD] [$Q] [PS] [$Q] [Ia] [$Q]-
[a%D] [Oa] % [3OS]-[uO] 3 [$TI]-
[TO]-[$Ia]-[@(IP]--
[%YO]-[%H]-D [%S] [%S] [3a] 
a-S-O 3-@ 
!-H-D [%S] [*S] [$a] 
a a D-P [5P] [$D] % 
% [%P] [%GJ] [%DH] [%GJ] %[GJ]% [%DH] 
[3GJ] 3 [H3k] 3 [3DH] 3 [3kZ] 3 
[!HL] * [k!Z] * [!HL] * [!DH] [*DH] 
[$Hk]-[$GJ]-[$DH] [@(Dh]--
[3a] [3S] [3D] 3 [3G] 3 [3D] [3S] 
[3S] [3S] [3D] 3 [3a] 3 3 3 
[a?] [7S] [D?] 7 [G?] 7 [D?] [7S] 
[S?] [7S] [G?] 7 [D?] 7 ? [7D] 
[$H] $G$ [$D] [$H] $G$ [$D] 
[$H] $G$ [$D] [$S] $ [$a] $ 
[a%D] % % [%Sf] [a%D] % % [%Sf] 
[a%D]--O O [4q] P-
[!Oa] * [!PS] * [a@D] ( [@af] ( 
[3aG] 0 [3a] 0 [O4a] q [4PS] q 
[@PS] ( @ ( @ ( [@(Pf] [@(PD]-
[@(] [@(] [@(PD] [PD]-[Dh]-
[3aH] 0 3 0 [3OS] 0 3 0 
[3aD] 0 3 0 [3DG] 0 3 0 
[@Ia] ( @ ( [@IS] ( @ ( 
[a@D] ( [@G] [(I] @ ( @ ( 
[!Of] [*ID] [u!S] [*Ya] ! [u*S] ! [*Ya] 
[5TP] [5TP] [5TP] [5TP] 5 5[uO]5 [5TP] 
[%Ya] % % [%OD] % % [%DJ] % 
$ [$TI] [$TI] [$TI]-[$TI] $ $ 
[3YO] 3 3 3 [3IP] 3 3 3 
[O3a] 3 3 3 [3aD] 3 3 3 
[%YO] % % % [%YP] % % % 
[%Os] % % % [%YO] % [%IP] % 
[!Oa] * [!PS] * [a@D] ( [@af] ( 
[3aG] 0 [3a] 0 [O4a] q [4PS] q 
[@(PS]--[@(]--[@(Pf]-
[@(PD]--[@(]--[@(]-
[h@(J]--[@(]--[@(] [@(PD]----
[Hk] 
[GJ] [DH] [SG] 
[%DH] % [%HZ] % [%Hk] [%GJ] [%DH] [%SG] 
[3DH] [3DH] [3HZ] 3 [3DH] 3 3 [3SG] 
[$SG] $ $ [$PS] [$PS] $ [$SG] $ 
[7af] 7 7 [7aD] [7aD] 7 7 7 
[!DH] * [!DG] [a*D] [!DH] * [!DG] [a*D] 
[@DH] ( [@DG] [a(D] [@OS] ( @ [(Oa] 
[O3a] 0 [3PS] 0 [3aD] 0 [H3k] 0 
[$QGJ] [$Q]--[Hk] [GJ] [DH] [SG] 
[%DH] [%DH] [%HZ] % [%Hk] [%GJ] [%DH] [%SG] 
[3DH] [3DH] [3HZ] 3 [3DH] 3 3 [3SG] 
[$SG] $ $ [$PS] [$PS] $ [$SG] $ 
[7af] 7 7 [7aD] [7aD] 7 7 7 
[!DH] * [!DG] [a*D] [!DH] * [!DG] [a*D] 
[@DH] ( [@DG] [a(D] [@OS] ( @ ( 
[%DH] W [%DG] [aWD] [%DH] W [%DG] [aWD] 
[4qDH]-[4qfk]-[4qHL]-[4q]-
[O3a] 0 [3PS] 0 [3aD] 0 [H3k] 0 
[@(GJ] [@(]--[DG]-[DH]-
[a%OD]-% [3IPS]-[aG] 3 [$Sf]-
[aD] [$Q] [PS] [$Q] [Ia] [$Q]-
[a%D] [Oa] % [3OS]-[uO] 3 [$k]L
[GZ] [Gk] [$Q] [GL] [$Q] [SH] [$Q]-
[a%OD]-% [3IPS]-[aG] 3 [$Sf]-
[aD] [$Q] [PS] [$Q] [Ia] [$Q]-
[a%D] [Oa] % [3OS]-[uO] 3 [$TI]-
[TO]-[$Ia]-[@IP]-[%YO] ]]

UseShiftKeys()
  
end) 

Anime2:Button("Gurenge - Demon Slayer", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 80 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ [8h]-[0G]-[wh]----
[9h]-[QG]-[eh]----
[0h]-[wG]-[rf]--d d 
7-9-Q-a-d 
[8f]-0-w-f-h 
[29j]----h-j 
[30k]-[29d]-[30f]-[29d]-[30f]-
[30af]-[29pd]-[30af]-[29pd]-[30af]-
[30af]-[29pd]-[30af]-[29pd]-[30af]-
[0f]-[wh]-[yG]-d f d 
9-Q-w p o p s 
[8a] uQ-w----
9 uQopea-p a d 
[0f]-[wh]-[yG]-d f d 
9-Q-w k j k l 
[8k] hQ-w--h 
[9G]-[QG]-[eh] j--h 
[0j]-[wh]-[yf]-h-k-j
9 bQb [wb] b-n-h 
[8j]-[Qh]-[wf]-h-z-
9 bQb [eb] b-C-h 
[0j]-[wh]-[yf]-h k j 
9-Qj [wk] j k z k 
[8j]-[Qh]-w--h 
[9G]-[QG]-[eh] j--
[80wh]-G-h----
[Q9eh]-G-h----
[0wrh]-G-f--d d 
[79Q]----a-d 
[18f]-[18]-[18] f [18] h 
[29j]-[29]-[29] h [29] j 
[30k] [30p] [30a] [30d] [30f] [30G] [30h] [30G]--
d-d-k-
[158j] k z [158k] j kk[158] h 
[269j] k z [269k] j kk[269] d 
[370d] hh-[370d] d h [370j] h 
[$7z]-l [$7] k-j[$7] h 
[158h]--[158h]-j [158k] j 
[7@(]--[@(7j]-k [@(7z] k 
[30]-[29pd]-[30af]-[29pd]-[30af]-
7-6d 7 d6-[7k]-
[1358j] k z [1358k] j kk[1358] h 
[$269j] k z [$269k] j kh[$269] h 
[@$(7h]-j-[@$(7k]-k [@$(7v] C 
[3570]-z [3570] k-j[3570] h 
[18h] [18] [18] [18h] [18] [18j] [18k] [18j] 
[29]--j j-k-
[30af]-[29pd]-[30af]-[29pd]-[30af] [30af] ]]

UseShiftKeys()

end)

Anime2:Button("Bink's Sake", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 50 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [oh][PJ][PJ][PJ]---[sl]--[PJ]
[oh]-[PJ]-----
[oh][PJ][PJ][PJ]---[sl]--[PJ]
[oh]-[YD]-----
[oh][PJ][PJ][PJ]---[sl]--[PJ]
[oh]-[PJ]-----
[oh][PJ][PJ][PJ]---[sl]--[PJ]
[oh]-[YD]-----
J-hg-Ds-dD-
J-hg-Ds-DP-
s-DP-Ps-dD-H
h-hg-Dg--
J-hg-Ds-dD-
J-hg-Ds-DP-
s-DP-Ps-dD-H
h-Dg-dD---
[PJ]-[oh][ig]-[YD][ts]-[yd][YD]-
[PJ]-[oh][ig]-[YD][ts]-[YD][EP]-
[ts]-[YD][EP]-[EP][ts]-[yd][YD]-[OH]
[oh]-[oh][ig]-[YD][ig]---
[PJ]-[oh][ig]-[YD][ts]-[yd][YD]-
[PJ]-[oh][ig]-[YD][ts]-[YD][EP]-
[ts]-[YD][EP]-[EP][ts]-[yd][YD]-[OH]
[oh]-[YD][ig]-[yd][YD]---
J-hg-Ds-dD-
J-hg-Ds-DP-
s-DP-Ps-dD-H
h-hg-Dg--
J-hg-Ds-dD-
J-hg-Ds-DP-
s-DP-Ps-dD-H
h-Dg-dD---
[PJ]-[oh][ig]-[YD][ts]-[yd][YD]-
[PJ]-[oh][ig]-[YD][ts]-[YD][EP]-
[ts]-[YD][EP]-[EP][ts]-[yd][YD]-[OH]
[oh]-[oh][ig]-[YD][ig]---
[PJ]-[oh][ig]-[YD][ts]-[yd][YD]-
[PJ]-[oh][ig]-[YD][ts]-[YD][EP]-
[ts]-[YD][EP]-[EP][ts]-[yd][YD]-[OH]
[oh]-[YD][ig]-[yd][YD]---
[oh][PJ][PJ][PJ]--[sl]-[PJ]
[oh]-[PJ]-----
[oh][PJ][PJ][PJ]---[sl]--[PJ]
[oh]-[YD]-----
[oh][PJ][PJ][PJ]---[sl]--[PJ]
[oh]-[PJ]-----
[oh][PJ][PJ][PJ]---[sl]--[PJ]
[oh]-[YD]-----
P-oi-Yt-yY-
P-oi-Yt-YE-
t-YE-Et-yY-O
o-oi-Yi--
P-oi-Yt-yY-
P-oi-Yt-YE-
t-YE-Et-yY-O
o-Yi-yY---
[PJ]-[oh][ig]-[YD][ts]-[yd][YD]-
[PJ]-[oh][ig]-[YD][ts]-[YD][EP]-
[ts]-[YD][EP]-[EP][ts]-[yd][YD]-[OH]
[oh]-[oh][ig]-[YD][ig]---
[PJ]-[oh][ig]-[YD][ts]-[yd][YD]-
[PJ]-[oh][ig]-[YD][ts]-[YD][EP]-
[ts]-[YD][EP]-[EP][ts]-[yd][YD]-[OH]
[oh]-[YD][ig]-[yd][YD]---
[oh][PJ][PJ][PJ]---[sl]--[PJ]
[oh]-[PJ]-----
[oh][PJ][PJ][PJ]---[sl]--[PJ]
[oh]-[YD]-----
[oh][PJ][PJ][PJ]---[sl]--[PJ]
[oh]-[PJ]-----
[oh][PJ][PJ][PJ]--[sl]-[PJ]
[oh]-[YD] ]]

    UseShiftKeys()

    end)

Anime2:Button("Sparkle - Kimi no nawa (Test)", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 160 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [0s] d h s d h [us] d h s d h
[qs] d h s d h [is] d h s d h
[ws] d h s d h [os] d h s d h
[os] d h s d h [os] d h s d h
[0s] d h s d h [us] d h s d h
[qs] d h s d h [is] d h s d h
[ws] d h s d h [os] d h s d h
[os] d h s d h [os] d h s d h
[30s] d h s d h [us] d h s d h
[4qs] d h s d h [is] d h s d h
[5ws] d h s d h [os] d h s d h
[6es] d h s d h [ps] d h [5ws] d h
[30s] d h s d h [us] d h s d h
[4qs] d h s d h [is] d h s d h
[5ws] d h s d h [os] d h s d h
s d h [8s] d h [ws] d h [ts] d h
[3s] 8 d w h [us] [ud] [uh] [us] d [yh] [ys] d [th]
[qts] d h s d h [4s] d h s d h
[5s] 9 d w h [us] [ud] [uh] [us] d [yh] [ys] d [th]
[etus] d h [us] d [oh] [ys] d h [ts] d h
[3s] 8 d w h [us] [ud] [uh] [us] d [yh] [ys] d [th]
[qts] d h s d h [4s] d h s d h
[5s] 9 d w h [ys] [yd] [yh] [ys] d [uh] [ys] d [th]
[8wts] d h s d h [1s] d h [wts] d h
[3s] 8 d w h [us] d h [us] d [ih] [us] d [yh]
[qts] d h s d h [4s] d h s d h
[5s] 9 d w h [us] [ud] [uh] [us] d [yh] [ys] d [th]
[etus] d h [us] d [oh] [ys] d h [ts] d h
[3s] 8 d w h [us] [ud] [uh] [us] d [yh] [ys] d [th]
[qts] d h [ts] d h [ts] d h [4s] d h
[5s] 9 d w h [ys] d h [ys] d [uh] [ys] d [th]
[8wts] d h s d h [1s] d h [wts] d h
[3t] [8y] [0o] [0s] [td] [uh] z l u h
[48qg] [4t] [8y] [qo] [qs] [td] [ih] s d h
[5ws] d h s d h [ws] t d y o h s d j
[5wh] d s o y t w 5
[3t] [8y] [0o] [0s] [td] [uh] z l u h
[4qg] [4t] [8y] [qo] [qs] [td] [ih] s d h
[5ws] d h s d h [ws] t d y o h s d h
[wyosdh] [ws] d y h o l z v m
[3t] [8y] [wo] [tf] [yf] [of] [tf] y [od] [td] y s
[4s] 8 q t y o t y o [qt] y o
[5t] [9y] [wo] [tf] [yf] [of] [tf] y [od] [td] y [os]
[6sf] 0 e [tf] y [oh] [td] y o [ts] y
[3t] [8y] [wo] [tf] [yf] [of] [tf] y [od] [td] y [os]
[4s] 8 q t y o t y o [qt] y o
[5t] [9y] [wo] [td] [yd] [od] [td] y [of] [td] y [os]
[8s] w t t y o t y o [18t] y o
[3t] [8y] [0o] [tf] [yf] [of] [tf] y [og] [tf] y [od]
[4s] 8 q t y o t y o [4t] y o
[5t] y o [tf] [yf] [of] [tf] y [od] [td] y [os]
[6sf] 0 e [tf] y [oh] [td] y o [ts] y o
[3t] [8y] [0o] [tf] [yf] [of] [tf] y [od] [td] y [os]
[4s] 8 q t y o t y o [4t] y o
[5t] y o t [yd] [od] [td] y [of] [td] y [os]
[8s] w t t y o t y o [18t] y o
[3t] [8y] [0o] [0s] [td] [uh] [z] [ulm] t [hv]
[48qgc] [4t] [8y] [qo] [qs] [td] [ih] s d h
[5ws] d h s d h [ws] t d y o h s d j
[5wh] d s o y t w 5
[3t] [8y] [0o] [0s] [td] [uh] [z] [lm] u [hv]
[48qgc] [4t] [8y] [qo] [qs] [td] [ih] s d h
[5ws] d h s d h [ws] t d y o h s d h
[5ws] d h [ws] d y h o l z v m
[0tus] f f f [of] d d s
[qtos] [tip]
[wryoa] f f f [yaf] d d s
[eupf] f h d [ps]
[0tos] f f f [of] d d s
[qtos] [ip] t
[wryoa] d [yad] f d s
[8ts] w y [tu]
[0tu] f [of] g f [4d] 8
[es] [qtio] [ep]
[59wry] f f f [wf] y o a d d s
[60tsf] f h [euod] s
[38wtu] f f f [wf] t o d d s
[4s] 8 e [es] [4q] s
[59w] d d d [rd] f [ryod] s
[5ws] [5t] y 9 o w s s d h l z v m
[9wry] [38wsh] [sh] [sh] [0tosh] [sh]
[4qsh] g [qetif] d [5ws] s [wtos] d
[5wf] d [wyod] [5adh] 9 [wadh] [radh] y [ah]
[6adh] 0 [tg] [ef] u t [4f] q q e [td] [is]
[3d] 0 0 r u r [6sfhl] e [edz] [ufx] p [ugjlc]
4 q [qfx] [esl] u [tsl] 8 t [tfx] [usl] o [udhz]
5 w y o y [6sfhl] e [edz] [ufx] p [ugjlc]
4 q [fx] [tgjlc] i [thv] 8 t [tgc] [ufx] o [udz]
[5dz] w [wfx] [ydz] o [sl] [^Esg] [Jc] m []
[dgPJ] l [zcm] [iEP] s [dgl] [^E] [iEP] s [dgl]
[^E] t [yis] [6] 8 [9qt] [5] [59w] y o
[wyoa] d h k z v [o]
[wyoadh] [5w] f g [18fh]
[8wtuo] [38w] j [48qh] g f
[etid] [4q] s d [59wf] [wyo]
[%ad] 0 r [Wru] [6euos] [0t]
[5wuo] [0t] [4qios] [qio] e t
[io] [qo] s [38wuod] [0o] t u
o [uos] d [I29pf] [9ey]
[$Ipd] 9 e [eyQI] [5wosdh] [ws] y o
a [5pj] 9 r [18osfh] 8 0 w
[tuo] [wtpj] [4osfh] 8 e [qt] g f
[eid] t s d [59wf] [wyo]
[%Hafk] 0 r [ruWO] [60esfhl] [eu]
[5wdz] [sl] [wo] [oh] [2sjl] 6 q [9ips] e y
[ips] [eyoh] [sl] [38wz] [0os] t u
[os] [tusl] [dz] [4qfx] [qios] e t
[dz] [tio] [qtshl] [4qio]
[qtio] [eips] [5wsl] [ws] [yd] h
[yos] d h s d h [5adk] 9 w [wa] d h
[yoa] d h [ya] d h [8sfl] w u s d h
s d h s d h s d h s d h
s d h s d h [qs] e d t u h s d h
s d h s d h s d h s d h
[0s] d h [os] d h [9s] e d t i h s d h
s d h s d h s d h s d h
[us] d h [ts] d h [wts] d h s d h
s d h s d h [ws] [yoad]
[tuos] d f g
f d s
[ro] a [euos] d f g
f d s f
[wuo] a [qtis] d f g
f d s
[ti] q o [wyos] d f g
f d s o
y w [0s] t o d f g
f d s
[oa] r [euos] d f g
f d s f
[woa] u [qs] t p d f g
f d s [is] p
[ts] d s s [wh] y o s s
p s d o t w
t o j [wyoh] s s s
g f s d o [5t] y o
[wt] y o [9t] y o [5wt] y [9t] y o
[wt] y o [9t] y o [5t] y o [9t] y o
[wt] y [9t] y o [5t] y [5t] y o
[18t] y o [29t] y o [5t] y t y o
t y o t y o [5t] y o [5t] y o
[18t] y o [29t] y o [5tyo] [59yo] w r y
[5p] 7 r 9 [we] 9 r 7 [5a] 7 y 9 r w y 9 o 7 [5s] [7o] [9y] [wt] [9y] [7o] [5d] [7a] [9o] [wy] [9o] [7a]
[5f] [7a] [9o] [wu] [9o] [7a] [5g] [7a] [wo] [9i] 7 5 [5odh] [579w] r y o a d
[9wh] a o a [wyh] k z v n [ryo] [wyoadh]
[5wryo] [5sl] [ak] [1sfhl] [80wtuo] [hv]
[0wuhlv] [3sfhl] [ak] [4sgjl] [468qeti] [jb]
[qetphv] [qti] [sfhl] [sfhl] [5dhkz] [wyo] [dkz] [fx]
[%Hgkzc] [ruWO] [fx] [dz] [6sfl] [eu] [sl]
[5sfl] [wuo] [4sgjl] [tipsg] [qdz] e t
[psl] [etioh] [3sfhl] [sfhl] [0tu] [dfhz]
[tosfhl] [0tu] [G2djz] [9eyI] [Gdjz] [fx]
[$gc] [eyQI] [fx] [dz] [5sl] [wtyo] [ak] [sl]
[5dhkz] [wyoad] [1fhl] [8s] [0f] [wh] [8l] [wv]
[uv] [th] [wl] [8sl] t [wak] [4gjl] [8s] [qg] [ej] [tl] [qb]
[tv] [ih] [tl] [qhv] [8sl] [4sl] [5hkz] [9d] [wh] [rk] [ydz] [rfx]
[%Hkc] [0g] [rH] [Wk] [ufx] [rdz] [6fl] [0s] [tf] [eh] [ul] [ts]
[5fhl] [ws] [wf] [uh] [ol] [us] [4gjl] [qs] [eg] [tj] [qsl] [tdz]
[esl] i t [eoh] q 8 [3fhl] [8s] [wf] [0h] w [tsl] [0dz] w
[tsl] u t [0hv] 0 8 [2gjl] [6s] [9g] [9j] [esl] [qpj]
[esl] 9 y [ehv] q 9 [2gjl] [9s] [9g] [ej] [qsl] [epj]
[9sl] y [eg] [qj] [9l] [6s] [5fhx] [59wuos] [59wuos] [59wuos]
[59wuos] [wgc] y o [fx] [5dhkz] [579wry]
[wryodhkz] [sl] [5] [ak] [1sfhl] t y o
t y o t y o t y o t y o
t y o [4t] [8y] [eoh] t y o
t y o t y o t y o t y o
[380t] y o [pj] [26qosh] t y o
t y o t y o t y o t y o
t y o t y o [5uf] t y o
[9wt] y o t y o [5yod] t y o
[9wt] y o t [1y] [5o] [0tus] t y o
t y o t y o t y o t y o
t y o [5t] y o [18t] y o t y o
t y o t y o t y o t y o
t y o [wt] y o [8us]
m [xv] ]]

    UseShiftKeys()

    end)

Anime2:Button("Renai Circulation - Kana Hanazawa", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 60 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ f--H
-S-S-a f-f-fa
S-S-a f-H-fa
S-S-a f-f fG
f-f fS H--
f-f fG H-f-aS
f-f fG H-f-S
f Sf-S f Sf-f
jH f-S H--
f-f fG H-f-aS
f-f fG H-f-S
f Sf-S f Sf-f
jH f-G f-f G
Hffff fff f f HH-
ffH fff fH f a
f af-afffH HHj
Hf-f HjH jH-H
fffff H faa-ff
Hf fHf f fHHf-
HfffafffaffH f-
a ffH ffffGf--
H j H j k-H j
H j k-k j H j
Hf f fS Hf f fS
f-f-S H--
H j H j k-H j
H j k-k j H j
Hf f fS Hf f fG
ff f fH f--
k-H-G-H-
G f G H--H
L-H-G-f-
f G H G----
k-H-G-H-
G f G H--H
L-H-f-H-
f----fa
S-S-a f-f-fa
S-S-a f-H-fa
S-S-a f-f-G
f-f-S H--fa
S-S-a f-f-fa
S-S-a H-f-fa
S-S-a f-f-G
f-f-H f ]]
 UseShiftKeys()

    end)

Anime2:Button("Spy x Family ED - Kigeki (Comedy)", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 50 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [WT6ru]-[r%QYI]-[I7eyp]-OIOI
[6O] [6u] [eTO]IOI[%O] [%u] [tWT] [%Y]
[!*u] [*u] [rWI] O [7p] a [%(QO]-
[6u] S [7a] O [!*u] D [$Qf] I
[6u]-[0eT]-[I7a] S O[%YI]-
[6uS] 6 [Teua]-[%YO] % [Wtu]I%O
[!*u][WT]* [Wr] [@7] a S [37f] D
6 [6S] [Tea]S[@(7a]-[rQY] p [0$*O]--
I [Y30a]-I [W70u]IOI
[6eTO] [6u] [eTO]I[6O]I[t%WO] [%u] [Wt] [%T]Y
[!*Wru] [*u] [rWI] [*O]p[W7r] aO[%W9r]-
[W6u] [pS] [O7a] [uO] [!*Wu] [aD] [$QSf] [eI]
[6ru]-[60W]-[I7a] S O[r%I]-
[6uS] 6 [Teua] 6 [%YO] % [Wtu]I%O
[!*u][WT]* [Wr] [@7] a S [37f] D
6 [6S] [Tea]S[@(7a]-[rQY] p [0$*O]--
S [30a]-a [^EI] u
[OSeuf]-[aWYG]-[OGeryj]Sa[yfWEOH]Iu
[60rWO]-[eT]-[r%(QO][uS][ID][WOrf][ID][rO]
[ru*WS]-[0ry] [Sf][Sf][QS7ef] [DG] [0f^WH] [Sf]
[$*T0p]-[%(QYa]-[O269a] [Sf] [7a@(D] [Sf]--
[uf][uf][uf][ISG]
6[uf] [0eWTS][uf] [%uf] [TOS]-[(QWtuf][uf][%uf][aIG]
[!*][uf] [0rWTS][uf] [30uf] [TOS]-[9rQWOH] [OH][afk]
6[pj] [0eWTOH][IG] [%uf] [sIG]-[(QWtuf][IG]%[OH]
[@(Dpj]-[%OH]-[OH][7pj] [ak][OH][^O][IG][uf][ISG]
6[uf] [0eWTS][uf] [%uf] [TS]-[(QWtuf][uf][%uf][IG]
[!*I][uf] [0rWTS][uf] [30uf] [TOS]-[9rQWOH][OH][OH][afk]
6[pj] [0eWTOH][IG] [%uf] [sIG]-[(QWtuf][IG]%[OH]
[@(Dpj]-[%OH]-[7pj] [ak][OSH]^ [SL][Gak]
6-[WTO0ea][pS][29][aD][Sf] O[ruO][0et] [$S][Ia]-
[0eTS]--[7eus]-[WI9ra]-[QT9up]-
[0rYO] ]]

UseShiftKeys()

    end)

Anime2:Button("Suzume no Tojimari - Trailer OST", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 35 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ y-p-piuy t et
y uioiu t--
y-p-piuy t et
y uioiu y--
[9y]-Op E[ep]iuy t [9e][8t]
[9y] uioi[8u] [9t]--6
[2y]-Op E[ep]iuy t [9e][8t]
[9y] uioi[6u] [9y]----
[2d]zljcxljzjhljcxl
jzjlcxlzjlhjxjlh
[2d]zljcxljzjhljcxl
jzjlcxlzjlhjxjlh
[2y]dspgfspdpospgfs
pdpsgfsdpsopfpso
[2y]dspgfspdpospgfs
[2p]dpsgfsdpsopfpso
[2y]dspgfsp[2d]pispgfs
[2p]dpsgfsd[2p]Pio[2d]osi
[^ipd]yte[ij]ut[ej][yg][ef][wd]t[es]i[up][ts]
[^Pid]y[tf][eg][ih][ug][tf]e[yis]ewtEiut
[5ipd]yte[ij]ut[ej][yg][ef][wd]t[es]i[up][ts]
[^P1id]y[tf][eg][18h][ug][tf]e[29pd]ewteiut
[^ipd]yte[ij]ut[ej][yg][ef][wd]t[es]i[up][ts]
[^Pid]y[tf][eg][ih][ug][tf]e[yis]ewtEiut
[5ipd]yte[ij]ut[ej][yg][ef][wd]t[es]i[up][ts]
[^P1id]y[tf][eg][18h][ug][tf]e[29pd]ewteiut
[^y][id][Es][qp][ig][Ef][qs][iP][Ed][qp][^i][4s][18p][og][tf][ws]
[29p][pd][yp][es][pg][yf][es][9d][4qp]s[io][tp][6f][tp][qd][8o]
[^y][id][Es][qp][ig][Ef][qs][ip][Ed][qp][^o][4s][18p][og][tf][ws]
[29p][pd][yp][es][pg][yf][es][9d][6ep]s[io][tp][18f][tp][qd][8o]
[^y][id][Es][qp][ig][Ef][qs][ip][Ed][qp][^o][4s][28p][og][tf][ws]
[29p][pd][yp][es][pg][yf][es][9d][6ep]s[io][tp][18f][tp][qd][8o]
[^y][id][Es][qp][ig][Ef][qs][ip][Ed][qp][^o][4s][18p][og][tf][ws]
[29p][pd][yp][es][pg][yf][es][9d][4qp]s[io][tp][6f][tp][qd][8o]
[5y][yd][ws][9p][yg][wf][9s][yp][wd][9p][5o][2s][^p][yg][wf][9s]
[6p][ud][ep][0s][eg][0f][6s][3d][6p][6P][6i][6o][6d][6o][6s][6i]----
z-
b-bcxz l jl
z xcvcx z ]]

    UseShiftKeys()

    end)

Anime2:Button("Doraemon no uta - Doraemon OP", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 60 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [9d]SapaSdSa[9p]aS
dSapaS[9d]Sap-
[0f]dSaSdfdS[0a]Sd
fdSaSd[eS]dDf-
[wk]Lz[0h]jk[Qj]kL[9G]hj
[0h]jk[*f]Gh[9G]hj[7d]fG
[6f]DdSsaPpOoIi
u-6-6 6 7 *
[9e] y [*y] I [7a] I [6p]-
[9p] a [6p] I [0o] I [6u]-
[0r] u [0u] o [6S] S [0a] p
[wo]-[7o] I [wr] T Q y
[0u]-6-6 6 7 *
[9e] y [*y] I [7a] I [6p]-
[9p] a [6p] I [0o] I [6u]-
[0r] u [6u] o [0S]-[6a] p
[0o] o [6I] u [0T]-[6u]-
[9y]-9-0-Q-
[wa]-[wa] p [9o]pa[9p]-
[0u] I [0O] u [6p]-6-
[0a]-[6p]-[0u] I [0O] u
[6p]-6-e-6-
[wa]-[wp]-[wo]-w-
[eu]-[eS] a [ep] a [ep] o
6-p a I--u
[9y]-6-9-6-
[9d] d [6S] S [9a] a [6p] p
[9a] a [6S] S [9d]-[6d]Sd
[0f] a [7a]-[0f] a [7a]-
[0a] S [7d] a [0f]-6-
[9d] d [6S] S [9a] a [6p] a
[9G] G [QG]fG[wh]-7 d
[0a] P [0a] d [6S] d [6f]-
[9d]-6-9 6 7 *
[9e] y [*y] I [7a] I [6p]-
[9p] a [6p] I [0o] I [6u]-
[0r] u [0u] o [6S] S [0a] p
[wo]-[7o] I [wr] T Q y
[0u]-6-6 6 7 *
[9e] y [*y] I [7a] I [6p]-
[9p] a [6p] I [0o] I [6u]-
[0r] u [6u] o [0S]-[6a] p
[0o] o [6I] u [0T]-[6u]-
[9y]-9-0-Q-
[wa]-[wa] p [9o]pa[9p]-
[0u] I [0O] u [6p]-6-
[0a]-[6p]-[0u] I [0O] u
[6p]-6-e-6-
[wa]-[wp]-[wo]-w-
[eu]-[eS] a [ep] a [ep] o
6-p a I--u
[Qy]-6-9er[6T]yu
[9I]iI[6y] e [9I]uI[6y] e
[0o]Io[6u]-[T6u] [T6u] [T6u]-
[0o]Io[6u] e [0o]Io[6u] e
[9I]oO[6p]-[I9p] [I9p] [I9p]-
[5a]Pa[9P]aP[5a] S [5d] a
[9p]Op[6O]pO[9p] S [9d] p
[6S]sS[0s]Ss[6S] f [6f]dS
[9d]-6-9 6 7 *
[9e] y [*y] I [7a] I [6p]-
[9p] a [6p] I [0o] I [6u]-
[0r] u [0u] o [6S] S [0a] p
[wo]-[7o] I [wr] T Q y
[0u]-6-6 6 7 *
[9e] y [*y] I [7a] I [6p]-
[9p] a [6p] I [0o] I [6u]-
[0r] u [6u] o [0S]-[6a] p
[0o] o [6I] u [0T]-[6u]-
[9y]-9-0-Q-
[wa]-[wa] p [9o]pa[9p]-
[0u] I [0O] u [6p]-6-
[0a]-[6p]-[0u] I [0O] u
[6p]-6-e-6-
[wa]-[wp]-[wo]-w-
[eu]-[eS] a [ep] a [ep] o
6-p a I--u
[9y]-6-9 9 0 Q
[wa]-[wp]-[wo]-w-
[eu]-[eS] a [ep] a [ep] o
6-p a I--u
[9y]-6-9 d [Qf] G
[wh]Gh[9G] h [wG] f 9 g
[eG]gG[9g] G [ef] d 9-
[wa]-[wa]-[eS] d [ef]-
[wa]-[wa]-[eS] d [ef] [9d]----
[9y] ]]

    UseShiftKeys()

    end)

Anime2:Button("Gravity Falls", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 60 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ g d p d g d p d
g s p s g s p s
f S p S f S p S
f S p S f S j-
[9d]----f-
g----
[qj]--h--j-
s----
[^d]----f-
g--f--
[8h]--j--
[6h]--g--
9-g-g-g-
j-j-h-g-
q-j-j-j-
h-j-h-g-
^-g-g-g-
j-j-h-g-
8-j-j-j-
6-L-L-L-
9-g-g-g-
[qj]-j-h-g-
^-J-J-J-
[8h]--l--
[6j]--L--
[9gz] d p d f S p S
d--[yd] ]]

    UseShiftKeys()

    end)

Anime2:Button("Red Swan - Yoshiki feat. HYDE (AOT S3 OST)", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 65 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ g--f--
h--g----
g--f--
h--g----
[4ig] 8 q e [uf] q 8-
[4oh] 8 q [eig]-q 8-
[6ig] 0 e t [uf] e 0-
[6oh] 0 e [tig]-e 0-
[^ig] q E y [uf] E q-
[^oh] q E [yig]-E q-
[^ig] q E T [uf] E q-
[^h] q E T s-P-
[4P] 8 q [ep] p q 8-
4 8 [qp] [ep] p qo8i-
[6p] 0 e t-e 0-
6 0 e t-e [0p] p
[^P] q E [yp] o E q-
^ q E y-E [qp] p
[^P] q E [Tp] o E q-
^ q E T s E [qP]-
[4P] 8 q [ep] p q 8-
4 8 [qp] [ep] P [qs] 8-
[6p] 0 e t-e 0-
6 0 e t-e [0p] p
[^P] q E [yp] o E q-
^ q E y-E [qp] p
[^P] q E T-E q-
[8ig] q E T [oh] E q-
[48qig]--[uf]--
[oh]--[ig]----
[60eig]--[uf]--
[oh]--[ig]----
[^Eqig]--[uf]--
[oh]--[ig]----
[^Eqig]--[uf]--
h-g g g-h-
[4sh] 8 q [esg]-q 8-
4 8 [qg] [eg] g qf8d-
[6sf] 0 e t-e 0-
6 0 e t [sg] e [0sh]-
[^dh] q E [ydg]-E q-
^ q E [yd] d Efqg-
[^g] q E T-E q-
[^Sh] q E T [Sh] E q-
[4sh] 8 q [esj] [sj] q 8-
4 8 [qj] [ej] j qh8g-
[6fj] 0 e t-e 0-
6 0 e t-e [0j] j
[^J] q E [yj] h E q-
^ q E y-E [qj] j
[^J] q E [Tj] h E q-
^ q E T g E [qh]-
[48qh]--g ]]

    UseShiftKeys()

    end)

Anime2:Button("One Summer's Day - Spirited Away", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 40 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [ig][sh]jx----
[ud][ah]l----
[ys][pg]J--[Tf][Ij][az]----
[qru]----
f f f f d f j
f dd----
[eyo] d d d d s d h
d s a s--pa
[wtis] s s s s--pa
[qrus] s s s a s-pa
[0eys] s s s s h-s
[9wtd]--[0ey]--
[4eru] f f f f d f j
[5f] [qd]dw y----
[10ey] d d d d s d h
[1d] [6s] [9a] [ws]--pa
[9eis] s s s [yis]--pa
[0yuos] s s s [ta] s-pa
[YOqts] s s s [is] h-gD
[wtyid]--[Oruf]-[Orig]-
[4psdh] [8psdh] q [epsdh] [O3ah] [7dg] [0sf] [Wad]
[6ad] [0sf][ps]e t [E5yi] e [E8wtu] [uf][ig]
[4psdh] [8psdh] [qpsdh] [epsdh] [O3ah] [7dg] [0sf] [Wad]
[6ad] [0sf] e t u t [ups] [td]
[2I]sf6 9 [Qp] [es] Q t e
[59etu]-[eti]-[59qey]-s d
[9etI]af--p s--
[5tyip] 9 q e y j k f
[el] [ul] [sz] [ul] [wk] u [af] [uh]
[qj] [tj] [ph] [tg] [0h] t o o
[(wto] i i Y [9qti]-t i
[(Yro]--[riO] [59eyo]-[pj] [ak]
[6s]fjl[0sfjl] [tdz] [0sl] [5a]fhk0 [ruf] [0oh]
[4p]sfj[8psfj] [eoh] [8ig] [3o]sdh8 w [oh]
[(oh] [wig] [tig] [wYD] [9ig] q [toh] [qOH]
[*PJ] [qOH] [EOH] [qoh] [8OH] 0 [Eoh][OH]0[PJ]
[4s]gHl8 W 8 @ 8 [wOH] [8PJ]
[2s]gHl9 q W t [Wsl] [qak] [Wsl]
[5dz] 9 w r y h l k
[qerul]--f f d f j
[if]paj j j j h j z
k-j [dhl]
uopduopduopd[uk]opd
[Ih]paf[Ij]pafIpafIpaf
[yhv]iosyios[ygc]ios[ysl]ios
[udz]opduopd[ufx]opduopd
[4qeru]----
[30wtyo]----
[ti@(P]----[ti@(P]-
[6eyups]----
[qf]eud f j f--
[0d]wys d h d--pa
[9s] e y u I a s d
[I7pf] Q e r [0yO]-j k
[ejl]f[ujl]f[skz]f[ujl]f[whk]f[uhk]f[af]s[uh]s
[qgj]s[tgj]s[pfh]s[tdg]s[0h]s[td] [os] o
[(wto] i i Y [9qti]-t i
[(Yro]--[riO] [59eyo]-[pj] [ak]
[6s]fjl[0sfjl] [tdz] [0sl] [5a]fhk0 [ruf] [0oh]
[4p]sfj[8psfj] [eoh] [8ig] [3o]sdh8 w [oh]
[(oh] [wig] [tig] [wYD] [9ig] q [toh] [qOH]
[*PJ] [qOH] [EOH] [qoh] [8OH] 0 [Eoh][OH]0[PJ]
[4s]gHl8 W 8 @ 8 [wOH] [8PJ]
[2s]gHl9 q W t [Wsl] [qak] [Wsl]
[5dz] 9 w r y h l k
[qerul]-q e r u p a
j k gjkx ]]

    UseShiftKeys()

    end)
    
local Emotional = win:Tab('Emotional')
local Emotional2 = Emotional:Section('Emotional | Sad')

Emotional2:Button("Kiss the rain - Yiruma", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 30 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ osd
[8d] [wf] [tf] y u--sdf
[3d] [7h] [0h] w r--hjk
[6k] [0l] [el] r t z xz l
[5k] 9 w e r l k h
[4h] [8j] [qj] w e--hg
[8g] [wh] [th] y u-s d
[9f] [eg] [yg] u i-h g
[3f] 7 0 w r-[wryd]osd
[8d] [wf] [tf] y u--sdf
[3d] [7h] [0h] w r--hjk
[6k] [0l] [el] r t z xz l
[5k] 9 w e r l k h
[4h] [8j] [qj] w e--hg
[8g] [wh] [th] y u-s d
[9f] [eg] y p [5s] 9 [wa]-
[8s] w t y u s f h
[4j] 8 q w e s s a
[8s] [wj] [th] y u s s a
[9s] [eh] [yh] [ug] [ig] f f d
[8d] [wf] [tf] y u s f h
[4j] 8 q w e s s j
[3k] [7h] 0 w r s s a
[8s] [wh] [th] [yg] [wtuf]--d
[5d] 7 w e r--osd
[8d] [wf] [tf] y u--sdf
[3d] [7h] [0h] w r--hjk
[6k] [0l] [el] r t z xz l
[5k] 9 w e r l k h
[4h] [8j] [qj] w e--hg
[8g] [wh] [th] y u-s d
[2f] [6g] [9g] 0 q-h g
[8f] w t y u-[wryd]osd
[8d] [wf] [tf] y u--sdf
[4d] [8h] [qh] w e--hjk
[6k] [0l] [el] r t z xz l
[5k] 9 w e r l k h
[4h] [8j] [qj] w e--hg
[3g] [7h] [0h] w r-s d
[2f] [6g] 9 p [5s] 9 [wa]-
[8s] w t y u o s d
f ]]

    UseShiftKeys()

    end)

Emotional2:Button("River flows in you - Yiruma", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for You


shared.tempo = 43 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ [6s]-[0a]-[es]-a-
[4s]-[8o]-[qs]-i-----
t u 
[6s]-[0a]-[es]-a-
[4s]-[8o]-[qs]-i-----
t u 
[6s]-[0a] s e-a s 
4-[8o] s q-i-
[8u]-[wi]-[to]-u-
[5y]-9-w-t r 
[6t]-0-e-t y 
[4u]-8-q-u i 
[8o]-w-t-i u 
[5y]-9-w-t u 
[6s]-[0a] s e-a s 
4-[8o] s q-i-
[8u]-[wi]-[to]-f-
[5d]-9-[wf] d s a 
[6s]-0-e-t y 
[4u]-8-q-u i 
[8o]-w-t-i u 
[5y]-9-[ws] d s a 
[6s]-[0o]-[es] d s a 
[4s]-[8o]-[qs] d s a 
[8s] d [wf] g [th] f d s 
[5a]-[9o]-[ws] d s a 
[6s]-[0o]-[es] d s a 
[4s]-[8o]-[qs] d s a 
[8s] d [wf] g [th] f d s 
[5a]-[9o]-[ws] d [9s] a 
[6s]-[0o]-[es] d [0s] a 
[4s]-[8o]-[qs] d [8s] a 
[8s] d [wf] g [th] f [wd] s 
[5a]-[9o]-[ws] d [9s] a 
[6s]-[0o]-[es] d [0s] a 
[4s]-[8o]-[qs] d [8s] a 
[8s] d [wf] g [th] f [wd] s 
[5a]-[9o]-[wy]-r-
w----t u 
[6s]-[0a]-[es]-a-
[4s]-[8o]-[qs]-i-
[8u]-[wi]-[to]-f-
[5d]-9-w-t r 
[6t]-0-e-t y 
[4u]-8-q-u i 
[8o]-w-t-i u 
[5y]-9-w--
[6t]-0-e-t-
[es] ]]

 UseShiftKeys()

    end)

Emotional2:Button("Sadness and Sorrow - Naruto Soundtrack", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 24 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ 0 r o I-y--
0 r o I-r--
[0G]f[ra] o I-y f h
[8j] w [tf] y u--
[9h] e y o [IG] [uh] [yj] [ed]
[wd]hky a y [Qd]Gjy p y
[0G]f[ra] o I-y f h
[8j] w [tf] y u--
[9h] e y u [IG] [uh] [yj] [ed]
[0f] r o I-y--
0 r o I-r--
[0G]f[ra] o I-y f h
[8j] w [tf] y u--
[9h] e y o [IG] [uh] [yj] [ed]
[wd]hky a y [Qd]Gjy p y
[0G]f[ra] o I-y f h
[8j] w [tf] y u--
[9h] e y u [IG] [uh] [yj] [ed]
[0f] r o I-y--
0 r o I-[rf] G h
[8j] [wk] [uf] [wh] 7 [QG] y r
[0f] r u I o I u y
[8h] [wj] [uh] [wG] 9 e [Ik] e
[wd]hky a y [Qd]Gjy p y
[8j] [wk] [uf] [wh] 7 [QG] y Q
[0f] r u I o I u y
[8h] [wj] [uh] [wG] 7 Q [ya] Q
[6f] 0 e t u p s f
jlxb--[9pG]-[Qd]-
[0o]afr o I-y--
0 r o I-r--
[0o]aGf[ra] o I-y oafh
[8s]fjw [tsf] y u s f j
[9p]dhe y o [Ip]dG[uh] [yj] [ed]
[wd]hky a y [Qd]Gjy p y
[0o]aGf[ra] o I-y oafh
[8s]fjw [tsf] y u s f j
[9p]dhe y u [Ip]dG[uh] [yj] [ed]
[0o]afr o I-y--
0 r o I-[rfx] [GC] [hv]
[8jb] [wkn] [ufx] [whv] 7 Q [yGC] r
[0fx] r u I o I u y
[8sfh] [wj] [uh] [wdG] 9 e [Ik] e
[wd]hky a y [Qd]Gjy p y
[8jb] [wkn] [ufx] [whv] 7 Q [yGC] Q
[0fx] r u I o I u y
[8sfh] [wj] [uh] [wdG] 7 Q [ya] Q
[6p]sf0 e t u p s f
jlxb--[9pG]-[Qd]-
[0o]afr u o a f h k
[3f]hkx ]]

    UseShiftKeys()

    end)

Emotional2:Button("Main Title Sayonara Zetsubou Sensei", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 35 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ fG
[3h] 7 0 w [2G] 6 9 [Qd]
[1f] 5 8 0 w--fG
[3h] 7 0 [wk] [2G] 6 9 [Qk]
[1f] 5 8 0 w--ds
[7d] Q r y I--
[rk] Y I p a--fG
[3fh] 7 0 [wa] [2dG] 6 9 [Qk]
[1sf] 5 8 0 w 0 8 [5f]G
[3fh] 7 0 [wa] [2dG] 6 9 [Qk]
[1sf] 5 8 0 w 0 8 [5d]s
[7d] Q r y I--
[7k] [(r] [QY] [eI] [ra]--[ak]
[8pj][ak][0uf] w [to] [us]-[pj]-[oh]
[9IG] Q e [yp] [Id]-yeQ
[7uf]Q[rIG]a-y I-[aG]-[ak]
[7ak](QerYIpaDGjkZCbn--xC
[uv] a f h [yC] p d [Gz]
[tx] u o s f--xC
[0v] r u [on] [9C]Qey--n
[8x] 0wtuosf-t-
[2z] 9ey----k
[0ux] u I o a u I o
[3u]----0 Q
[3w] 7 0 7 [2Q] 6 9 [69]
[10] 5 8 [5t]u[1o]-0 Q
[3w] 7 0 [7r] [2Q] 6 9 [6r]
[10] 5 8 [5t]u[1o]--yt
[7y] 9 Q 9 r--
[Y7a](Qe----[fx] [GC]
[0hv] [rGC] [ufx] r [9GC] [efx] [ydz] e
[8flx] w t [ua] [op]-[fx] [GC]
[0hxv] r u [rkn] [9GC] e y [ekn]
[8flx] w t u o--
[9djz] [Qe] [ey] [yI] [Ip]--
[3aG] [7fx] 0 w r o u r
3 5 7 0 w o u-
[3wu]7 ]]

    UseShiftKeys()

    end)

Emotional2:Button("Sad Song - We The Kings", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 50 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ S H g Q T [IH] g T
O [SH] D W Y O Y W
S s S Q T [IH] g T
O [SH] D W Y O Y W--
D [*Tg] W T W T
W [TS] [WD] [8t] W t W t
W [tS] [WD] [ETg] [WD] [TD] [WS] [Tg]
[WD] [TD] [WS] [*g] [QD] [ED] [QS] [EP]
Q [EO] [QD] [*WTg] W T W [TS]
[ES] [TS] [ED] [(8t] W t W t
W [tS] [WD] [*Tqg] [WD] [TD] [WS] [Tg]
[WD] [TD] [WS] [*QEg] [QD] [ED] [QS] [EP]
W T [Ws] [*QES] Q [ES] [QS] [ES]
[QD] [ETg] [Qs] [W8t] [Ws] [tY] [Ws] [tYS]
[WD] [tY] [Wg] [^*E] [qD] [ETD] [qS] [ETS]
[qg] [ETD]S[QD] [$S] D--S
H g [QET] [QS] [ETH] [Wg] [WT] [qS]
[TH] [QD] [tWY] [QD] [tYS] [Wg] [tY] [qS]
[tYH] [Wg] [QET] [qS] [ETH] [Wg] [*WT] [EG]
[WTg] [qD] [tWY] W [tY] W [tY] [WS]
[tYH] [Wg] [QET] [qS] [ETH] [WTg] q [*S]
[TH] [QD] [tWY] [QD] [tYS] [qg] [tY] [QD]S
[tWYD]S[EP] [QETS] Q [ET] Q [ET] [QO]
[ETg] Q [s%QD]--D D
S [DH] [Sg] $ * [QH] g *
W [TH] D % ( W ( %
[YS] [Ys] [YS] [$Y] [*T] [QH] g *
W [TH] D % ( W ( %--
D [*Tg] W T W T
W [TS] [WD] t W t W t
[WS] [tS] [WD] [ETg] [WD] [TD] [WS] [Tg]
[WD] [TD] [WS] [Wg] [QD] [ED] [QS] [EP]
Q [EO] [QD] [*WTg] W T W [TS]
[WS] [TH] [WG] [(8tg] [WD] t W t
[WS] [tS] [WD] [*qtg] [WD] [TD] [WS] [Tg]
[WD] [TD] [WS] [*QEg] [QD] [ED] [QS] [EP]
Q E [Qs] [*QETS] Q [ETS] [QS] [ETS]
[QD] [ETg] [Qs] [W8t] [Ws] [tY] [Ws] [tYS]
[WD] [tY] [Wg] [*E] [qD] [ETD] [qS] [ETS]
[qg] [ETD]S[QD] [*EIS] D--S
H g [QET] [QS] [ETH] [Wg] [WT] [qS]
[TH] [QD] [tWY] [QD] [tYS] [Wg] [tY] [qS]
[tYH] [Wg] [QET] [qS] [ETH] [Wg] [*WT] [EG]
[WTg] [qD] [tWY] W [tY] W [tY] [WS]
[tYH] [Wg] [QET] [qS] [ETH] [WTg] q [*S]
[TH] [QD] [tWY] [QD] [tYS] [qg] [tY] [QD]S
[tWYD]S[EP] [QETS] Q [ET] Q [ET] [QO]
[ETg] Q [8sD]--D D
[tYD] [WD] [qiTS] q [TS] [qS] [TH] [qG]
[Tg] [qD] [QT] [TS] [QS] [TS] [QH] [TG]
[Tg] [QD] [*WT] [iS] [WS] i [WP] [iS]
[WD] [ig] [(EYD] W Y W Y W
[YS] [Ws] [q*T] q [TS] [qS] [TH] [qG]
[Tg] [qD] [*QT] [QS] [TS] [QS] [TH] [QG]
[Tg] [QD] [WTi] [WS] [iS] [WS] [iS] [WS]
[qD] [%g] [s$WODH]-[8%(]-[8s%(ODH] [SL]
[OH] [ig]-[$T] [*OH] [Qig]-[*T]
[WOH] [TYD]-[%Y] [(T] [Wi] ( [%TS]
[Os] [iS]-[$T] [*OH] [Qig]-[*I]
[WOH] [TYD]-% ( W ( [%TS]
[OH] [ig] [QE] [QTS] [EOH] [Qig] [*WT] [qOH]
[*OH] [4pj] [^*4q] [^pj] [*qpj] [^PJ] [*q] ^
[(8sl] % [!$^*SL] $ [^*] [$L] [^*l] [$S]
[^*] [$g] [8@%(] [%D] [8(] % [8(] [%TS]
[8(OH] [%ig] [$^] [$TS] [^OH] [$ig] [!%*] [4TS]
[*OH] [4YD] [8@%(] [%YD] [8(TS] [%ig] [8(] [%TS]
[8(OH] [i%D] [$^] [^TS] [$OH] [!%*ig] 4 [4IG]
[*ig] [4YD] [8@%(] % [8(] % [8(] [%TS]
[8(OH] [%ig] [$^] [^TS] [$OH] [!%*ig] 4 [4TS]
[*OH] [4YD] [8@%(] [%YD] [8(TS] [%ig] [8(] [%D]S
[8@%(D]S[^P] [@$^*TS] $ [^*] $ [^*] [$O]
[^*ig] $ [8s@%(D] % [8s%OD]-D D
L [ZV] [Lc] $ * [QV] c *
[Wc] [TV] Z % ( W ( %
[DL] [Dl] [DL] [$S] [*S] [QV] c *
O [SV] Z W Y O Y W ]]

    UseShiftKeys()

    end)

local Classical = win:Tab('Classical')
local Classical2 = Classical:Section("Classical | 90's")

Classical2:Button("La Campanella", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 80 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ DY-DY-DY-ZZ-ZZ-ZZ-DY-
DY-DY-ZZ-Z-Z-DY-
ZZ-ZZ-DY-ZZ--ZZ----
D 
ZZZZZLZWYkaZkZJrZO
HDZhZHYPZhJZDZDZoPfZ
DZSZaOZaZPZryOiZoZO
(Z PoZYDDZZZZZLZWY
kaZkZJrZOHDZhZHYZPJhZ 
D ZDZoPfZDZSZDaOZHk
ZZ DSYoZhJZZWYa HD
Z ZZZZ ZL L[%k] Zkr(Z
JZJH7ZhYWZHZhH(J ZEoD Z
DZPGfoZDPoZSZSaOZaOZPZOPiyr
ZoiyrZLOZ(PoZYDDZZZ
ZZLZLk%Z([rk]ZJZJH7ZhYWZ
HZhH(JZoED ZDZPGOTfVPDOYVPSO
uVDaOYZHkZZ(TDoZhJ Z
Z% rY OD H k Z-V----
a Po aIpa
Oiaou-SaPaIYrC IaQYC DSsS
IuECSIQuC fDdDIYar C-D [ad]D
PSD[ps]DOa gDdDPIYB DPIEB G
gfg[OP]yBPgOEB HGgGPDIY B Ggd
GSfG[sD]Gda HGgG[IP]SLGSPTL 
JHhHSaiLHSTaLJGHkILJLCkHGJ
aHSJrkDZnJS[aH]PGaHTJSBLHa[PG]O
gPGTHakVDIOgQGP[JC]IGohO
H[OV]uHOVYGVTOf CDH xSHWZLs
HLPHZsHTxSHLfHohIG
IYCG[TI]CfCIrD xSGaZGQLPGOn
GPLGrZaGDnGyd YDYwZD
WZidZoESZoESOZrLaxPfT[JZ]SLkfyiaJHg
PhoYJDhk[DJ]dzDZZDoLZ ZgOz[hZ]PL
Z[Ph]LHZakxxjSZbLL[xn]kbgdVcJvhDBZdz
DZZZDZfxZZfxgc
ZZGCZZhvZ ZHV Zj
ZJZkZlZLZz ZZ ZZ
ZZZZZZZZZZ DZZ
Z DZZZDYZDZZDZSZZW
[aD]ZZaZDPZOrZZoDZOZZ[PD]oZ
ZYZYDZuZwZDYZZTZrDWZZr
ZEDZWZ0ZDwZWZZEDwZ-(Z
DZYZDZDZ[SZ]ZWaDZZaZPD
ZOZrZ[oD]ZOZZPDoZYZZDZP[Tf]O
ZDPOYZ[PS]uOZDaYOZHkZZ DSYo
ZhJ Z ZW Ya HDZZZZ
ZZZZLLLk%knkr(knJ(rJB
H7HVYWhhvYHWHV(JJBE[oD]DZDEoDZ
fwfxDPYDZPSYSLaWakaOYakOPYPJr
OOHioyohiyOH[(P]PJ[EY]oYDDZZ 
ZZZZLLL%kknk[(r]knJ(rJB
7HHVYhWhvYHWHV(JJBoEDDZDPoDZ
OaffxDPIDZSOuSLa[YO]DDZffZgg
ZGGZhhZHHZj(jTZ[oJ]JZkkZl
lZLLZzzZ%Z(ZrZxOxZc ZC
CZvv-VV Z----
aO Po [pa]I Oaiaoua[YI] iya [Ta]u 
SaPa[YI]rGGGIQaYkkkSLLLGEu
CCCIE[QL]CL[LC]Z7CZCZ-kYQ--
Da d PSD DspDOaDPoDpI DOi gDd
DPYIJJJPEIDZZZgcccOJyBBBP[Ey]c
cB[cB](CCBBCE[IZ]--GD gdGfS
DGs dGa S[PG] [sG]p [OG]a HGgGSPILLLSPGTC
CCHVVVLaVL[LV]SLViT[LV]LVIBLZLbZ[GL]JVZ
LHvZCLLJZLZVnrLvnLnCHaLJcnSLnZkDLnLCBTncBn
B[PZ]GnHB[az]n[JL]BSnBnc[TV]BZVBVzOgBVLGPBVHkaZxIcSCJVC
VCGCVChvVvHVb[uV]bHVbVYbGVb
VTbVfbVbVZCbVb[LV]xbVObZVlbVb[LV]JbVbV[lZ]
bVbSxLVbVb[xV]L-hvbvGCVCYVGC
VCTVfCVCrVCDVCVCxLVCVCZkVCIVCLJVCV
CnHVCVCLJVCVaZCkVCVnZC-dzZzDZx
ZDxYoZxZ[dx]OiZxZxSoPZzZxcCvbvBnmLzZOfxa
CxZzLmnBbVvCYPx[hZ]-PJkJdz
ZzDZxZDY[ox]ZxZ[Od]xixZxS[oP]ZzZxcCvVb
BnmLzZ[Ox]faCxZzLmnBbVvCcYPxhZxZzZ
xcCvVbBnmWLYzZaxCxZzLmnBbVvCc(xE
ZoxZzZxcCvVbBnmL%zZrxCxZzZzLm
LmnBnBVbVvCvCcxCxZzZzLlLlk
JkJjHjHhGhGgfGfDdDdSsSsaPaP
pOpOoIo5IiEuyTuYiuIioIOopOPp
aPsaSsdSDdfDgfGghGHhjHJjkJl
kLlzLZzxZcxCcvCVvbVBbnBmnmL
mzLZzxzZzxzZzxzZzxzZzxz
ZzxzZxZxZxZxZxZxZxZ
xZxZxZxZxZxZxZxZxDZxZxZZxZ
xZZxZxZLxZOxZkZx xZZkxZxZ[JZ]xZxHZZax
ZxZZhxZxHZZxZxJZ[hZ]xZxZZDxZxZDZxZxZZfPox
ZxZ[DZ]xxZSZxZxZaOZxZxZaOZxZx[PZ]IZxZxZZOux
xZZoxZxZOZxZxP[oZ]ZxZxZZYxZxZZxZYx
ZZDxZxZDxZZSZxZWxaZZZaxZDPZx
ZZOrxZZoxZDOZxZPZoxZZ YxZD
YZxZOZrxZZI[tZ]xZDTuZxZYZxZZHa
kD ZH-YZxZZPhJS Zh-W-
YaH--DZxZZZxZZ
ZxZLLZL%nLnYk(rnLnYrWJBn
BH7VBVYh(rvVvYrWHJVBV@(JBnBowYDZx
ZoEYDZxZ5wfxCxPDTYZxZPL[YS]EZLW%akLkaOY
kLkYPrJkO03HJHoryhHhO[Ey]HJHP@(JkJ
YEwDfDDoPZxZZhJZxZZZxcZLLZL
l%mLmIlYemLmIjeYbnbH8VbVHYeVb 
IGYeCVC*fxCxpSuLZLpDtZxZTpfxCx
IpDZxZ[up]SLZYLDOaZfgGhHjJklLzZ
xcCvVbBnmL(zTZCxoLBvzZCxLJ
hfSPouTEw%(WrYOaDHk
Z nV----
kaO kaPokapIkOaiko[ua] k8YIGQra[YI]k7YI
L$JIGQSEI$LIuZ7LYIDQk7$Zn7--
ZDadZDPSZDZsDpOZDZ(IPJYEDIP[(Z]PI^cP
OJEgyOP^c[OP]C(PIGEZ(C^@Z--DCG
CgdG[SC]GfCDGsCd[aG] CQPSLTGPSCQSPV*SaL[TH]iSa
[*V]Da-BL[QC]L[Vn][TL]LBLPVnGL[JB]L [7kV]ZBLnrZnLO
LDVk[LC]J*VLk[LB]ELBI[kV]SJGCLLcHTHCLJgLVkVkLOkJCTac
PCGIL-[$Q]$Q5w5w%WW%OWOHHO HV-
CCDHCCHHSxxxxHZZHs[HZ]ZPLLHLZsHZZHx[Sx]-%W%W
[5w]w5Q$Q$QIQIGIGIGC-G[Sx]xGxxZZaGZG
GLPLLLG[Okn]GnGkLLGPGLLGZa-q44q03[30][@(][@(]
(YYDDY DZ-oDZYo[DZ]YDZiOiZDpxfIp[ID]ZSLouo[ak]u
PJyiiOHyhoY ^^[29]29(@(@Y(Y DYDY
DZ-[DZ]ZooZ[DZ]Z[gZ]O[OZ]ZgxpxGpZZGLLhPPh[kn]JBdggdVHJ[Dv]hP
[PD]CGa[Ogc]aOxfIzpdpIZDP[fx]oP[oD]Zo[SL]uukaoiy[PJ]iHOY[Eh]oIE[YG]OgriW
[Wr]ufdyQeQYeDEw[uf]EwYDwTS009[ra]9qEPq9OW[(o]*w^^Q(I[7i]q%[%7]u06y9$0$^(Y
^5u0q5[^0][Ty]q5^0T[^0]5r7[qE]27q2W [^w]@-y99[(Y]([ep]o
ew6[EP]^dyy9[YD]Y([pj]pePJPEzddy[DZ]DYbjjpJB
JPzzzdZZZDzzdZZDzzdZZLSZZJPZ
hoZDYZZSTZZPEZowZZY(ZZT*ZE^ZZ
5wZZ(@ZZ ZZ ZZZZZZZZZZZZ
ZZZZZZZZZZZZZZZYZZ ZZDZZ Z
ZZ LLLL%%kn[kn] nk[(Y]r[(n]kYrJB[rY]WBJ7H7VVHY
(rhvYrh(vYHrVWVH@J(BBJowDZowDZYo[EZ]DYZD5wxfxfP[TD]ZPTZDPSLEY
[SL][%W][ak][ak]YOkaOYkaP[YJ]rJP [0O]H3[OH]hyro[ry]hoOyEHHOPJ(@
JPwEYDwED[EY]wDZZ ZDoPZZZZZLLLL %%[lm] ml
Yml[Qe][eY]Q[lm]YbjeQjb$81HVHVpH[eYV]eY[pHV]pY[GC]eCG *!xf-
TSe[0u]p[0T]pSue[(T]DpueT(Deup[Tf]p*ueT*[pf]euT(e[uD]p[eT]upD00Tp[uS]eS[eT][0p]uDaYOW(ry[9f]
T*[ig][8t]GI[7r]hoE^HOe6jpW[%PJ]w5kaQ$sl[4q]LS[30dz][(Z]D5[h@^J]29xfgc*![18]Cv77h
[^HV]^66[jb][%B]J55[kn]$$L3z3@@ZZ-%%O[rY]-(@W%[ak]YD(-
[PJ]%%Dak(@LSW%akDY(JP[ak]D%%LS(@DZW%SLY([ak]JPD%%
ak(@LSW%akDY([PJ]kaD%%[PJ](@[OH]W% nkYZ(-BJ[%Z]%[kn]@(LL
W%knZY(BJnkZ%%L[@(]ZZW%LLY(nk[JB]%%Zkn@(LLW%knY(
[JB]nk[%Z]%JBV[@H](W%aDYr7( E^PYDY[7a]r([YD]TS*( [(r]Y[aD]E[YD]^(Pr[YD]7a([YD]E(P
[(WD]YO%-D[%Z]H@-E^Y[PD]([7r][aYD](D[TY][*(]S [(Y]raDE(Y[PD]^Dr[7Y]a([EYP][(D]WD(WO%-
%DZ%H@-7DYartEYDP(WD(%O-%H%VZ@ r7[Ya]D[EY]D(PW(DO%-[kZ][%n]%@-
r7[YD]a([EY]DPW[(D]O%-Z%[ZV]@--WZ[%Z]V(-
Z[OZV]W-Z[HZV]DO O[WZ]VY W%V(ZZ-Z[%Z][%V]@--
O[rWY]%(----V[aH][kOZ]rY ]]

UseShiftKeys()

end) 

Classical2:Button("Für Elise - Beethoven", function()

if Speedo2 == "" or Speedo2 == nil then
shared.tempo = 90
else
shared.tempo = Speedo2
end
shared.scr = [[ f D f D f a d s [6p] 0 e t u p [3a] 0 W u O a [6s] 0 e u f D f D f a d s [6p] 0 e t u p [3a] 0 W u s a [6p] 0 e a s d [8f] w t o g f [5d] w r i f d [6s] 0 e u d s [3a] 0 u u f u f f x D f D f D f D f D f a d s [6p] 0 e t u p [3a] 0 W u O a [6s] 0 e u f D f D f a d s [6p] 0 e t u p [3a] 0 W u s a [6p] 0 e ]]

    UseShiftKeys()

    end)

Classical2:Button("Consolation No. 3 - Liszt", function()

if Speedo2 == "" or Speedo2 == nil then

    shared.tempo = 40 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ !qTWiTWqTWiT
!qTWiTWqTWiT
!qTWiTWqT[Wg]iT
gwTEiT[EP]wsT[ES]igT
gQtWitWQDt[Wg]YDt
[!S]qTWiTWqTWgiSTJ
HqTWiTWqT[Wg]iT
[!g]wTEiT[EP]wsT[ES]igT
gwTEiT1wfT[EH]uht
[4g]WitOitWitHOgiL
lWitOitWi[tH]Oi
[4H]WyrOy[rd]WDy[rg]OHy
[$H]QYEIYEQPY[Es]IdY
D g G H j l-J
[%J]qTWiTW[qH][TL][Wl][if][Tg]
JHsSGgoOPsSg
[%g]wTEiT%QDt[Wg]YDt
[!S]qTWiTWqTWiT-
qTWiTWqT[Wgc]iT
[!g]cwTEiT[EPJ]w[sl]T[ESL]i[gc]T
gcQtWitWQ[DZ]t[Wgc]Y[DZ]t
[!SL]qTWiTWgqSTJ[WH]ciLTB
[!V]qTWiTWqT[Wgc]iT
[!gc]wTEiT[EPJ]w[sl]T[ESL]i[gc]T
[gc]wTEiT1w[fx]T[EHV]u[hv]t
[4gc]WitOitHWgiL[tl]VOciL
mWitOitWi[ts]Oi
sEutou[to]EOu[tP]oSu
sWitOitWi[tl]Oi
[P4l]fEutou[tfh]E[gH]u[thJ]o[JL]u
[4jl]eitpite[Jz]i[tgj]p[Jz]i
[4jl]e[Jz]i[tgj]p[Jz]i[4jl]e[Jz]i[tgj]p[Jz]i
[3jl]eutpute[kz]u[tlx]p[zc]u
[3xv]Wu[rzc]Ou[lx]-[kz]-
[6jl]tpusputp[uf]sp
fyOuaO[ua]ysO[ud]agO
ftpusputp[ux]sp
[H6dx]yOuaO[Huk]y[jl]O[ukz]a[zc]O
[L6x]TpuSpuT[zC]p[ujL]S[zC]p
[L6x]T[zC]p[ujL]S[zC]p[L6x]T[zC]p[ujL]S[zC]p
[%Lc]TO[iGZC]SO[icHV]TW[qJCB]TW
[%JCB]QYtOYtQ[cHV]Y[tGZC]O[DJZ]Y
[!Lgc]qTWOTWqTWOT
!qTWOTWqT[Wi]OT
i*EwiEE t T i
i*tWIt-Y i Y
T*WiTPOgSJHg
SPOiTWqTW[igc]TW
[!g]cwTEiT[EPJ]w[sl]T[ESL]i[gc]T
[!gc]QtWitWQ[DZ]t[Wgc]Y[DZ]t
[!SL]qTrOTrgqSTJ[rH]cOLTB
VqTrOTrqTrOT
[!T]*EQIEQP*IED[QS]JIGEZ
L*EQIEQ*EQISE
[u!S]p*e0ue0*e0fu[pS]eG
fj[Sf]kjL[fj]ZLx[pL]Cxb[Sx]nbL[fb]ZbL[fb]ZbL[fb]ZbL[fb]Z
[c!LV]qTWiTWq[CB]T[WLc]i[CB]T
[cV]q[CB]T[WLc]i[CB]T[cV]q[CB]T[WLc]i[CB]T
[cV] [Lc] [JL] [GJ] [gH] [Sg] [PS] [IP]
[iO]-[Ti]-[ET]-[QE]----
[qW] ]]

    UseShiftKeys()

    end)

Classical2:Button("Canon in D - Pachelbell", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 40 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ 9 Q e y 6 * 0 e
7 9 Q r $ 6 * Q
5 7 9 w 2 $ 6 9
5 7 9 w 6 * 0 e
[9G] Q e y [6f] * 0 e
[7d] 9 Q r [$S] 6 * Q
[5a] 7 9 w [2p] $ 6 9
[5a] 7 9 w [6S] * 0 e
[9dG] Q e y [S6f] * 0 e
[7ad] 9 Q r [p$S] 6 * Q
[5oa] 7 9 w [I2p] $ 6 9
[5oa] 7 9 w [6pS] * 0 e
[9y]-I-[6p]-o-
[7I]-y-[$I]-u-
[5y]-r-[2y]-p-
[5o]-a-[6p]-o-
[9I]-y-[6u]-S-
[7d]-G-[$j]-p-
[5a]-o-[2p]-I-
[5y]-d-[6S]--
[9d] S d y [6T] p u I
[7y] d S a [$S] G j k
[5h] G f h [2G] f d S
[5a] p o I [6u] o I u
[9y] u I o [6p] u p o
[7I] a p o [$p] o I u
[5y] r a S [2d] S a p
[5o] I u a [6p] a p o
[9I]-G-[6f]--
7-d-[$G]--
[5k]--[2j]--
[5k]--[6L]--
[9z]-d-[6S]--
7-a-[$d]--
[5d]--2-d-
[5d]-G-[6f]-j-
[9j] Ghj Gh[6j]paSdfGh
[7G] dfG Io[$p]apopIop
[5o] apo Iu[2I]uyuIopa
[5o] apa Sd[6p]aSdfGhj
[9G] dfG fd[6f]SdfGfdS
[7d] aSd yu[$I]oIuIdSd
[5a] dSa po[2p]oIopaSd
[5a] dSd Sa[6S]dfdSdaS
[9d]--j [6j] k j h
[7G]--G [$G] h G f
[5d]--d [2d]-p-
[5d] s a s [6S]--
[9d]--j [6j] k j h
[7G]--G [$G] h G f
[5d]--d [2d]-p-
[5d] s a s [6S]--
[9d] ]]

    UseShiftKeys()

    end)

Classical2:Button("Comptine d'un autre été - Yan Tiersen", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 47-- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [0u] r [wu] r [0u] r [wu] r
[9y] r [wy] r [9y] r [wy] r
[9y] r [Qy] r [9y] r [Qy] r
[9y] e [Qy] e [9y] e [Qy] e
[0u] [ro]I[wuo] [ra]s[0ua] r [wu] r
[9y] [rI]o[wyI] [ro]p[9yo] r [wy] r
[9y] [rI]u[yQI] [ra]s[9ya] r [Qy] r
[9y] [eI]u[yQI] e [9y] e [Qy] e
[0u] [ro]I[wuo] [ra]s[0ua] r [wu] r
[9y] [rI]o[wyI] [ro]p[9yo] r [wy] r
[9y] [rI]u[yQI] [ra]s[9ya] r [Qy] r
[9y] [eI]u[yQI] e [9y] e [Qy] e
[0uf] r [wu] [ra] [0u] r [wu] r
[9yd] r [wy] [ra] [9y] r [wy] r
[9yG] r [Qy] [ra] [9y] r [Qy] r
[9yG] e [Qy] [ep] [9y] e [Qy] e
[0uah] r [wu] [rof] [0u] r [wu] r
[9yah] r [wy] [rod] [9y] r [wy] r
[9yaG] r [Qy] [Ird] [9yd] r [Qy] r
[9ypG] e [Qy] [Ied] [9yd] e [Qy] e
[0ua]f[rk]a[wuf]k[ra]f[0uk]a[rf]k[wua]f[rs]f
[9ya]d[rk]a[wyd]k[ra]d[9yk]a[rd]k[wya]d[rp]d
[9yI]a[rG]I[Qya]G[rI]a[9yG]I[ra]G[yQI]a[ro]a
[9yp]d[ej]p[Qyd]j[ep]d[9yj]p[ed]j[Qyp]d[eo]d
[0ua]f[rk]a[wuf]k[ra]f[0uk]a[rf]k[wua]f[rs]f
[9ya]d[rk]a[wyd]k[ra]d[9yk]a[rd]k[wya]d[rp]d
[9yI]a[rG]I[Qya]G[rI]a[9yG]I[ra]G[yQI]a[ro]a
[9yp]d[ej]p[Qyd]j[ep]d[9yj]p[ed]j[Qyp]d[ej]
[0u] [rh]G[wuh] [rk]l[0uk] r [wu] r
[9y] [rG]h[wyG] [rh]j[9yh] r [wy] r
[9y] [rG]f[yQG] [rk]l[9yk] r [Qy] r
[9y] [eG]f[yQG] e [9y] e [Qy] e
[0u] [rh]G[wuh] [rk]l[0uk] r [wu] r
[9y] [rG]h[wyG] [rh]j[9yh] r [wy] r
[9y] [rG]f[yQG] [rk]l[9yk] r [Qy] r
[9y] [eG]f[yQG] e [9y] e [Qy] e
[0ux] r [wu] [rk] [0u] r [wu] r
[9yz] r [wy] [rk] [9y] r [wy] r
[9yC] r [Qy] [rk] [9y] r [Qy] r
[9yC] e [Qy] [ej] [9y] e [Qy] e
[0ukv] r [wu] [rhx] [0u] r [wu] r
[9ykv] r [wy] [rhz] [9y] r [wy] r
[9ykC] r [Qy] [Grz] [9y] r [Qy] r
[9yjC] e [Qy] [Gez] [9y] e [Qy] e
[0uk]x[rn]k[wux]n[rk]x[0un]k[rx]n[wuk]x[rl]x
[9yk]z[rn]k[wyz]n[rk]z[9yn]k[rz]n[wyk]z[rj]z
[9yG]k[rC]G[Qyk]C[rG]k[9yC]G[rk]C[yQG]k[rh]k
[9yj]z[eb]j[Qyz]b[ej]z[9yb]j[ez]b[Qyj]z[eh]z
[0uk]x[rn]k[wux]n[rk]x[0un]k[rx]n[wuk]x[rl]x
[9yk]z[rn]k[wyz]n[rk]z[9yn]k[rz]n[wyk]z[rj]z
[9yG]k[rC]G[Qyk]C[rG]k[9yC]G[rk]C[yQG]k[rh]k
[9yj]z[eb]j[Qyz]b[ej]z[9yb]j[ez]b[Qyj]zbv
[0ruhkx] ]]

    UseShiftKeys()

    end)

Classical2:Button("Moonlight Sonata", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 30 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [!*W]TuWTuWTuWTu
[7W]TuWTuWTuWTu
[6e]TueTu[$e]yIeyI
[%W]tIWTu[%W]TYQtY
[!%*0]WTWTuWTu[WO]TuO
[18%WO]YIWYIWYI[WO]YIO
[!*WO]TuWTu[$ep]TIeTI
[7WO]ruWru[7eI]rY[ea]rY
[W30u]ruWruWruWru
[30w]ruwruwru[wo]ruo
[29wo]riwriwri[wo]rio
[18wo]tu[7w]ru[^w]Tu[QI]Tu
[7QI]ryQry[3wo]rT[50u]rT
[$QI]ryQry[$QI]ETQET
[7r]yIryIrYI[ra]YI
[rs]uo[30r]uo[5wr]uo[30rP]uo
[7ra]YIrYIrYI[ra]YI
[rs]uo[30r]uo[5wr]uo[30rP]uo
[7ra]YIrYI[%ra]yiryi
[4ra]TOrTO[$ep]TIeTI
[%7wo]rywry[18QI]eYQeY
[!*T]Qe*Qe[!*T]QW[*T]qW
[!$Q]eTeTITIp[TS]IpS
[4q*TS]OaTOaTOa[TS]OaS
[$QTS]IpTIp[@(ts]Ip[!*TS]Ip
[18%YD]IOYIOYIO[18%YD]IO
[!%*uf]OSuOS[$YD]Ip[5TS]uP
[%s]tYOtYptYItY
%tYWtYetYQtY
[%0]uOSuOfuOSuO
%0WT0Wu0WT0W
[%(]eQteYtIYpIs
[%0]TWuTOuSOfSp
[%T]ouPoSPfShfJ
[%I]spDsGDjGljZ
lGjDGsDpsIpY
ItYetQe(Q*Qe
[%8]QWeWQ(Qe*Qe
[%8]QWeWQ9Qe*Qe
[%8]QWeWQ[6*]0T*0T
[$(]eT(eT[%(]Wt(Qt
[!%*0]WTWTuWTu[WO]TuO
[18%WO]YIWYIWYI[WO]YIO
[!*WO]TuWTu[$ep]TIeTI
[7WO]ruWru[7eI]rY[ea]rY
[W30u]ruruOruO[ra]uOa
[@(ra]IprIprIp[ra]Ipa
[30ra]uOruO[@(ts]IO[!*TS]IO
[18%YD]IOYIO[!%*uf]OSuOS
[$yd]IpyIp[%ts]IOtIO
[!*TS]uOTuOTiO[TS]iO
[Td]Ip[$QT]Ip[6eT]Ip[$QTs]Ip
[!*TS]iOTiOTiO[TS]iO
[Td]Ip[$QT]Ip[6eT]Ip[$QTs]Ip
[!*TS]iOTiO[$TS]IpTIp
[@(ra]IprIprIp[30ra]uO
[*3ep]uO[@(ep]YI[18WO]YI[!*WO]Tu
[6QI]TYQTY[%WO]TY[$ep]TY
[%WO]TuWTu[%QO]tYQtY
[0!%T]WTWTuWTu[%W]Tu%
[1%W]YIWYIWYI[%W]YI%
[!%W]uTOuSOfS[%H]fS%
[%s]DpsIpYIe[%t]WQ%
[0!%T]uTOuSOfS[%H]fS%
[%s]DpsIpYIe[%t]WQ%
[!%0]WTuTW*0WTW0
%*0W0*%*%3%3
!--[0!%*WT]--
[0!%*WT] ]]
    UseShiftKeys()

    end)

local GameOST = win:Tab('Gaming OST')
local GameOST2 = GameOST:Section('Games Soundtracks')

GameOST2:Button("FNAF 4 Song - The Living Tombstone", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 160 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [1t]-[5o] [5o] [15t]-[8s]-
[1t]-[5o] [5o] [15t]-[8s]-
[1t]-[5o] [5o] [15t]-[8s]-
[1t]-[5o] [5o] [15t]-[8s]-
[1Y] y [(wt]-[15] y [w(Y] y 
[1t] Y [(wo]-[15] t [(wi] o 
[%O] o [Wti] Y [2y] Y [9wi] o 
[1Y]-[(w]-[15] t [(wi] o 
[2O] o [Wqi] Y [2y] Y [9qi] E 
[@o] i [wEY] y [@t] y [w(Y] t 
[2i] Y [Wqy] t [2y] Y [Wqi] o 
[1yo]-[(w]-[15]-[(wt] y 
[1Y] y [(wt]-[15] y [w(Y] y 
[1t] Y [(wo]-[15] t [(wi] o 
[%O] o [Wti] Y [2y] Y [9wi] o 
[1Y]-[(w]-[15] t [(wi] o 
[2O] o [Wqi] Y [2y] Y [9qi] E 
[@o] i [wEY] y [@t] y [w(Y] t 
[2i] Y [Wqy] t [2y] Y [Wqi] o 
[5wyo]-[5w]-[5w] t Y P 
% s [%Y]-[@%] t [%Y] P 
@ s [@Y]-[@%] t [@Y] Y 
[5o] o [5o] O [15o] i [5i] i 
[18] [1Y] [18] @ [5(] [5t] [5(Y] P 
% s [%Y]-[@%] t [%Y] P 
@ s [@o]-[@%] s [@d] D 
[@d] d [@d] D [@%d] d [@s] d 
1 [1s] [1o] @ [@5] [5t] [5@Y] P 
% s [%Y]-[@%] t [%Y] P 
@ s [@Y]-[@%] t [@Y] Y 
[5o] o [5o] O [15o] i [5i] i 
[18] [1Y] [18] @ [5(] [5t] [5(Y] P 
% s [%Y]-[@%] t [%Y] P 
@ s [@o]-[@%] t [@y] Y 
[2y] y [2y] Y [5y] y [5t] y 
1 Y t----
[18o]-8-[@(]-9-
5-^-[@(]-9-
%-8-[@(] Y [9i] o 
[@(]-w-[^E]-( O 
4 o [%Y]-[@(]-[8t] E 
@ Y [^t]-[@(E] W ^-
[2w]-[5Y] t [@(] W [^w]-
[2Y] t 5 y [29o]-[7i]-
[18o]-8-[@(]-9-
[5P]-^-[@(]-9-
[%Y]-8-[@(] E [9s] P 
[@(]-[wo]-[^E]-[(O]-
[4i]-%-[@(Y]-8-
@-^-[@(]-^ t 
[2Y]-[5Y]-[@(Y] i ^ y 
2-[5o]-[29]-[7O]-
[1Y] y [(wt]-[15] y [w(Y] y 
[1t] Y [(wo]-[15] t [(wi] o 
[%O] o [Wti] Y [2y] Y [9wi] o 
[1Y]-[(w]-[15] t [(wi] o 
[2O] o [Wqi] Y [2y] Y [9qi] E 
[@o] i [wEY] y [@t] y [w(Y] t 
[2i] Y [Wqy] t [2y] Y [Wqi] o 
[1yo]-[(w]-[15]-[(wt] y 
[1Y] y [(wt]-[15] y [w(Y] y 
[1t] Y [(wo]-[15] t [(wi] o 
[%O] o [Wti] Y [2y] Y [9wi] o 
[1Y]-[(w]-[15] t [(wi] o 
[2O] o [Wqi] Y [2y] Y [9qi] E 
[@o] i [wEY] y [@t] y [w(Y] t 
[2i] Y [Wqy] t [2y] Y [Wqi] o 
[5wyo]-[5w]-[5w] t Y P 
% s [%Y]-[@%] t [%Y] P 
@ s [@Y]-[@%] t [@Y] Y 
[5o] o [5o] O [15o] i [5i] i 
[18] [1Y] [18] @ [5(] [5t] [5(Y] P 
% s [%Y]-[@%] t [%Y] P 
@ s [@o]-[@%] s [@d] D 
[@d] d [@d] D [@%d] d [@s] d 
1 [1s] [1o] @ [@5] [5t] [5@Y] P 
% s [%Y]-[@%] t [%Y] P 
@ s [@Y]-[@%] t [@Y] Y 
[5o] o [5o] O [15o] i [5i] i 
[18] [1Y] [18] @ [5(] [5t] [5(Y] P 
% s [%Y]-[@%] t [%Y] P 
@ s [@o]-[@%] t [@y] Y 
[2y] y [2y] Y [5y] y [5t] y 
1 Y t----
[18o]-8-[@(]-9-
5-^-[@(]-9-
%-8-[@(] Y [9i] o 
[@(]-w-[^E]-( O 
4 o [%Y]-[@(]-[8t] E 
@ Y [^t]-[@(E] W ^-
[2w]-[5Y] t [@(] W [^w]-
[2Y] t 5 y [29o]-[7i]-
[18o]-8-[@(]-9-
[5P]-^-[@(]-9-
[%Y]-8-[@(] E [9s] P 
[@(]-[wo]-[^E]-[(O]-
[4i]-%-[@(Y]-8-
@-^-[@(]-^ t 
[2Y]-[5Y]-[@(Y] i ^ y 
2-[5o]-[29]-[7O]-
[18o]-8-[@(]-9-
5-^-[@(]-9-
%-8-[@(] Y [9i] o 
[@(]-w-[^E]-( O 
4 o [%Y]-[@(]-[8t] E 
@ Y [^t]-[@(E] W ^-
[2w]-[5Y] t [@(] W [^w]-
[2Y] t 5 y [29o]-[7i]-
[18o]-8-[@(]-9-
[5P]-^-[@(]-9-
[%Y]-8-[@(] E [9s] P 
[@(]-[wo]-[^E]-[(O]-
[4i]-%-[@(Y]-8-
@-^-[@(]-^ t 
[2Y]-[5Y]-[@(Y] i ^ y 
2-[5o]-[29]-[7O]-
[8i]--Y--
Y ]]

UseShiftKeys()

end)

GameOST2:Button("Littleroot Town - Pokemon", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 70 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ [3t] [1i] o [4ip] 6 8 [1o] [4p] [8o] 
p [5P] [6ps] 3 1 [8d] [*ip] 6 
[6p] [5S] [2d] 6 [9f] 6 [*d] 6 
p [5o] [1i] [4u] [6i] [4p] [5pd] 7 
y [6u] [^yi] 2 4 ^ [4s] [2P] 
P [4p] [1ti] 4 6 8 [9d] [^P] 
[^P] [6p] [1yo] 3 5 ^ 8 0 
[wi] [0y] [8tu] ^ 5 [3i] [1o] [3t] 
[5s] [^P] [4ip] 6 8 [1uo] [4ip] [8uo] 
[ip] [5oP] [6ps] 3 1 [8d] [*ip] 6 
[6ip] [5pS] [P2d] 6 [9sf] 6 [*dg] 6 
p [5o] [1ti] [4tu] [6ti] [4tp] [5pd] 7 
y [6u] [^yi] 2 4 ^ [4os] [2oP] 
[oP] [4p] [1ti] 4 6 8 [9id] [i^P] 
[i^P] [6ip] [1yo] 3 5 ^ 8 0 
[wi] [0y] [8tu] ^ 5 [3i] [1o] [3t] 
[5p] [^P] [4s] 6 8 6 [2S] [4P] 
[6p] [8o] [6i] [4i] 2 [4u] [6y] 9 
[qi] [9p] [8o] ^ 5 3 1 3 
[5i] [^y] [8u] ^ 5 [^i] [8o] [^t] 
[5p] [1P] [4s] 6 8 6 4 [3p] 
[6S] [*f] [9h] [6g] [4f] [2g] [6d] 4 
[2g] [!j] [1h] 3 5 ^ [8h] [^g] 
[5d] [3g] [1f] [3f] 5 [^g] [8h] s 
[^P] o [4ip] 6 8 [1o] [4p] [8o] 
p [5P] [6ps] 3 1 [8d] [*ip] 6 
[6p] [5S] [2d] 6 [9f] 6 [*d] 6 
p [5o] [1i] [4u] [6i] [4p] [5pd] 7 
y [6u] [^yi] 2 4 ^ [4s] [2P] 
P [4p] [1ti] 4 6 8 [9d] [^P] 
[^P] [6p] [1yo] 3 5 ^ 8 0 
[wi] [0y] [8tu] ^ 5 [3i] [1o] [3t] 
[5s] [^P] [4ip] 6 8 [1uo] [4ip] [8uo] 
[ip] [5oP] [6ps] 3 1 [8d] [*ip] 6 
[6ip] [5pS] [P2d] 6 [9sf] 6 [*dg] 6 
p [5o] [1ti] [4tu] [6ti] [4tp] [5pd] 7 
y [6u] [^yi] 2 4 ^ [4os] [2oP] 
[oP] [4p] [1ti] 4 6 8 [9id] [i^P] 
[i^P] [6ip] [1yo] 3 5 ^ 8 0 
[wi] [0y] [8tu] ^ 5 [3i] [1o] [3t] 
[5p] [^P] [4s] 6 8 6 [2S] [4P] 
[6p] [8o] [6i] [4i] 2 [4u] [6y] 9 
[qi] [9p] [8o] ^ 5 3 1 3 
[5i] [^y] [8u] ^ 5 [^i] [8o] [^t] 
[5p] [1P] [4s] 6 8 6 4 [3p] 
[6S] [*f] [9h] [6g] [4f] [2g] [6d] 4 
[2g] [!j] [1h] 3 5 ^ [8h] [^g] 
[5d] [3g] [1f] [3f] 5 [^g] [8h] s 
[^P] o [4i] p s d g  ]]

UseShiftKeys()

end)

GameOST2:Button("Sweden", function()

if Speedo2 == "" or Speedo2 == nil then  
-- Sheet for you

    
    shared.tempo = 20 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [30w]-$-[5ey]-7-
[Q6e]-5-[2eT]--
[30wr]-$-[5eyI]-7-
[6eQT]-5-[T2eu]--
[30wr]-$-[5eyI]-7-
[6eQT]-5-[T2eu]--
[30wr]-[$p] a [5eyI]-7 yu
[6eQT]-5 Ip[T2eu]--
[30wr] d [$a] p [5eyI]-7 yu
[6eQT]-5 pI[T2eu]--
[30wr]-[$p] a [I5eyd]-7 [yG][uf]
[6eyQS]-5 [Id]S[T2eup]--
[30wr]-[$a] p [5eyI]-7 yu
[6eQT]-5 Ip[T2eu]--
[30wr]-[$p] a [5eyI]-7 yu
[6eQT]-[5G] Ip[T2eu]--
[7ryI]--ap[W30ru]-u y
[60eT]--yu[59wr]--
[I7ryd]--ap[W30ru]-u [yf]
[60eTS]-d G [59wra] ]]

    UseShiftKeys()

end)

GameOST2:Button("Vs Sonic.Exe - Endless", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 60 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ [6b][6x][6l]j[%f][%s][%p]u[6O]p-6 [6u] 
p [6a] 6 [6a]s-[6a] [6p] [6O] 
sd[6s] [6a] [6s] [4f]g-[4f]d[4s]-
[4a] [4p] 4 [%O]-% % 
u % [%a] % [6p]-6 [6u] 
p [6a] 37[6s]-[6s]d[6g] 6 
f 6 [6d] [6f] [4s]-4 4 
a 4 [4s] 4 [%O]-% % 
s [%a] [%O] [%a] [6p]-[680] [6u] 
p [6a] [68] [6s]-[6a] [680p] [6O] 
d [6s] [680a] [6s]5[4g]-[468f]d[4s]-
[4a] [46p] 4 [%O]-[%70] % 
u % [%a]%% [6p]-6 [6u] 
p [6a] 6 [6s]-[6s]d[6g] 6 
f 6 [6d] [6f] [4s]-4 4 
a 4 [4s] 4 [%O]-% % 
s [%a] [%O] [%a] [6p]-[68s] [6p]-
[6s] [68p] [68s] p 6 [68s] p 
[6a] o [68p] i [5u]-i[79] [5u] 
o 5 [79p] [79i] p 5 [79]-
[5a]-[79]-[4s] a [68o] [4a]4
[4g] [4f] [68d] [4s] [4a]-[468] [46s]-
4 [4h] 4 [5d]-[57] 5-
5 [57f] [2d]5[5s] 5a5 [5s] 
[%d]s[%a]s[%d]s[%a]s[6p]-[68s] [6p]-
[6s] [68p] [68s] p 6 [68s] p 
[6a] o [68p] i [5u]-i[79] [5u] 
o 5 [79p] [79i] p 5 [79]-
[5a]-9737[4s] a [68o] [4a]4
[4g] [4f] [68d] [4s] [4a]-[468] [46s]-
4 [4h] 4 [5d]-[57] 5-
5 [57f] [2d]5[5s] 5a5 [5s] 
[%d][@s][%a]s[%d]s[%a]s[6s]apu[68s]a[6p]u
[6d]sao[68d]s[6a][7o][%h]-g[79] [%f] 
[%f] d [79s] %6[$a]-[68] [$o]k
[$sl] [hv] [68fx] $5[7dz] [sl] [79ak] [7ak] 
[7s]ao [79u] 71[6s]apu[80s]a[6p]u
[6d]sao[68d]s[6a][7o][%h]-g[79] [%f] 
[%f] d [79s] %6[$a]-[68] [$o]a
[$s] h [68f] $5[1d] s [79a] [1a] 
[1s]ao [80u] 12[6j]-[80] 6 
k 666-[6z]-[80l] 6 
k 66[6h]-[5f]-[79] 5-
555-[5h] j [79h] [5f] 
h 555-[4l]-[68z] 4 
l 44[4k]-[4h]-[68] 4 
d 444-[3f]-[57d] 3 
f 33[3d]-[3s]-[57] 3 
[3d]-[57] 3$[6j]-[80] 6 
k 666-[6z]-[80l] 6 
k 66[6h]-[5f]-[79] 5-
555-[5h] j [79h] [5f] 
h 555-[4l]-[68z] 4 
l 44[4k]-[4h]-[68] 4 
d 444-[3sf]-[57ad] 3 
[fh] 33[3dk]akaj p H O 
GgfDdSsaPpOoIi[uf]-[6pj] [6sl]h[80pj] [6pj]6
[%OH] [%ak]f[79OH] [%OH]%[5oh] [5pl]f[57oh] [$oh] 
[IG] [$a][sl][79I][ak][$s]5[6pj] [6sl]h[80pj] [6pj]6
[%Oh] [%ak]f[O79h] [%Oh]%[5oh] [5pl]f[57oh] [$oh] 
[$I] [$a]s[79I]a[$s]5[6fj] [6l]h[80j] [6fj]6
[d%H] [%k]f[79H] [d%H]%[5fh] [5j]f[57h] [$fh] 
[dG] [$dk][fl][79dG][fk][$dl]5[6fj] [6l]h[80j] [6fj]6
[d%H] [%k]f[79H] [d%H]%[5fh] [5l]f[57h] [$fh] 
d [$d]f[Qd][9f][7d]5[6pf]s[6p][sh][80p]s[6pf][6s]
[%Od]a[%O][af][79O]a[%Od][%a][5of]s[5o][sf][57o]s[$of]s
[Id]a[$Id][af][I79d][af][$Id][5a][6pf]s[6p][sh][80p]s[6pf][6s]
[%Od]a[%O][af][79O]a[%Od][%a][5of]s[5o][sf][57o]s[$of]s
[od]S[$od][Sf][79od][Sf][$od][5S][6pf]S[6p][Sh][80p]S[6pf][6S]
[%Od]a[%O][af][79O]a[%Od][%a][5of]s[5o][sf][57o]s[$of]s
[Id]a[$Id][af][I79d][af][$Id]a[6pf]s[6p][sh][80p]s[6pf][6s]
[%Od]a[%O][af][79O]a[%Od][%a][5j] [5H] [57h]H[Qh]G
[9g] [8f]7[6D]5[$f] [6p] p [6a] [6s] 
p [6u]6[6p] u [6t]-[6r]-
[6t]-[6w] r [4w]-[68e] 4 
r 44[4y]-[4t] e [68t]e[4t] 
sa[4o][4u][4y]trt[4p]-p4 [4p] 
o 4[4o]4 o [4u] y [68t] [4r] 
t 4[4r]4 e [%t] r [%t] [%o] 
i [6u]6[6y]-[6t] e [6t]etu
sa[6s][6d][6s]apa[6p] p [6a] [6s] 
p [6u]6[6p] u [6t]-[6r]-
[6t]-[6w] r [4w]-[68e] 4 
r 44[4y]-[4t] e [68t]e[4t] 
sa[4o][4u][4y]trt[4p]-p4 [4p] 
o 4[4o]4 o [4u] y [68t] [4r] 
t 4[4r]4 e [4t] a [4s] [4h] 
g [4f]4[4d]-[5s] p [5s]p[5s]f
[%l]klz[%j] [%h] [6pf]s[6p][sh][80p]s[6pf][6s]
[%Od]a[%O][af][79O]a[%Od][%a][5of]s[5o][sf][57o]s[$of]s
[Id]a[$Id][af][I79d][af][$Id]a[6pf]s[6p][sh][80p]s[6pf][6s]
[%Od]a[%O][af][79O]a[%Od][%a][5of]s[5o][sf][57o]s[$of]s
[od]S[$od][Sf][79od][Sf][$od]S[6pf]S[6p][Sh][80p]S[6pf][6S]
[%Od]a[%O][af][79O]a[%Od][%a][5of]s[5o][sf][57o]s[$of]s
[Id]a[$Id][af][I7d][$af][I5d]a[6pf]s[6p][sh][80p]s[6pf][6s]
[%Od]a[%O][af][79O]a[%Od][%a][5of]s[5o][sf][57o]s[$of]s
[$Id]a[$Id][af][I79d][af][$Id]a[6pf]s[6p][sh][80p]s[6pf][6s]
[%Od]a[%O][af][79O]a[%Od][%a][5of]s[5o][sf][57o]s[$of]s
[Id]a[$Id][af][I7d][$af][I5d]a[6pf]s[6p][sh][80p]s[6pf][6s]
[%Od]a[%O][af][79O]a[%Od][%a][5of]s[5o][sf][57o]s[Qof][7s]
[QId][7a][$Id][af][I79d][af][$Id]a[6pf]s[6p][sh][80p]s[6pf][6s]
[WOd][(a][%O][af][7(O]a[%Od][%a][5of]s[5o][sf][57o]s[$of]s
[$d] [$d]f[79d]f[$d] [6f] 6h6 [68f] 
[5d] 5f5 [57d] [$f] $f$ [$6f] 
[QId]a[$Id][af][I79d][af][$Id]a6 6 [80] 66
6 6 [80] 6 6 6 [80] 66
pute086 ]]

UseShiftKeys()

end) 

GameOST2:Button("Elevator Jam - Doors OST",  function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 120 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ [(D]-[QEGJ]-[(D] [QEGJ]-[(D]-
[QEGJ]-[(D] [(D]-[QEGJ]-
[*S]-[qgWH]-[*S] [qgWH]-[*S]-
[qgWH]-[*S] [*S]-[qgWH]-
[7a]-[(QDG]-[7a] [(QDG]-[7a]-
[(QDG]-[7a] [7a]-[(QDG]-
[^P]-[9dWH]-[^P] [9dWH]-[^P]-
[9qdg]-[^P] [^P] D [9qG] H 
[(J]-[QE]-( [QE]-(-
[QEH]-[(G]g[(H]-[QEG]-
[*g]Dg [qW]-* [qW]-*-
[qWG]-[*g]D[*G]-[Wqg]-
[7D]Sa [(Q]-7 [(Q]-7-
[(Q]-7 7 a [(QS] D 
[^g]-[9W]-[^H] [9W]-[^G]-
[9q]-^ [^d]-[9q]-
[(D]-[QE]-( [Qt]-E-
[QT]-( q ^ q-
Q ]]

UseShiftKeys()

end)

GameOST2:Button("FNAF 2 song - The Living Tombstone",  function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 62 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [^g] [WT] * [WTD] 8 [et] ( [etD] 
[^D] [WT] * [WTS] [8D] [et] ( [etS] 
[^S] [WT] * [WTsl] [8PJ] [et] ( [etsl] 
[^SL] [WT] * [WTDZ] [8sl] [et] [(pj] [et] 
[q^*E]ii iii Y----
TY i TY TE--T
[^*Eqi] I i TY[(68e]Yi I iY
[q^*E] T----TO
[q^*E] i YT O[8%(W] i YT P
[q^*E] O [9q^EI]i I[^(QE]iT-Ti
[q^*E] I iT Y[(68e]Yi I iY
[q^*E] T--^^^^^^^
^iii[*Eqi]i Y[!*] W [qET] WT
^TY [*Eqi] TY[!*]TE [qET] TY
^iI [*Eqi] TY4iI [8qei] YY
^T-[q*E]-4-[q*E] TO
^ i [q*EY]T O% i [8(WY]T P
2 O [9qEI]i I@iT [^*q] Ti
4 I [(8qei]T Y6Yi [8qe(I] iY 
T--[^E][^E][^E][^E][^E][^EPJ][^E]
[^SL?] [q^*E] [^DZ?] [^*Eqsl] 4 [8qet] 4 [8qetPJ] 
[!SL] [q*WTPJ] [!ak][PJ][q*WT][dz]2 [9qyWPJ] [2ak][PJ][W9qy][OH]
@ [^(QEIG] @[IG][^(QEIG][ig]4 [8qetIG] [4ig] [8qetYD][YD]
[^?] [q^*ETS] [^?] [q^*E] 4 [8qet] 4 [8qetPJ] 
[^SL?] [q^*E] [^DZ?] [^*Eqsl] 4 [8qet] 4[PJ][8qetsl][SL]
![SL][q*WTPJ] [!ak][PJ][q*WT][dz]2 [9qyWPJ] [2ak][PJ][W9qy][OH]
@ [^(QEIG] @[IG][^(QEIG][ig]4 [8qetIG] [4ig] [8qetYD][YD]
[^?] [q^*ETS] [^?] [q^*E] 4 [8qet] 4 [8qet] 
[^P?]S[*Eqg]P[^S]g[q*EP]p[%O]s[8(WG]O[%s]G[8(WD]s
[!S]g[q*WTH]S[!g]H[q*WTD]S[4s]D[8et(H]S[4J] [8et(H]S
[^P?]S[*Eqg]P[^S]g[q*EP]p[%O]s[8(WG]O[%s]G[8(WD]s
[!S]g[q*WTH]S[!g]H[q*WTD]S[4s]D[8et(H]s[4D]H[8et(D]S
[^P?]S[*Eqg]P[^S]g[q*EP]p[%O]s[8(WG]O[%s]G[8(WD]s
[!S]g[q*WTH]S[!g]H[q*WTD]S[4s]D[8et(H]l[4L]l[8et(H]D
[^P?]S[*Eqg]P[^S]g[q*EP]p[%O]s[8(WG]O[%s]G[8(WD]s
[!S]g[q*WTH]S[!g]H[q*WTD]S[48s]-[qi]-
[q^*E]iiiiiiY-W-WT 
TY i TY TE-EY
[q^*E]iI iT Y[68qe]iI i YY
[q^*E] T----T 
[q^*EO] i YT O[8%(W] i YT P
[E9qy]PO [9qyWI]IiI[(QEY]iT-TY
[q^*E]iI iT Y[68qe] I i YY
[q^*E] T--[^E][^E][^E][^E][^E][^E][^E]
^iii[*Eqi]i Y[!*] W [qET] WT
^TY [*Eqi] TY[!*]TE [qET] TY
^iI [*Eqi] TY4iI [8qei] YY
^T-[q*E]-4-[q*E] TO
^ i [q*EY]T O% i [8(WY]T P
2 O [9qEI]i I@iT [^*q] Ti
4 I [(8qei]T Y6Yi [8qe(I] iY 
T--[^E][^E][^E][^E][^E][^EPJ][^E]
[^SL?] [q^*E] [^DZ?] [^*Eqsl] 4 [8qet] 4 [8qetPJ] 
[!SL] [q*WTPJ] [!ak][PJ][q*WT][dz]2 [9qyWPJ] [2ak][PJ][W9qy][OH]
@ [^(QEIG] @[IG][^(QEIG][ig]4 [8qetIG] [4ig] [8qetYD][YD]
[^?] [q^*ETS] [^?] [q^*E] 4 [8qet] 4 [8qetPJ] 
[^SL?] [q^*E] [^DZ?] [^*Eqsl] 4 [8qet] 4[PJ][8qetsl][SL]
![SL][q*WTPJ] [!ak][PJ][q*WT][dz]2 [9qyWPJ] [2ak][PJ][W9qy][OH]
@ [^(QEIG] @[IG][^(QEIG][ig]4 [8qetIG] [4ig] [8qetYD][YD]
^ [q*ETS] ^ [q*E]----
[q^*E] T i E T i--
[Q7r] T i [Q7r] T O [*W]-[^E][%W]
[$*QI] P S I [6ep] D--
[%qi] O S i [6qY] T 
[q^*E] T i E [Tsl] i [PJ]-
[$Q7r] T i r [Tsl] O [OH]-
[$*QI] P S I [Q6psl] D [OH]-
[!*OH][PJ]O S i Y T t T ]]

    UseShiftKeys()

end) 

GameOST2:Button("FNAF 1 Song - The Living Tombstone", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 60 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ [k?]-L-kH-H-
H-GH-jH--j-
G-kH--f-
S-GD-[%(]-[*W] 
f[*W]D [*WS] [0ra] f[0r]O [0ra]S[60a] 
p[60]O [60I] [*WO] T[*W]u [*W] [60I] 
p[60]O [60I] [*WO] T[*W]u [*Wu] [60I] 
p[60]O [60I] [%(u] Y[%(]T [%(Y] [*W] 
f[*W]D [*WS] [0ra] f[0r]O [0ra]S[60a] 
p[60]O [60I] [*WO] T[*W]u [*W] [60I] 
p[60]O [60I] [*WO] T[*W]u [*Wu] [60I] 
p[60]O [60I] [%(O] a s-[*W] 
H[*W]HGf[0rG]f [0rH] [0rH]Gf[60G]f 
[60H] [60H]GfG[%(H]jH[%(f]-[%(] [60] 
f[60]fS[60a]a[0r] f[0r]fS[0ra]a[60] 
f[60]fS[60f]G[%(D] S fD [*W] [*W]
H [*WH]Gf[0rG] f[0rH] [0rH]Gf[60G] f
[60H] [60H]GfG[%(H]jH[%(f]-[%(] [60] 
f[60]fS[60a]a[0r] f[0r]fS[0ra]a[60] 
f[60]fS[60f]G[%(D] H j H [*WG]-
[*Wf]-[0r]-[0r]-S[60f] 
fS[60f]G H[%(] H [%(j] H [*WG]-
f[*W] S [0r]-[0r]-S[60f] 
fS[60f]G D[%(] H [%(j] H [*WG]-
[*Wf]-[0r]-[0r]-S[60f] 
fS[60f]G H[%(] H [%(j] H [*WG]-
f[*W] S [0r]-[0r]-S[60f] 
fS[60f]G [%(D]----[*W]-
[*W]-[0r]-[0r]-[60]-
[60]-[%(]-[%(]-[*WS]-
[*WS]-[0rf]-[0rH]-[60p]-
[60p]-[%(O]--[*W] 
f[*W]D [*WS] [0ra] f[0r]O [0ra]S[60a] 
p[60]O [60I] [*WO] T[*W]u [*W] [60I] 
p[60]O [60I] [*WO] T[*W]u [*Wu] [60I] 
p[60]O [60I] [%(u] Y[%(]T [%(Y] [*W] 
f[*W]D [*WS] [0ra] f[0r]O [0ra]S[60a] 
p[60]O [60I] [*WO] T[*W]u [*W] [60I] 
p[60]O [60I] [*WO] T[*W]u [*Wu] [60I] 
p[60]O [60I] [%(O] a s-[*W] 
H[*W]HGf[0rG]f [0rH] [0rH]Gf[60G]f 
[60H] [60H]GfG[%(H]jH[%(f]-[%(] [60] 
f[60]fS[60a]a[0r] f[0r]fS[0ra]a[60] 
f[60]fS[60f]G[%(D] S fD [*W] [*W]
H [*WH]Gf[0rG] f[0rH] [0rH]Gf[60G] f
[60H] [60H]GfG[%(H]jH[%(f]-[%(] [60] 
f[60]fS[60a]a[0r] f[0r]fS[0ra]a[60] 
f[60]fS[60f]G[%(D] H j H [*WG]-
[*Wf]-[0r]-[0r]-S[60f] 
fS[60f]G H[%(] H [%(j] H [*WG]-
f[*W] S [0r]-[0r]-S[60f] 
fS[60f]G D[%(] H [%(j] H [*WG]-
[*Wf]-[0r]-[0r]-S[60f] 
fS[60f]G H[%(] H [%(j] H [*WG]-
f[*W] S [0r]-[0r]-S[60f] 
fS[60f]G [%(D]----[*W]-
[*W]-[0r]-[0r]-[60]-
[60]-[%(]-[%(]-[*WS]-
[*WS]-[0rf]-[0rH]-[60j]-
[60j]-[%(H]--[*W] ]]

UseShiftKeys()

end) 

GameOST2:Button("Among us drip (meme)", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 47 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ [18]-s D g G g D 
s--Pds--5 
[18]-s D g G g D 
G--GgD[8tG]gD
[18]-s D g [18G] g D 
[18s]--Pds [18]-^5 
[18]-s D g [@(G] g D 
[$QG]-[$Q]-[$Q]G[$Q]g[$Q]D[@(G]g[18]D
[18]-s D g G g D 
s--Pds--5 
[18]-s D g G [8tg] D 
G----
[18]-s D g [18G] g D 
[18s]--Pds [18]-^5 
[18]-s D g [@(G] g D 
[$QG]-[$Q]-[$Q]G[$Q]g[$Q]D[@(G]g[18]D
t-t Y i I [18i] Y 
[18t]--Eyt [18]-^5 
[18]-t Y i [@(I] i Y 
[18G]-[18]-[18G]g[18]D[18G][18g][8tD]
[18]-s D g [18G] g D 
[18s]--Pds [18]-^5 
[18]-s D g [@(G] g D 
[$QG]-[$Q]-[$Q]G[$Q]g[$Q]D[@(G]g[18]D
[18]-[ts] [YD] [ig] [IG] [ig] [YD] 
[ts]--[EP][yd][ts]--5 
[18]-[ts] [YD] [ig] [IG] [ig] [YD] 
[IG]--[IG][ig][YD][IG][ig][YD]
[ts] ]]

UseShiftKeys()

end)

GameOST2:Button("Undertale - Fallen Down", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 60 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [yG] [IS] [pG] [IS] [pG] [IS]
[yG] [IS] [pG] [IS] [pG] [IS]
[ra] [Yp] [IS] Y [Ip] [Ya]
[rf] [YD] [If] [YG] [ID] [Ya]
[wG] [ra] [yG] [ra] [yG] [ra]
[wG] [EP] [yG] [EP] [yh] E
[yG] [Id] [pG] [Id] [pf] [IG]
[Tf] u [pd] u [pS] u
[yG] [IS] [pG] [IS] [pG] [IS]
[yG] [IS] [pG] [IS] [pG] [IS]
[ra] [Yp] [IS] Y [Ip] [Ya]
[rf] [YD] [If] [YG] [ID] [Ya]
[wG] [ra] [yG] [ra] [yG] [ra]
[wG] [EP] [yG] [EP] [yh] E
[yG] [Id] [pG] [Id] [pf] [IG]
[TS] I [pG] I [pS] u
[od] y o [yp] [oa] [IS]
[ud] T [IS] e [rd] T
[up] I T [Ia] [Tp] [wo]
[eI] T [IG] y [of] I
[rd] y I [yp] [Ia] [rS]
[ed] T [uS] T [Id] P
[aG] I u [rh] [yG] [of]
[pd] I [uf] y [uS] I
[od] y o [yp] [oa] [IS]
[ud] T [IS] e [rd] T
[up] I T [Ia] [Tp] [wo]
[eI] T [IG] y [of] I
[rd] y I [yp] [Ia] [rS]
[ed] T [uS] T [Id] P
[aG] [Id] [aG] [Id] [af] [IG]
[pf] u [pd] u [pS] u
[yp] [Ip] [Ip] [yj] [Ip] [Ip]
[Tf] [up] [up] T [up] [up]
[rd] [yI] [yI] [rj] [yI] [yI]
[ep] [Tu] [Tu] e [Tu] [Tu]
[wp] [ry] [ry] [wd] [ry] [ry]
[Qj] [ey] [ey] Q [ey] [eyk]
[0j] [wr] [wr] [0f] [wr] [wr]
[ed] [Tu] [Tu] e [Tu] [Tu]
[yp] [Ip] [Ip] [yj] [Ip] [Ip]
[Tf] [up] [up] T [up] [up]
[rd] [yI] [yI] [rj] [yI] [yI]
[ep] [Tu] [Tu] e [Tu] [Tu]
[wp] [ry] [ry] [wd] [ry] [ry]
[Qj] [ey] [ey] Q [ey] [eyk]
[0j] [wr] [wr] [0f] [wr] [wr]
[ed] [Tu] [Tu] e [Tu] [Tu]
[wp] [ry] [ry] [wj] [ry] [ryG]
[wf] [ry] [ryd] [wS] [ry] [ryd]
[Qf] [eT] [eT] [QL] [Tel] [Tek]
[Qj] [eT] [eT] Q [eT] [eT]
[0a] [wr] [wr] [0j] [wr] [wrG]
[ef] [Tu] [Tud] [ef] [Tu] [uTG]
[ES] [Tu] [Tu] [Ef] [Tu] [Tu]
[rf] [yI] [Ipd] [eS] [Tu] [upd]
[wp] [ry] [ry] [wj] [ry] [ryG]
[wf] [ry] [ryd] [wS] [ry] [ryd]
[Qf] [eT] [eT] [QL] [Tel] [Tek]
[Qj] [eT] [eT] Q [eT] [eT]
[0a] [wr] [wr] [0j] [wr] [wrG]
[ef] [Tu] [Tud] [ef] [Tu] [uTG]
[ES] [Tu] [Tu] [Ef] [Tu] [Tu]
[rf] [yI] [Ipd] [eS] [Tu] [upd]
[9p] y u y
W y u y
w y u o
[9I] u y e
[9p] y u y
W y u y
w y u o
[9I] u y e
[wp] y u y
e y u I u
[ey] ]]
 UseShiftKeys()

    end)
    
GameOST2:Button("Megalovania", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for Rondo Alla Turca by Wolfgang Amadeus Mozart

    
    shared.tempo = 60 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ 99y e-W w q 9qw
88y e-W w q 9qw
77y e-W w q 9qw
^^y e-W w q 9qw
[29]9y e-W w q 9qw
[18]8y e-W w q 9qw
77y e-W w q 9qw
^^y e-[1W] w q 9qw
[2y]y[9d] [2p] 9[2O] [2o]9[2i]2[2y][9i]o
[1t]t[8d] [1p] 8[1O] [1o]8[1i]1[1y][8i]o
[7r]r[7d] [7p] 7[7O] [7o]7[7i]7[7y][7i]o
[^E]E[^d] [^p] ^[1O] [1o]8[1i]1[1y][8i]o
[2y]y[9d] [2p] 9[2O] [2o]9[2i]2[2y][9i]o
[1t]t[8d] [1p] 8[1O] [1o]8[1i]1[1y][8i]o
[7r]r[7d] [7p] 7[7O] [7o]7[7i]7[7y][7i]o
[^E]E[^d] [^p] ^[1O] [1o]8[1i]1[1y][8i]o
[2g] [9g]g2g9[2g] [2d]9[2d]229
[1g] [8g]g1h8[1H] [1H]h[8g][1d][1g][1h]8
[7g] [7g]g7h7[7H] [7j]7[7l]7[7j]7
[^z] [^z] [^z]j[^z][1l] 181[1lv]18
[2gj] [9gj][gj]2[gj]9[2gj] [2dh]9[2dh]229
[1gj] [8gj][gj]1[gj]8[1dh] [1gj]8[1jz]1[1gj][8dh]
[7kz]h[7dj]f[7gh]d[7ag][7d]l[7d][7ah][7d][7ag][7o][7af]o
[^P] [^s]d^g^[1fl] 181118
^ ^ ^ ^^g[^d][^g][^h][^H][^h][^g]d
[1j]hgd[8g] [1h] 81 1811[1H]8j
[2l] [9j]H[2h]g[9d][2g]h2[9H]2[2j]2[9l]
[!L] [*H] [!H]h[*g][@h] @(@@@(
[^yi] [^uo] [^ip] [^dg]^[sf]^^^[^pd]^^
[1of] 8 [1pg] 81[sh]181[1pf]18
[2dj] 9 2 92j[2H][9h][2G][2g][2f][9D]d
[!OS] * ! *@[PD]@(@@@(
^ ^ ^ ^^g[^d][^g][^h][^H][^h][^g]d
[1j]hgd[8g] [1h] 81 1811[1H]8j
[2l] [9j]H[2h]g[9d][2g]h2[9H]2[2j]2[9l]
[!L] [*H] [!H]h[*g][@h] @(@@@(
[^yi] [^uo] [^ip] [^dg]^[sf]^^^[^pd]^^
[1of] 8 [1pg] 81[sh]181[1pf]18
[2dj] 9 2 92j[2H][9h][2G][2g][2f][9D]d
[!OS] * ! *@[PD]@(@@@(
[^E] ^ ^ ^^ ^^^[^i]^^
[1u] 1 8 11y181118
[7i] 7 7 77 777777
7 7 7 77 777777
[^E] ^ ^ ^^ ^^^[^i]^^
[1u] 1 8 11y181118
[2y] 2 9 22 292229
2 2 9 22 292229
[^E]E[^d] [^p] ^[^O] [^o]^[^i]^[^y][^i]o
[1t]t[1d] [8p] 1[1O] [1o]8[1i]1[1y][8i]o
[7y]y[7d] [7p] 7[7O] [7o]7[7i]7[7y][7i]o
[7y]y[7d] [7p] 7[7O] [7o]7[7i]7[7y][7i]o
[^E]E[^d] [^p] ^[^O] [^o]^[^i]^[^y][^i]o
[1t]t[1d] [8p] 1[1O] [1o]8[1i]1[1y][8i]o
[269]9[26yi] [26eu]-[W26t] [26wu] [26qy] [269w][26qe][26wt]
[269]9[26yi] [26eu]-[W26t] [26wu] [26qy] [269w][26qe][26wt]
[q^E] [q^E] [q^E] ^[q^E] [q^E]^[q^E]^^[^Eqi]
[1wt] [8wt] [1wt] 8[1wt] [1wt]8[1wt]11[8wt]
[2ey] [9ey] [2ey] 9[!WT] [!WT]*[!WT]!![*WT]
[1wt] [8wt] [1wt] 8[Q7r] [Q7r]7[Q7r]77[Q7r]
[q^E] [q^E] [q^E] ^[q^E] [q^E]^[q^E]^^[^Eqi]
[1wt] [8wt] [1wt] 8[1wt] [1wt]8[1wt]11[8wt]
[2ey] [9ey] [2ey] 9[2ey] [2ey]9[2ey]22[9ey]
[2ey] [9ey] [2ey] 9[2ey] [2ey]9[2ey]22[9ey]
[q^E] [q^E] [q^E] ^[q^E] [q^E]^[q^E]^^[^Eqi]
[1wt] [8wt] [1wt] 8[1wt] [1wt]8[1wt]11[8wt]
[2ey] [9ey] [2ey] 9[!WT] [!WT]*[!WT]!![*WT]
[1wt] [8wt] [1wt] 8[Q7r] [Q7r]7[Q7r]77[Q7r]
[q^E] [q^E] [q^E] ^[q^E] [q^E]^[q^E]^^[^Eqi]
[1wt] [8wt] [1wt] 8[1wt] [1wt]8[1wt]11[8wt]
[2y]y[9d] [2p] 9[2O] [2o]9[2i]2[2y][9i]o
[2y]y[9d] [2p] 9[2O] [2o]9[2i]2[2y][9i]o
^^y e-W w q 9qw
88y e-W w q 9qw
99y e-W w q 9qw
99y e-W w q 9qw
^^y e-W w q 9qw
88y e-W w q 9qw
[29]9[2yi] [2eu]-[W2t] [2wu] [2qy] [29w][2qe][2wt]
[29]9[2yi] [2eu]-[W2t] [2wu] [2qy] [29w][2qe][2wt]
[269yd]--[29dgjz] ]]

    UseShiftKeys()

    end)
    
GameOST2:Button("It's Raining Tacos", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 55 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ s s d f 8 [to] 8 t 8 t 8 [tf] [d5] [ws] [d5] [wa] 5 w 5 w [s6] e [u6] e 6 e 6 [se] [a3] [p0] [a3] [a0] 3 0 3 [o0] [p4] [qo] [p4] [sq] 4 q [g4] q [f1] 8 [f1] [s8] 1 8 1 8 4 q [g4] q [g4] q [f4] [qf] 5 [wd] [s5] w [s5] w [d5] [wf] 8 [to] 8 t 8 t 8 t [d5] [ws] [d5] [wa] 5 [wh] h [l5] [wh] [s6] e [u6] e 6 e 6 e [a3] [p0] [a3] [a0] 3 [h0] h [l3] [h0] [p4] [qo] [p4] [sq] 4 q 4 q [f1] 8 [f1] [s8] 1 [h8] h [l1] [h8] 4 q [g4] q [g4] q [f4] [qf] 5 [wd] 5 w [s5] w [d5] w [f6] e [f6] e [f6] [ge] [f6] [ed] 5 w [f5] w [f5] w [f5] [wg] 4 q 4 q 4 [qf] [g4] [qf] 8 t 8 t [s8] t [d8] t [f6] e [f6] e [f6] [ge] [f6] [ed] 5 w [f5] [wf] [f5] [wf] 5 [wg] 4 q 4 q 4 [qf] [g4] [qh] 5 w 5 w 5 [wf] [d5] [ws] 8 t 8 t 8 t 8 t 5 w 5 w 5 w 5 w 6 e 6 6 e 6 6 e 6 6 e 6 3 0 3 0 3 0 3 0 4 q 4 q 4 q 4 q 8 t 8 t 8 t 8 t 4 q 4 q 4 q 4 q 5 w 5 w 5 w 5 w 5 s s d f t [uo] o s f s o u w r y o a o [ya] [sr] e [ut] u p s p u t 0 w r u [of] u [rf] [wg] q [se] t i p i t e 8 0 w t u t w 0 q e [tg] i [pg] i [tf] [fe] w [rd] [ys] o [sa] o [yd] [rf] 8 [to] 8 t 8 t 8 t 5 w 5 w [a5] w [a5] [ws] 6 [ue] 6 e 6 e 6 e 3 0 3 0 [f3] 0 [f3] [g0] 4 [sq] 4 q 4 q 4 q 1 8 1 8 1 8 1 8 4 q [g4] q [g4] q [f4] [qf] 5 [wd] [h5] w [h5] w [h5] [wh] 8 f ]]

    UseShiftKeys()

    end)
    
local Seasonal = win:Tab('Seasonal Songs')
local Seasonal2 = Seasonal:Section('Christmas | Halloween')

Seasonal2:Button("Snowfall - Øneheart & reidenshi",  function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 75 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ y[ip][sf]--f--
f--f|s--
f|s--f--
f--g|ld
Po-g|l--g|J|
dPi-g|J--g|j|
p[yi]-g|j--f|s|
f|s|f|s|f-s|o|
[8qp]4|[8i]|[qp]|[ei]|p|i|[tp]|[eP]|
[5p]|[9P]|[wp]|[EP]|p|P|[ys]|[Ei]|
[2u]|[6i]|[9us]|[qi]|u|i|[ef]|[qs]|
f|s|f|s--s|p|
[^4p]^|[4i]|[^p]|[9i]|p|i|[qp]|[9P]|
[1p]|[5P]|[8p]|[0P]|p|P|[ws]|[0i]|
[5u]|[9i]|[wu]|[Ei]|u|i|f|s|
[269f]|s|f|s|f-s|o|
[8qp]4|[8i]|[qp]|[ei]|p|i|[tp]|[eP]|
[5p]|[9P]|[wp]|[EP]|p|P|[ys]|[Ei]|
[2u]|[6i]|[9us]|[qi]|u|i|[ef]|[qs]|
f|s|f|s|f-s|p|
[^4p]^|[4i]|[^p]|[9i]|p|i|[qp]|[9P]|
[1p]|[5P]|[8p]|[0P]|p|P|[ws]|[0i]|
[5u]|[9i]|[wu]|[Ei]|u|i|f|s|
[269f]|s|f|s|f-s|o|
[8qp]4|[8i]|[qp]|[ei]|p|i|[tp]|[eP]|
[5p]|[9P]|[wp]|[EP]|p|P|[ys]|[Ei]|
[2u]|[6i]|[9us]|[qi]|u|i|[ef]|[qs]|
f|s|f|s--s|p|
[^4p]^|[4i]|[^p]|[9i]|p|i|[qp]|[9P]|
[1p]|[5P]|[8p]|[0P]|p|P|[ws]|[0i]|
[5u]|[9i]|[wu]|[Ei]|u|i|f|s|
[269f]|s|f|s|f-s|o|
[8qp]4|[8i]|[qp]|[ei]|p|i|[tp]|[eP]|
[5p]|[9P]|[wp]|[EP]|p|P|[ys]|[Ei]|
[2u]|[6i]|[9us]|[qi]|u|i|[ef]|[qs]|
f|s|f|s--s|p|
[^4p]^|[4i]|[^p]|[9i]|p|i|[qp]|[9P]|
[1p]|[5P]|[8p]|[0P]|p|P|[ws]|[0i]|
[5u]|[9i]|[wu]|[Ei]|u|i|f|s|
[269f]|s|f|s|f-s|o|
[8qp]4|[8i]|[qp]|[ei]|p|i|[tp]|[eP]|
[5p]|[9P]|[wp]|[EP]|p|P|[ys]|[Ei]|
[2u]|[6i]|[9us]|[qi]|u|i|[ef]|[qs]|
f|s|f|s--g|l--
g|l--g|J--
g|J--g|j--
g|j--g|j ]]

UseShiftKeys()

end)

Seasonal2:Button("All i want for christmas is you",  function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 40 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ h k z C [fv] 
C z k [sh] l z v [dz]----
op59wr-o----
a d G h Gfd
f-d-79wy j-h
h G h Gfdaf d-8
wtu-fh j k j hd
f-(wtok zjh h hj 
h-D 9 ryo h jG 
h f G [7f]etID-0 ruo
k-jkjh G f G f(wto
D-9 ryod-fdh 
z 0rylOzl uOfHxx-[etuok]-
kjhfh-f-9 tYo
D--[sj]----
h-
[adh][adh][adh][oadh][adh][adh][yadh][adh][adh][radh][adh][adh][uafh][afh][afh][rafh][afh][afh][wafh][afh][afh][0afh][afh][afh]
[tsfh][sfh][sfh][wsfh][sfh][sfh][0sfh][sfh][sfh][8sfh][sfh][sfh] [29yd][29yd][29yd][29yd][29yd][29v]cxzmnbvcxzlkjhgfds
[5o]w[5ryoa]w[5od]w[5ryaG][wah]5[waG][5ry][waf]5[wad][5ry]w
[5aj]w[5ryah]w[5ah][waG][5ry][wah]5[wraG]6[etaf][^ad][ET]7[ry]
[18]w[18tusf]w[18sh]w[18tusj][wsk][18][wsj][18tu][wsh][18][wsf][18tu][29w]
[@(s]w[ts@(YD][wsh][@(]w[@(Ytsj][wsJ][@(][wsj][t@(Y][wsg][@(][wsD][t@(Y]w
[5aj]w[5ryah][waG]5w[5ryaG][wah]5[waG][5ry][waf]5[wad][5ry]w
[5o]w[5ryoa][wod]5[woG][5ry][wah]5[wraG]6[etaf][^ad][ET]7[ry]
[18]w[18tufk][wfk][18fk]w[18tufj][wfk][18][wfj][18tu][wfh][18][wf][18tu][29]
[@(s]w[ts@(YD][wsh][@(]w[@(Ytsj][wsJ][@(][wsj][t@(Y][wsg][@(][wsD][t@(Y]w
[5ah]w[5ryaj]w[5aG]w[5ryah][waf]5[waG][5ry][wsD]7Q[7eY]Q
[30ah]w[30ruaj]w[30aG]w[30ruah][waf][30][waG][30ru][wsD][@(]w[t@(Y]w
[29ad]w[29ryaf]w[29ah][wdz][29ry][wfl][30][Wfz][30ryfl]W[30]W[%ry]W
[6sk]w[6tusj]w[6sh]w[6tusf]w[29sD]w[Y29tsj]w[29]w[Y29tsk]w
[5aj][wah][5ry]w5w[5ry]w3w[3ru]w3w[3ru]w
[6hk]e[6tu]e6[ekz][6tuhk]e[hk][29y][29y][G29yj][29y][29yfh][29y][Gj]
[5ak]w[5ryaj]w[5ah][waG][5ryaG][wah]5[waG][5ry][waf]5[wad][5ry]w
[5aj]w[5ryah][waG]5w[5ryaG][wah]5[wraG]6[etaf][^ad][ET]7[ry]
[18]w[18tufz][wfk][18fj][wfj][18tu][wfk][18][wfx][18tu][wfh][18][wfh][18tu][29]
[@(Dk]w[@(YDtz][Dwh][@(]w[@(YDth][Dwj][@(][Dwh][t@(Y][wsD][@(]w[t@(Y]w
[5aj]w[5ryah][waG]5w[5ryaG][wah]5[waG][5ry][waf]5[wad][5ry]w
[5o]w[5ryoa][wod]5[woG][5ry][wah]5[wraG]6[etaf][^ad][ET]7[ry]
[18]w[18tufz][wfk][18fk]w[18tufj][wfk][18][wfx][18tu][wfj][18][wfh][18tu][29]
[@(s]w[ts@(YD][wsh][@(]w[@(Ytsj][wsJ][@(][wsj][t@(Y][wsg][@(][wsD][t@(Y]w
[5ah]w[5ryaj]w[5aG]w[5ryah][waf]5[waG][5ry][wsD]7Q[7eY]Q
[30ak]w[30ruaj][wah][30]w[30ruaG][waf][30][waG][30ru][wsD][@(]w[t@(Y]w
[29ad]w[29ryaf]w[29ah][wdz][29ry][wfl][30][Wfz][30ryfl]W[30][Wl][%ryl][Wz]
[6sk]w[6tusj]w[6sh]w[6tusf]w[29sD]w[Y29tsj]w[29]w[Y29tsk]w
[5aj][wah][5ry]w5w[5ry]w3w[3ru]w3w[3ru]w
[6hk]e[6tu]e6[ekz][6tuhk]e[hk][29y][29y][G29yj][29y][29y][29yz] 
[D7k]7(Qer[D7k]7Q[Dek]r[YDl]77[Dek]rY[IDj]77[QDh]er[YDh]
[3af]70[waG]r[uah]30[waj]ru[oaj]37r[uah]oa30wruo
77(Qer[D7j]7[QDk]er[YDx]77[Dez]rY[IDj]77[QDh]erY
[3fk]70[wfz]r[ufj]30[wfh]ru[ofk]30ruoa30wruo
@8(wt[Yd][@sh]([wsj]tY[osj]@8[(sj]wt[Ysh]@([wsh]tYo
279wr[yd][2dh]9[wdj]ry[ofx]37[9fz]Wr[ufj]30[Wfh]ryO
[6sk]6[8sk][0sk]w[esk][6sk]60[wsk]e[tsk][6sk]6[wsk][esk]t[usk][6sk]6e[tsk]u[osk]
[2fx]9w[tfz]u[ofk][2fz]9[tfk][ufz]o[sfx] [29][29dz][29k][29k]j[29h][29h]jk
[5akn][wd][5ryajb][wd][5ahv][wdGC][5ryaGC][wdhv][5a][wdGC][5rya][wdfx][5a][wdz][5rya][wd]
[5ajb][wd][5ryahv][wdGC][5a][wd][5ryaGC][wdhv][5o][wraGC][6p][etsfx][^P][ETSdz][7a][ryd]
[18s][wf][18tusz][wfkn][18sjb][wfjb][18tus][wfkn][18s][wfx][18tus][wfhv][18s][wfhv][18tus][29f]
[@(skn][wD][@(Ytsz][Dwhv][@(s][wD][@(Ytshv][Dwjb][@(o][Dwhv][@(Yto][wDZ][@(o][wD][@(Yto][wD]
[5ahv][wd][5ryajb][wd][5aGC][wd][5ryahv][wdfx][5a][wdGC][5rya][wdDZ][7I][Qa][7eYI][Qa]
[30akn][wf][30ruakb][wfhv][30a][wf][30ruaGC][wfx][30a][wfGC][30rua][wfDZ][@(o][ws][@(Yto][ws]
[29a][wdx][29rya][kn][wd][29akn][wdz][29rya][wdz][30a][Wf][30ryaxm][Wf][30a][Wf][%ryalm][Wfz]
[6skn][wf][6tusjb][wf][6shv][wf][6tusfx][wf][29psDZ]w[YD29tsjb]w[29]w[29tY]w
2--61@568(w68(wetYope
tYopsDhjb--[ah]oYt
[5oah]9[Irp]9[ruo] [Ip] [0oa]w[ruo]-[Ip] 
[8oa]wr-[ad][oa] [9oa]wyw[Itp]-
[5oa]9[Irp]9[ruo] [Ip] [0oa]w[ruo]-[Ip] 
[8oa]wr-[ad][oa] [9oa]wyw[Itp]-
[whk]y[Gaj]y[afh] [Gj] [uhk]o[afh]-[Gj] 
[thk]oa-[kz][hk] [yhk]odo[Gsj]-
[whk]y[Gaj]y[afh] [YGj]a[uhk]o[afh]-[Gj] 
[thk]oa-[kz][hk] [yhk]osD[Gj]-
hdaoywrw975 ]]

UseShiftKeys()

end) 

Seasonal2:Button("Jingle Bells", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 80 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ [9y]-[ra]-[wp]-[ro]-
[9y]wr----y y 
[9y]-[ra]-[wp]-[ro]-
[0u]wt----
[0u]-[ts]-[wa]-[tp]-
[9I]Qe----
[9d]-[ed]-[Qs]-[ep]-
[9a]wr----
[9y]-[ra]-[wp]-[ro]-
[9y]wr----y y 
[9y]-[ra]-[wp]-[ro]-
[0u]wt----
[0u]-[ts]-[wa]-[tp]-
[9d]Qe-d-d-d-
[9f]-[ed]-[Qs]-[ep]-
[9o]wr----
[woa]-[yoa]-[roa]-y-
[woa]-[yoa]-[roa]-y-
[woa]-d-[ro]-y p 
[woa]-y-r-y-
[eps]-[yps]-[tps]-y [ps] 
[wps]-[oa]-[oa]-[yoa] [oa] 
[Teoa]-p-p-a-
[Iyp]-t-[rd]-e-
[woa]-[yoa]-[roa]-y-
[woa]-[yoa]-[roa]-y-
[woa]-d-[ro]-y p 
[woa]-y-r-y-
[eps]-[yps]-[tps]-y [ps] 
[wps]-[oa]-[oa]-[yoa] [oa] 
[etd]-d-s-p-
[wro]-d-h--
[9y]-[ra]-[wp]-[ro]-
[9y]wr----y y 
[9y]-[ra]-[wp]-[ro]-
[0u]wt----
[0u]-[ts]-[wa]-[tp]-
[9I]Qe----
[9d]-[ed]-[Qs]-[ep]-
[9a]wr----
[9y]-[ra]-[wp]-[ro]-
[9y]wr----y y 
[9y]-[ra]-[wp]-[ro]-
[0u]wt----
[0u]-[ts]-[wa]-[tp]-
[9d]Qe-d-d-d-
[9f]-[ed]-[Qs]-[ep]-
[9o]wr----
[woa]-[yoa]-[roa]-y-
[woa]-[yoa]-[roa]-y-
[woa]-d-[ro]-y p 
[woa]-y-r-y-
[eps]-[yps]-[tps]-y [ps] 
[wps]-[oa]-[oa]-[yoa] [oa] 
[Teoa]-p-p-a-
[Iyp]-t-[rd]-e-
[woa]-[yoa]-[roa]-y-
[woa]-[yoa]-[roa]-y-
[woa]-d-[ro]-y p 
[woa]-y-r-y-
[eps]-[yps]-[tps]-y [ps] 
[wps]-[oa]-[oa]-[yoa] [oa] 
[etd]-d-s-p-
[wro]-d-h--
[9y]-[ra]-[wp]-[ro]-
[9y]wr----y y 
[9y]-[ra]-[wp]-[ro]-
[0u]wt----
[0u]-[ts]-[wa]-[tp]-
[9I]Qe----
[9d]-[ed]-[Qs]-[ep]-
[9a]wr----
[9y]-[ra]-[wp]-[ro]-
[9y]wr----y y 
[9y]-[ra]-[wp]-[ro]-
[0u]wt----
[0u]-[ts]-[wa]-[tp]-
[9d]Qe-d-d-d-
[9f]-[ed]-[Qs]-[ep]-
[9o]wr----
[woa]-[yoa]-[roa]-y-
[woa]-[yoa]-[roa]-y-
[woa]-d-[ro]-y p 
[woa]-y-r-y-
[eps]-[yps]-[tps]-y [ps] 
[wps]-[oa]-[oa]-[yoa] [oa] 
[Teoa]-p-p-a-
[Iyp]-t-[rd]-e-
[woa]-[yoa]-[roa]-y-
[woa]-[yoa]-[roa]-y-
[woa]-d-[ro]-y p 
[woa]-y-r-y-
[eps]-[yps]-[tps]-y [ps] 
[wps]-[oa]-[oa]-[yoa] [oa] 
[etd]-d-s-p-
[wro]-y-[wrh] ]]

UseShiftKeys()

end) 
      
Seasonal2:Button("Silent Night", function()

if Speedo2 == "" or Speedo2 == nil then  
-- Sheet for you

    
    shared.tempo = 80 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [5id] 9 w e [rid] - [eyg] - w [ud] [5ia] - [8us] w t y
u - [8of] w t y u - [8us] w [to] y [tu] - [5ro] 9
w [eri] [ry] - [8t] w t y u - s |
[tuo] 8 w [tip] [uo] - [8tu] w t y u - [8uo] w t [yip]
[uo] - [8tu] w t o u - [5id] 9 w e [rid] - [5ia] 9
w e r - [8us] w t y [us] - [8uo] w t o u -
[4ip] 8 q w [eip] - [4ps] 8 q [woa] [eip] - [8uo] w t [yip]
[uo] - [8tu] w t o u - [4tp] 8 q w [eip] - [4ps] 8
q [woa] [eip] - [8uo] w t [yip] [uo] - [8tu] w t o u -
[5id] 9 w e [rid] - [eyg] - w [ud] [5ia] - [8us] w t y
u - [8of] w t y u - [8us] w [to] y [tu] - [5ro] 9
w [eri] [ry] - [8t] w t y u - s |
[tuo] 8 w [tip] [uo] - [8tu] w t y u - [8uo] w t [yip]
[uo] - [8tu] w t o u - [5id] 9 w e [rid] - [5ia] 9
w e r - [8us] w t y [us] - [8uo] w t o u -
[4ip] 8 q w [eip] - [4ps] 8 q [woa] [eip] - [8uo] w t [yip]
[uo] - [8tu] w t o u - [4tp] 8 q w [eip] - [4ps] 8
q [woa] [eip] - [8uo] w t [yip] [uo] - [8tu] w t o u -
[5id] 9 w e [rid] - [eyg] - w [ud] [5ia] - [8us] w t y
u - [8of] w t y u - [8us] w [to] y [tu] - [5ro] 9
w [eri] [ry] - [8t] w t y u - s | ]]

UseShiftKeys()

end)
    
Seasonal2:Button("We wish you a merry christmas", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 55 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ o 
[0wts] s d s a 
[qetp] p p 
[Qeyd] d f d s 
[wrya] o o 
[Wruf] f g f d 
[etus] p o o 
[qp] d [wia] 
[8wus] h 
[ul] o [sl] z l k 
[ij] p [sj] j 
[Iz] p [dz] x z l 
[ok] a [dh] h 
[Ox] a [fx] c x z 
[pl] s [fj] h h 
[ij] z [ogk] 
[tofl] o 
[1us] 5 [8us] [us] 
[5ya] 9 w e [rya] 
[4ps] 8 [qoa] [ip] 
[8yuo] w t y [us] d 
[6of] 0 [ed] s 
[3ah] 7 [0o] o o 
[4p] 8 [qd] [5ioa] 
[8us] o 
[0s] w [ts] d s a 
[qp] e [tp] p 
[Qd] e [yd] f d s 
[wa] r [yo] o 
[Wf] r [uf] g f d 
[es] t [up] o o 
[qp] d [wia] 
[8wus] h 
[tfl] o [sfl] [fl] 
[wdk] y o p [adk] 
[qjl] t [ihk] [gj] 
[tdfh] o s d [fl] z 
[ehx] u [pz] l 
[0kv] r u h 
[qhl] t [ihz] [hx] 
[whz] y o p [ah] 
[qgj] t [ik] l 
[tfl] o [sh] d f 
[qgj] t [ih] g 
[8dfh] w t s s 
[4is] 8 [qid] [if] 
[1us] 5 [8o] o o 
[4ip] 8 [qid] [5ioa] 
[8uos]  ]]

UseShiftKeys()

end)

local Requested = win:Tab('More Songs')
local Requested2 = Requested:Section('More Songs | Requested')

Requested2:Button("Ylang Ylang (Test)", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 60 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ [Qgc]-[ETigc]-[QDZ]-[ETY]-
[Qgc]-[JB][ETig]-f[QD]-[ETYD]ffg
[*s]-[Wqts]-[*P]-[qWE]iOsD
[*s]-D[Wqts] Dg[*P]-[qWE]PsDg
[Qg]-[ETigc]-[QDZ]-[ETY]SD
[Qgc]-[HV][ETi][JB]g[QDZ]-[ETYD]fg
[*s]-[Wqts]D-[*P]-[qWE]gHlZ
[*l]-Zl-c[*J]--
[$gc]-[ETi]-[$DZ]-[ETY]-
[$gc]-[HV][ETig]-f[$D]-[ETYD]fg
[!s]-[Wqt]-[sl][*P]-[qWE]iOsD
[!s]-D[*s] Dg[qWEP]--PsDg
[$g]-[Qgc]-[QDZ]-[ETY]-
[$gc]-[JB]QLLLL[ETYDZ]-[QD]fg
[!s]-[Wqt]-[*P]-[qWE]iOsD
[*s]-Ds DgP--
[4esl]-[qetY]-[qetC]v-[qety]-l
[4sH]-J[qtWY]lZ[qtWC]v-[Wqty]-c
[^J]-[WEyil]-[Eqyv]-[Ei]c-
[1c]--x--
[6fx]-[etuo]-[etudz]-[etu][sl][dz]
[6f]-[hv][etuofx]-[DZ][etudz]-[etu]-z
^qWtWtYtYolZvZvBv-c-
[wy(ES]dPo[9qeO]piy[*Wqta]s--
[$Qg]E[ETi]g-[Qg]fD-[ETY]-
[$Qg]ETJ[ig]TEf[QD]-Dfg
[!*s]qW[Wts]qW[*P]qW[WE][qO][PS]O[WPS]O[PS]
[!*i]q[Wi][Wt][qi][Ws][*P][qO][Wi][WEg][qi][WO]
[$Qg]ET[ig]E[TJ][QD]ETYET
[$Qg]ETH[ig][EJ][Tg][QD]ET[YD][EH]JH[TJ]HJ
[!*][qH]Jk[WJ]Hg[tD]gHgD[*s]qW[EO]-P
[!*a]sqWD[ts]-Wg[*P]qWEW-
[(QETc]--c[GJZ]--
[$gc]-[HV][gc]-[fx][(D]QEQ[Ef][Tg]
!--ZcZlJlJgPsPi--
!-kl--HJ[lm]LZ
[(D]gTEQVB([TZ]EQBV
[(c]Q V[(c]QEx[(Z]Q[Es]Ps[(P]S[Sg]
[%gc]q8-ZL[%l]L[8Z]c[(l]-sSDS
[WP]O[Wti]-[(Wt]----
[4s]--sDgh--
[4h]-H[qetY]lZcvBv--
[7k]-l-v--c-
[W9qrc]--[E0wtf]hLl-J
qet[ex]l[tj]x[el]j[9qz]l[ej]z[tl]j[qz]l[ej]z[tl]j
[qx]l[ej]bt[qx]e[tZ][qz]etet-
^qWtWtYtYolZvZvBv-c-
[wy(ES]dPo[9qeO]piy[*Wqta]s--
[$c]^*q--[$Z]^*(--
[$c]^*q Bc-x[$^*(Z]-Zxc
[!H]J4l8J--gHlZ[!Hl]48-[Hl]-gHlZ
[!l]48HJl HJHg DgDs-OP
[Qgc]--[JB][HV][QDZ]--
[QV]VmLZ I-JH[QD]-i-lJHg
[*O]PsP T--DgHJHgDgHJHg
DgHJHgDgHJHg[DV]gHJHBg[Dc]gHJHVg
DgHJHgDgHJHgDgHJHg[DZ]gHJHcg
DgHJHgDgHJHgDgHJHgDgHJHg
DgHJHgD ]]

UseShiftKeys()

end) 

Requested2:Button("Atlantis - Seafret (Test)", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you


shared.tempo = 82 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ [W0ru] O u a u O u a 
u O u a [QETI] P I a 
[rWYO]-a-O-a-
O-a-O-a-
[W0ru] O u a u O u a 
u O u a u O u a 
[rWYO]--a-O-I 
[QETP]----I 
[3a] 7 [0a] [7a] W [7P] 0 [7O] 
3 7 0 7 $ * Q [*a] 
[%S] ( [Wa] [(P] r [(a] W [(a] 
[%P] [(O] W ( r ( [Wa] ( 
[3S] 7 [0a] [7P] W [7a] 0 [7S] 
3 [7a] 0 7 [Wa] [7D] [0D] 7 
%--7-%-$ 
^----Y Y-
[3a] 7 [0a] [7a] W [7P] 0 [7O] 
3 7 0 7 $ * [Qa] [*a] 
[%S] ( [Wa] ( [rP] [(a] W [(a] 
% [(P] [WO] ( $ * Q * 
[3S] 7 [0a] [7P] W [7a] 0 [7S] 
3 [7a] 0 [7P] W [7D] 0 7 
[%D]--7-%-$ 
[^S]----I 
[!*O] % [*O] % [0WO] * [0I] [*O] 
[!*] [%O] * [%D] [0W] * 0 [*I] 
[30O] [7O] [0O] 7 [rWO] 0 [WI] [0O] 
[30] [7O] 0 [7D] [Wr] 0 [WD] 0 
[%WS] ( W ( [Yra] W [ra] W 
[%W] ( W ( [rY] W r [WD] 
[$QH] [*G] Q [*D] [ET] [QD] E [QD] 
[$Q] * Q [*f] [ET] [QD] E Q 
[!*OH] % [*IG] % [0WYD] * [0YD] [*OH] 
[!*] [%IG] * [%YD] [0W] * 0 * 
[30OH] 7 [0IG] 7 [rWYD] 0 [WYD] [0OH] 
[30] [7IG] 0 [7YD] [Wr] 0 [Wuf] 0 
[%WYD] ( W ( [rY] W r W 
[%W] ( W ( [rY] W [rTS] W 
[$QTS] * Q * [ETYD] Q E Q 
[$Quf] * Q * [ETYD] Q E Q 
3-[D3ak] 7 0-[QTS]-
[WYD]-[QTS] 0 [$Yra]--
%-[%Dak] ( W-[ETS]-
[rYD]-[ETS] W [(ra]-[%YD]-
$-[$TS] * Q-W-
E-W-Q-* [YD] 
[$OH] [IG] $ [*YD] Q [YD] W [YD] 
E [uf] W [QYD] *-$-
3-[D3ak] 7 0-[QTS]-
[WYD]-[QTS] 0 [$Yra]--
%-[%Dak] ( W-[ETS]-
[rYD]-[ETS] W [(ra]-[%YD]-
$-[$TS] * Q-W-
E-W-Q-* [YD] 
[$OH] [IG] $ [*YD] Q [YD] W [YD] 
E [uf] W [QYD] *-$-
[0L] W 0 r 0 W 0 r 
[0C] W 0 r Q E Q T 
[WZ] r W Y W r W Y 
W r W Y Q E Q T 
[0L] W 0 r 0 W 0 r 
0 W 0 r [0C] W 0 r 
[WZ]--r-W-Q 
[EL]----Y 
[3ua] 7 [0ua] [7ua] W [7uP] 0 [7uO] 
3 7 0 7 $ * Q [*O] 
[%OS] ( [Wa] [(P] r [(Oa] W [(Oa] 
[%P] [(O] W ( r ( W ( 
[3uS] 7 [0ua] [7uP] W [7ua] 0 [7uS] 
3 [7ua] 0 7 [WOa] [7OD] [0OD] 7 
%--7-%-$ 
^----Y 
[3ua] 7 [0ua] [7ua] W [7uP] 0 [7ua] 
[3uP] [7uO] 0 7 $ * [QO] [*O] 
[%OS] ( [Wa] [(P] r [(Oa] W [(Oa] 
[%P] [(O] W ( $ * [QO] [*O] 
[3uS] 7 [0ua] [7uP] W [7ua] 0 [7uS] 
3 [7ua] 0 7 [WOa] [7OD] [0OD] 7 
%--7-%-$ 
[^IS]----I 
[u!*O] % [u*O] % [0uWO] * [0I] [u*O] 
[!*] [u%O] * [%OD] [0W] * 0 [*I] 
[30uO] 7 [0uO] 7 [ruWO] 0 [WI] [0uO] 
[30] [7uO] 0 [7OD] [Wr] 0 [WOD] 0 
[%WOS] ( W ( [YOra] W [Ora] W 
[%W] ( W ( [rY] W r [WD] 
[$QPH] [*PG] Q [*PD] [ET] [QPD] E [QPD] 
[$Q] * Q [*Pf] [ET] [QPD] E Q 
[!*OH] % [*IG] % [0WYD] * [0YD] [*OH] 
[!*] [%IG] * [%YD] [0W] * 0 * 
[30OH] 7 [0IG] 7 [rWYD] 0 [WYD] [0OH] 
[30] [7IG] 0 [7YD] [Wr] 0 [Wuf] 0 
[%WYD] ( W ( [rY] W r W 
[%W] ( W ( [rY] W [rTS] W 
[$QTS] * Q * [ETYD] Q E Q 
[$Quf] * Q * [ETYD] Q E Q 
3-[D3ak] 7 0-[QTS] W 
[rYD]-[WTS] Q [$Yra]--
%-[%Dak] ( W-[ETS] r 
[YD]-[rTS] E [Wra]-[(YD]-
$-[$TS] * Q-W E 
T-E W Q-* [YD] 
[$OH] [IG] $ [*YD] Q [YD] W [EYD] 
T [uf] E [WYD] Q-*-
3-[D3ak] 7 0-[QTS] W 
[rYD]-[WTS] Q [$Yra]--
%-[%Dak] ( W-[ETS] r 
[YD]-[rTS] E [Wra]-[(YD]-
$-[$TS] * Q-W E 
T-E W Q-* [YD] 
[$OH] [IG] $ [*YD] Q [YD] W [EYD] 
T [uf] E [WYD] Q-*-
[W0r]----
[QET]-D D 
[rWYH]-G G-D D H-
G G-[QET]-V-
[0rWC]--Z--L-
k----D D 
[rWYH]-G G-D-D 
[QET] f-D----
[W0ru]----
[QETI]-D D 
[rWYOH]-G G-D D H-
G G-[QETI]-V-
[0ruWC]--Z--L-
k----D D 
[rWYOH]-G G-D-D 
[QETI] f-D----
3-[D3ak] % 7 0 [QTS] W 
[rYD] W [QTS] 0 [$Yra]--
%-[%Dak] 7 ( W [ETS] r 
[YD] r [ETS] W [(ra] 7 [%YD]-
$-[$TS] ^ * Q W E 
T E W Q * ^ $ [YD] 
[$OH] [IG] $ [^YD] * [QYD] W [EYD] 
T [Euf] W [QYD] * ^ $-
3-[D3ak] % 7 0 [QTS] W 
[rYD] W [QTS] 0 [$Yra]--
%-[%Dak] 7 ( W [ETS] r 
[YD] r [ETS] W [(ra] 7 [%YD]-
$-[$TS] ^ * Q W E 
T E W Q * ^ $ [YD] 
[$OH] [IG] $ [^YD] * [QYD] W [EYD] 
T [Euf] W [QYD] * ^ $-
[0x] W 0 r 0 W 0 r 
0 W 0 r Q E Q T 
[WZ] r W Y W r W Y 
W r W Y Q E Q T 
[0x] W 0 r 0 W 0 r 
0 W 0 r 0 W 0 r 
[WZ]--r-W-Q 
[EL]----
[0rk] ]]

UseShiftKeys()

end) 

Requested2:Button("Mixed nuts (SPY X FAMILY OP 1)", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 55 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [QET] P P P P a S D
[qWTS]-O-[Wqya]-P O
[(QTO]-I--[(P]-
[i*O] q W I [$TI] * Q i
[7rY] Q r [YI] O-P a
[^OS] q [ED] g [@SG] ^ [(g] G
[%OS] ( W [rI] S ( W I
[7pS] [Qd] [rf] [*af]-[qd] [WOS] T
$ [*P] [QP] [EP] [IP] [*a] [QS] D
[4iOS] 8 [qO]-[^ia] q [iEP] [^O]
[@YO] ^ [(I] Q-^ [(P]-
[i!TO] % * I [$ETI] * Q i
[7rY] Q r [YI] O [QP] [rS] [7D]
[^PSH] q E G [@PDG] ^ ( [@I]
[%Ia] ( [WS] [ra]-[(P] [Wa] [%S]
[I7ad] Q r 7 [*TI] [WO] [Tp] [*a]
[7pIS] Q [rS] [7S][3OS]-[7a] [0I] [3a]
[6upS] 0 [eS] [6S][2pS]-[6a] [9f] [2d]
[%OS] ( [WS] [%S][i!OS]-[%d] [*S] [!a]
[p$IS] * Q * [Iep] [*a] [QS] [$d]
[3oaf] 7 [0f] [3f][pf]6 [0d] [epd] [6S]
[2ipd] 6 [9d] [2f][dg]5 [9f] [wpd] [5S]
7 [7O] [7a] [7S] [7S] [7G] [7S] [7a]
[!p] * [!a] [*S] [!a] * ! [*p]
[YI7p] 7 7 [D7pj] 7 7 7 [!*H]j
[OSH]-[!*]-[TSg] [WSG] [*h] [$PSH]-
[*G] [QH] [*G] [EPS] $ G [4sgH]-
[8J] [qgk] 4 [dg^J] [qH] [dEH] [^G]
[@PDH] ^ ( Q-[^G] [(J] [g@SH]
! % * [!G] [$PSG] * Q $
[7aD] Q [rD][7D] [^dg]-[qP] [ED] [^g]
[@SG] ^ [(G][@h] [s%DH]-( [WG] [(H]
[%DGJ] ( [WG] [(GL] r [(k] [WJ] [(k]
[7DGJ] Q [rH] [7G] [g*H] W T [*ETO]
$ [*I] [QO] [*I] [ET] $ I [4tiO]-
[8P] [qa]-[yi^P] [qO] [yEO] [^I]
[@EYO] ^ ( ^ Q [^I] [(P] [i@O]
! % * [!I] [$TI] * Q $
[7rY] [Qi] [rI] [7O] [yi^P] [qO] [EI] [^Y]
[@ET] [^I] [(i] [%TI]-[(S] [Wa] [(P]
% [(I] [WI] [(O] [rIP] [(O] [WI] [%i]
[!TI] % * [%T] [i!*TP] O [!*TI] i
[7rYI]-[7rY]-[YI7a]-[7aID]-
[i^PS] G [^PSH] J [@(PS] H [@(PSG] J
[a%WDH]-[a%WD] G [a%WDG]-[%Wa] S
[SG] [*T] [*T] H [gSJ] [!*H] [!*G] g
[$QPSG]----
[$GJL] ]]

    UseShiftKeys()

    end)

Requested2:Button("On my way - Alan Walker", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 60 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [TOSHLfx]--x Z L xWYOaDH
Z-Z L k--eupSfj
L--L k j-0ruOaf
k-k j H--QTIpSG
j--j H G j*WTuOS
H-L-L-f WYOsD
G--G f D-
[TOf]-S-S----
r-
Ya[pk] jH0 r O r
7 QG[Ij] [YH]f* Wf[uj] [WH]G
6 [0f]fu [IG]H0 r O r
7 QG[IG] [YH]f* W u [YD]S
6 0a[uk] [Ij]H0 r O r
[rk]k[Ik]k[GL]ZDxT O f Oj
[ej]j[uj]j[fj]k[Gj]H0 r O r
rG[QG] [IG] [YH]f* W u Y
6 0 u-W[60eT]TTIOO
[rT]TT[eI]OO[7QYI]IuI-u
[%0r]--W[60eT]TTIOO
[rT]TT[eI]OO[7QYI]Iu[uI] O
[Yp]----L
[Sx]Hf[HL]SH[fx]H[OZ]D[aL][Dk]ODa[DH]
[pL]f[Sk][fj]pf[SL]f[uk]f[aj][fH]ufaf
[Ij]Sp[SG][IG][SH][pj]S[TH]S[OL]S[TH]S[Of]S
[WD]sOsWs[OG]s[Tf]O[uD]O[TS]O[uSL]O
[Tfx]SO[SL]TS[Ofx]S[WDZ]Y[rSL][Yak]WY[rOH]Y
[eSL]u[Tak][upj]eu[TSL]u[0ak]u[rpj][uOH]0uru
[Qpj]Te[TIG][QIG][TOH][epj]T[*OH]T[WSL]T[*OH]T[Wuf]T
[%YD]tWt%t[WI]t[*WTu] Y T-
[!*HLfx] OT[ufx][WDZ][TSL][0fx][k%DHZ] [YDZ][WSL][rak](W7
[6fjSL] ue[TSL][0ak][epj]*[H3afk] [rak][0pj][WOH]70%
[$SGpj] [Tpj]Q[epj][*OH][QIG][*pj][f!*OSH] [OSL]T[uSL]W[Tuf]0
[s%IOG] YW[tIG][(uf][WYD]8[!*OSuf] [TS]0[WS]*0%
[!*HLfx] OT[ufx][WDZ][TSL][0fx][k%DHZ] [YDZ][WSL][rak](W7
[6fjSL] ue[TSL][0ak][epj]*[H3afk] [rak][0pj][WOH]70%
[$SGpj] [Tpj]Q[epj][*OH][QIG][*pj][f!*OSH] [OSL]T[uSL]W[Tuf]0
[s%IOG] YW[tIG]([uf][YD] [*WTOSuf] SI[rp] pp
[0r]O--[(r]-Ip Ou
[*r]-fx GC [6T]-uuIII
[0ruO][uO] [uO] [uO] O[r(YI][YI] IpO[Tu]
[*Tru]--[6T]aaaaaff
[0r][Oa][Oa][Oa] [Ip][uO][Ip][(r][Oa][Oa][Oa][Ia][Ia][uf][uf]
[*r][Oa][Oa][Oa] [Ip][uO][Ip][6T][Oa][Oa][Oa][Ia][Ia][uf][uf]
[0r][Oa][Oa][Oa] [Ip][uO][Ip][(r]O uuIO
[*r]IIIIIuO[6T]OI aa S
ear T uffDDDDaaa
r T Y If[Wf]D[rD]D[uD]a[Ia]a
e r T uffDDDDSaa
[ra]aTSYaIS[pD]--L
[Sx]Hf[HL]SH[fx]H[OZ]D[aL][Dk]ODa[DH]
[pL]f[Sk][fj]pf[SL]f[uk]f[aj][fH]ufaf
[Ij]Sp[SG][IG][SH][pj]S[TH]S[OL]S[TH]S[Of]S
[WD]sOsWs[OG]s[Tf]O[uD]O[TS]O[uSL]O
[Tfx]SO[SL]TS[Ofx]S[WDZ]Y[rSL][Yak]WY[rOH]Y
[eSL]u[Tak][upj]eu[TSL]u[0ak]u[rpj][uOH]0uru
[Qpj]Te[TIG][QIG][TOH][epj]T[*OH]T[WSL]T[*OH]T[Wuf]T
[%YD]tWt%[tI][WG]t[*uf]T[WYD]T[*TS]TWT
[*x][Tf][WH][Tf][*x][TZ][WL][Tx][%Z][rD][(Z][rL][%k][rD][(H][rD]
[6L][eS][0f][eS][6L][ek][0j][eL][3k][Wa][7k][Wj][3H][Wa][7f][Wa]
[$j][QS][*f][QS][$j][QH][*G][Qj][*H][WS][0L][WS][*L][WS][0f][WS]
[%G][QO][(s][QO][%G]fD [!%*f] S S O
[*WT]-rTu-[%(W]Tru-r
[60T]rQWu T [30rO] YTu-
[$*T]-rTu-[*W]Tru-r
[%QT]rQWu T [r*WO] YTu-
[uTOS]-aSf-[rWYO]Saf-a
[euTS]aIOf S [0ruaH] DSf-
[eQTS]-aSf-[uTO]Saf-a
SaIOHGSDf D S [SL]
[!*HLfx] O[TSL]uW[Tfx]0[k%DHZ] [YSL][Wak]r([WOH]7
[6fjSL] [uak][epj]T0[eSL]*[H3afk] [rpj][0OH]W70%
[$SGpj] T[QIG][eIG][*OH][Qpj]*[f!*OSH] [OSL]T[uOH]W[Tuf]0
[s%IDG] YWt([WIG]8[!*OSuf] [YOD]T[uTS]WT0
[!*HLfx] O[TSL]uW[Tfx]0[k%DHZ] [YSL][Wak]r([WOH]7
[6fjSL] [uak][epj]T0[eSL]*[H3afk] [rpj][0OH]W70%
[$SGpj] T[QIG][eIG][*OH][Qpj]*[f!*OSH] [OSL]T[uOH]W[Tuf]0
[s%YOD] OtYWt(W8(%% [TOf]G
f-D-S ]]

    UseShiftKeys()

    end)

Requested2:Button("Can you feel my heart (Full)", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 70 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ [as]-a-a-d-s
[pa]-a u a-d-s
[Oa]-a-a-d-s
a a u a auuua-
[as]-a-a-d-s
[pa]-a u a-d-s
[ua]-a-a-d-s
a a u a auuua-
[80wtuoa]-[uoa]-[uoa]-[od]-[os]
[680euoa]-[oa] u [oa]-[od]-[os]
[%WO70ua]-[ua]-[ua]-[ud]-[us]
[ua] [ua] u a auuua-
[80wtuoa]-[uoa]-[uoa]-[od]-[os]
[680euoa]-[oa] u [oa]-[od]-[os]
[%O370ua]-[ua]-[ua]-[ud]-[us]
[ua] [ua] u a auuua-
[80wa]-[80wa]-[0wtp]-o p o
[680]-[680]-[80e]----
[357a]-[357a]-[570p]-o a-
[357]-[357]-[570]--[570]
[80wa]-[80wa]-[0wtp]-o p o
[680]-[680]-[80e]----
[357a]-[357a]-[570a]----
[357a]-[357a]-[570] a-s [yoa]
[80w]-[80w]-[0wt] [uoa]-[od]-[os]
[680uoa]-[680][oa] [80eu] [oa]-[od]-[os]
[%O37ua]-[%37][ua] [%70] [ua]-[ud]-[us]
[%37ua] [ua][%37]u [%70a] auuua [579]
[680uoa]-[680][uoa] [80e] [uoa]-[od]-[os]
[80wuoa]-[80w][oa] [0wtu] [oa]-[od]-[os]
[%O37ua]-[%37][ua] [%70] [ua]-[ud]-[us]
[%37a]-[%37a]-[%70] a-s [yoa]
[80wa]-[80wa]-[0wtp]-o p o
[680]-[680]-[80e]--o o
[357a]-[357a]-[570p]-o a-
[357]-[357]-[570]----
[80wa]-[80wa]-[0wtp]-o p-o
[680o]-[680]-[80e]----
[357a]-[357a]-[570p]-o a-
[357]-[357]-[570]-a a a
[80wa] a[80w]-[0wt]-a a a
[680p] o[680]-[80e]-a a a
[357a] a[357]-[570]-a a a
[357a] a[357]-[570]----
[80wa] a[80w]p [0wto] p o--
[680a] a[680]p [80eo] p--
[357a] a[357]p [570o] p o--
[357a]-[357a]-[570] a-s [yoa]
[80w]-[80w]-[0wt] [uoa]-[od]-[os]
[680uoa]-[680][oa] [80eu] [oa]-[od]-[os]
[%O37ua]-[%37][ua] [%70] [ua]-[ud]-[us]
[%37a]-[%37a]-[%70] a-s [yoa]
[680uoa]-[680][uoa] [80e] [uoa]-[od]-[os]
[80wuoa]-[80w][oa] [0wtu] [oa]-[od]-[os]
[%O37ua]-[%37][ua] [%70] [ua]-[ud]-[us]
[%37a]-[%37a]-[%70] a-s [yoa]
[80w]-[80w]-[0wt] [uoa]-[od]-[os]
[680uoa]-[680][oa] [80eu] [oa]-[od]-[os]
[%O37ua]-[%37][ua] [%70] [ua]-[ud]-[us]
[%37ua] [ua][%37]u [%70a] auuua [579]
[680uoa]-[680][uoa] [80e] [uoa]-[od]-[os]
[80wuoa]-[80w][oa] [0wtu] [oa]-[od]-[os]
[%37uoa]-[%37][ua] [%70] [ua]-[ud]-[us]
[%37a]-[%37a]-[%70] a-s [yoa]----
p--
a----
u--
I--
o----
I--
a----
u--I--o
[ta]-a-a p--o
a-a-a p r-o
[ua]-a-a p-o-o
a-a-a p w-o
[ta]-a-a d--s
a-a-a p r-o
[ua]-a-a p-o-o
a-a-a p w-o
[80wua]-[ua]-[ua] [up]--o
[ua]-[ua]-[ua] [up] [7Q]-o
[0wrua]-[ua]-[ua] [up]-[uo]-o
[579wyoa]-[yoa]-[yoa] [yp]--o
[8wa] 0aw [ta] [wd] 0 8 [0s]
[60a] 8a0 [ea] [0d] 8 6 [8o]
[37a] 5a7 [0a] [7p] 5o3 [5o]
[59a] 7a9 [wa] [9p] 7 5 o
[8wua] 0[ua]w [tua] [wup] 0 8 [0o]
[60ua] 8[ua]0 [eua] [0up] 8 6 [8o]
[37ua] 5[ua]7 [0ua] [7up] 5[uo]3 [5o]
[59yoa] 7[yoa]9 [wyoa] [9yp] 7 5 o
[8wuoa] 0[uoa]w [tuoa] [wuoad] 0 8 [0s]
[60uoa] 8[uoa]0 [euoa] [0uoad] 8 6 [8o]
[37ua] 5[ua]7 [0ua] [7up] 5[uo]3 [5o]
[59yoa] 7[yoa]9 [wyoa] [9yp]--
[80wtuoa]-[uoa]-[uoa]-[od]-[os]
[680euoa]-[oa] u [oa]--
[80wtud] o [ud] o [ud] o [ud] o
[ud] o [ud] o [ud] o [680eys] o
[3570ya] o [ya] o [ya] o [ya] o
[579wyp] I [yp] I [yp] I [yp] I
[80wtud] o [ud] o [ud] o [ud] o
[ud] o [ud] o [ud] o [680eys] o
[3570ya] o [ya] o [ya] o [ya] o
[357a]-[357a]-[570] a-s [570a]
[80wyoa] a[80w]p [0wto] p o--[680uoa]-
[680][oa] [80eu] [oa]-[od]-[os] [357a]
a[357]p [570o] a--[357uoa]-
[357][oa] [570u] [oa]-[od]-[os] [80wa]
a[80w]p [0wto] p o--[680uoa]-
[680][oa] [80eu] [oa]-[od]-[os] [357a]-
[357a]-[570a]----[357a]-
[357a]-[570] a-s [yoa] [80w]-
[80w]-[0wt] [uoa]-[od]-[os] [357ua]
[ua][357]u [570a] auuua ]]

    UseShiftKeys()

    end)

Requested2:Button("Rush E", function()

if Speedo2 == "" or Speedo2 == nil then  
-- Sheet for you

    
    shared.tempo = 120 -- tempo overides the delay

        else
        shared.tempo = Speedo2
    end
shared.scr = [[ u-----
u-----
u-----
u-----
u--u--
u--u--
u-u-u-u-
u u u u u u u [uf]
[0uf] [30fx] [30fx] [30fx] [3x] [3x] [3x] [3x]
6----[80]----3----[80]----
6----[80]----3----[80]----
[6u] u [80u] u [3u] u [80u] u
[6u] u [80u] u [3u] u [80u] u
[6u] u [80u] u [3u] i [80u] Y
[6u]-[80p]-[3s]-[80]-
[%d] d [90d] d [3d] s [90a] d
[6s] s [80s] s [3s] a [80p] s
[7a] a [(ra] a [$I]-[(ea]-
[0O]--[30]--$5%
[6u] u [80u] u [3u] u [80u] u
[6u] u [80u] u [3u] u [80u] u
[6u] i [80u] Y [3u]-[80p] s
[6f]-[80j]-[3l]-[80]-
[9z] l [qrk] z [8l] k [0tj] l
[7k] j [9WH] k [6j] f [8es] p
[30g] f [$Qd] s [%Wa] p [30O] a
[6ep]--3--$5%
[6u] u [80u] u [3u] u [80u] u
[6u] u [80u] u [3u] u [80u] u
[6u] u [80u] u [3u] i [80u] Y
[6u]-[80p]-[3s]-[80]-
[%d] d [90d] d [3d] s [90a] d
[6s] s [80s] s [3s] a [80p] s
[7a] a [(ra] a [$I]-[(ea]-
[0O]--[30]--$5%
[6u] u [80u] u [3u] u [80u] u
6 u [80u] u [3u] u [80u] u
[6u] i [80u] Y [3u]-[80p] s
[6f]-[80j]-[3l]-[80]-
[9z] l [qrk] z [8l] k [0tj] l
[7k] j [9WH] k [6j] f [8es] p
[30g] f [$Qd] s [%Wa] p [30O] a
[6ep]--6--78*
[29d]-[qe] S [6d]-[qef]-
[9g]-[qef]-[6d]-[qeg]-
[8f]-[0e] d [6s]-[0ed]-
[8f]-[0e]-6-[0es]-
[7a]-[9W] P [3a]-[W9s]-
[7d]-[W9s]-[3a]-[W9d]-
[18s]-[6p]-[18s]-[30f]-
[6ej]-f-[6s]-p-78*
[29d]-[qe] S [6d]-[qef]-
[9g]-[qef]-[6d]-[qeg]-
[8f]-[0e] d [6s]-[0ed]-
[8f]-[0e]-[6j]-[0e]-
7-[qed]-9-[qeg]-
[%30f]-[18s]-[29d]-[7a]-
[6p]----[O30uaf]-
[60epsfj]----
[6u] u [80u] u [3u] u [80u] u
[6u] u [80u] u [3u] u [80u] u
[6u] u [80u] u [3u] i [80u] Y
[6u]-[80p]-[3s]-[80]-
[%d] d [90d] d [3d] s [90a] d
[6s] s [80s] s [3s] a [80p] s
[7a] a [(ra] a [$I]-[(ea]-
[0O]--[30]--$5%
[6u] u [80u] u [3u] u [80u] u
6 u [80u] u [3u] u [80u] u
[6u] i [80u] Y [3u]-[80p] s
[6f]-[80j]-[3l]-[80]-
[9z] l [qrk] z [8l] k [0tj] l
[7k] j [9WH] k [6j] f [8es] p
[30g] f [$Qd] s [%Wa] p [30O] a
[6ep]--[!@$%^*(QWETYIOP148qtyuiopasdfghjklzxcvbnm?]--
6-[80]-3-[80]-
6-[80]-3-[80]-
6-[80]-3-[80]-
6-[80]-3-[80]-
6-[80e]-3-[80e]-
6-[80e]-3-[80e]-
6-[80t]-3-[80t]-
6-[80t]-3-[80t]-
6-[etu]-3-[etu]-
6-[etu]-3-[etu]-
6-[tup]-3-[tup]-
6-[tus]-3-[tus]-
[6u]u[etu]u[3u]u[etuf]f
[6x]x[etuf]f [3u] u [etu] u
[6u] u [etu] u [3u] i [etu] Y
[6u]-[etup]-[3s]-[etu]-
[%d] d [W90d] d [3d] s [W90a] d
[6s] s [etus] s [3s] a [etup] s
[7a] a [(ra] a [$I]-[(ea]-
[0O]--[30]--$5%
[6u] u [etu] u [3u] u [etu] u
6 u [etu] u [3u] u [etu] u
[6u] i [etu] Y [3u]-[etup] s
[6f]-[etuj]-[3l]-[etu]-
[9fkz] l [qrk] z [8fjl] k [0tj] l
[H7k] j [9WH] k [6fj] f [8es] p
[30g] f [$Qd] s [%Wa] p [30O] a
[6ep]----
[29d]-[qe] S [6d]-[qef]-
[9g]-[qef]-[6d]-[qeg]-
[8f]-[0e] d [6s]-[0ed]-
[8f]-[0e]-6-[0es]-
[7a]-[9W] P [3a]-[W9s]-
[7d]-[W9s]-[3a]-[W9d]-
[18s]-[6p]-[18s]-[30f]-
[6ej]-f-[6s]-p-78*
[29d]-[qe] S [6d]-[qef]-
[9g]-[qef]-[6d]-[qeg]-
[8f]-[0e] d [6s]-[0ed]-
[8f]-[0e]-[6j]-[0e]-
7-[qed]-9-[qeg]-
[%30f]-[18s]-[29d]-[7a]-
[6p]----[O30uaf]-
[60epsfj]----
[6u] u [etu] u [3u] u [etuf] f
[6x] x [etuf] f [3u] u [etu] u
[6u] u [etu] u [3u] i [etu] Y
[6u]-[etup]-[3s]-[etu]-
[%d] d [W90d] d [3d] s [W90a] d
[6s] s [etus] s [3s] a [etup] s
[7a] a [(ra] a [$I]-[(ea]-
[0O]--[30]--$5%
[6u] u [etu] u [3u] u [etu] u
6 u [etu] u [3u] u [etu] u
[6u] i [etu] Y [3u]-[etup] s
[6f]-[etuj]-[3l]-[etu]-
[9fkz] l [qrk] z [8fjl] k [0tj] l
[H7k] j [9WH] k [6fj] f [8es] p
[30g] f [$Qd] s [%Wa] p [30O] a
[6ep]----
[^i] i [ETi] i [4i] i [ETi] i
[^i] i [ETi] i [4i] i [ETi] i
[^i] i [ETi] i [4i] I [ETi] u
[^i]-[iETP]-[4S]-[ETi]-
[6D] D [qe(D] D [4D] S [(qes] D
[^S] S [iETS] S [4S] s [iETP] S
[8s] s [0ts] s [5o]-[E0s]-
[qp]--[4q]--5%6
[^i] i [ETi] i [4i] i [ETi] i
^ i [ETi] i [4i] i [ETi] i
[^i] I [ETi] u [4i]-[iETP] S
[^g]-[iETJ]-[4L]-[ETi]-
[(Z] L [Qtl] Z [*L] l [qTJ] L
[8l] J [(Wj] l [^J] g [*ES] P
[4qG] g [5wD] S [6es] P [4qp] s
[^EP]----
[sYIZ] L l Z [iTPL] l J L
[Ytpl] J j l [ETPJ] g S P
[4qG] g [5wD] S [6es] P [4qp] s
[^EP]--[g^SJ] ]]

    UseShiftKeys()

    end)

Requested2:Button("Golden Wind", function()

if Speedo2 == "" or Speedo2 == nil then
-- Sheet for you

    
    shared.tempo = 60 -- tempo overides the delay

    else
        shared.tempo = Speedo2
    end
shared.scr = [[ 7 7 76 7 9 7 $6
7 7 76 7 q 0 96
7 7 76 7 9 7 $6
7 7 7679 q 0 96
[7r] [7r] [7r][6e] [7r] [9y] [7r] [$Q][6e]
[7r] [7r] [7r][6e] [7r] [qi] [0u] [9y][6e]
[7r] [7r] [7r][6e] [7r] [9y] [7r] [$Q][6e]
[7r] [7r] [7r] [6e][7r]-d I p
[7r] [7r] [7r]e [7r] [7y] [7r] [7Q]e
[7r] [7r] [7r]e [7r] [7i] [7u] [7y]e
[7r] [7r] [7r]e [7r] [7y] [7r] [7Q]e
[7r] [7r] [7r]er[7y] [7i] [7u] [7y]e
[7ra] [7ra] [7ra][ep] [7ra] [7yd] [7ra] [7QI][ep]
[7ra] [7ra] [7ra][ep] [7ra] [7ig] [7uf] [7yd][ep]
[7ra] [7ra] [7ra][ep] [7ra] [7yd] [7ra] [7QI][ep]
[7ra] [7ra] [7ra] [ep][ra]k-[ak]Sdf
[7adG] 9 0q Q eaQ[ed] [Ej]
[rafH] E eQ 0 %G%6 [^f]
[7adG] 9 0q Q e Qe E
r % 6^ 7 % %[6a]S[^d]f
[7adG] 9 0q Q eaQ[ed] [Ej]
[rafH] E eQ[afj]0 % %[H6afk] ^
[7afH] 9[adG]0q Q e Qe E
r 7 % W 6e6 [^a]S[Ed]f
[7adG] 9 0q Q eaQ[ed] [Ej]
[rafH] E eQ 0 %G%6 [^f]
[7adG] 9 0q Q e Qe E
r % 6^ 7 % %[6a]S[^d]f
[7adG] 9 0q Q eaQ[ed] [Ej]
[Hrafk] E eQ[afj]0 % %[6afH] ^
[7adG] 9 0q Q e Qe E
r 7 % W 6e6 [^d]S[Ea]
[I7yp]-[QIrya]-[QIrya]-I p a
[7yIS]-[QIryp]-[QIrya]--dSa
[I7yp]-[QIrya]-[QIrya]-I S d
[7yIS]-[QIryp]-[QTru]--dSa
[I7yp]-[I7ya]-[QIrya]-[7I] [Qrp] [7a]
[7yIS]-[I7yp]-[QIrya]-7 [Qrd]S[7a]
[6ep][29yd][$QIG][30uf][@(YD][7ra][6epj][%WOH][$QIG][29yd][!*TS][7ra]
[6ep][7ra] [6ep][7ra] [6ep][7ra] [6ep][7ra] [6ep][7ra][29yd]
[7adIG]-[Qr] [%iadg]--[9W] df
[!*iadg]-[wrf]-d [uo$S]-[*0d]-f
[7adIG]-[Qr] [%adgk]--[W9a] S
[!*uad]-[wrf]-d [uo$S]-[*0j]-h
[7adIG]-[Qr] [%iadg]--[9W] df
[!*iadg]-[wrf]-d [uo$S]-[*0d]-f
[7adIG]-[Qr] [%adgk]--[W9k] L
[!*fhz]-[wrh]-G [$iadg]-[*0z]-J
[7ra] [7ra] [7ra][ep] [7ra] [7yd] [7ra] [7QI][ep]
[7ra] [7ra] [7ra][ep] [7ra] [7ig] [7uf] [7yd][ep]
[7ra] [7ra] [7ra][ep] [7ra] [7yd] [7ra] [7QI][ep]
[7ra] [7ra] [7ra][ep][ra][7yd] [7ig] [7uf] [7yd][ep]
[7ra] [7ra] [7ra][ep] [7ra] [7yd] [7ra] [7QI][ep]
[7ra] [7ra] [7ra][ep] [7ra] [7ig] [7uf] [7yd][ep]
[7ra] [7ra] [7ra][ep] [7ra] [7yd] [7ra] [7QI][ep]
[7ra] [7ra] [7ra] [ep][ra]k-[Ik]dG
[7dIG] 9 0q Q efQe [Ed]
[raf] ESeQp0 %I%[6a] [^I]u
7y[9r] [0y]qiQu[ey] Qe E
r [%a] 6[^p] [7I]p%a%[6d] [^f]
[7dIG] 9 [0a][qd]G[Qj] e Qe E
[rf]d[Ea] [ed]Qf0 %y[%d][6y]d[^y]d
[7y]d9y[0d]qy[Qd] [ef] [Qd][ef]d[Ea]
[rd]a7 [%a] W 6e6 ^ [Ea]G
[G7aj] 9 [G0aj]q Q e Qe E
r E eQ[afH]0 % %6G^f
[7afH] 9[adG]0q Q e Qe [Ey]d
[ry]d[%y]d[6y][^d]y[7d] [%yd] [%yd][6yd] [^yd]
[G7dkz] 9[Gdkz]0q Q e Q[ek] [Ej]
[rf]d[Ea] [ep]Qa0 % %6 [^a]
[7yad] 9 [0uaf]q QGejQ[ek] [EGdkz]
r 7 % W 6e6 ^ E
[7f] 9 0qS[Qd]fe Qe [ES]d
[rf] [Ed] [eS][Qd] [0S] % %6 [^S]d
[7S] [9a] [0p]qaQ e Q[ep] [Eu]
[ry] % [6T][^y] [7T] % %6 ^
[7r] [9y] [0u]qiQue Q[ey]r[Ey]
[rI] [Ep]ae[Qd]a0d[%a] [%d][6a] ^
[7G]d[9S]a[0f][qS]p[Qa]a[eO] [QT][er]T[Er]O
[rp] [7a] [%f]S[Wk]j[6H]e[6G] [^j]k[Ek]L
[7z] 9 0q Q e Q[ez] [Ek]
[rz] E eQ 0k% %6 [^L]z
[7z] [9L]z[0L]qk[QL]kej[Qk][ej] [EH]j
[rH] [%G]H[6f]^G[7f]d%f[%d][6S]d[^S]a
[7a] 9 0qp[QI]ieayQ[eu]IEy
[ru] [EI] eQ 0 % %6 ^
7 9 [0r]q Q e Qe E
ry[7I]a[%d]G[Wk]z[6C][ez][6k]G[^d]a[EI]
[%WIDG]--[$QSuf]----
[$QSuf]--[30yad]----
[*TGpj]--[7rfOH]----
[7rfOH]--[6eofh]----
[5afhk]-[29]-[5w]-[7r]-
[5oaf]-[29]-[5woaG]-[7r]-
[$SGk]-[!*]-[$Q]-[7r]-
[$SGJ]-[!*]-[$Q]-[^E]-
[7r]-[^T]-[6y]-[%I]-[5i] I
[7ra]-[^TS]-[6yd]-[%YD]-[5IG][ig][IG]
[7ak]-[^SL]-[6dz]-[%GC]-[5gc][fx][gc]
[k$GC]----
J----aSdf
[7adG] 9 0q Q eaQ[ed] [Ej]
[rafH] E eQ 0 %G%6 [^f]
[7adG] 9 0q Q e Qe E
r % 6^ 7 % %[6a]S[^d]f
[7adG] 9 0q Q eaQ[ed] [Ej]
[rafH] E eQ[afj]0 % %[H6afk] ^
[7afH] 9[adG]0q Q e Qe E
r 7 % W 6e6 [^a]S[Ed]f
[7adG] 9 0q Q eaQ[ed] [Ej]
[rafH] E eQ 0 %G%6 [^f]
[7adG] 9 0q Q e Qe E
r % 6^ 7 % %[6a]S[^d]f
[7adG] 9 0q Q eaQ[ed] [Ej]
[Hrafk] E eQ[afj]0 % %[6afH] ^
[7adG] 9 0q Q e Qe E
r 7 % W 6e6 [^d]S[Ea]
[I7yp]-[QIrya]-[QIrya]-I p a
[7yIS]-[QIryp]-[QIrya]--dSa
[I7yp]-[QIrya]-[QIrya]-I S d
[7yIS]-[QIryp]-[QTru]--dSa
[I7yp]-[I7ya]-[QIrya]-[7I] [Qrp] [7a]
[7yIS]-[I7yp]-[QIrya]-7 [Qrd]S[7a]
[6pj][29dz][$QGC][30fx][@(DZ][7ak][6ejb][%WHV][$QGC][29dz][!*SL][7ak]
[6pj][7ak] [6pj][7ak] [6pj][7ak] [6pj][7ak] [6pj][7ak][29dz]
7----
7-7--77[29][29][29]
[7radIG]--[%Wiadg]--df
[*Tiadg]-f-d [uo$QS]-d-f
[7radIG]--[%Wadgk]--a S
[*Tuad]-f-d [uo$QS]-j-h
[7radIG]--[%Wiadg]--df
[*Tiadg]-f-d [uo$QS]-d-f
[7radIG]--[%Wadgk]--k L
[*Tfhz]-h-G [$Qiadg]-z-x
[7kzGC]-[Qr] [%gkzc]--[9W] zx
[!*gkzc]-[wrx]-z [fh$L]-[*0z]-x
[7kzGC]-[Qr] [%kzcn]--[W9k] L
[!*fkz]-[wrx]-z [fh$L]-[*0b]-v
[7kzGC]-[Qr] [%gkzc]--[9W] zx
[!*gkzc]-[wrx]-z [fh$L]-[*0z]-x
[7kzGC]-[Qr] [%kzcn]--[W9n] L
[!*zxv]-[wrv]-C [$gkzc]-[*0z]-B
[C7kzn] 7 76 7 9 7 $6
7 7 76 7 q 0 96
7 7 76 7 9 7 $6
7 7 7679 q 0 96
[7r] [7r] [7r][6e] [7r] [9y] [7r] [$Q][6e]
[7r] [7r] [7r][6e] [7r] [qi] [0u] [9y][6e]
[7r] [7r] [7r][6e] [7r] [9y] [7r] [$Q][6e]
[7r] [7r] [7r] [6e][7r]-d I p
[7r] [7r] [7r]e [7r] [7y] [7r] [7Q]e
[7r] [7r] [7r]e [7r] [7i] [7u] [7y]e
[7r] [7r] [7r]e [7r] [7y] [7r] [7Q]e
[7r] [7r] [7r]er[7y] [7i] [7u] [7y]e
[7ra] [7ra] [7ra][ep] [7ra] [7yd] [7ra] [7QI][ep]
[7ra] [7ra] [7ra][ep] [7ra] [7ig] [7uf] [7yd][ep]
[7ra] [7ra] [7ra][ep] [7ra] [7yd] [7ra] [7QI][ep]
[7ra] [7ra] [7ra][ep][ra][7yd] [7ig] [7uf] [7yd][ep]----
[7upTS] ]]

    UseShiftKeys()

    end)