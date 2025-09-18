local TimeService = {}
	function TimeService.GetServerTime()
		local serverTime = os.date("%Y-%m-%d:%H:%M:%S", os.time())
		return serverTime
	end

return TimeService
