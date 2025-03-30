--[[

require('lib.events')

EventsManager:init()
EventsManager:subscribe('blah', sample_ev1)
EventsManager:subscribe('blah', sample_ev2)
EventsManager:send_event('blah', "123")

in update:     EventsManager:process_events()


function sample_ev1(value)
    print("sample_ev1 received ", value)
end

function sample_ev2(value)
    print("sample_ev2 received ", value)
end

]]--


EventsManager = {}

function EventsManager:init()
    self.topics = {}
    self.events = {}
end

function EventsManager:subscribe(topic, callback)
    if not Table_has(self.topics, topic) then
        self.topics[topic] = {}
    end
    table.insert(self.topics[topic], callback)
end

function EventsManager:trigger_callbacks(topic, value)
    print("Processing callbacks for: ", topic,' with value:', value)

    for i,v in ipairs(self.topics[topic]) do
        local callback = self.topics[topic][i]
        if type(callback) == 'function' then
            callback(value)
        else
            print("ERROR: not a function=",callback)
        end
    end
end

function EventsManager:send_event(topic, value)
    local v = {}
    v.topic = topic
    v.value = value
    table.insert(self.events, v)
end

function EventsManager:process_events()
    if type(self.topics) == 'nil' then
        return
    end

    for i,v in ipairs(self.events) do
        print("Processing events for: ", v.topic,' with value:', v.value)
        self:trigger_callbacks(v.topic, v.value)
    end

    self.events = {}
end