From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54681] New: Connecting TV to second DVI port of
 9600GT card causes GPU lockup and Xorg crash
Date: Sun, 09 Sep 2012 05:31:33 +0000
Message-ID: <bug-54681-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=54681

             Bug #: 54681
           Summary: Connecting TV to second DVI port of 9600GT card causes
                    GPU lockup and Xorg crash
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: hancockrwd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Machine is running an up-to-date Fedora 17 and has a 9600GT card:

https://bugzilla.redhat.com/show_bug.cgi?id=850573

I have an LG 44NHM84 TV connected to the second DVI port of a GeForce 9600GT
card using a DVI-to-HDMI cable and an HDMI switcher. If I switch the switcher
for the TV to the computer input, the main monitor loses signal as well as the
TV, and dmesg reports the following:

Sep  8 23:12:54 newcastle kernel: [1467414.791946] detected fb_set_par error,
error code: -16
Sep  8 23:12:54 newcastle kernel: [1467417.024758] [drm] nouveau 0000:01:00.0:
GPU lockup - switching to software fbcon
Sep  8 23:12:57 newcastle kernel: [1467420.791069] [drm] nouveau 0000:01:00.0:
Failed to idle channel 2.

Xorg also segfaults with the following backtrace:

#0  0x0000003425435925 in __GI_raise (sig=sig@entry=6) at
../nptl/sysdeps/unix/sysv/linux/raise.c:64
#1  0x00000034254370d8 in __GI_abort () at abort.c:91
#2  0x000000000046c86e in OsAbort () at utils.c:1207
#3  0x0000000000482d6c in ddxGiveUp (error=EXIT_ERR_ABORT) at xf86Init.c:1009
#4  0x0000000000468ef2 in AbortServer () at log.c:476
#5  0x00000000004690f5 in FatalError (f=f@entry=0x572db8 "Caught signal %d
(%s). Server aborting\n") at log.c:611
#6  0x000000000046a2de in OsSigHandler (sip=<optimized out>, signo=11,
unused=<optimized out>) at osinit.c:146
#7  OsSigHandler (signo=11, sip=<optimized out>, unused=<optimized out>) at
osinit.c:107
#8  <signal handler called>
#9  0x00007f1be12f222b in ?? () from
/usr/lib64/xorg/modules/drivers/nouveau_drv.so
#10 0x00007f1be0269e66 in exaDoPutImage (src_stride=<optimized out>,
bits=0x61fc168 "$\025\f", format=2, h=34, w=1920, y=1920, x=34, pGC=0x3acab10,
pDrawable=0x3b463b0, 
    depth=<optimized out>) at exa_accel.c:212
#11 exaPutImage (pDrawable=0x3b463b0, pGC=0x3acab10, depth=24, x=0, y=34,
w=1920, h=34, leftPad=0, format=2, bits=0x61fc168 "$\025\f") at exa_accel.c:233
#12 0x0000000000505452 in damagePutImage (pDrawable=0x3b463b0, pGC=0x3acab10,
depth=24, x=0, y=34, w=<optimized out>, h=34, leftPad=0, format=2,
pImage=0x61fc168 "$\025\f")
    at damage.c:795
#13 0x0000000000431053 in ProcPutImage (client=0x2aa76a0) at dispatch.c:1963
#14 0x000000000043444a in Dispatch () at dispatch.c:428
#15 0x0000000000423485 in main (argc=13, argv=0x7fff2f6d7948, envp=<optimized
out>) at main.c:288

See the possibly related Fedora bug report here:
https://bugzilla.redhat.com/show_bug.cgi?id=850573

