From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99841] Switching to VT freezes X only on a dual
	screen
Date: Sat, 18 Feb 2017 15:47:00 +0000
Message-ID: <bug-99841-8800-umxW8Ek4Qt@http.bugs.freedesktop.org/>
References: <bug-99841-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0792952927=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99841-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0792952927==
Content-Type: multipart/alternative; boundary="14874328191.ebcCB.11852";
 charset="UTF-8"


--14874328191.ebcCB.11852
Date: Sat, 18 Feb 2017 15:46:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99841

--- Comment #5 from kevin-Fk+Xth6EFAKtEw7EPzjzzg@public.gmane.org ---
I have the same issue, I think=E2=80=94X freezes when switching to a TTY, b=
ut switching
back to X unfreezes the display. Furthermore, keyboard input works in the T=
TY,
even if it displays no output=E2=80=94blind login is possible.

GPU:

00:10.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 77=
0]
(rev a1) (prog-if 00 [VGA controller])[160/1837]
        Subsystem: Micro-Star International Co., Ltd. [MSI] Device 2825
        Physical Slot: 16
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 45
        Region 0: Memory at c0000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at 800000000 (64-bit, prefetchable) [size=3D128M]
        Region 3: Memory at 808000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at 1000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
                Address: 00000000feeff00c  Data: 41d2
        Capabilities: [78] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 75.000W
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <1us, L1 <4us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 8GT/s, Width x16, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range AB, TimeoutDis+, LTR-, O=
BFF
Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR=
-,
OBFF Disabled
                LnkSta2: Current De-emphasis Level: -6dB,
EqualizationComplete+, EqualizationPhase1+
                         EqualizationPhase2+, EqualizationPhase3+,
LinkEqualizationRequest+
        Capabilities: [b4] Vendor Specific Information: Len=3D14 <?>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

CPU:

processor       : [0-7]
vendor_id       : GenuineIntel
cpu family      : 6
model           : 62
model name      : Intel(R) Core(TM) i7-4820K CPU @ 3.70GHz
stepping        : 4
microcode       : 0x1
cpu MHz         : 3699.939
cache size      : 4096 KB
physical id     : 0
siblings        : 8
core id         : 7
cpu cores       : 8
apicid          : 7
initial apicid  : 7
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov
pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm
constant_tsc arch_perfmon rep_good nopl xtopology pni pclmulqdq vmx ssse3 c=
x16
pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx f16c rdra=
nd
hypervisor lahf_lm tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust
smep erms xsaveopt arat
bugs            :
bogomips        : 7415.70
clflush size    : 64
cache_alignment : 64
address sizes   : 40 bits physical, 48 bits virtual
power management:

xrandr:

Screen 0: minimum 320 x 200, current 5120 x 1080, maximum 16384 x 16384
DVI-I-1 connected 1280x1024+2560+0 (normal left inverted right x axis y axi=
s)
338mm x 270mm
   1280x1024     60.02 +  75.02*
   1152x864      75.00
   1024x768      75.03    60.00
   800x600       75.00    60.32
   640x480       75.00    59.94
   720x400       70.08
DVI-D-1 connected 1280x1024+3840+0 (normal left inverted right x axis y axi=
s)
338mm x 270mm
   1280x1024     60.02 +  75.02*
   1152x864      75.00
   1024x768      75.03    60.00
   800x600       75.00    60.32
   640x480       75.00    59.94
   720x400       70.08
HDMI-1 connected primary 2560x1080+0+0 (normal left inverted right x axis y
axis) 798mm x 334mm
   2560x1080     60.00*+
   1920x1080     60.00    50.00    59.94    30.00    29.97
   1920x1080i    60.00    50.00    59.94
   1680x1050     59.88
   1600x900      60.00
   1280x1024     75.02    60.02
   1152x864      75.00
   1280x720      60.00    50.00    59.94
   1024x768      75.03    60.00
   800x600       75.00    60.32
   720x576       50.00
   720x480       60.00    59.94
   640x480       75.00    60.00    59.94
   720x400       70.08
