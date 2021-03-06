local actions = {}
local callRegister = {}

function addAction(actionName, call)
    if Config.Debug then
        print(string.format('[rcore] register action %s',actionName))
    end
    actions[actionName] = call
end

function getAction(actionName)
    return actions[actionName]
end

function callAction(actionName,params)
    if actions[actionName] ~= nil then
        if Config.Debug then
            print(string.format('[rcore] call action %s',actionName))
        end
        actions[actionName](params)
    end
end

function isCalled(actionName)
    if callRegister[actionName] == true then
        return true
    else
        return false
    end
end

function callActionOnce(actionName,params)
    if callRegister[actionName] == nil then
        if actions[actionName] ~= nil then
            if Config.Debug then
                print(string.format('[rcore] call action once %s',actionName))
            end
            actions[actionName](params)
        end
        callRegister[actionName] = true
    end
end

function resetCall(actionName)
    callRegister[actionName] = nil
end
