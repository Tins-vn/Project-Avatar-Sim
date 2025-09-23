local TimeService = {}
	function TimeService.GetServerTime()
		local serverTime = os.date("%Y-%m-%d:%H:%M:%S", os.time())
		return serverTime
	end

	function TimeService.ProcessTime(timeString)
		local year, month, day, hour, min, sec = string.match(timeString, "(%d+)-(%d+)-(%d+):(%d+):(%d+):(%d+)")
		return {
			Year = tonumber(year),
			Month = tonumber(month),
			Day = tonumber(day),
			Hour = tonumber(hour),
			Min = tonumber(min),
			Sec = tonumber(sec)
		}
		
	end
return TimeService