DP-1 disconnected (normal left inverted right x axis y axis)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14874328191.ebcCB.11852
Date: Sat, 18 Feb 2017 15:46:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Switching to VT freezes X only on a dual screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99841#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Switching to VT freezes X only on a dual screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99841">bug 99841<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kevin&#64;potatofrom.space" title=3D"kevin&#64;potatofrom.space">kevin&#64;=
potatofrom.space</a>
</span></b>
        <pre>I have the same issue, I think=E2=80=94X freezes when switchin=
g to a TTY, but switching
back to X unfreezes the display. Furthermore, keyboard input works in the T=
TY,
even if it displays no output=E2=80=94blind login is possible.

GPU:

00:10.0 VGA compatible controller: NVIDIA Corporation GK104 [GeForce GTX 77=
0]
(rev a1) (prog-if 00 [VGA controller])[160/1837]
        Subsystem: Micro-Star International Co., Ltd. [MSI] Device 2825
        Physical Slot: 16
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast &gt;TAbort-=
 &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 45
        Region 0: Memory at c0000000 (32-bit, non-prefetchable) [size=3D16M]
        Region 1: Memory at 800000000 (64-bit, prefetchable) [size=3D128M]
        Region 3: Memory at 808000000 (64-bit, prefetchable) [size=3D32M]
        Region 5: I/O ports at 1000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [60] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
                Address: 00000000feeff00c  Data: 41d2
        Capabilities: [78] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 &lt;64us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
SlotPowerLimit 75.000W
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s &lt;1us, L1 &lt;4us
                        ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 8GT/s, Width x16, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range AB, TimeoutDis+, LTR-, O=
BFF
Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR=
-,
OBFF Disabled
                LnkSta2: Current De-emphasis Level: -6dB,
EqualizationComplete+, EqualizationPhase1+
                         EqualizationPhase2+, EqualizationPhase3+,
LinkEqualizationRequest+
        Capabilities: [b4] Vendor Specific Information: Len=3D14 &lt;?&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau

CPU:

processor       : [0-7]
vendor_id       : GenuineIntel
cpu family      : 6
model           : 62
model name      : Intel(R) Core(TM) i7-4820K CPU &#64; 3.70GHz
stepping        : 4
microcode       : 0x1
cpu MHz         : 3699.939
cache size      : 4096 KB
physical id     : 0
siblings        : 8
core id         : 7
cpu cores       : 8
apicid          : 7
initial apicid  : 7
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov
pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm
constant_tsc arch_perfmon rep_good nopl xtopology pni pclmulqdq vmx ssse3 c=
x16
pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx f16c rdra=
nd
hypervisor lahf_lm tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust
smep erms xsaveopt arat
bugs            :
bogomips        : 7415.70
clflush size    : 64
cache_alignment : 64
address sizes   : 40 bits physical, 48 bits virtual
power management:

xrandr:

Screen 0: minimum 320 x 200, current 5120 x 1080, maximum 16384 x 16384
DVI-I-1 connected 1280x1024+2560+0 (normal left inverted right x axis y axi=
s)
338mm x 270mm
   1280x1024     60.02 +  75.02*
   1152x864      75.00
   1024x768      75.03    60.00
   800x600       75.00    60.32
   640x480       75.00    59.94
   720x400       70.08
DVI-D-1 connected 1280x1024+3840+0 (normal left inverted right x axis y axi=
s)
338mm x 270mm
   1280x1024     60.02 +  75.02*
   1152x864      75.00
   1024x768      75.03    60.00
   800x600       75.00    60.32
   640x480       75.00    59.94
   720x400       70.08
HDMI-1 connected primary 2560x1080+0+0 (normal left inverted right x axis y
axis) 798mm x 334mm
   2560x1080     60.00*+
   1920x1080     60.00    50.00    59.94    30.00    29.97
   1920x1080i    60.00    50.00    59.94
   1680x1050     59.88
   1600x900      60.00
   1280x1024     75.02    60.02
   1152x864      75.00
   1280x720      60.00    50.00    59.94
   1024x768      75.03    60.00
   800x600       75.00    60.32
   720x576       50.00
   720x480       60.00    59.94
   640x480       75.00    60.00    59.94
   720x400       70.08
DP-1 disconnected (normal left inverted right x axis y axis)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14874328191.ebcCB.11852--

--===============0792952927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0792952927==--
