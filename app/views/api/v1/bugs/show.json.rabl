object @bug

attributes :number, :status, :priority

child :state do
  attributes :device, :os, :memory, :storage
end
