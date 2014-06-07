From: Christian Wehrmeyer <c.wehrmeyer-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: PROBLEM: new kernel 3.15.0-rc8 hangs completely with
 CONFIG_DRM_NOUVEAU enabled
Date: Sat, 07 Jun 2014 23:35:09 +0200
Message-ID: <5393858D.1060509@gmx.de>
References: <53922B6D.8020004@gmx.de>
 <CAKb7UvjPjNC=3KeKa8YLWoRZiUtw8YAZcMXYSTfVBFCcT0kMQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjPjNC=3KeKa8YLWoRZiUtw8YAZcMXYSTfVBFCcT0kMQg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Yes, you are right - the Intel-chip is connected to the display, it just
offloads 3D work to do to the nVidia-chip, which isn't even to tell how
to get the EDID. I just wanted to try it out, simply for two reasons:

1. I heard that nouveau now "supports" the chip, and since I got the
hardware, I wanted to try it out - just for the fun of it. :)
2. As far as I am informed, a way to support you guys is to run the
latest version and do status reports.

No, my Xorg log does not contain that line. That's because I forbid X to
add any GPUs that were not defined in my /etc/X11/xorg.conf, and I just
added the Intel driver, not the nouveau driver:

Section "ServerLayout"
...
        Option          "AutoAddGPU" "false"
...
EndSection

Section "Device"
...
        Identifier      "Card0"
        Driver          "intel"
        BusID           "PCI:0:2:0"

        Option          "AccelMethod"   "sna"
        Option          "TearFree"      "true"
        Option          "DRI"           "true"
...
EndSection

OK, I will do open a bug there.

With best regards,
Christian Wehrmeyer from Germany

