function RuntimeUpdate()
	local scl = {
        [0] = 1,
        [3] = 3,
        [4] = 5 + 64,
	}
	CWM_SettingControl(SCL_LOG, scl)

	return 0
end
