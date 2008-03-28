From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15233] New: geforce 7800gs and AGP 3.0 DBI function
Date: Thu, 27 Mar 2008 17:25:28 -0700 (PDT)
Message-ID: <bug-15233-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15233

           Summary: geforce 7800gs and AGP 3.0 DBI function
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: vallesroc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=15521)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=15521)
X log with DBI enabled

this night (about an hour ago) I made up my mind to help test xrandr 1.2; seems
it works fine; this bug has been reproduced with and without it.

When I first got into xfce4, I noticed the clock background was red instead of
grey; something wasn't working well. With firefox (3b4) Some websites would
display fine, some others would have red background on text too, and others
would display text+background black or shit instead of text.

Then it occurred to me: There's some option in bios setup called "AGP 3.0 DBI
function". When this option is disabled, windows displays similar artifacts,
while linux works fine. When it is enabled, windows works fine, but Linux hangs
with interrupts disabled or something like that after a few hours or at most
three days of usage (box won't answer pings, sysrq won't work, hw reset button
is needed). Nouveau seems to behave like windows here, working fine only when
the option is enabled.

The motherboard is an ASRock 4CoreDUAL-SATA2 with latest bios (1.90), CPU is
intel e2160, gfx card is an AGP geforce 7800gs, 256MB, from BFG.

I attach my Xorg configuration, and two logs, one with and one without that
option, though I don't know if they'll be of any use.

I also attach a screenshot of insani.org being rendered wrongly, but the
make-screenshot itself (with the gimp) also corrupts stuff, so it's far worse
than what I get on the screen.

from lspci:
reimu ~ # lspci
00:00.0 Host bridge: VIA Technologies, Inc. PT894 Host Bridge
00:00.1 Host bridge: VIA Technologies, Inc. PT894 Host Bridge
00:00.2 Host bridge: VIA Technologies, Inc. PT894 Host Bridge
00:00.3 Host bridge: VIA Technologies, Inc. PT890 Host Bridge
00:00.4 Host bridge: VIA Technologies, Inc. PT894 Host Bridge
00:00.5 PIC: VIA Technologies, Inc. PT894 I/O APIC Interrupt Controller
00:00.7 Host bridge: VIA Technologies, Inc. PT894 Host Bridge
00:01.0 PCI bridge: VIA Technologies, Inc. VT8237 PCI Bridge
00:02.0 PCI bridge: VIA Technologies, Inc. PT890 PCI to PCI Bridge Controller
00:0f.0 IDE interface: VIA Technologies, Inc. Unknown device 5372
00:0f.1 IDE interface: VIA Technologies, Inc.
VT82C586A/B/VT82C686/A/B/VT823x/A/C PIPC Bus Master IDE (rev 07)
00:10.0 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller (rev b0)
00:10.1 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller (rev b0)
00:10.2 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller (rev b0)
00:10.3 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller (rev b0)
00:10.4 USB Controller: VIA Technologies, Inc. USB 2.0 (rev 90)
00:11.0 ISA bridge: VIA Technologies, Inc. VT8237S PCI to ISA Bridge
00:11.7 Host bridge: VIA Technologies, Inc. VT8251 Ultra VLINK Controller
00:12.0 Ethernet controller: VIA Technologies, Inc. VT6102 [Rhine-II] (rev 7c)
00:13.0 Host bridge: VIA Technologies, Inc. VT8237A Host Bridge
00:13.1 PCI bridge: VIA Technologies, Inc. VT8237A PCI to PCI Bridge
01:00.0 VGA compatible controller: nVidia Corporation G70 [GeForce 7800 GS]
(rev a2)
03:04.0 Ethernet controller: D-Link System Inc DGE-528T Gigabit Ethernet
Adapter (rev 10)
03:05.0 Multimedia audio controller: Creative Labs SB Live! EMU10k1 (rev 07)
03:05.1 Input device controller: Creative Labs SB Live! Game Port (rev 07)
03:06.0 Multimedia video controller: Brooktree Corporation Bt878 Video Capture
(rev 02)
03:06.1 Multimedia controller: Brooktree Corporation Bt878 Audio Capture (rev
02)
03:07.0 SCSI storage controller: Adaptec AHA-2940U2/U2W

# cat /proc/interrupts
           CPU0       CPU1       
  0:        107          0   IO-APIC-edge      timer
  1:       9207          0   IO-APIC-edge      i8042
  7:          0          0   IO-APIC-edge      parport0
  8:          1          0   IO-APIC-edge      rtc
  9:          0          0   IO-APIC-fasteoi   acpi
 14:        112          0   IO-APIC-edge      libata
 15:         39          0   IO-APIC-edge      libata
 16:         15          0   IO-APIC-fasteoi   aic7xxx,
nouveau@pci:0000:01:00.0
 17:      21068          0   IO-APIC-fasteoi   eth0
 18:          0          0   IO-APIC-fasteoi   EMU10K1
 19:      23203          0   IO-APIC-fasteoi   bttv0
 20:      26611          0   IO-APIC-fasteoi   uhci_hcd:usb1
 21:      27612          0   IO-APIC-fasteoi   sata_via, uhci_hcd:usb3,
ehci_hcd:usb5
 22:         40          0   IO-APIC-fasteoi   uhci_hcd:usb2
 23:          0          0   IO-APIC-fasteoi   uhci_hcd:usb4
NMI:          0          0   Non-maskable interrupts
LOC:     351843     414542   Local timer interrupts
RES:       4049       6006   Rescheduling interrupts
CAL:        130        350   function call interrupts
TLB:       1117       1358   TLB shootdowns
TRM:          0          0   Thermal event interrupts
THR:          0          0   Threshold APIC interrupts
SPU:          0          0   Spurious interrupts
ERR:          0

