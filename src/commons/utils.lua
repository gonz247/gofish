local utils = {}

function utils.isInstanceOf(object, class)
    -- 1. Type check: ensure we're dealing with a table
    if type(object) ~= 'table' then
        return false
    end
    
    -- 2. Get the object's metatable
    local meta = getmetatable(object)
    
    -- 3. Walk up the inheritance chain
    while meta do
        if meta == class then
            return true  -- Found the class in the chain!
        end
        meta = getmetatable(meta)  -- Move to parent's metatable
    end
    
    return false  -- Class not found in chain
end

function utils.formatErrorMessage(template, ...)
    -- TODO Investigate how to format strings in lua, or concat strings
    return string.format(template, ...)
end

return utils