Nouveau dmesg output from boot:
[    3.535300] [drm] nouveau 0000:01:00.0: Detected an NV50 generation card
(0x094100a1)
[    3.539647] [drm] nouveau 0000:01:00.0: Checking PRAMIN for VBIOS
[    3.598564] [drm] nouveau 0000:01:00.0: ... appears to be valid
[    3.598564] [drm] nouveau 0000:01:00.0: Using VBIOS from PRAMIN
[    3.598566] [drm] nouveau 0000:01:00.0: BIT BIOS found
[    3.598567] [drm] nouveau 0000:01:00.0: Bios version 62.94.82.00
[    3.598571] [drm] nouveau 0000:01:00.0: TMDS table version 2.0
[    3.598902] [drm] nouveau 0000:01:00.0: MXM: no VBIOS data, nothing to do
[    3.598906] [drm] nouveau 0000:01:00.0: DCB version 4.0
[    3.598910] [drm] nouveau 0000:01:00.0: DCB outp 00: 02000300 00000028
[    3.598913] [drm] nouveau 0000:01:00.0: DCB outp 01: 01000302 00020030
[    3.598915] [drm] nouveau 0000:01:00.0: DCB outp 02: 04011310 00000028
[    3.598918] [drm] nouveau 0000:01:00.0: DCB outp 03: 02011312 00020030
[    3.598920] [drm] nouveau 0000:01:00.0: DCB outp 04: 010223f1 00c0c083
[    3.598922] [drm] nouveau 0000:01:00.0: DCB conn 00: 00001030
[    3.598926] [drm] nouveau 0000:01:00.0: DCB conn 01: 00002130
[    3.598928] [drm] nouveau 0000:01:00.0: DCB conn 02: 00000210
[    3.598931] [drm] nouveau 0000:01:00.0: DCB conn 03: 00000211
[    3.598933] [drm] nouveau 0000:01:00.0: DCB conn 04: 00000213
[    3.598938] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset
0xD681
[    3.624214] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset
0xDAE7
[    3.627125] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset
0xEAE8
[    3.627133] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset
0xEC09
[    3.628217] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset
0xEF24
[    3.628219] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset
0xEF89
[    3.648185] [drm] nouveau 0000:01:00.0: 0xEF89: Condition still not met
after 20ms, skipping following opcodes
[    3.652467] [TTM] Zone  kernel: Available graphics memory: 2023556 kiB
[    3.652469] [TTM] Initializing pool allocator
[    3.652476] [TTM] Initializing DMA pool allocator
[    3.652489] [drm] nouveau 0000:01:00.0: Detected 512MiB VRAM (GDDR3)
[    3.654868] [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[    3.655717] nouveau 0000:01:00.0: irq 55 for MSI/MSI-X
[    3.655728] [drm] nouveau 0000:01:00.0: enabled MSI
[    3.693553] [drm] nouveau 0000:01:00.0: DCB encoder 1 unknown
[    3.693557] [drm] nouveau 0000:01:00.0: TV-1 has no encoders, removing
[    3.695635] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    3.695638] [drm] No driver support for vblank timestamp query.
[    3.701073] [drm] nouveau 0000:01:00.0: 2 available performance level(s)
[    3.701080] [drm] nouveau 0000:01:00.0: 0: core 300MHz shader 600MHz memory
300MHz fanspeed 100%
[    3.701085] [drm] nouveau 0000:01:00.0: 3: core 600MHz shader 1500MHz memory
900MHz voltage 1010mV fanspeed 100%
[    3.701090] [drm] nouveau 0000:01:00.0: c: core 500MHz shader 1250MHz memory
499MHz voltage 1010mV fanspeed 100%
[    3.749478] [drm] nouveau 0000:01:00.0: MM: using CRYPT for buffer copies
[    3.863834] [drm] nouveau 0000:01:00.0: allocated 1920x1080 fb: 0x2c0000, bo
ffff88013955c400
[    3.864024] fbcon: nouveaufb (fb0) is primary device
[    3.883778] Console: switching to colour frame buffer device 240x67
[    3.885833] fb0: nouveaufb frame buffer device
[    3.885836] drm: registered panic notifier
[    3.885841] [drm] Initialized nouveau 1.0.0 20120316 for 0000:01:00.0 on
minor 0

Let me know if there is any more information that is needed.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
