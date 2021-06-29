CUSTOM_ACC              = 0
CUSTOM_GYRO             = 1
CUSTOM_MAG              = 2
CUSTOM_BARO             = 3
CUSTOM_TEMP             = 4
CUSTOM_HEARTRATE        = 5
CUSTOM_GNSS             = 6
CUSTOM_OFFBODY_DETECT   = 7
CUSTOM_ON_CHARGING      = 8
CUSTOM_ACC_ANY_MOTION   = 9
CUSTOM_SENS1            = 10

SCL_LOG                 = 0
SCL_USER_INFO           = 1
SCL_DATE_TIME           = 2
SCL_SEDENTARY           = 3
SCL_PEDO_RESET          = 4
SCL_REQ_SLEEPING_DATA   = 5
SCL_LOW_POWER_MODE      = 6
SCL_SET_ACTIVITY_MODE   = 7
SCL_GET_CHIP_INFO       = 8
SCL_ACTIVITY_CONFIG     = 9
SCL_LIB_DEBUG           = 10
SCL_PEDO_CONFIG         = 11
SCL_GET_LIB_INFO        = 12
SCL_SWIM_CONFIG         = 13
SCL_BIKING_CONFIG       = 14
SCL_ACTIVITY_PAUSE      = 15
SCL_HAND_UPDOWN_CONFIG  = 16
SCL_CHIP_VENDOR_CONFIG  = 17
SCL_SLEEP_CONFIG        = 18
SCL_ABS_STATIC_CONFIG   = 19
SCL_HEART_RATE_CONFIG   = 20
SCL_REQ_SWIM_EXIT       = 21

SCL_SZ_BREACH_CONFIG    = 50
SCL_ALGO_PROC_CONFIG    = 100
SCL_INPUT_SENSOR_CONFIG = 101
SCL_SENS_CALI_CONFIG    = 110
SCL_SENS_CALI_CTRL_MAG  = 111
SCL_SENS_CALI_CTRL_A    = 112

SCL_GET_HEAP_INFO       = 120

IDX_ACCEL                    = 0
IDX_GYRO                     = 1
IDX_MAG                      = 2
IDX_BARO                     = 3
IDX_TEMP                     = 4
IDX_HEARTRATE                = 5
IDX_GNSS                     = 6
IDX_OFFBODY_DETECT           = 7
IDX_ALGO_SEDENTARY           = 8
IDX_ALGO_WATCH_HANDUP        = 9
IDX_ALGO_SLEEP               = 10
IDX_REQUEST_SENSOR           = 11
IDX_ALGO_ACTTYPEDETECT       = 12
IDX_ALGO_SHAKE               = 13
IDX_ALGO_ACTIVITY_OUTPUT     = 14
IDX_ALGO_ANY_MOTION          = 15
IDX_ALGO_NO_MOTION           = 16
IDX_ALGO_FALLING             = 17
IDX_ONCHARGING_DETECT        = 18
IDX_ALGO_ABSOLUTE_STATIC     = 19

TYPE_DBGLOG_LIB_DBGOUTPUT    = 201
TYPE_DBGLOG_REQSENSOR       = 202
TYPE_DBGLOG_HOOKSTDOUT      = 203
TYPE_DBGLOG_MAIN_DBGOUTPUT   = 204

OUT_SENS_NAME = {
    [IDX_ACCEL] = "acc",
    [IDX_GYRO] = "gyro",
    [IDX_MAG] = "mag",
    [IDX_BARO] = "baro",
    [IDX_TEMP] = "temp",
    [IDX_HEARTRATE] = "hr",
    [IDX_GNSS] = "gnss",
    [IDX_OFFBODY_DETECT] = "offbody",
    [IDX_ALGO_SEDENTARY] = "sed",
    [IDX_ALGO_WATCH_HANDUP] = "w_hand",
    [IDX_ALGO_SLEEP] = "sleep",
    [IDX_REQUEST_SENSOR] = "req_sens",
    [IDX_ALGO_ACTTYPEDETECT] = "act_type",
    [IDX_ALGO_SHAKE] = "shake",
    [IDX_ALGO_ACTIVITY_OUTPUT] = "act_out",
    [IDX_ALGO_ANY_MOTION] = "any_mot",
    [IDX_ALGO_NO_MOTION] = "no_mot",
    [IDX_ALGO_FALLING] = "falling",
    [IDX_ONCHARGING_DETECT] = "oncharg",
    [IDX_ALGO_ABSOLUTE_STATIC] = "abs_static",
}

function print_output_sensor(m, ts_ms)
    local sensorType = m.evt.sensorType
    local f = m.evt.fData

    local idxName = OUT_SENS_NAME[sensorType]
    if idxName == nil then
        idxName = "IDX[" .. sensorType .. "]"
    end

    local str = string.format("%.1f ", ts_ms / 1000) .. idxName .. ': '
    for i = 0, #f do
        local value = f[i]
        local str1
        if (value == 0) then
            str1 = '0'
        else
            str1 = string.format("%.3f", value)
        end

        if (i == 0) then
            str = str .. str1
        else
            if (i % 4 == 0) then
                str = str .. ',  ' .. str1
            else
                str = str .. ', ' .. str1
            end
        end
    end

    print(str)
end
