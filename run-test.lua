require "common"

function aml_pre_config()

end

function aml_between_config()
	local scl = {
		[0] = 1,
		[1] = 2,
	}

	CWM_SettingControl(SCL_CHIP_VENDOR_CONFIG, scl);

	scl = {
		[0] = 1,
		[3] = 3,
		[4] = 5 + 64,
	}
	CWM_SettingControl(SCL_LOG, scl);
end

function aml_poast_config()
	CWM_Sensor_Enable(100)
end
