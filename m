From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [REGRESSION] drm/g94/i2c: add aux channel interrupt
	driver
Date: Wed, 18 Jun 2014 08:13:58 +1000
Message-ID: <CACAvsv7zn14YEnw1PYvN5Vk1i-SjBn=Kv7Sd8hr9D097aQq1Hw@mail.gmail.com>
References: <53A052DA.2070207@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53A052DA.2070207-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Jun 18, 2014 at 12:38 AM, Maarten Lankhorst
<maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
> Hey,
>
> This patch causes a regression on my display-less nvd7.
> Commenting out the aux, aux_stat and aux_mask members in nvd0_i2c_oclass fixes boot, and makes things work normally again.
>
Hey Maarten,

Yeah that probably makes sense that those regs aren't there, no idea
how it breaks gr though :P  I'll push a fix, sorry for that.

Ben.

> broken dmesg:
>
> [   40.314470] ACPI Warning: \_SB_.PCI0.GFX0._DSM: Argument #4 type mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
> [   40.314729] ACPI Warning: \_SB_.PCI0.GFX0._DSM: Argument #4 type mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
> [   40.314963] i915 0000:00:02.0: optimus capabilities: enabled, status dynamic power,
> [   40.315001] ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
> [   40.315198] ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI requires [Package] (20140424/nsarguments-95)
> [   40.315386] pci 0000:01:00.0: optimus capabilities: enabled, status dynamic power,
> [   40.315392] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.PEGP handle
> [   40.315652] nouveau D[     DRM] hdmi device not found 1 0 1
> [   40.315695] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0d7000a2
> [   40.315698] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF117 (NVD7)
> [   40.315700] nouveau  [  DEVICE][0000:01:00.0] Family : NVD0
> [   40.315703] nouveau D[  DEVICE][0000:01:00.0] crystal freq: 27000KHz
> [   40.315724] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
> [   40.315728] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
> [   40.315730] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
> [   40.315787] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
> [   40.315788] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
> [   40.361066] init: Failed to obtain startpar-bridge instance: Unknown parameter: INSTANCE
> [   40.505222] ieee80211 phy0: Selected rate control algorithm 'iwl-agn-rs'
> [   41.547821] snd_hda_intel 0000:00:1b.0: irq 47 for MSI/MSI-X
> [   41.695435] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
> [   41.695441] nouveau  [   VBIOS][0000:01:00.0] using image from ACPI
> [   41.695539] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
> [   41.695543] nouveau  [   VBIOS][0000:01:00.0] version 75.17.53.00.12
> [   41.695746] nouveau D[   VBIOS][0000:01:00.0] reset
> [   41.695751] nouveau D[ DEVINIT][0000:01:00.0] reset
> [   41.695753] nouveau  [   VBIOS][0000:01:00.0] running init tables
> [   41.695884] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.697027] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.697030] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.698124] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.698126] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.699239] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.699242] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.700337] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.704845] sound hdaudioC0D0: autoconfig: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
> [   41.704848] sound hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [   41.704850] sound hdaudioC0D0:    hp_outs=1 (0x15/0x0/0x0/0x0/0x0)
> [   41.704851] sound hdaudioC0D0:    mono: mono_out=0x0
> [   41.704852] sound hdaudioC0D0:    inputs:
> [   41.704854] sound hdaudioC0D0:      Mic=0x1a
> [   41.704856] sound hdaudioC0D0:      Internal Mic=0x19
> [   41.783610] nouveau D[    GPIO][0000:01:00.0] reset
> [   41.783616] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.783618] nouveau D[     I2C][0000:01:00.0] PAD:X:05: -> NULL
> [   41.784591] nouveau D[     I2C][0000:01:00.0] reset
> [   41.784596] nouveau D[     MXM][0000:01:00.0] no VBIOS data, nothing to do
> [   41.784599] nouveau D[     MXM][0000:01:00.0] reset
> [   41.784619] nouveau 0000:01:00.0: irq 48 for MSI/MSI-X
> [   41.784634] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
> [   41.784655] nouveau D[     PMC][0000:01:00.0] reset
> [   41.784658] nouveau D[    PBUS][0000:01:00.0] reset
> [   41.784660] nouveau D[  PTIMER][0000:01:00.0] reset
> [   41.784662] nouveau D[  PTIMER][0000:01:00.0] input frequency : 27000Hz
> [   41.784663] nouveau D[  PTIMER][0000:01:00.0] input multiplier: 3
> [   41.784665] nouveau D[  PTIMER][0000:01:00.0] numerator       : 0x00000144
> [   41.784666] nouveau D[  PTIMER][0000:01:00.0] denominator     : 0x0000007d
> [   41.784668] nouveau D[  PTIMER][0000:01:00.0] timer frequency : 31250Hz
> [   41.784669] nouveau D[  PTIMER][0000:01:00.0] time low        : 0x00000000
> [   41.784670] nouveau D[  PTIMER][0000:01:00.0] time high       : 0x00000000
> [   41.786060] nouveau D[     PFB][0000:01:00.0] 0x100800: 0x00000001
> [   41.786062] nouveau D[     PFB][0000:01:00.0] parts 0x00000000 mask 0x00000000
> [   41.786074] nouveau W[     PFB][0000:01:00.0][0x00000000][ffff8800028d1000] reclocking of this ram type unsupported
> [   41.786076] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
> [   41.786077] nouveau  [     PFB][0000:01:00.0] RAM size: 0 MiB
> [   41.786078] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
> [   41.786081] nouveau D[     PFB][0000:01:00.0] reset
> [   41.786091] nouveau D[   PLTCG][0000:01:00.0] reset
> [   41.786094] nouveau D[   PIBUS][0000:01:00.0] reset
> [   41.786096] nouveau D[ INSTMEM][0000:01:00.0] reset
> [   41.786098] nouveau D[      VM][0000:01:00.0] reset
> [   41.790889] nouveau D[  BARCTL][0000:01:00.0] reset
> [   41.790906] nouveau D[     I2C][0000:01:00.0] probing monitoring devices on bus: 3
> [   41.790909] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.791961] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.791964] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.793007] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.793009] nouveau D[     I2C][0000:01:00.0] using custom udelay 40 instead of 10
> [   41.793010] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.796758] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.796760] nouveau D[     I2C][0000:01:00.0] using custom udelay 40 instead of 10
> [   41.796761] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.800509] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.800511] nouveau D[     I2C][0000:01:00.0] using custom udelay 40 instead of 10
> [   41.800512] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.805007] input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input9
> [   41.805098] input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card0/input10
> [   41.805198] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1b.0/sound/card0/input11
> [   41.808051] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.808060] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.808648] systemd-udevd[650]: could not open builtin file '/lib/modules/3.16.0-rc1-patser+/modules.builtin.bin'
> [   41.809221] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.809226] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.810386] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.810391] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.811635] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.811641] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.812937] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.812944] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.814065] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.814069] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.815126] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.815132] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.816179] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.816185] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.817230] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.817234] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.818279] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.818284] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.819329] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.819338] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.820385] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.820392] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.821437] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.821442] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.822490] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.822496] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.823541] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.823547] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> PORT:03
> [   41.824589] nouveau D[     I2C][0000:01:00.0] PAD:X:03: -> NULL
> [   41.824592] nouveau D[     I2C][0000:01:00.0] no devices found.
> [   41.824604] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
> [   41.824623] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
> [   41.824628] nouveau D[  PTHERM][0000:01:00.0] reset
> [   41.824631] nouveau D[  PTHERM][0000:01:00.0] programmed thresholds [ 90(3), 95(3), 105(5), 135(5) ]
> [   41.824666] nouveau D[     CLK][0000:01:00.0] 15:     270000 KHz
> [   41.824669] nouveau D[     CLK][0000:01:00.0] 14:     810000 KHz
> [   41.824671] nouveau D[     CLK][0000:01:00.0] 17:     324000 KHz
> [   41.824672] nouveau D[     CLK][0000:01:00.0] 12:     540000 KHz
> [   41.824677] nouveau D[     CLK][0000:01:00.0] 11:     405000 KHz
> [   41.824678] nouveau D[     CLK][0000:01:00.0] 1a:     405000 KHz
> [   41.824680] nouveau D[     CLK][0000:01:00.0] 18:     270000 KHz
> [   41.824681] nouveau D[     CLK][0000:01:00.0] 16:     540000 KHz
> [   41.824682] nouveau  [     CLK][0000:01:00.0] 07: core 270 MHz memory 405 MHz
> [   41.824697] nouveau D[     CLK][0000:01:00.0] 15:    1100000 KHz
> [   41.824698] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824702] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824704] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824705] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824707] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824708] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824709] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824710] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824711] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824713] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824714] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824715] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824716] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824722] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824728] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824733] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824735] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824736] nouveau D[     CLK][0000:01:00.0] 14:    1100000 KHz
> [   41.824737] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824738] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824739] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824741] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824742] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824743] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824744] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824746] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824747] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824748] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824749] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824750] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824752] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824753] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824755] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824757] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824761] nouveau D[     CLK][0000:01:00.0]    1100000 KHz
> [   41.824768] nouveau D[     CLK][0000:01:00.0] 17:     405000 KHz
> [   41.824777] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824783] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824789] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824791] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824793] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824794] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824795] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824796] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824797] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824798] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824800] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824801] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824802] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824803] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824804] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824806] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824807] nouveau D[     CLK][0000:01:00.0]     405000 KHz
> [   41.824808] nouveau D[     CLK][0000:01:00.0] 12:    1600000 KHz
> [   41.824809] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824811] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824812] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824813] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824814] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824815] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824817] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824818] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824819] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824820] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824821] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824823] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824824] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824825] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824826] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824827] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824829] nouveau D[     CLK][0000:01:00.0]    1600000 KHz
> [   41.824830] nouveau D[     CLK][0000:01:00.0] 11:     900000 KHz
> [   41.824831] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824833] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824834] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824835] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824836] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824843] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824849] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824855] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824861] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824867] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824873] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824879] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824883] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824887] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824889] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824890] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824892] nouveau D[     CLK][0000:01:00.0]     900000 KHz
> [   41.824893] nouveau D[     CLK][0000:01:00.0] 1a:     540000 KHz
> [   41.824894] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824896] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824897] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824898] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824899] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824900] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824902] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824903] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824904] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824905] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824906] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824908] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824909] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824910] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824911] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824912] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824914] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824915] nouveau D[     CLK][0000:01:00.0] 18:     270000 KHz
> [   41.824916] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824917] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824919] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824920] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824921] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824922] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824923] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824925] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824926] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824927] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824928] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824929] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824931] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824932] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824933] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824934] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824935] nouveau D[     CLK][0000:01:00.0]     270000 KHz
> [   41.824937] nouveau D[     CLK][0000:01:00.0] 16:     540000 KHz
> [   41.824938] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824939] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824940] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824942] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824943] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824944] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824945] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824946] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824948] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824949] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824950] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824951] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824952] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824954] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824955] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824961] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824968] nouveau D[     CLK][0000:01:00.0]     540000 KHz
> [   41.824975] nouveau  [     CLK][0000:01:00.0] 0f: core 800 MHz memory 900 MHz
> [   41.825131] nouveau D[     CLK][0000:01:00.0] 00:      27000 KHz
> [   41.825134] nouveau D[     CLK][0000:01:00.0] 01:     100000 KHz
> [   41.825136] nouveau D[     CLK][0000:01:00.0] 15:     270000 KHz
> [   41.825137] nouveau D[     CLK][0000:01:00.0] 14:     810000 KHz
> [   41.825143] nouveau D[     CLK][0000:01:00.0] 17:     324000 KHz
> [   41.825145] nouveau D[     CLK][0000:01:00.0] 12:     540000 KHz
> [   41.825147] nouveau D[     CLK][0000:01:00.0] 13:      27000 KHz
> [   41.825148] nouveau D[     CLK][0000:01:00.0] 11:     324000 KHz
> [   41.825149] nouveau D[     CLK][0000:01:00.0] 1a:     405000 KHz
> [   41.825151] nouveau D[     CLK][0000:01:00.0] 18:     270000 KHz
> [   41.825152] nouveau D[     CLK][0000:01:00.0] 16:     540000 KHz
> [   41.825154] nouveau  [     CLK][0000:01:00.0] --: core 270 MHz memory 324 MHz
> [   41.825157] nouveau D[  DMAOBJ][0000:01:00.0] reset
> [   41.843408] nouveau D[   PFIFO][0000:01:00.0] reset
> [   41.843417] nouveau D[      SW][0000:01:00.0] reset
> [   41.844025] nouveau D[  PGRAPH][0000:01:00.0] reset
> [   41.844036] nouveau D[     PVP][0000:01:00.0] reset
> [   41.844044] nouveau D[    PBSP][0000:01:00.0] reset
> [   41.844051] nouveau D[    PPPP][0000:01:00.0] reset
> [   41.844059] nouveau D[    PCE0][0000:01:00.0] reset
> [   41.844064] nouveau D[   PDISP][0000:01:00.0] engine disabled by hw/fw
> [   41.844082] nouveau D[     PPM][0000:01:00.0] reset
> [   41.844090] vga_switcheroo: enabled
> [   41.844198] [TTM] Zone  kernel: Available graphics memory: 918302 kiB
> [   41.844200] [TTM] Initializing pool allocator
> [   41.844204] [TTM] Initializing DMA pool allocator
> [   41.844215] nouveau  [     DRM] VRAM: 0 MiB
> [   41.844216] nouveau  [     DRM] GART: 1048576 MiB
> [   41.844219] nouveau D[     DRM] Pointer to BIT loadval table invalid
> [   41.844221] nouveau E[     DRM] Pointer to TMDS table invalid
> [   41.844455] nouveau  [     DRM] DCB version 4.0
> [   41.844458] nouveau E[     DRM] Pointer to flat panel table invalid
> [   41.862779] nouveau D[  DMAOBJ][0000:01:00.0] reset
> [   41.862815] nouveau D[  DEVICE][0000:01:00.0][0x80000080][ffff880002b39a00] illegal class 0xa06f
> [   41.862824] nouveau D[   PFIFO][0000:01:00.0] reset
> [   41.862827] nouveau D[   PFIFO][0000:01:00.0] 1 PBDMA unit(s)
> [   41.868057] nouveau E[   PFIFO][0000:01:00.0] write fault at 0x0000080000 [INVALID_STORAGE_TYPE] from BAR1/BAR_WRITE on channel 0x3ffffedf000 [unknown]
> [   41.868116] nouveau D[  DEVICE][0000:01:00.0][0x80000080][ffff880002b39a00] illegal class 0xa06f
> [   41.873552] nouveau D[      SW][0000:01:00.0] reset
> [   41.873561] nouveau D[   PFIFO][0000:01:00.0][0xc000906f][ffff88006ed3f180] attached SW context
> [   41.873565] nouveau E[   PFIFO][0000:01:00.0] write fault at 0x0000080000 [INVALID_STORAGE_TYPE] from BAR1/BAR_WRITE on channel 0x3ffffedf000 [unknown]
> [   41.873569] nouveau D[   PFIFO][0000:01:00.0][0xc000906f][ffff88005fffd300] illegal class 0xa0b5
> [   41.873571] nouveau D[   PFIFO][0000:01:00.0][0xc000906f][ffff88006ed3f180] illegal class 0xa0b5
> [   41.873574] nouveau D[   PFIFO][0000:01:00.0][0xc000906f][ffff88005fffd300] illegal class 0x90b8
> [   41.873585] nouveau D[    PCE0][0000:01:00.0] reset
> [   41.873594] nouveau D[    PCE0][0000:01:00.0] falcon version: 3
> [   41.873595] nouveau D[    PCE0][0000:01:00.0] secret level: 0
> [   41.873596] nouveau D[    PCE0][0000:01:00.0] code limit: 4608
> [   41.873596] nouveau D[    PCE0][0000:01:00.0] data limit: 2048
> [   41.873598] nouveau D[    PCE0][0000:01:00.0] firmware: internal (static code/data segments)
> [   41.874237] nouveau D[   PFIFO][0000:01:00.0][0xc000906f][ffff88005fffd300] attached PCE0 context
> [   41.874242] nouveau  [     DRM] MM: using COPY0 for buffer copies
> [   41.874246] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on minor 1
> [   42.212332] iwlwifi 0000:02:00.0: L1 Disabled; Enabling L0S
> [   42.219848] iwlwifi 0000:02:00.0: Radio type=0x2-0x0-0x0
> [   42.460626] iwlwifi 0000:02:00.0: L1 Disabled; Enabling L0S
> [   42.468136] iwlwifi 0000:02:00.0: Radio type=0x2-0x0-0x0
> [   42.532799] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
> [   42.828025] init: nvidia-prime main process (1064) terminated with status 127
> [   44.096635] init: plymouth-upstart-bridge main process ended, respawning
> [   44.550032] nouveau D[Xorg[1292]] fini running
> [   44.550036] nouveau D[Xorg[1292]] fini completed with 0
> [   45.183583] nouveau D[Xorg[1292]] fini running
> [   45.183588] nouveau D[Xorg[1292]] fini completed with 0
> [   45.330715] nouveau D[   PDISP][0000:01:00.0] engine disabled by hw/fw
> [   45.348892] nouveau D[  DEVICE][0000:01:00.0][0x80000080][ffff88006e9b4000] illegal class 0xa06f
> [   45.354477] nouveau E[   PFIFO][0000:01:00.0] write fault at 0x0000080000 [INVALID_STORAGE_TYPE] from BAR1/BAR_WRITE on channel 0x3ffffedf000 [unknown]
> [   45.354868] nouveau D[  PGRAPH][0000:01:00.0] reset
> [   45.399639] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0000000000 [INVALID_STORAGE_TYPE] from PGRAPH/CTXCTL on channel 0x3ffffcc9000 [unknown]
>
> ~Maarten
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
