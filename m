From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37039] New: display of black-and-white lines on the
 video screen on system startup after hibernate
Date: Mon,  9 May 2011 15:32:28 -0700 (PDT)
Message-ID: <bug-37039-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37039

           Summary: display of black-and-white lines on the video screen
                    on system startup after hibernate
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Description of problem:
On system start up after hibernate the video screen displays black and white
think lines, the system is then rendered unusable and the only way out is
pressing the reset switch (ctrl-alt-del won't do!).

Version-Release number of selected component (if applicable):
Even though the core system is FC13, I use gdm 2.32 with kernel 2.6.35.11-83

How reproducible:
This happens at random (roughly about once every 5-6 times after
hibernate/startup). With earlier versions of the kernel (and gdm) this used to
happen more often - about once every 2-3 start ups (the reason I upgraded the
kernel and gdm).

Steps to Reproduce:
1. Hibernate the system
2. Start the system after hibernate is completed
3. Once the system starts up instead of the normal screen being restored I see
black and white lines and the whole system is rendered unusable. The syslog
(below) may indicate the reason for this.

Actual results:
From syslog (on system startup after hibernate):
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: We're back, enabling
device...
Apr 13 10:52:28 test1 kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
Apr 13 10:52:28 test1 kernel: agpgart: pm-hibernate tried to set rate=x12.
Setting to AGP3 x8 mode.
Apr 13 10:52:28 test1 kernel: agpgart-via 0000:00:00.0: putting AGP V3 device
into 8x mode
Apr 13 10:52:28 test1 kernel: nouveau 0000:01:00.0: putting AGP V3 device into
8x mode
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: POSTing device...
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init
table 0 at offset 0xDFFC
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init
table 1 at offset 0xE8EF
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init
table 2 at offset 0xF310
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init
table 3 at offset 0xF48B
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init
table 4 at offset 0xF5DF
Apr 13 10:52:28 test1 kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
Apr 13 10:52:28 test1 kernel: agpgart: pm-hibernate tried to set rate=x12.
Setting to AGP3 x8 mode.
Apr 13 10:52:28 test1 kernel: agpgart-via 0000:00:00.0: putting AGP V3 device
into 8x mode
Apr 13 10:52:28 test1 kernel: nouveau 0000:01:00.0: putting AGP V3 device into
8x mode
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Reinitialising
engines...
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Restoring GPU
objects...
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Restoring mode...
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: 0xD3FB: Parsing
digital output script table
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on tmds encoder (output 1)
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on vga encoder (output 0)
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on vga encoder (output 2)
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on TV encoder (output 3)
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: 0xD3FB: Parsing
digital output script table
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 0
on tmds encoder (output 1)
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Output DVI-I-1 is
running on CRTC 0 using output C
Apr 13 10:52:28 test1 kernel: PM: restore of devices complete after 2412.354
msecs
Apr 13 10:52:28 test1 kernel: Restarting tasks ... 
Apr 13 10:52:28 test1 kernel: done.

Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: We're back, enabling
device...
Apr 14 23:21:32 test1 kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
Apr 14 23:21:32 test1 kernel: agpgart: pm-hibernate tried to set rate=x12.
Setting to AGP3 x8 mode.
Apr 14 23:21:32 test1 kernel: agpgart-via 0000:00:00.0: putting AGP V3 device
into 8x mode
Apr 14 23:21:32 test1 kernel: nouveau 0000:01:00.0: putting AGP V3 device into
8x mode
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: POSTing device...
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init
table 0 at offset 0xDFFC
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init
table 1 at offset 0xE8EF
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init
table 2 at offset 0xF310
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init
table 3 at offset 0xF48B
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init
table 4 at offset 0xF5DF
Apr 14 23:21:32 test1 kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
Apr 14 23:21:32 test1 kernel: agpgart: pm-hibernate tried to set rate=x12.
Setting to AGP3 x8 mode.
Apr 14 23:21:32 test1 kernel: agpgart-via 0000:00:00.0: putting AGP V3 device
into 8x mode
Apr 14 23:21:32 test1 kernel: nouveau 0000:01:00.0: putting AGP V3 device into
8x mode
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Reinitialising
engines...
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Restoring GPU
objects...
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Restoring mode...
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: RANGE_EXCEPTION, nStatus: PROTECTION_FAULT
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0039 Mthd 0x0328 Data 0x00000000:0x00000000
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: RANGE_EXCEPTION, nStatus: PROTECTION_FAULT
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0039 Mthd 0x0328 Data 0x00000000:0x00000000
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: 0xD3FB: Parsing
digital output script table
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on tmds encoder (output 1)
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on vga encoder (output 0)
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on vga encoder (output 2)
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on TV encoder (output 3)
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: 0xD3FB: Parsing
digital output script table
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 0
on tmds encoder (output 1)
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Output DVI-I-1 is
running on CRTC 0 using output C
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Unhandled PGRAPH_INTR
- 0x00000080
Apr 14 23:21:32 test1 kernel: PM: restore of devices complete after 2416.491
msecs
Apr 14 23:21:32 test1 kernel: Restarting tasks ... 
Apr 14 23:21:32 test1 kernel: done.
Apr 14 23:21:35 test1 kernel: [drm] nouveau 0000:01:00.0: fail pre-validate
sync
Apr 14 23:21:35 test1 kernel: [drm] nouveau 0000:01:00.0: validate vram_list
Apr 14 23:21:35 test1 kernel: [drm] nouveau 0000:01:00.0: validate: -16
Apr 14 23:21:39 test1 kernel: [drm] nouveau 0000:01:00.0: fail pre-validate
sync
Apr 14 23:21:39 test1 kernel: [drm] nouveau 0000:01:00.0: validate vram_list
Apr 14 23:21:39 test1 kernel: [drm] nouveau 0000:01:00.0: validate: -16
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: fail pre-validate
sync
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: validate vram_list
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: validate: -16
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: fail pre-validate
sync
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: validate vram_list
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: validate: -16
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: fail pre-validate
sync
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: validate vram_list
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: validate: -16
Apr 14 23:21:50 test1 kernel: [drm] nouveau 0000:01:00.0: fail pre-validate
sync
Apr 14 23:21:50 test1 kernel: [drm] nouveau 0000:01:00.0: validate vram_list
Apr 14 23:21:50 test1 kernel: [drm] nouveau 0000:01:00.0: validate: -16
Apr 14 23:22:07 test1 abrt[13745]: saved core dump of pid 2113 (/usr/bin/Xorg)
to /var/spool/abrt/ccpp-1302819724-2113.new/coredump (39473152 bytes)
Apr 14 23:22:07 test1 kernel: [drm] nouveau 0000:01:00.0: nouveau_channel_free:
freeing fifo 1
Apr 14 23:22:07 test1 abrtd: Directory 'ccpp-1302819724-2113' creation detected
Apr 14 23:22:10 test1 kernel: [drm] nouveau 0000:01:00.0: Failed to idle
channel 1.
Apr 14 23:22:10 test1 kernel: [drm] nouveau 0000:01:00.0: RAMHT entry not
found. ch=1, handle=0xd8000003
Apr 14 23:22:10 test1 kernel: [drm] nouveau 0000:01:00.0: RAMHT entry not
found. ch=1, handle=0x80000006
Apr 14 23:22:10 test1 kernel: [drm] nouveau 0000:01:00.0: RAMHT entry not
found. ch=1, handle=0x8000000e
Apr 14 23:22:10 test1 kernel: [drm] nouveau 0000:01:00.0: RAMHT entry not
found. ch=1, handle=0xd8000001
Apr 14 23:22:12 test1 gnome-keyring-daemon[2310]: dbus failure unregistering
from session: Connection is closed
Apr 14 23:22:15 test1 gnome-keyring-daemon[2310]: dbus failure unregistering
from session: Connection is closed
Apr 14 23:22:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on tmds encoder (output 1)
Apr 14 23:22:28 test1 kernel: [drm] nouveau 0000:01:00.0: 0xD3FB: Parsing
digital output script table
Apr 14 23:22:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 0
on tmds encoder (output 1)
Apr 14 23:22:28 test1 kernel: [drm] nouveau 0000:01:00.0: Output DVI-I-1 is
running on CRTC 0 using output C
Apr 14 23:22:28 test1 kernel: [drm] nouveau 0000:01:00.0: GPU lockup -
switching to software fbcon
Apr 14 23:22:28 test1 kernel: [drm] nouveau 0000:01:00.0: Allocating FIFO
number 1
Apr 14 23:22:28 test1 kernel: [drm] nouveau 0000:01:00.0:
nouveau_channel_alloc: initialised FIFO 1
Apr 14 23:22:32 test1 abrtd: New crash /var/spool/abrt/ccpp-1302819724-2113,
processing
Apr 14 23:22:33 test1 abrtd: Registered Action plugin 'RunApp'
Apr 14 23:22:33 test1 abrtd:
RunApp('/var/spool/abrt/ccpp-1302819724-2113','test x"`cat component`" =
x"xorg-x11-server-Xorg" && cp /var/log/Xorg.0.log .')

On another instance I get this in my syslog with the same effect - black and
white lines and the system is unusable:

May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: Restoring mode...
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x0184 Data 0x00000000:0x00004002
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR -
Ch 0/0 Mthd 0x0188 Data 0x80000002
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x030c Data 0x00000000:0x03d99000
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x0310 Data 0x00000000:0x00040000
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x0314 Data 0x00000000:0x00001000
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x0318 Data 0x00000000:0x00001000
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x031c Data 0x00000000:0x00001000
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x0320 Data 0x00000000:0x00000004
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x0324 Data 0x00000000:0x00000101
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x0328 Data 0x00000000:0x00000000
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x0184 Data 0x00000000:0x00004002
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: 0xD3FB: Parsing
digital output script table
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR -
Ch 0/0 Mthd 0x0188 Data 0x80000002
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x030c Data 0x00000000:0x03d9d000
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x0310 Data 0x00000000:0x00044000
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x0314 Data 0x00000000:0x00001000
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x0318 Data 0x00000000:0x00001000
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x031c Data 0x00000000:0x00001000
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x0320 Data 0x00000000:0x00000004
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x0324 Data 0x00000000:0x00000101
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/0
Class 0x0000 Mthd 0x0328 Data 0x00000000:0x00000000
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on tmds encoder (output 1)
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on vga encoder (output 0)
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on vga encoder (output 2)
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on TV encoder (output 3)
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: 0xD3FB: Parsing
digital output script table
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 0
on tmds encoder (output 1)
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: Output DVI-I-1 is
running on CRTC 0 using output C
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/3
Class 0x0000 Mthd 0x0be4 Data 0x00000000:0x00000000
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - Ch 0/3
Class 0x0000 Mthd 0x0be8 Data 0x00000000:0x00100008
May  9 22:48:41 test1 kernel: PM: restore of devices complete after 2349.027
msecs
May  9 22:48:41 test1 kernel: Restarting tasks ... 
May  9 22:48:41 test1 kernel: done.
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_CACHE_ERROR -
Ch 0/0 Mthd 0x0188 Data 0x80000002
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00010000
- Ch 1
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: PFIFO still angry
after 101 spins, halt
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: reloc wait_idle
failed: -16
May  9 22:48:41 test1 kernel: [drm] nouveau 0000:01:00.0: reloc apply: -16
May  9 22:48:44 test1 abrt[13042]: saved core dump of pid 1904 (/usr/bin/Xorg)
to /var/spool/abrt/ccpp-1304977723-1904.new/coredump (28205056 bytes)
May  9 22:48:44 test1 abrtd: Directory 'ccpp-1304977723-1904' creation detected
May  9 22:48:44 test1 kernel: [drm] nouveau 0000:01:00.0: nouveau_channel_free:
freeing fifo 1
May  9 22:48:47 test1 kernel: [drm] nouveau 0000:01:00.0: Failed to idle
channel 1.
May  9 22:48:50 test1 abrtd: New crash /var/spool/abrt/ccpp-1304977723-1904,
processing
May  9 22:48:50 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on tmds encoder (output 1)
May  9 22:48:50 test1 kernel: [drm] nouveau 0000:01:00.0: 0xD3FB: Parsing
digital output script table
May  9 22:48:50 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 0
on tmds encoder (output 1)
May  9 22:48:50 test1 kernel: [drm] nouveau 0000:01:00.0: Output DVI-I-1 is
running on CRTC 0 using output C
May  9 22:48:50 test1 abrtd: Registered Action plugin 'RunApp'
May  9 22:48:50 test1 abrtd:
RunApp('/var/spool/abrt/ccpp-1304977723-1904','test x"`cat component`" =
x"xorg-x11-server-Xorg" && cp /var/log/Xorg.0.log .')
May  9 22:48:50 test1 kernel: [drm] nouveau 0000:01:00.0: GPU lockup -
switching to software fbcon
May  9 22:48:50 test1 kernel: [drm] nouveau 0000:01:00.0: Allocating FIFO
number 1
May  9 22:48:50 test1 kernel: [drm] nouveau 0000:01:00.0:
nouveau_channel_alloc: initialised FIFO 1

Expected results:
This is what "normally" happens when everything is restored properly after
hibernate and without any errors:

Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: We're back, enabling
device...
Apr 13 10:52:28 test1 kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
Apr 13 10:52:28 test1 kernel: agpgart: pm-hibernate tried to set rate=x12.
Setting to AGP3 x8 mode.
Apr 13 10:52:28 test1 kernel: agpgart-via 0000:00:00.0: putting AGP V3 device
into 8x mode
Apr 13 10:52:28 test1 kernel: nouveau 0000:01:00.0: putting AGP V3 device into
8x mode
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: POSTing device...
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init
table 0 at offset 0xDFFC
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init
table 1 at offset 0xE8EF
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init
table 2 at offset 0xF310
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init
table 3 at offset 0xF48B
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS init
table 4 at offset 0xF5DF
Apr 13 10:52:28 test1 kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
Apr 13 10:52:28 test1 kernel: agpgart: pm-hibernate tried to set rate=x12.
Setting to AGP3 x8 mode.
Apr 13 10:52:28 test1 kernel: agpgart-via 0000:00:00.0: putting AGP V3 device
into 8x mode
Apr 13 10:52:28 test1 kernel: nouveau 0000:01:00.0: putting AGP V3 device into
8x mode
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Reinitialising
engines...
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Restoring GPU
objects...
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Restoring mode...
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: 0xD3FB: Parsing
digital output script table
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on tmds encoder (output 1)
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on vga encoder (output 0)
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on vga encoder (output 2)
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 3
on TV encoder (output 3)
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: 0xD3FB: Parsing
digital output script table
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms mode 0
on tmds encoder (output 1)
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Output DVI-I-1 is
running on CRTC 0 using output C
Apr 13 10:52:28 test1 kernel: PM: restore of devices complete after 2412.354
msecs
Apr 13 10:52:28 test1 kernel: Restarting tasks ... 
Apr 13 10:52:28 test1 kernel: done.


Additional info:

The system is x86_64 (Core2) with nVidia G70/GeForce 7800GS, swap file (where
all hibernate information is stored) is 2GiB, VRAM is 1MiB, RAM is 2GiB. If you
need any additional information please let me know and I will provide it as
soon as possible.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
