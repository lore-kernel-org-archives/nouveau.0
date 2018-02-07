From: John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Addressing the problem of noisy GPUs under Nouveau
Date: Tue, 6 Feb 2018 19:31:07 -0800
Message-ID: <fccca49e-71a6-094c-42ac-7e4ce37c0108@nvidia.com>
References: <4597fd60-59f8-5e45-ec5a-f52c4c6c6260@free.fr>
 <7cad7e2b-e207-03be-b5a6-d036420b42e0@nvidia.com>
 <20171122012909.GA4002@prokofiev.nvidia.com>
 <CAKb7Uvjcbz0_F155xC5T1qXdTgo25Jp57mPAR8txPWTt_ZdYhw@mail.gmail.com>
 <8c630fe4-ee96-2c68-eafb-d243195af29f@free.fr>
 <985ec2c1-df88-622a-8ccb-1246c320e8c3@nvidia.com>
 <f0f5c17c-2bcc-2bee-563a-0bc4b0858869@free.fr>
 <11b5cc0f-24b6-97ca-3942-28381766fdbc@nvidia.com>
 <1b9f324f-0dcd-7eaf-91ae-fadece88a0dd@free.fr>
 <43a75ab3-b358-9a0c-aa9c-053fa029d430@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------B6961E4284C6BAC1F1BE3CAD"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <43a75ab3-b358-9a0c-aa9c-053fa029d430-GANU6spQydw@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, gpu-public-documentation <gpu-public-documentation-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--------------B6961E4284C6BAC1F1BE3CAD
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 01/28/2018 04:05 PM, Martin Peres wrote:
> On 29/01/18 01:24, Martin Peres wrote:
>> On 28/11/17 07:32, John Hubbard wrote:
>>> On 11/23/2017 02:48 PM, Martin Peres wrote:
>>>> On 23/11/17 10:06, John Hubbard wrote:
>>>>> On 11/22/2017 05:07 PM, Martin Peres wrote:
>>>>>> Hey,
>>>>>>
>>>>>> Thanks for your answer, Andy!
>>>>>>
>>>>>> On 22/11/17 04:06, Ilia Mirkin wrote:
>>>>>>> On Tue, Nov 21, 2017 at 8:29 PM, Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>>>>> Martin's question was very long, but it boils down to this:
>>>>>>>
>>>>>>> How do we compute the correct values to write into the e114/e118 pwm
>>>>>>> registers based on the VBIOS contents and current state of the board
>>>>>>> (like temperature).
>>>>>>
>>>>>> Unfortunately, it can also be the e11c/e120 couple, or 0x200d8/dc on
>>>>>> GF119+, or 0x200cd/d0 on Kepler+.
>>>>>>
>>>>>> At least, it looks like we know which PWM controler we need to drive, so
>>>>>> I did not want to muddy the water even more by giving register
>>>>>> addresses, rather concentrating on the problem at hand: How to compute
>>>>>> the duty value for the PWM controler.
>>>>>>
>>>>>>>
>>>>>>> We generally do this right, but appear to get it extra-wrong for certain GPUs.
>>>>>>
>>>>>> Yes... So far, we are always safe, but users tend to mind when their
>>>>>> computer sound like a jumbo jet at take off... Who would have thought? :D
>>>>>>
>>>>>> Anyway, looking forward to your answer!
>>>>>>
>>>>>> Cheers,
>>>>>> Martin
>>>>>
[...]

Hi Martin,

I strongly suspect you are seeing a special behavior, which is: on
some GF108 boards we use only a very limited range of PWM,
0.4 to 2.5%, due to the particular type of DC power conversion
circuit on those boards. However, it could also just be difficulties
in interpreting the fixed-point variables in the tables. In either
case, the answer is to explain those formats, so I'll do that now.

I am attaching the fan cooler table, in HTML format. We have also
published the BIT (BIOS Information Table) format, separately:

    http://download.nvidia.com/open-gpu-doc/BIOS-Information-Table/1/BIOS-Information-Table.html

, but I don't think it has any surprises for you, in this regard. You
can check it, to be sure you're looking at the right subtable, though,
just in case.

The interesting parts of that table are:

PWM Scale Slope (16 bits):

  Slope to scale effective PWM to actual PWM (1/4096, F4.12, signed).
  For backwards compatibility, a value of 0.0 (0x0000) is interpreted as 1.0 (0x1000).
  This value is used to scale the effective PWM duty cycle, a conceptual fraction
  of full speed (0% to 100%), to the actual electrical PWM duty cycle.
  PWM(actual) = Slope × PWM(effective) + Offset

PWM Scale Offset (16 bits):

  Offset to scale effective PWM to actual PWM (1/4096, F4.12, signed).
  This value is used to scale the effective PWM duty cycle, a conceptual fraction
  of full speed (0% to 100%), to the actual electrical PWM duty cycle.
  PWM(actual) = Slope × PWM(effective) + Offset


However, the calculations are hard to get right, and the table stores
values in fixed-point format, so I'm showing a few simplified code excerpts
that use these. The various fixed point macro definitions are found as part of
our normal driver package, in nvmisc.h and nvtypes.h. Any other definitions
that you need are included right here (I ran a quick compiler check to be sure.)

#define VBIOS_THERM_COOLER_TABLE_10_ENTRY_SIZE_10                    0x00000010

// Fan Cooler Table Version
#define NV_FAN_COOLER_TABLE_V2_VERSION_10                             0x10

// We limit the size of V2 tables
#define NV_FAN_COOLER_TABLE_V2_MAX_ENTRIES                            10

// Entry skip.
#define NV_FAN_COOLER_TABLE_V2_SKIP_ENTRY                             0x000000FF

#define NV_FAN_COOLER_TABLE_TYPE                                      3:0       // field1- dword
#define NV_FAN_COOLER_TABLE_TYPE_PASSIVE_HEAT_SINK                    0x00000000
#define NV_FAN_COOLER_TABLE_TYPE_ACTIVE_FAN_SINK                      0x00000001
#define NV_FAN_COOLER_TABLE_TYPE_ACTIVE_SKIP                          0x0000000F
#define NV_FAN_COOLER_TABLE_TYPE_DEFAULT                              NV_FAN_COOLER_TABLE_TYPE_PASSIVE_HEAT_SINK

#define NV_FAN_COOLER_TABLE_TARGET_AFFINITY                           6:4
#define NV_FAN_COOLER_TABLE_TARGET_AFFINITY_GPU                       0x00000000
#define NV_FAN_COOLER_TABLE_TARGET_AFFINITY_ALL                       0x00000001
#define NV_FAN_COOLER_TABLE_TARGET_AFFINITY_DEFAULT                   NV_FAN_COOLER_TABLE_TARGET_AFFINITY_GPU

#define NV_FAN_COOLER_TABLE_CONTROL_DEVICE                            10:8
#define NV_FAN_COOLER_TABLE_CONTROL_DEVICE_NONE                       0x00000000
#define NV_FAN_COOLER_TABLE_CONTROL_DEVICE_GPU                        0x00000001
#define NV_FAN_COOLER_TABLE_CONTROL_DEVICE_EXTERNAL                   0x00000002
#define NV_FAN_COOLER_TABLE_CONTROL_DEVICE_DEFAULT                    NV_FAN_COOLER_TABLE_CONTROL_DEVICE_NONE

#define NV_FAN_COOLER_TABLE_TACHOMETER_DEVICE                         14:12
#define NV_FAN_COOLER_TABLE_TACHOMETER_DEVICE_NONE                    0x00000000
#define NV_FAN_COOLER_TABLE_TACHOMETER_DEVICE_GPU                     0x00000001
#define NV_FAN_COOLER_TABLE_TACHOMETER_DEVICE_EXTERNAL_INSTANCE0      0x00000002
#define NV_FAN_COOLER_TABLE_TACHOMETER_DEVICE_DEFAULT                 NV_FAN_COOLER_TABLE_TACHOMETER_DEVICE_NONE

#define NV_FAN_COOLER_TABLE_CONTROL_SPEED_MAXIMUM                     25:16

#define NV_FAN_COOLER_TABLE_CONTROL_SIGNAL                            29:26
#define NV_FAN_COOLER_TABLE_CONTROL_SIGNAL_NONE                       0x00000000
#define NV_FAN_COOLER_TABLE_CONTROL_SIGNAL_UNKNOWN                    0x00000001
#define NV_FAN_COOLER_TABLE_CONTROL_SIGNAL_FAN_SPECIFIC_INSTANCE0     0x00000002
#define NV_FAN_COOLER_TABLE_CONTROL_SIGNAL_GPIO_FAN_FUNC_INSTANCE0    0x00000003
#define NV_FAN_COOLER_TABLE_CONTROL_SIGNAL_DEFAULT                    NV_FAN_COOLER_TABLE_CONTROL_SIGNAL_NONE

