local module = {}

function module.Psuedorandom(NumMin,NumMax,PreviousNum)
    if NumMin == nil or NumMax == nil then
        return math.random()
    end
    local Random = math.floor(math.random() * math.floor(NumMax - NumMin + 1)) + NumMin
    if PreviousNum == nil then
        return Random
    else
        if Random == PreviousNum then
            return module.Psuedorandom(NumMin,NumMax,PreviousNum)
        end
    end
end


return module