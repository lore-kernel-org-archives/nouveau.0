From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20780] New: nouveau corrupts and crashes on 7800gt
 when NoAccel= false after a few drawing operations
Date: Fri, 20 Mar 2009 15:12:53 -0700 (PDT)
Message-ID: <bug-20780-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=20780

           Summary: nouveau corrupts and crashes on 7800gt when
                    NoAccel=false after a few drawing operations
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: xt.knight-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=24097)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=24097)
Attachment described above.

Distro: Ubuntu Jaunty development version

Attached are three test cases containing the configuration used for each one
and the corresponding logs.

In cases 411pm and 426pm, the video card will crash with corruption and xorg
will exit with a GPU lockup message.  In 431pm, the card starts using
NoAccel=true.

In all cases, Xorg was started with:

"sudo Xorg -logverbose 6 :0"

over ssh from another machine.  I couldn't find any backtraces from gdb since
Xorg exited softly with code 1 (I think that #), no crash.

Using:
        git xf86-video-nouveau  ~ Thu Mar 19 2009 03:40 AM EDT
        git drm                 ~ Thu Mar 19 2009 03:36 AM EDT

$ dpkg -s xserver-xorg|grep Version
Version: 1:7.4~5ubuntu16

$ uname -a
Linux ubuntu 2.6.28.8 #1 SMP Thu Mar 19 22:31:12 EDT 2009 x86_64 GNU/Linux

( Custom compiled Jaunty kernel )

$ sudo lspci -vv

03:00.0 VGA compatible controller: nVidia Corporation G70 [GeForce 7800 GT]
(rev a1)
        Subsystem: eVga.com. Corp. Device c518
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 30
        Region 0: Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at f9000000 (64-bit, non-prefetchable) [size=16M]
        Region 5: I/O ports at bc00 [size=128]
        Expansion ROM at fbbe0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [68] Message Signalled Interrupts: Mask- 64bit+ Queue=0/0
Enable-
                Address: 0000000000000000  Data: 0000
        Capabilities: [78] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns,
L1 <4us
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr+ FatalErr- UnsuppReq+ AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Latency
L0 <1us, L1 <4us
                        ClockPM- Suprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- Retrain-
CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        Capabilities: [100] Virtual Channel <?>
        Capabilities: [128] Power Budgeting <?>
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb

$ lsmod

Module                  Size  Used by
nouveau               344256  1 
drm                   198624  2 nouveau
binfmt_misc            14476  1 
bridge                 59424  0 
stp                     7300  1 bridge
bnep                   18944  2 
vmnet                  50052  13 
ppdev                  12872  0 
parport_pc             40936  0 
vmblock                19664  3 
vmci                   61224  0 
vmmon                  81040  0 
input_polldev           8848  0 
video                  25108  0 
output                  7808  1 video
lp                     15620  0 
parport                45744  3 ppdev,parport_pc,lp
mt2131                 10500  1 
s5h1409                14404  1 
snd_hda_intel         537396  1 
snd_cmipci             45152  4 
snd_pcm_oss            47936  0 
gameport               17488  1 snd_cmipci
snd_mixer_oss          20928  1 snd_pcm_oss
snd_opl3_lib           16512  1 snd_cmipci
snd_pcm                93704  4 snd_hda_intel,snd_cmipci,snd_pcm_oss
snd_hwdep              12936  1 snd_opl3_lib
snd_mpu401_uart        12800  1 snd_cmipci
snd_seq_dummy           7620  0 
cx25840                33712  0 
snd_seq_oss            38016  0 
snd_seq_midi           11904  0 
cx23885               104204  0 
snd_rawmidi            29952  2 snd_mpu401_uart,snd_seq_midi
compat_ioctl32         14336  1 cx23885
videodev               41280  2 cx23885,compat_ioctl32
v4l1_compat            19972  1 videodev
cx2341x                18308  1 cx23885
videobuf_dma_sg        18756  1 cx23885
snd_seq_midi_event     12736  2 snd_seq_oss,snd_seq_midi
videobuf_dvb           12612  1 cx23885
dvb_core              102124  1 videobuf_dvb
snd_seq                62304  6
snd_seq_dummy,snd_seq_oss,snd_seq_midi,snd_seq_midi_event
videobuf_core          25732  3 cx23885,videobuf_dma_sg,videobuf_dvb
snd_timer              29200  3 snd_opl3_lib,snd_pcm,snd_seq
snd_seq_device         12372  6
snd_opl3_lib,snd_seq_dummy,snd_seq_oss,snd_seq_midi,snd_rawmidi,snd_seq
v4l2_common            19456  3 cx25840,cx23885,cx2341x
btcx_risc               9992  1 cx23885
tveeprom               19524  1 cx23885
snd                    74184  22
snd_hda_intel,snd_cmipci,snd_pcm_oss,snd_mixer_oss,snd_opl3_lib,snd_pcm,snd_hwdep,snd_mpu401_uart,snd_seq_oss,snd_rawmidi,snd_seq,snd_timer,snd_seq_device
soundcore              12896  1 snd
snd_page_alloc         14864  2 snd_hda_intel,snd_pcm
iTCO_wdt               17680  0 
iTCO_vendor_support     8580  1 iTCO_wdt
usbhid                 42688  0 
pcspkr                  7296  0 
ohci1394               37620  0 
ieee1394              103232  1 ohci1394
sky2                   57796  0 
ehci_hcd               44940  0 
uhci_hcd               30368  0


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