On 07.06.2014 22:21, Ilia Mirkin wrote:
> First off, the current state of support for Maxwell (GM107/NV110) is
> not very useful to end-users. It's especially not useful if it's a 3d
> accelerator card without outputs (as yours appears to be), since
> acceleration is not supported in 3.15 out of the box. You'd have to
> figure out how to extract the context switching firmware from the blob
> driver and load it in nouveau. I'm told the mechanism that this fw is
> uploaded with has also changed lately in the blob, so existing
> instructions will be less-than-useful.
> 
> It looks like the card is probably suspended since nothing is using
> it. Does your Xorg log show any NOUVEAU(G0) lines? If so, it's being
> added as a GPU, and chances are your environment is helpfully trying
> to link it up for offloading. However xf86-video-nouveau presently has
> no support for GM107, which means it's unlikely to do anything good.
> 
> It's also a little odd that you're getting errors executing _DSM.
> Could you open a bug on freedesktop.org to track this? Include the
> "old" log (since it's pretty obvious what happens without nouveau
> being loaded at all), as well as an acpidump of your system.
> 
>   -ilia
> 
> On Fri, Jun 6, 2014 at 4:58 PM, Christian Wehrmeyer <c.wehrmeyer-Mmb7MZpHnFY@public.gmane.org> wrote:
>> Hello, guys.
>> First apologize my flaws, I am not a native English speaker and thus am
>> prone to stupid errors.
>>
>> My box is an ASUSTek Notebook with Optimus capability (no, this is NOT
>> about Optimus, I don't try to use Optimus yet, so please don't switch
>> off here) with a running Gentoo. The first GPU is an Haswell-based Intel
>> chip, the second one is a nVidia GeForce GTX 850M, the chip is a GM107M,
>> which I understand to be a NV110.
>> So far I have been using the 3.14.8 kernel without CONFIG_DRM_NOUVEAU
>> enabled, as it was lacking of the maxwell support you guys added in May
>> 2014. Today I wanted to try if I could use my card with the nouveau
>> driver (no particular purpose in general, I just thought I could somehow
>> support you guys. Xorg is told NOT to use any GPU except for the Intel one).
>>
>> Yet, the 3.15.0-rc8 which I downloaded this evening crashes on me when
>> compiled with the CONFIG_DRM_NOUVEAU flag enabled during compilation.
>> Crashes means: xdm starts, slim starts, I login to my Gentoo box, open a
>> terminal emulator instance (exo-open --launch TerminalEmulator), and try
>> to open /var/log/kern.log for any error messages - and if I got halfway
>> through tipping that command, I'll be a lucky man. The notebook suddenly
>> and unexpectedly hangs during these actions, the mouse does not
>> response, the keyboard does not response, the display manager freezes
>> completely (I can say that by a CPU usage tool that runs in my Xfce, and
>> it freezes as well, so it's not just the input devices getting
>> disconnected). ALT+SysReq+s/b does not work, syncing/rebooting fails, it
>> does absolutely nothing. Disabling the CONFIG_DRM_NOUVEAU flag and
>> recompiling removes the hang completely. I can reproduce the problem by
>> just rebooting and logging in as descriped above.
>>
>> Files within the attached tar.gz:
>> config-3.15.0-rc8-valhalla.old [non-working configuration]
>> config-3.15.0-rc8-valhalla [working configuration]
>> kern.log.old: Shows the boot process with the non-working configuration
>> kern.log: Shows the boot process with the working configuration
>>
>> The output of lshw:
>>
>> description: Notebook
>> product: N550JK (ASUS-NotebookSKU)
>> vendor: ASUSTeK COMPUTER INC.
>> version: 1.0
>> serial: <scrubed>
>> width: 64 bits
>> capabilities: smbios-2.7 dmi-2.7 ldt16 vsyscall32
>> configuration: boot=normal chassis=notebook family=N
>> sku=ASUS-NotebookSKU uuid=<scrubed>
>>
>> Output of lspci -vvvvvk, everything not-VGA-like scrubed off:
>>
>> 00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core
>> Processor Integrated Graphics Controller (rev 06) (prog-if 00 [VGA
>> controller])
>>         Subsystem: ASUSTeK Computer Inc. Device 11cd
>>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>> Stepping- SERR- FastB2B- DisINTx+
>>         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort-
>> <MAbort- >SERR- <PERR- INTx-
>>         Latency: 0
>>         Interrupt: pin A routed to IRQ 40
>>         Region 0: Memory at f7400000 (64-bit, non-prefetchable) [size=4M]
>>         Region 2: Memory at d0000000 (64-bit, prefetchable) [size=256M]
>>         Region 4: I/O ports at f000 [size=64]
>>         Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-
>>                 Address: feeff00c  Data: 4181
>>         Capabilities: [d0] Power Management version 2
>>                 Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
>>                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>>         Capabilities: [a4] PCI Advanced Features
>>                 AFCap: TP+ FLR+
>>                 AFCtrl: FLR-
>>                 AFStatus: TP-
>>         Kernel driver in use: i915
>>
>> 01:00.0 3D controller: NVIDIA Corporation GM107M [GeForce GTX 850M] (rev a2)
>>         Subsystem: ASUSTeK Computer Inc. Device 11cd
>>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
>> Stepping- SERR- FastB2B- DisINTx-
>>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
>> <MAbort- >SERR- <PERR- INTx-
>>         Latency: 0, Cache Line Size: 64 bytes
>>         Interrupt: pin A routed to IRQ 11
>>         Region 0: Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
>>         Region 1: Memory at e0000000 (64-bit, prefetchable) [size=256M]
>>         Region 3: Memory at f0000000 (64-bit, prefetchable) [size=32M]
>>         Region 5: I/O ports at e000 [size=128]
>>         Expansion ROM at f7000000 [disabled] [size=512K]
>>         Capabilities: [60] Power Management version 3
>>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
>>                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>>         Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
>>                 Address: 0000000000000000  Data: 0000
>>         Capabilities: [78] Express (v2) Endpoint, MSI 00
>>                 DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 <64us
>>                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>>                 DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
>>                         RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>>                         MaxPayload 256 bytes, MaxReadReq 512 bytes
>>                 DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
>>                 LnkCap: Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Latency L0 <1us,
>> L1 <4us
>>                         ClockPM+ Surprise- LLActRep- BwNot-
>>                 LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- Retrain- CommClk+
>>                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>>                 LnkSta: Speed 8GT/s, Width x16, TrErr- Train- SlotClk+ DLActive-
>> BWMgmt- ABWMgmt-
>>                 DevCap2: Completion Timeout: Range AB, TimeoutDis+, LTR+, OBFF Via message
>>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, OBFF
>> Disabled
>>                 LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
>>                          Transmit Margin: Normal Operating Range, EnterModifiedCompliance-
>> ComplianceSOS-
>>                          Compliance De-emphasis: -6dB
>>                 LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+,
>> EqualizationPhase1+
>>                          EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
>>
>> I will provide you with additional informations if you need them, just
>> let me know.
>>
>> With best regards,
>> Christian Wehrmeyer from Germany
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>