reimu ~ # lsmod
Module                  Size  Used by
nouveau               147136  1 
drm                   175696  2 nouveau
snd_rtctimer            4240  0 
fbcon                  41264  76 
font                    4544  1 fbcon
bitblit                 5952  1 fbcon
softcursor              2624  1 bitblit
uvesafb                31096  1 
fb                     52368  4 fbcon,bitblit,softcursor,uvesafb
cfbcopyarea             4096  1 uvesafb
cn                      9272  2 uvesafb
cfbimgblt               3136  1 uvesafb
cfbfillrect             4480  1 uvesafb
nfs                   266136  2 
nfsd                  255192  13 
lockd                  68880  3 nfs,nfsd
nfs_acl                 4032  2 nfs,nfsd
auth_rpcgss            50256  1 nfsd
sunrpc                198184  17 nfs,nfsd,lockd,nfs_acl,auth_rpcgss
exportfs                5568  1 nfsd
ipv6                  266024  16 
w83627hf               25112  0 
hwmon_vid               3328  1 w83627hf
snd_seq_midi            9216  0 
snd_emu10k1_synth       7808  0 
snd_emux_synth         35712  1 snd_emu10k1_synth
snd_seq_virmidi         8384  1 snd_emux_synth
snd_seq_midi_emul       6784  1 snd_emux_synth
snd_seq_oss            32960  0 
snd_seq_midi_event      8384  3 snd_seq_midi,snd_seq_virmidi,snd_seq_oss
snd_seq                55264  8
snd_seq_midi,snd_emux_synth,snd_seq_virmidi,snd_seq_midi_emul,snd_seq_oss,snd_seq_midi_event
snd_pcm_oss            41952  0 
snd_mixer_oss          17728  1 snd_pcm_oss
af_packet              24072  0 
vboxdrv              1643568  0 
coretemp                8384  0 
loop                   19524  0 
mt2060                  5700  1 
dvb_usb_dib0700        30472  0 
dib7000p               16840  2 dvb_usb_dib0700
dib7000m               15364  1 dvb_usb_dib0700
dvb_usb                20492  1 dvb_usb_dib0700
tuner                  44000  0 
tea5767                 6340  1 tuner
tda8290                12228  1 tuner
dvb_core               85852  1 dvb_usb
dib3000mc              13576  1 dvb_usb_dib0700
dibx000_common          4612  3 dib7000p,dib7000m,dib3000mc
dib0070                 7940  1 dvb_usb_dib0700
tuner_simple            8520  1 tuner
mt20xx                 12552  1 tuner
tea5761                 5508  1 tuner
tvaudio                25500  0 
joydev                 14208  0 
usbhid                 25028  0 
sr_mod                 17252  0 
cdrom                  35752  1 sr_mod
bttv                  200372  0 
ir_common              38404  1 bttv
compat_ioctl32          9152  1 bttv
i2c_algo_bit            6916  1 bttv
videobuf_dma_sg        15236  1 bttv
videobuf_core          19780  2 bttv,videobuf_dma_sg
btcx_risc               5448  1 bttv
tveeprom               17936  1 bttv
ehci_hcd               34060  0 
videodev               28160  1 bttv
8250_pnp               12288  0 
nvidia               8851844  0 
8250                   29624  1 8250_pnp
parport_pc             36504  0 
snd_emu10k1           140176  2 snd_emu10k1_synth
snd_rawmidi            27104  3 snd_seq_midi,snd_seq_virmidi,snd_emu10k1
firmware_class         11328  3 dvb_usb,bttv,snd_emu10k1
snd_ac97_codec        113928  1 snd_emu10k1
ac97_bus                2880  1 snd_ac97_codec
snd_pcm                85256  3 snd_pcm_oss,snd_emu10k1,snd_ac97_codec
snd_seq_device          8916  7
snd_seq_midi,snd_emu10k1_synth,snd_emux_synth,snd_seq_oss,snd_seq,snd_emu10k1,snd_rawmidi
snd_timer              25160  4 snd_rtctimer,snd_seq,snd_emu10k1,snd_pcm
snd_page_alloc         11280  2 snd_emu10k1,snd_pcm
snd_util_mem            5568  2 snd_emux_synth,snd_emu10k1
snd_hwdep              11144  2 snd_emux_synth,snd_emu10k1
parport                30336  1 parport_pc
snd                    62776  15
snd_emux_synth,snd_seq_virmidi,snd_seq_oss,snd_seq,snd_pcm_oss,snd_mixer_oss,snd_emu10k1,snd_rawmidi,snd_ac97_codec,snd_pcm,snd_seq_device,snd_timer,snd_hwdep
soundcore               9680  1 snd
pcspkr                  3648  0 
r8169                  30724  0 
v4l2_common            19968  5 tuner,tvaudio,bttv,compat_ioctl32,videodev
aic7xxx               156684  0 
scsi_transport_spi     27136  1 aic7xxx
via_rhine              25416  0 
uhci_hcd               26336  0 
usbcore               154592  6
dvb_usb_dib0700,dvb_usb,usbhid,ehci_hcd,uhci_hcd
serial_core            23744  1 8250
i2c_core               26368  18
mt2060,dib7000p,dib7000m,dvb_usb,tuner,tea5767,tda8290,dib3000mc,dibx000_common,dib0070,tuner_simple,mt20xx,tea5761,tvaudio,bttv,i2c_algo_bit,tveeprom,nvidia
v4l1_compat            12292  2 bttv,videodev
mii                     6144  1 via_rhine
pata_via               13252  0 
via_agp                11776  1 
sg                     34072  0 
evdev                  13632  0 
unix                   31848  288


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
