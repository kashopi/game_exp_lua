EventsManager = {}

function EventsManager:init()
    self.topics = {}
end

function EventsManager:subscribe(topic, callback)
    if not Table_has(self.topics, topic) then
        self.topics[topic] = {}
    end
    table.insert(self.topics[topic], callback)
end

function EventsManager:trigger_callbacks(topic, value)
    for i,v in ipairs(self.topics[topic]) do
        local callback = self.topics[topic][i]
        if type(callback) == 'function' then
            callback(value)
        else
            print("ERROR: not a function=",callback)
        end
    end
end