#define NV_FAN_COOLER_TABLE_CONTROL_POLARITY                          31:30
#define NV_FAN_COOLER_TABLE_CONTROL_POLARITY_GPIO                     0x00000000
#define NV_FAN_COOLER_TABLE_CONTROL_POLARITY_LOW                      0x00000001
#define NV_FAN_COOLER_TABLE_CONTROL_POLARITY_HIGH                     0x00000002
#define NV_FAN_COOLER_TABLE_CONTROL_POLARITY_DEFAULT                  NV_FAN_COOLER_TABLE_CONTROL_POLARITY_GPIO

#define NV_FAN_COOLER_TABLE_CONTROL_SPEED_MINIMUM                     9:0      // field2- dword

#define NV_FAN_COOLER_TABLE_TACHOMETER_SIGNAL                         13:10
#define NV_FAN_COOLER_TABLE_TACHOMETER_SIGNAL_NONE                    0x00000000
#define NV_FAN_COOLER_TABLE_TACHOMETER_SIGNAL_UNKNOWN                 0x00000001
#define NV_FAN_COOLER_TABLE_TACHOMETER_SIGNAL_TACH_SPECIFIC_INSTANCE0 0x00000002
#define NV_FAN_COOLER_TABLE_TACHOMETER_SIGNAL_GPIO_TACH_FUNC_INSTANCE0 0x00000003
#define NV_FAN_COOLER_TABLE_TACHOMETER_SIGNAL_DEFAULT                 NV_FAN_COOLER_TABLE_TACHOMETER_SIGNAL_NONE

#define NV_FAN_COOLER_TABLE_TACHOMETER_RATE                           15:14
#define NV_FAN_COOLER_TABLE_TACHOMETER_RATE_1                         0x00000000
#define NV_FAN_COOLER_TABLE_TACHOMETER_RATE_2                         0x00000001
#define NV_FAN_COOLER_TABLE_TACHOMETER_RATE_3                         0x00000002
#define NV_FAN_COOLER_TABLE_TACHOMETER_RATE_4                         0x00000003
#define NV_FAN_COOLER_TABLE_TACHOMETER_RATE_DEFAULT                   NV_FAN_COOLER_TABLE_TACHOMETER_RATE_1

#define NV_FAN_COOLER_TABLE_PWM_MINIMUM                               22:16

#define NV_FAN_COOLER_TABLE_CONTROL_STOP                              23:23
#define NV_FAN_COOLER_TABLE_CONTROL_STOP_PWM                          0x00000000
#define NV_FAN_COOLER_TABLE_CONTROL_STOP_POWER                        0x00000001
#define NV_FAN_COOLER_TABLE_CONTROL_STOP_DEFAULT                      NV_FAN_COOLER_TABLE_CONTROL_STOP_PWM

#define NV_FAN_COOLER_TABLE_PWM_START                                 30:24

#define NV_FAN_COOLER_TABLE_PWM_FREQUENCY                             11:0     // field3 - dword
#define NV_FAN_COOLER_TABLE_PWM_FREQUENCY_UNDEFINED                   0x00000000

#define NV_FAN_COOLER_TABLE_FIELD3_RSVD                               15:12

#define NV_FAN_COOLER_TABLE_FIELD3_PWM_SCALE_SLOPE                    31:16

#define NV_FAN_COOLER_TABLE_FIELD4_PWM_SCALE_OFFSET                   15:0     // field4 - dword

#define NV_FAN_COOLER_TABLE_FIELD4_LOW_ENDPOINT_EXPECTED_ERROR        23:16

#define NV_FAN_COOLER_TABLE_FIELD4_INTERPOLATION_EXPECTED_ERROR       31:24

#define NV_FAN_COOLER_TABLE_FIELD5_HIGH_ENDPOINT_EXPECTED_ERROR       7:0

#define NV_FAN_COOLER_TABLE_FIELD5_RSVD                               31:8

// Fan Cooler Table entry

typedef struct
{
    NvU32 field1;
    NvU32 field2;
    NvU32 field3;
    NvU32 field4;
    NvU32 field5;
} FAN_COOLER_TABLEENTRY;

// Fan Cooler Table
typedef struct
{
    NvU32                   version;
    NvU32                   entrySize;
    NvU32                   entryCount;
    FAN_COOLER_TABLEENTRY   entries[NV_FAN_COOLER_TABLE_V2_MAX_ENTRIES];
} FAN_COOLER_TABLE, *PFAN_COOLER_TABLE;

// Default minimum fan level - *cannot* be overriden by VBIOS:
#define FAN_SPEEDCONTROL_MINIMUM_LEVEL_DEFAULT          30

// Default maximum fan level - can be overriden by VBIOS:
#define FAN_SPEEDCONTROL_MAXIMUM_LEVEL_DEFAULT          100

/*!
 * Scales a PWM ratio (raw duty cycle / period) to a functional percentage,
 * which more adequately represents the percent of full phsyical fan speed on
 * the fan.
 *
 * @param[in] fanPwmScaleOffset   Fan PWM scale offset, in F4.12
 * @param[in] fanPwmScaleSlope    Fan PWM scale slope, in F4.12
 * @param[in] pwmRatio    PWM ratio in F16.16.  However, expected values are in
 *            the range [0,1] so it's actually F1.16.
 *
 * @return Scaled percent in F16.16 - Note, this is an actual percentage stored
 *         in the fractional part.  The value is not scaled up by 100, as
 *         elsewhere in the RM.
 */
static NvUFXP16_16
fanPwmScalePwmRatioToPct
(
    NvSFXP4_12 fanPwmScaleOffset,
    NvSFXP4_12 fanPwmScaleSlope,
    NvUFXP16_16 pwmRatio
)
{
    NvUFXP16_16 pwmPct;

    if (fanPwmScaleSlope == 0)
    {
        // Various logging/tracing actions here...
        return 0;
    }

    //
    //   (F1.16 << 12) - (F4.12 << 16) => F4.28
    // / F4.12                         => F4.12
    // ----------------------------------------
    //                                    F4.16
    NvSFXP16_16 signedPwmPct = ((pwmRatio << 12) -
                                (((NvS32) fanPwmScaleOffset) << 16) +
                                 (fanPwmScaleSlope / 2)) /
                               fanPwmScaleSlope;

    if (signedPwmPct > NV_TYPES_S32_TO_SFXP_X_Y(16, 16, 1))
    {
        pwmPct = NV_TYPES_U32_TO_UFXP_X_Y(16, 16, 1);
    }
    else if (signedPwmPct < NV_TYPES_S32_TO_SFXP_X_Y(16, 16, 0))
    {
        pwmPct = NV_TYPES_U32_TO_UFXP_X_Y(16, 16, 0);
    }
    else
    {
        pwmPct = (NvUFXP16_16) signedPwmPct;
    }

    return pwmPct;
}

/*!
 * Scales a functional percentage (represing the percent of full physical fan
 * speed) to a PWM ratio (raw duty cycle / period).
 *
 * @param[in] fanPwmScaleOffset   Fan PWM scale offset, in F4.12
 * @param[in] fanPwmScaleSlope    Fan PWM scale slope, in F4.12
 * @param[in] pwmPct      Percent to scale in F16.16.  Note, this is an actual
 *            percentage stored in the fractional part.  The value is not scaled
 *            up by 100, as elsewhere in the RM.  So expected values are in the
 *            range [0,1] and actual value is really F.16.
 *
 * @return Scaled pwm ratio in F16.16
 */
static NvUFXP16_16
fanPwmScalePctToPwmRatio
(
    NvSFXP4_12 fanPwmScaleOffset,
    NvSFXP4_12 fanPwmScaleSlope,
    NvUFXP16_16 pwmPct
)
{
    NvUFXP16_16 pwmRatio;

    //
    //   (F1.16 * F4.12) >> 12  => F4.28 => F4.16
    // + F4.12 << 4                      => F4.16
    // ------------------------------------------
    //                                      F4.16
    //
    NvSFXP16_16 signedPwmRatio = pwmPct * fanPwmScaleSlope;
    signedPwmRatio = (signedPwmRatio >> 12) +
                     (DRF_VAL(_TYPES, _FXP, _FRACTIONAL_MSB(4, 12),
                            signedPwmRatio)) +
                     (((NvSFXP16_16) fanPwmScaleOffset) << 4);

    if (signedPwmRatio > NV_TYPES_S32_TO_SFXP_X_Y(16, 16, 1))
    {
        pwmRatio = NV_TYPES_U32_TO_UFXP_X_Y(16, 16, 1);
    }
    else if (signedPwmRatio < NV_TYPES_S32_TO_SFXP_X_Y(16, 16, 0))
    {
        pwmRatio = NV_TYPES_U32_TO_UFXP_X_Y(16, 16, 0);
    }
    else
    {
        pwmRatio = (NvUFXP16_16) signedPwmRatio;
    }

    return pwmRatio;
}

/*!
 * Parses the PWM Scale slope and offset from the Fan Coolers Table.
 *
 * @param[in]   pTable          FAN_COOLER_TABLE pointer from which to pull the
 *                              information.
 * @param[out]  pPwmScaleSlope  Pointer in which to return the slope
 * @param[out]  pPwmScaleOffset Pointer in which to return the offset
 *
 * @return NV_OK if values successfully returned in the pointers
 * @return NV_ERR_INVALID_ARGMENT if NULL pointers are provided.
 * @return NV_ERR_NOT_SUPPORTED if this Fan Coolers Table does not support
 *         these fields.
 */

NV_STATUS
fanCoolerTableGetPwmScale
(
    PFAN_COOLER_TABLE   pTable,
    NvSFXP4_12         *pPwmScaleSlope,
    NvSFXP4_12         *pPwmScaleOffset
)
{
    NV_STATUS status = NV_ERR_NOT_SUPPORTED;
    NvU32     i;

    if ((pPwmScaleSlope == NULL) ||
        (pPwmScaleOffset == NULL))
    {
       status = NV_ERR_INVALID_ARGUMENT;
       goto fanCoolerTableGetPwmScale_exit;
    }

    //
    // Make sure that we know the table supports this field.
    //
    // Ideally, this should have been abstracted out in the devinit
    // function to parse this table, so that our storage isn't
    // version-dependent.
    //
    if ((pTable->version >= NV_FAN_COOLER_TABLE_V2_VERSION_10) &&
        (pTable->entrySize >= VBIOS_THERM_COOLER_TABLE_10_ENTRY_SIZE_10))
    {
        for (i = 0; i < pTable->entryCount; i++)
        {
            // Slope of zero is unsupported, and the error case for this data.
            if ((FLD_TEST_DRF(_FAN, _COOLER_TABLE, _TYPE, _ACTIVE_FAN_SINK,
                              pTable->entries[i].field1)) &&
                (FLD_TEST_DRF(_FAN, _COOLER_TABLE, _CONTROL_DEVICE, _GPU,
                              pTable->entries[i].field1)))
            {
                //
                // Scale of zero is an invalid/unexpected case.  This is a major
                // failure.
                //
                if (FLD_TEST_DRF_NUM(_FAN_COOLER_TABLE, _FIELD3,
                      _PWM_SCALE_SLOPE, NV_TYPES_S32_TO_SFXP_X_Y(4, 12, 0),
                      pTable->entries[i].field3))
                {
                    // Warning/assertion here: Found a PWM Scaling Slope of
                    // zero!  This is invalid and would effectively lock the
                    // fan speed.
                }
                else
                {
                    *pPwmScaleSlope = (NvSFXP4_12) DRF_VAL(_FAN_COOLER_TABLE,
                        _FIELD3, _PWM_SCALE_SLOPE, pTable->entries[0].field3);

                    *pPwmScaleOffset = (NvSFXP4_12) DRF_VAL(_FAN_COOLER_TABLE,
                        _FIELD4, _PWM_SCALE_OFFSET, pTable->entries[0].field4);

                    status = NV_OK;
                }
                break;
            }
        }
    }

fanCoolerTableGetPwmScale_exit:
    return status;
}

/**
 * Converts a PWM duty cycle to a fan level (fan speed percentage) based on the
 * fan period and duty cycle.
 *
 * @param[in] fanPeriod          The fan period to convert
 * @param[in] dutyCycle          The duty cycle to convert
 * @param[in] fanPwmScaleOffset  PWM scale offset, from the VBIOS table
 * @param[in] fanPwmScaleSlope   PWM scale slope, from the VBIOS table
 *
 * @return The converted level
 */
NvU32
fanConvertDutyCycleToLevel
(
    NvU32 fanPeriod,
    NvU32 dutyCycle,
    NvSFXP4_12 fanPwmScaleOffset,
    NvSFXP4_12 fanPwmScaleSlope
)
{
    NvU32       level;
    NvUFXP16_16 pwmRatio;
    NvU64       pwmRatio64;

    // If the fan period is 0, we dont have a cooler, so default to OFF.
    if (fanPeriod == 0)
    {
        // OFF
        level = 0;
    }
    // If the fanPeriod is 1, we have an ON/OFF cooler
    else if (fanPeriod == 1)
    {
        // If the dutyCycle matches the fanPeriod, the cooler is ON
        if (dutyCycle == fanPeriod)
        {
            // ON.
            level = 100;
        }
        else
        {
            // OFF.
            level = 0;
        }
    }
    else
    {
        //
        // Variable speed, so calc level from dutyCycle and fanPeriod
        //

        //
        // On our legacy boards, we can have periods > 16-bits, meaning the
        // dutyCycle can be also be > 16-bits.  This means that if we shift left
        // by 16 we can overflow 32-bits.
        //
        // However, once we divide by the period, the result will always be in
        // the range [0,1] because dutyCycle <= period.  Thus, if we shift and
        // do the division/scaling in 64-bits the result can be truncated back
        // to 32-bits.
        //
        //   32.0 << 16   => 32.16
        // / 32.0
        // -----------------------
        //                  1.16
        //
        pwmRatio64 = NV_UNSIGNED_ROUNDED_DIV(((NvU64)dutyCycle) <<
                      DRF_SHIFT(NV_TYPES_FXP_INTEGER(32, 16)), fanPeriod);
        pwmRatio = (NvUFXP16_16) pwmRatio64;

        // F16.16 >> 16 => F16.0
        level = NV_TYPES_UFXP_X_Y_TO_U32_ROUNDED(16, 16,
                    fanPwmScalePwmRatioToPct(fanPwmScaleOffset,
                                             fanPwmScaleSlope,
                                             pwmRatio) * 100);

        // Make sure we're within the max and min bounds - this can be due to
        // rounding/truncation issues due to integer math.
        if (level > FAN_SPEEDCONTROL_MAXIMUM_LEVEL_DEFAULT)
        {
            level = FAN_SPEEDCONTROL_MAXIMUM_LEVEL_DEFAULT;
        }
        else if (level < FAN_SPEEDCONTROL_MINIMUM_LEVEL_DEFAULT)
        {
            level = FAN_SPEEDCONTROL_MINIMUM_LEVEL_DEFAULT;
        }
    }
    return level;
}

thanks,
-- 
John Hubbard
NVIDIA


--------------B6961E4284C6BAC1F1BE3CAD
Content-Type: text/html; charset="UTF-8";
	name="thermal_coolers_table_1.0.html"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="thermal_coolers_table_1.0.html"

PCFET0NUWVBFIGh0bWwgUFVCTElDICItLy9XM0MvL0RURCBYSFRNTCAxLjAgVHJhbnNpdGlv
bmFsLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL1RSL3hodG1sMS9EVEQveGh0bWwxLXRyYW5z
aXRpb25hbC5kdGQiPgo8aHRtbCB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRt
bCIgeG1sOmxhbmc9ImVuIiBsYW5nPSJlbiIgZGlyPSJsdHIiPgoJPGhlYWQ+CgkJPG1ldGEg
aHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9
VVRGLTgiIC8+Cgk8L2hlYWQ+Cjxib2R5Pgo8aDE+PHNwYW4gY2xhc3M9Im13LWhlYWRsaW5l
IiBpZD0iVGhlcm1hbF9Db29sZXJzX1RhYmxlXzEuMCI+CiAgICA8c3BhbiBjbGFzcz0ibXct
aGVhZGxpbmUtbnVtYmVyIj4xPC9zcGFuPiBUaGVybWFsIENvb2xlcnMgVGFibGUgMS4wPC9z
cGFuPjwvaDE+CjxoMj48c3BhbiBjbGFzcz0ibXctaGVhZGxpbmUiIGlkPSJUaGVybWFsX0Nv
b2xlcnNfVGFibGVfSGVhZGVyIj4KICAgIDxzcGFuIGNsYXNzPSJtdy1oZWFkbGluZS1udW1i
ZXIiPjEuMTwvc3Bhbj4gVGhlcm1hbCBDb29sZXJzIFRhYmxlIEhlYWRlcjwvc3Bhbj48L2gy
Pgo8cD5UaGUgVGhlcm1hbCBDb29sZXJzIFRhYmxlIEhlYWRlciBpcyBwb2ludGVkIGF0IGJ5
IHRoZSBUaGVybWFsIENvb2xlcnMgVGFibGUKICAgUG9pbnRlciBmaWVsZCBpbiB0aGUgQklP
UyBJbmZvcm1hdGlvbiBUb2tlbnMgKEJJVCkgQklUX1BFUkZfUFRSUyBzdHJ1Y3R1cmUKICAg
dmVyc2lvbiAyLiBUaGUgVGhlcm1hbCBDb29sZXJzIFRhYmxlIHRhYmxlIHN0YXJ0cyB3aXRo
IGEgaGVhZGVyLCBmb2xsb3dlZAogICBpbW1lZGlhdGVseSBieSBhbiBhcnJheSBvZiBlbnRy
aWVzLgo8L3A+Cjx0YWJsZSBjZWxscGFkZGluZz0iNSIgYm9yZGVyPSIxIiB3aWR0aD0iODAw
IiBzdHlsZT0iYm9yZGVyLWNvbGxhcHNlOiBjb2xsYXBzZSI+Cgo8dHI+Cjx0aD4gTmFtZSA8
L3RoPgo8dGg+IEJpdCB3aWR0aCA8L3RoPgo8dGg+IFZhbHVlcyBhbmQgbWVhbmluZwo8L3Ro
PjwvdHI+Cjx0cj4KPHRkPiBWZXJzaW9uIDwvdGQ+Cjx0ZD4gOCA8L3RkPgo8dGQ+IFRoZXJt
YWwgQ29vbGVycyBUYWJsZSB2ZXJzaW9uICgweDEwKQo8L3RkPjwvdHI+Cjx0cj4KPHRkPiBI
ZWFkZXIgU2l6ZSA8L3RkPgo8dGQ+IDggPC90ZD4KPHRkPiBTaXplIG9mIFRoZXJtYWwgQ29v
bGVycyBUYWJsZSBIZWFkZXIgaW4gYnl0ZXMgKDQpCjwvdGQ+PC90cj4KPHRyPgo8dGQ+IEVu
dHJ5IFNpemUgPC90ZD4KPHRkPiA4IDwvdGQ+Cjx0ZD4gU2l6ZSBvZiBUaGVybWFsIENvb2xl
cnMgVGFibGUgRW50cnkgaW4gYnl0ZXMgKDIwKQo8L3RkPjwvdHI+Cjx0cj4KPHRkPiBFbnRy
eSBDb3VudCA8L3RkPgo8dGQ+IDggPC90ZD4KPHRkPiBOdW1iZXIgb2YgVGhlcm1hbCBDb29s
ZXJzIFRhYmxlIEVudHJpZXMKPC90ZD48L3RyPjwvdGFibGU+CjxoMj48c3BhbiBjbGFzcz0i
bXctaGVhZGxpbmUiIGlkPSJUaGVybWFsX0Nvb2xlcnNfVGFibGVfRW50cnkiPgogICAgPHNw
YW4gY2xhc3M9Im13LWhlYWRsaW5lLW51bWJlciI+MS4yPC9zcGFuPiBUaGVybWFsIENvb2xl
cnMgVGFibGUgRW50cnk8L3NwYW4+PC9oMj4KPHRhYmxlIGNlbGxwYWRkaW5nPSI1IiBib3Jk
ZXI9IjEiIHdpZHRoPSI4MDAiIHN0eWxlPSJib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlIj4K
Cjx0ciBzdHlsZT0iZm9udC13ZWlnaHQ6IGJvbGQiPgo8dGQgYWxpZ249ImxlZnQiPiAzMQo8
L3RkPgo8dGQ+ICYjMTYwOyA8L3RkPgo8dGQ+ICYjMTYwOwo8L3RkPgo8dGQgYWxpZ249InJp
Z2h0Ij4gMjgKPC90ZD4KPHRkIGFsaWduPSJsZWZ0Ij4gMjcKPC90ZD4KPHRkPiAmIzE2MDsg
PC90ZD4KPHRkPiAmIzE2MDsKPC90ZD4KPHRkIGFsaWduPSJyaWdodCI+IDI0CjwvdGQ+Cjx0
ZCBhbGlnbj0ibGVmdCI+IDIzCjwvdGQ+Cjx0ZD4gJiMxNjA7IDwvdGQ+Cjx0ZD4gJiMxNjA7
CjwvdGQ+Cjx0ZCBhbGlnbj0icmlnaHQiPiAyMAo8L3RkPgo8dGQgYWxpZ249ImxlZnQiPiAx
OQo8L3RkPgo8dGQ+ICYjMTYwOyA8L3RkPgo8dGQ+ICYjMTYwOwo8L3RkPgo8dGQgYWxpZ249
InJpZ2h0Ij4gMTYKPC90ZD4KPHRkIGFsaWduPSJsZWZ0Ij4gMTUKPC90ZD4KPHRkPiAmIzE2
MDsgPC90ZD4KPHRkPiAmIzE2MDsKPC90ZD4KPHRkIGFsaWduPSJyaWdodCI+IDEyCjwvdGQ+
Cjx0ZCBhbGlnbj0ibGVmdCI+IDExCjwvdGQ+Cjx0ZD4gJiMxNjA7IDwvdGQ+Cjx0ZD4gJiMx
NjA7CjwvdGQ+Cjx0ZCBhbGlnbj0icmlnaHQiPiA4CjwvdGQ+Cjx0ZCBhbGlnbj0ibGVmdCI+
IDcKPC90ZD4KPHRkPiAmIzE2MDsgPC90ZD4KPHRkPiAmIzE2MDsKPC90ZD4KPHRkIGFsaWdu
PSJyaWdodCI+IDQKPC90ZD4KPHRkIGFsaWduPSJsZWZ0Ij4gMwo8L3RkPgo8dGQ+ICYjMTYw
OyA8L3RkPgo8dGQ+ICYjMTYwOwo8L3RkPgo8dGQgYWxpZ249InJpZ2h0Ij4gMAo8L3RkPjwv
dHI+Cjx0ciBzdHlsZT0idGV4dC1hbGlnbjogY2VudGVyOyI+Cjx0ZCBjb2xzcGFuPSIyIj4g
Q1AKPC90ZD4KPHRkIGNvbHNwYW49IjQiPiBDUwo8L3RkPgo8dGQgY29sc3Bhbj0iMTAiPiBT
cGVlZCBNYXhpbXVtCjwvdGQ+Cjx0ZCBjb2xzcGFuPSIxIj4gUnN2ZAo8L3RkPgo8dGQgY29s
c3Bhbj0iMyI+IFRhY2ggRGV2CjwvdGQ+Cjx0ZCBjb2xzcGFuPSIxIj4gUnN2ZAo8L3RkPgo8
dGQgY29sc3Bhbj0iMyI+IEN0cmwgRGV2CjwvdGQ+Cjx0ZCBjb2xzcGFuPSIxIj4gUnN2ZAo8
L3RkPgo8dGQgY29sc3Bhbj0iMyI+IFRBCjwvdGQ+Cjx0ZCBjb2xzcGFuPSI0Ij4gVHlwZQo8
L3RkPjwvdHI+Cjx0ciBzdHlsZT0iZm9udC13ZWlnaHQ6IGJvbGQiPgo8dGQgYWxpZ249Imxl
ZnQiPiA2Mwo8L3RkPgo8dGQ+ICYjMTYwOyA8L3RkPgo8dGQ+ICYjMTYwOwo8L3RkPgo8dGQg
YWxpZ249InJpZ2h0Ij4gNjAKPC90ZD4KPHRkIGFsaWduPSJsZWZ0Ij4gNTkKPC90ZD4KPHRk
PiAmIzE2MDsgPC90ZD4KPHRkPiAmIzE2MDsKPC90ZD4KPHRkIGFsaWduPSJyaWdodCI+IDU2
CjwvdGQ+Cjx0ZCBhbGlnbj0ibGVmdCI+IDU1CjwvdGQ+Cjx0ZD4gJiMxNjA7IDwvdGQ+Cjx0
ZD4gJiMxNjA7CjwvdGQ+Cjx0ZCBhbGlnbj0icmlnaHQiPiA1Mgo8L3RkPgo8dGQgYWxpZ249
ImxlZnQiPiA1MQo8L3RkPgo8dGQ+ICYjMTYwOyA8L3RkPgo8dGQ+ICYjMTYwOwo8L3RkPgo8
dGQgYWxpZ249InJpZ2h0Ij4gNDgKPC90ZD4KPHRkIGFsaWduPSJsZWZ0Ij4gNDcKPC90ZD4K
PHRkPiAmIzE2MDsgPC90ZD4KPHRkPiAmIzE2MDsKPC90ZD4KPHRkIGFsaWduPSJyaWdodCI+
IDQ0CjwvdGQ+Cjx0ZCBhbGlnbj0ibGVmdCI+IDQzCjwvdGQ+Cjx0ZD4gJiMxNjA7IDwvdGQ+
Cjx0ZD4gJiMxNjA7CjwvdGQ+Cjx0ZCBhbGlnbj0icmlnaHQiPiA0MAo8L3RkPgo8dGQgYWxp
Z249ImxlZnQiPiAzOQo8L3RkPgo8dGQ+ICYjMTYwOyA8L3RkPgo8dGQ+ICYjMTYwOwo8L3Rk
Pgo8dGQgYWxpZ249InJpZ2h0Ij4gMzYKPC90ZD4KPHRkIGFsaWduPSJsZWZ0Ij4gMzUKPC90
ZD4KPHRkPiAmIzE2MDsgPC90ZD4KPHRkPiAmIzE2MDsKPC90ZD4KPHRkIGFsaWduPSJyaWdo
dCI+IDMyCjwvdGQ+PC90cj4KPHRyIHN0eWxlPSJ0ZXh0LWFsaWduOiBjZW50ZXI7Ij4KPHRk
IGNvbHNwYW49IjEiPiBDUwo8L3RkPgo8dGQgY29sc3Bhbj0iNyI+IFBXTSBTdGFydAo8L3Rk
Pgo8dGQgY29sc3Bhbj0iMSI+IFJzdmQKPC90ZD4KPHRkIGNvbHNwYW49IjciPiBQV00gTWlu
aW11bQo8L3RkPgo8dGQgY29sc3Bhbj0iMiI+IFRSCjwvdGQ+Cjx0ZCBjb2xzcGFuPSI0Ij4g
VFMKPC90ZD4KPHRkIGNvbHNwYW49IjEwIj4gU3BlZWQgTWluaW11bQo8L3RkPjwvdHI+Cjx0
ciBzdHlsZT0iZm9udC13ZWlnaHQ6IGJvbGQiPgo8dGQgYWxpZ249ImxlZnQiPiA5NQo8L3Rk
Pgo8dGQ+ICYjMTYwOyA8L3RkPgo8dGQ+ICYjMTYwOwo8L3RkPgo8dGQgYWxpZ249InJpZ2h0
Ij4gOTIKPC90ZD4KPHRkIGFsaWduPSJsZWZ0Ij4gOTEKPC90ZD4KPHRkPiAmIzE2MDsgPC90
ZD4KPHRkPiAmIzE2MDsKPC90ZD4KPHRkIGFsaWduPSJyaWdodCI+IDg4CjwvdGQ+Cjx0ZCBh
bGlnbj0ibGVmdCI+IDg3CjwvdGQ+Cjx0ZD4gJiMxNjA7IDwvdGQ+Cjx0ZD4gJiMxNjA7Cjwv
dGQ+Cjx0ZCBhbGlnbj0icmlnaHQiPiA4NAo8L3RkPgo8dGQgYWxpZ249ImxlZnQiPiA4Mwo8
L3RkPgo8dGQ+ICYjMTYwOyA8L3RkPgo8dGQ+ICYjMTYwOwo8L3RkPgo8dGQgYWxpZ249InJp
Z2h0Ij4gODAKPC90ZD4KPHRkIGFsaWduPSJsZWZ0Ij4gNzkKPC90ZD4KPHRkPiAmIzE2MDsg
PC90ZD4KPHRkPiAmIzE2MDsKPC90ZD4KPHRkIGFsaWduPSJyaWdodCI+IDc2CjwvdGQ+Cjx0
ZCBhbGlnbj0ibGVmdCI+IDc1CjwvdGQ+Cjx0ZD4gJiMxNjA7IDwvdGQ+Cjx0ZD4gJiMxNjA7
CjwvdGQ+Cjx0ZCBhbGlnbj0icmlnaHQiPiA3Mgo8L3RkPgo8dGQgYWxpZ249ImxlZnQiPiA3
MQo8L3RkPgo8dGQ+ICYjMTYwOyA8L3RkPgo8dGQ+ICYjMTYwOwo8L3RkPgo8dGQgYWxpZ249
InJpZ2h0Ij4gNjgKPC90ZD4KPHRkIGFsaWduPSJsZWZ0Ij4gNjcKPC90ZD4KPHRkPiAmIzE2
MDsgPC90ZD4KPHRkPiAmIzE2MDsKPC90ZD4KPHRkIGFsaWduPSJyaWdodCI+IDY0CjwvdGQ+
PC90cj4KPHRyIHN0eWxlPSJ0ZXh0LWFsaWduOiBjZW50ZXI7Ij4KPHRkIGNvbHNwYW49IjE2
Ij4gUFdNIFNjYWxlIFNsb3BlCjwvdGQ+Cjx0ZCBjb2xzcGFuPSI0Ij4gUnN2ZAo8L3RkPgo8
dGQgY29sc3Bhbj0iMTIiPiBQV00gRnJlcXVlbmN5CjwvdGQ+PC90cj4KPHRyIHN0eWxlPSJm
b250LXdlaWdodDogYm9sZCI+Cjx0ZCBhbGlnbj0ibGVmdCI+IDEyNwo8L3RkPgo8dGQ+ICYj
MTYwOyA8L3RkPgo8dGQ+ICYjMTYwOwo8L3RkPgo8dGQgYWxpZ249InJpZ2h0Ij4gMTI0Cjwv
dGQ+Cjx0ZCBhbGlnbj0ibGVmdCI+IDEyMwo8L3RkPgo8dGQ+ICYjMTYwOyA8L3RkPgo8dGQ+
ICYjMTYwOwo8L3RkPgo8dGQgYWxpZ249InJpZ2h0Ij4gMTIwCjwvdGQ+Cjx0ZCBhbGlnbj0i
bGVmdCI+IDExOQo8L3RkPgo8dGQ+ICYjMTYwOyA8L3RkPgo8dGQ+ICYjMTYwOwo8L3RkPgo8
dGQgYWxpZ249InJpZ2h0Ij4gMTE2CjwvdGQ+Cjx0ZCBhbGlnbj0ibGVmdCI+IDExNQo8L3Rk
Pgo8dGQ+ICYjMTYwOyA8L3RkPgo8dGQ+ICYjMTYwOwo8L3RkPgo8dGQgYWxpZ249InJpZ2h0
Ij4gMTEyCjwvdGQ+Cjx0ZCBhbGlnbj0ibGVmdCI+IDExMQo8L3RkPgo8dGQ+ICYjMTYwOyA8
L3RkPgo8dGQ+ICYjMTYwOwo8L3RkPgo8dGQgYWxpZ249InJpZ2h0Ij4gMTA4CjwvdGQ+Cjx0
ZCBhbGlnbj0ibGVmdCI+IDEwNwo8L3RkPgo8dGQ+ICYjMTYwOyA8L3RkPgo8dGQ+ICYjMTYw
Owo8L3RkPgo8dGQgYWxpZ249InJpZ2h0Ij4gMTA0CjwvdGQ+Cjx0ZCBhbGlnbj0ibGVmdCI+
IDEwMwo8L3RkPgo8dGQ+ICYjMTYwOyA8L3RkPgo8dGQ+ICYjMTYwOwo8L3RkPgo8dGQgYWxp
Z249InJpZ2h0Ij4gMTAwCjwvdGQ+Cjx0ZCBhbGlnbj0ibGVmdCI+IDk5CjwvdGQ+Cjx0ZD4g
JiMxNjA7IDwvdGQ+Cjx0ZD4gJiMxNjA7CjwvdGQ+Cjx0ZCBhbGlnbj0icmlnaHQiPiA5Ngo8
L3RkPjwvdHI+Cjx0ciBzdHlsZT0idGV4dC1hbGlnbjogY2VudGVyOyI+Cjx0ZCBjb2xzcGFu
PSI4Ij4gRXJyb3IgSW50ZXJwb2xhdGlvbgo8L3RkPgo8dGQgY29sc3Bhbj0iOCI+IEVycm9y
IEVuZHBvaW50IChMb3cpCjwvdGQ+Cjx0ZCBjb2xzcGFuPSIxNiI+IFBXTSBTY2FsZSBPZmZz
ZXQKPC90ZD48L3RyPgo8dHIgc3R5bGU9ImZvbnQtd2VpZ2h0OiBib2xkIj4KPHRkIGFsaWdu
PSJsZWZ0Ij4gMTU5CjwvdGQ+Cjx0ZD4gJiMxNjA7IDwvdGQ+Cjx0ZD4gJiMxNjA7CjwvdGQ+
Cjx0ZCBhbGlnbj0icmlnaHQiPgo8L3RkPgo8dGQgYWxpZ249ImxlZnQiPgo8L3RkPgo8dGQ+
ICYjMTYwOyA8L3RkPgo8dGQ+ICYjMTYwOwo8L3RkPgo8dGQgYWxpZ249InJpZ2h0Ij4KPC90
ZD4KPHRkIGFsaWduPSJsZWZ0Ij4KPC90ZD4KPHRkPiAmIzE2MDsgPC90ZD4KPHRkPiAmIzE2
MDsKPC90ZD4KPHRkIGFsaWduPSJyaWdodCI+CjwvdGQ+Cjx0ZCBhbGlnbj0ibGVmdCI+Cjwv
dGQ+Cjx0ZD4gJiMxNjA7IDwvdGQ+Cjx0ZD4gJiMxNjA7CjwvdGQ+Cjx0ZCBhbGlnbj0icmln
aHQiPgo8L3RkPgo8dGQgYWxpZ249ImxlZnQiPgo8L3RkPgo8dGQ+ICYjMTYwOyA8L3RkPgo8
dGQ+ICYjMTYwOwo8L3RkPgo8dGQgYWxpZ249InJpZ2h0Ij4KPC90ZD4KPHRkIGFsaWduPSJs
ZWZ0Ij4KPC90ZD4KPHRkPiAmIzE2MDsgPC90ZD4KPHRkPiAmIzE2MDsKPC90ZD4KPHRkIGFs
aWduPSJyaWdodCI+IDEzNgo8L3RkPgo8dGQgYWxpZ249ImxlZnQiPiAxMzUKPC90ZD4KPHRk
PiAmIzE2MDsgPC90ZD4KPHRkPiAmIzE2MDsKPC90ZD4KPHRkIGFsaWduPSJyaWdodCI+Cjwv
dGQ+Cjx0ZCBhbGlnbj0ibGVmdCI+CjwvdGQ+Cjx0ZD4gJiMxNjA7IDwvdGQ+Cjx0ZD4gJiMx
NjA7CjwvdGQ+Cjx0ZCBhbGlnbj0icmlnaHQiPiAxMjgKPC90ZD48L3RyPgo8dHIgc3R5bGU9
InRleHQtYWxpZ246IGNlbnRlcjsiPgo8dGQgY29sc3Bhbj0iMjQiPiBSZXNlcnZlZAo8L3Rk
Pgo8dGQgY29sc3Bhbj0iOCI+IEVycm9yIEVuZHBvaW50IChIaWdoKQo8L3RkPjwvdHI+PC90
YWJsZT4KPHA+PGJyIC8+CjwvcD4KPHRhYmxlIGNlbGxwYWRkaW5nPSI1IiBib3JkZXI9IjEi
IHdpZHRoPSI4MDAiIHN0eWxlPSJib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlIj4KCjx0cj4K
PHRoPiBOYW1lIDwvdGg+Cjx0aD4gQml0IHdpZHRoIDwvdGg+Cjx0aD4gVmFsdWVzIGFuZCBt
ZWFuaW5nCjwvdGg+PC90cj4KPHRyPgo8dGQ+IFR5cGUgPC90ZD4KPHRkPiA0IDwvdGQ+Cjx0
ZD4gVHlwZSBvZiBjb29sZXIuCjxkbD4KPGRkPiAweDAgPSBQYXNzaXZlIEhlYXQgU2luayAo
RGVmYXVsdCkKPC9kZD4KPGRkPiAweDEgPSBBY3RpdmUgRmFuIFNpbmsKPC9kZD4KPGRkPiAw
eDIgLSAweEUgPSBSZXNlcnZlZAo8L2RkPgo8ZGQ+IDB4RiA9IFNraXAgRW50cnkKPC9kZD4K
PC9kbD4KPC90ZD48L3RyPgo8dHI+Cjx0ZD4gVGFyZ2V0IEFmZmluaXR5IDwvdGQ+Cjx0ZD4g
MyA8L3RkPgo8dGQ+IENvb2xlcidzIHRhcmdldCBhZmZpbml0eS4gIFRoaXMgc3BlY2lmaWVz
IHdoaWNoIGRldmljZShzKSB0aGUgY29vbGVyIGlzCiAgICAgaW50ZW5kZWQgdG8gYWZmZWN0
Lgo8ZGw+CjxkZD4gMHgwID0gR1BVIChEZWZhdWx0KQo8L2RkPgo8ZGQ+IDB4MSA9IEFsbCBD
b21wb25lbnRzCjwvZGQ+CjxkZD4gMHgyIC0gMHg3ID0gUmVzZXJ2ZWQKPC9kZD4KPC9kbD4K
PC90ZD48L3RyPgo8dHI+Cjx0ZD4gUmVzZXJ2ZWQgPC90ZD4KPHRkPiAxIDwvdGQ+Cjx0ZD4g
UmVzZXJ2ZWQKPC90ZD48L3RyPgo8dHI+Cjx0ZD4gQ29udHJvbCBEZXZpY2UgPC90ZD4KPHRk
PiAzIDwvdGQ+Cjx0ZD4gRGV2aWNlIGNvbm5lY3RlZCB0byB0aGUgY29vbGVyJ3MgY29udHJv
bCBzaWduYWwKPGRsPgo8ZGQ+IDB4MCA9IE5vbmUgKFVuY29udHJvbGxlZCwgRGVmYXVsdCkK
PC9kZD4KPGRkPiAweDEgPSBHUFUKPC9kZD4KPGRkPiAweDIgPSBFeHRlcm5hbCBJbnN0YW5j
ZSAwCjwvZGQ+CjxkZD4gMHgzIC0gMHg3ID0gUmVzZXJ2ZWQKPC9kZD4KPC9kbD4KPC90ZD48
L3RyPgo8dHI+Cjx0ZD4gUmVzZXJ2ZWQgPC90ZD4KPHRkPiAxIDwvdGQ+Cjx0ZD4gUmVzZXJ2
ZWQKPC90ZD48L3RyPgo8dHI+Cjx0ZD4gVGFjaG9tZXRlciBEZXZpY2UgPC90ZD4KPHRkPiAz
IDwvdGQ+Cjx0ZD4gRGV2aWNlIGNvbm5lY3RlZCB0byB0aGUgY29vbGVyJ3MgdGFjaG9tZXRl
ciBzaWduYWwKPGRsPgo8ZGQ+IDB4MCA9IE5vbmUgKFVuZGV0ZWN0YWJsZSwgRGVmYXVsdCkK
PC9kZD4KPGRkPiAweDEgPSBHUFUKPC9kZD4KPGRkPiAweDIgPSBFeHRlcm5hbCBJbnN0YW5j
ZSAwCjwvZGQ+CjxkZD4gMHgzIC0gMHg3ID0gUmVzZXJ2ZWQKPC9kZD4KPC9kbD4KPC90ZD48
L3RyPgo8dHI+Cjx0ZD4gUmVzZXJ2ZWQgPC90ZD4KPHRkPiAxIDwvdGQ+Cjx0ZD4gUmVzZXJ2
ZWQKPC90ZD48L3RyPgo8dHI+Cjx0ZD4gU3BlZWQgTWF4aW11bSA8L3RkPgo8dGQ+IDEwIDwv
dGQ+Cjx0ZD4gRmFuIHNwZWVkIGNvcnJlc3BvbmRpbmcgdG8gVGhlcm1hbCBQb2xpY3kgbWF4
aW11bSBkdXR5IGN5Y2xlIFBXTSBzaWduYWwKICAgICAoMTAgUlBNLCAwIFJQTSB0byAxMDIz
MCBSUE0pCjx1bD4KPGxpPiBUaGUgVGhlcm1hbCBQb2xpY3kgVGFibGUgMi54IG1heGltdW0g
ZHV0eSBjeWNsZSBpcyBkZWZpbmVkIGJ5CiAgICAgT1BDT0RFX0ZBTlNQRUVEX01JTk1BWF9N
QVhJTVVNLgo8L2xpPgo8L3VsPgo8L3RkPjwvdHI+Cjx0cj4KPHRkPiBDb250cm9sIFNpZ25h
bCA8L3RkPgo8dGQ+IDQgPC90ZD4KPHRkPiBTaWduYWwgZm9yIFBXTSBvciBPbi9PZmYgY29u
dHJvbCByZWxhdGl2ZSB0byB0aGUgQ29udHJvbCBEZXZpY2UuCjxkbD4KPGRkPiAweDAgPSBO
b25lIChVbmNvbnRyb2xsZWQsIERlZmF1bHQpCjwvZGQ+CjxkZD4gMHgxID0gVW5rbm93bgo8
L2RkPgo8ZGQ+IDB4MiA9IEZhbi1zcGVjaWZpYyBJbnN0YW5jZSAwCjwvZGQ+CjxkZD4gMHgz
ID0gR1BJTyBGYW4gRnVuY3Rpb24gSW5zdGFuY2UgMAo8L2RkPgo8ZGQ+IDB4NCAtIDB4RiA9
IFJlc2VydmVkCjwvZGQ+CjwvZGw+CjwvdGQ+PC90cj4KPHRyPgo8dGQ+IENvbnRyb2wgUG9s
YXJpdHkgPC90ZD4KPHRkPiAyIDwvdGQ+Cjx0ZD4gQWN0aXZlIFBXTSBvciBPTiBjb250cm9s
IHNpZ25hbCBsZXZlbAo8ZGw+CjxkZD4gMHgwID0gVXNlIEdQSU8gRGVmaW5pdGlvbiAoRGVm
YXVsdCkKPC9kZD4KPGRkPiAweDEgPSBMb3cgKEFjdGl2ZS1sb3csIDEwMCUgPSBjb250aW51
b3VzIGxvdyBvdXRwdXQpCjwvZGQ+CjxkZD4gMHgyID0gSGlnaCAoQWN0aXZlLWhpZ2gsIDEw
MCUgPSBjb250aW51b3VzIGhpZ2ggb3V0cHV0KQo8L2RkPgo8ZGQ+IDB4MyA9IFJlc2VydmVk
CjwvZGQ+CjwvZGw+CjwvdGQ+PC90cj4KPHRyPgo8dGQ+IFNwZWVkIE1pbmltdW0gPC90ZD4K
PHRkPiAxMCA8L3RkPgo8dGQ+IEZhbiBzcGVlZCBjb3JyZXNwb25kaW5nIHRvIG1pbmltdW0g
ZHV0eSBjeWNsZSBQV00gc2lnbmFsCiAgICAgKDEwIFJQTSwgMCBSUE0gdG8gMTAyMzAgUlBN
KQo8dWw+CjxsaT4gVGhlIFRoZXJtYWwgUG9saWN5IFRhYmxlIDIueCBtaW5pbXVtIGR1dHkg
Y3ljbGUgaXMgZGVmaW5lZCBieQogICAgIE9QQ09ERV9GQU5TUEVFRF9NSU5NQVhfTUlOSU1V
TS4KPC9saT4KPC91bD4KPC90ZD48L3RyPgo8dHI+Cjx0ZD4gVGFjaG9tZXRlciBTaWduYWwg
PC90ZD4KPHRkPiA0IDwvdGQ+Cjx0ZD4gU2lnbmFsIGZvciBUYWNob21ldGVyIG9yIE9uL09m
ZiBkZXRlY3Rpb24gcmVsYXRpdmUgdG8gdGhlIFRhY2hvbWV0ZXIgRGV2aWNlLgo8ZGw+Cjxk
ZD4gMHgwID0gTm9uZSAoVW5kZXRlY3RhYmxlLCBEZWZhdWx0KQo8L2RkPgo8ZGQ+IDB4MSA9
IFVua25vd24KPC9kZD4KPGRkPiAweDIgPSBUYWNob21ldGVyLXNwZWNpZmljIEluc3RhbmNl
IDAKPC9kZD4KPGRkPiAweDMgPSBHUElPIFRhY2hvbWV0ZXIgRnVuY3Rpb24gSW5zdGFuY2Ug
MAo8L2RkPgo8ZGQ+IDB4NCAtIDB4RiA9IFJlc2VydmVkCjwvZGQ+CjwvZGw+CjwvdGQ+PC90
cj4KPHRyPgo8dGQ+IFRhY2hvbWV0ZXIgUmF0ZSA8L3RkPgo8dGQ+IDIgPC90ZD4KPHRkPiBO
dW1iZXIgb2YgdGFjaG9tZXRlciBwdWxzZXMgcGVyIHJldm9sdXRpb24KPGRsPgo8ZGQ+IDB4
MCA9IDEgKERlZmF1bHQpCjwvZGQ+CjxkZD4gMHgxID0gMgo8L2RkPgo8ZGQ+IDB4MiA9IDMK
PC9kZD4KPGRkPiAweDMgPSA0CjwvZGQ+CjwvZGw+CjwvdGQ+PC90cj4KPHRyPgo8dGQ+IChE
ZXByZWNhdGVkKSBQV00gTWluaW11bSA8L3RkPgo8dGQ+IDcgPC90ZD4KPHRkPiBNaW5pbXVt
IGR1dHkgY3ljbGUgUFdNIHNpZ25hbCB0byBrZWVwIGZhbiBydW5uaW5nIChwZXJjZW50LCAw
JSB0byAxMDAlKQo8dWw+CjxsaT4gU2V0IHRoZSBtaW5pbXVtIHNwZWVkIHRvIDEwMCUgdG8g
aW5kaWNhdGUgb24vb2ZmIG9ubHkgYmVoYXZpb3IgKG5vIFBXTSBzdXBwb3J0KQo8L2xpPgo8
bGk+IFRoZSB1c2Ugb2YgdGhpcyBmaWVsZCBoYXMgYmVlbiBkZXByZWNhdGVkLgo8L2xpPgo8
L3VsPgo8L3RkPjwvdHI+Cjx0cj4KPHRkPiBDb250cm9sIFN0b3AgPC90ZD4KPHRkPiAxIDwv
dGQ+Cjx0ZD4gQ29vbGVyIHN0b3AgbWV0aG9kCjxkbD4KPGRkPiAweDAgPSBQV00gKERlZmF1
bHQpCjxkbD4KPGRkPiBBIDAlIGR1dHkgY3ljbGUgUFdNIHNpZ25hbCB3aWxsIHN0b3AgdGhl
IGNvb2xlci4KPC9kZD4KPC9kbD4KPC9kZD4KPGRkPiAweDEgPSBQb3dlcgo8ZGw+CjxkZD4g
VGhlIGNvb2xlciByZW1haW5zIGFjdGl2ZSB3aXRoIGEgMCUgZHV0eSBjeWNsZSBQV00gc2ln
bmFsOyBwb3dlciB0byB0aGUKICAgICBjb29sZXIgbXVzdCBiZSByZW1vdmVkIHRvIHN0b3Ag
dGhlIGNvb2xlci4KPC9kZD4KPC9kbD4KPC9kZD4KPC9kbD4KPC90ZD48L3RyPgo8dHI+Cjx0
ZD4gKERlcHJlY2F0ZWQpIFBXTSBTdGFydCA8L3RkPgo8dGQ+IDcgPC90ZD4KPHRkPiBQV00g
ZHV0eSBjeWNsZSByZXF1aXJlZCB0byBzdGFydCBmYW4gZnJvbSB0aGUgb2ZmIHN0YXRlIChw
ZXJjZW50LCAwJSB0byAxMDAlKQo8dWw+CjxsaT4gVGhpcyB2YWx1ZSBtdXN0IGJlIGdyZWF0
ZXIgdGhhbiBvciBlcXVhbCB0byBQV00gTWluaW11bQo8L2xpPgo8bGk+IFRoZSB1c2Ugb2Yg
dGhpcyBmaWVsZCBoYXMgYmVlbiBkZXByZWNhdGVkLgo8L2xpPgo8L3VsPgo8L3RkPjwvdHI+
Cjx0cj4KPHRkPiBSZXNlcnZlZCA8L3RkPgo8dGQ+IDEgPC90ZD4KPHRkPiBSZXNlcnZlZAo8
L3RkPjwvdHI+Cjx0cj4KPHRkPiBQV00gRnJlcXVlbmN5IDwvdGQ+Cjx0ZD4gMTIgPC90ZD4K
PHRkPiBGcmVxdWVuY3kgb2YgcHVsc2Utd2lkdGggbW9kdWxhdGlvbiBzaWduYWwgKDEwIEh6
LCAxMCBIeiB0byA0MDk1MCBIeikKPHVsPgo8bGk+IDAgSHogaXMgYSByZXNlcnZlZCB2YWx1
ZSwgdGhlIGJlaGF2aW9yIGlzIHVuZGVmaW5lZAo8L2xpPgo8L3VsPgo8L3RkPjwvdHI+Cjx0
cj4KPHRkPiBSZXNlcnZlZCA8L3RkPgo8dGQ+IDQgPC90ZD4KPHRkPiBSZXNlcnZlZAo8L3Rk
PjwvdHI+Cjx0cj4KPHRkPiBQV00gU2NhbGUgU2xvcGUgPC90ZD4KPHRkPiAxNiA8L3RkPgo8
dGQ+IFNsb3BlIHRvIHNjYWxlIGVmZmVjdGl2ZSBQV00gdG8gYWN0dWFsIFBXTSAoMS80MDk2
LCBGNC4xMiwgc2lnbmVkKQo8ZGw+CjxkZD4gRm9yIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5
LCBhIHZhbHVlIG9mIDAuMCAoMHgwMDAwKSBpcwogICAgIGludGVycHJldGVkIGFzIDEuMCAo
MHgxMDAwKS4KPC9kZD4KPGRkPiBUaGlzIHZhbHVlIGlzIHVzZWQgdG8gc2NhbGUgdGhlIGVm
ZmVjdGl2ZSBQV00gZHV0eSBjeWNsZSwgYSBjb25jZXB0dWFsCiAgICAgZnJhY3Rpb24gb2Yg
ZnVsbCBzcGVlZCAoMCUgdG8gMTAwJSksIHRvIHRoZSBhY3R1YWwgZWxlY3RyaWNhbCBQV00g
ZHV0eQogICAgIGN5Y2xlLgo8L2RkPgo8ZGQ+UFdNKGFjdHVhbCkgPSBTbG9wZSDDlyBQV00o
ZWZmZWN0aXZlKSArIE9mZnNldAo8L2RkPgo8L2RsPgo8L3RkPjwvdHI+Cjx0cj4KPHRkPiBQ
V00gU2NhbGUgT2Zmc2V0IDwvdGQ+Cjx0ZD4gMTYgPC90ZD4KPHRkPiBPZmZzZXQgdG8gc2Nh
bGUgZWZmZWN0aXZlIFBXTSB0byBhY3R1YWwgUFdNICgxLzQwOTYsIEY0LjEyLCBzaWduZWQp
CjxkbD4KPGRkPiBUaGlzIHZhbHVlIGlzIHVzZWQgdG8gc2NhbGUgdGhlIGVmZmVjdGl2ZSBQ
V00gZHV0eSBjeWNsZSwgYSBjb25jZXB0dWFsCiAgICAgZnJhY3Rpb24gb2YgZnVsbCBzcGVl
ZCAoMCUgdG8gMTAwJSksIHRvIHRoZSBhY3R1YWwgZWxlY3RyaWNhbCBQV00gZHV0eQogICAg
IGN5Y2xlLgo8L2RkPgo8ZGQ+UFdNKGFjdHVhbCkgPSBTbG9wZSDDlyBQV00oZWZmZWN0aXZl
KSArIE9mZnNldAo8L2RkPgo8L2RsPgo8L3RkPjwvdHI+Cjx0cj4KPHRkPiBFcnJvciBFbmRw
b2ludCAoTG93KSA8L3RkPgo8dGQ+IDggPC90ZD4KPHRkPiBFcnJvciB0b2xlcmFuY2UgZm9y
IGFjdHVhbCBzcGVlZCBjb21wYXJlZCB0byBleHBlY3RlZCBzcGVlZCBhdCBUaGVybWFsCiAg
ICAgUG9saWN5IG1pbmltdW0gZHV0eSBjeWNsZS4gKHBlcmNlbnQpCjwvdGQ+PC90cj4KPHRy
Pgo8dGQ+IEVycm9yIEludGVycG9sYXRpb24gPC90ZD4KPHRkPiA4IDwvdGQ+Cjx0ZD4gRXJy
b3IgdG9sZXJhbmNlIGZvciBhY3R1YWwgc3BlZWQgY29tcGFyZWQgdG8gbGluZWFybHkgaW50
ZXJwb2xhdGVkCiAgICAgZXhwZWN0ZWQgc3BlZWRzIGJldHdlZW4gVGhlcm1hbCBQb2xpY3kg
bWluaW11bSBhbmQgbWF4aW11bSBkdXR5IGN5Y2xlcy4gKHBlcmNlbnQpCjwvdGQ+PC90cj4K
PHRyPgo8dGQ+IEVycm9yIEVuZHBvaW50IChIaWdoKSA8L3RkPgo8dGQ+IDggPC90ZD4KPHRk
PiBFcnJvciB0b2xlcmFuY2UgZm9yIGFjdHVhbCBzcGVlZCBjb21wYXJlZCB0byBleHBlY3Rl
ZCBzcGVlZCBhdCBUaGVybWFsCiAgICAgUG9saWN5IG1heGltdW0gZHV0eSBjeWNsZS4gKHBl
cmNlbnQpCjwvdGQ+PC90cj4KPHRyPgo8dGQ+IFJlc2VydmVkIDwvdGQ+Cjx0ZD4gMjQgPC90
ZD4KPHRkPiBSZXNlcnZlZAo8L3RkPjwvdHI+PC90YWJsZT4KPGgzPjxzcGFuIGNsYXNzPSJt
dy1oZWFkbGluZSIgaWQ9IlRoZXJtYWxfQ29vbGVyc19UYWJsZV9FbnRyeV9Ob3RlcyI+CiAg
ICA8c3BhbiBjbGFzcz0ibXctaGVhZGxpbmUtbnVtYmVyIj4xLjIuMTwvc3Bhbj4KICAgIFRo
ZXJtYWwgQ29vbGVycyBUYWJsZSBFbnRyeSBOb3Rlczwvc3Bhbj48L2gzPgo8b2w+CjxsaT4g
VGhlIHNwZWNpZmllZCBkZWZhdWx0cyBpbmRpY2F0ZSB0aGUgdmFsdWUgaW5pdGlhbGx5IGFs
bG9jYXRlZCBpbiB0aGUKICAgICBzdHJ1Y3R1cmUgKHR5cGljYWxseSAwKS4gIFRoaXMgdmFs
dWUgd2lsbCByZW1haW4gaWYgbm90IG92ZXJyaWRkZW4gZm9yIGEKICAgICBzcGVjaWZpYyBi
b2FyZCBhbmQgU0tVLgo8L2xpPgo8bGk+ICJDb250cm9sIFNpZ25hbCIgYW5kICJUYWNob21l
dGVyIFNpZ25hbCIgc2hvdWxkIG1haW50YWluIGVxdWl2YWxlbnQgZW51bWVyYW50cy4KPC9s
aT4KPGxpPiAiQ29udHJvbFNpZ25hbC5Vbmtub3duIiBpbmRpY2F0ZXMgZmFuIGNvbnRyb2wg
aXMgcHJlc2VudCwgYnV0IG5vIHByb2dyYW1taW5nIGlzIHJlcXVpcmVkLgo8L2xpPgo8bGk+
ICJDb250cm9sU2lnbmFsLkZhbi1TcGVjaWZpY0luc3RhbmNlMCIgcmVmZXJzIHRvIHRoZSBG
QU4gcGluIG9uIE5WSU8uCjwvbGk+CjxsaT4gIlRhY2hvbWV0ZXJTaWduYWwuVGFjaG9tZXRl
ci1TcGVjaWZpY0luc3RhbmNlMCIgd291bGQgcmVmZXIgdG8gYSBkZWRpY2F0ZWQKICAgICBU
QUNIIHBpbiBpZiBldmVyIGltcGxlbWVudGVkLgo8L2xpPgo8bGk+ICJUYWNob21ldGVyU2ln
bmFsLlVua25vd24iIGluZGljYXRlcyBzcGVlZCBkZXRlY3Rpb24gaXMgcHJlc2VudCwgYnV0
IG5vCiAgICAgcHJvZ3JhbW1pbmcgaXMgcmVxdWlyZWQuCjwvbGk+CjxsaT4gIlRhY2hvbWV0
ZXIgUG9sYXJpdHkiIGlzIG5vdCBzcGVjaWZpZWQsIGl0IGlzIGFzc3VtZWQgdG8gYmUgQWN0
aXZlLWhpZ2gKICAgICBib3RoIGZvciBjb3VudGluZyB0YWNob21ldGVyIHB1bHNlcyBvciBm
b3Igb24gZGV0ZWN0aW9uLgo8L2xpPgo8L29sPgo8L2JvZHk+PC9odG1sPgoK
--------------B6961E4284C6BAC1F1BE3CAD
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--------------B6961E4284C6BAC1F1BE3CAD--
