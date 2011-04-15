From: Mr Dash Four <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: hibernate problems on startup (nVidia G70/GeForce 7800GS,
 kernel 2.6.35.11-83)
Date: Fri, 15 Apr 2011 01:21:10 +0100
Message-ID: <4DA78F76.7000109@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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

I hope someone could shed some light on the rather annoying problem I am 
having.

My system is x86_64 (Core2) with nVidia G70/GeForce 7800GS, swap file 
(where all hibernate information is stored) is 2GiB, VRAM is 1MiB, RAM 
is 2GiB. The kernel version is 2.6.35.11-83, gdm is 2.32.

On system start up after hibernate the video screen displays black and 
white think lines, the system is then rendered unusable and the only way 
out is the three-finger salute! This happens at random (roughly about 
once every 5-6 times after hibernate/startup).

With earlier versions of the kernel (and gdm) this used to happen more 
often - about once every 2-3 start ups (the reason I upgraded both the 
kernel and gdm). This is part of the syslog when I get the black and 
white lines on the screen and the system is unusable:

Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: We're back, 
enabling device...
Apr 14 23:21:32 test1 kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
Apr 14 23:21:32 test1 kernel: agpgart: pm-hibernate tried to set 
rate=x12. Setting to AGP3 x8 mode.
Apr 14 23:21:32 test1 kernel: agpgart-via 0000:00:00.0: putting AGP V3 
device into 8x mode
Apr 14 23:21:32 test1 kernel: nouveau 0000:01:00.0: putting AGP V3 
device into 8x mode
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: POSTing device...
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS 
init table 0 at offset 0xDFFC
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS 
init table 1 at offset 0xE8EF
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS 
init table 2 at offset 0xF310
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS 
init table 3 at offset 0xF48B
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS 
init table 4 at offset 0xF5DF
Apr 14 23:21:32 test1 kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
Apr 14 23:21:32 test1 kernel: agpgart: pm-hibernate tried to set 
rate=x12. Setting to AGP3 x8 mode.
Apr 14 23:21:32 test1 kernel: agpgart-via 0000:00:00.0: putting AGP V3 
device into 8x mode
Apr 14 23:21:32 test1 kernel: nouveau 0000:01:00.0: putting AGP V3 
device into 8x mode
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Reinitialising 
engines...
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Restoring GPU 
objects...
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Restoring mode...
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - 
nSource: RANGE_EXCEPTION, nStatus: PROTECTION_FAULT
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - 
Ch 0/0 Class 0x0039 Mthd 0x0328 Data 0x00000000:0x00000000
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - 
nSource: RANGE_EXCEPTION, nStatus: PROTECTION_FAULT
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: PGRAPH_ERROR - 
Ch 0/0 Class 0x0039 Mthd 0x0328 Data 0x00000000:0x00000000
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: 0xD3FB: 
Parsing digital output script table
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms 
mode 3 on tmds encoder (output 1)
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms 
mode 3 on vga encoder (output 0)
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms 
mode 3 on vga encoder (output 2)
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms 
mode 3 on TV encoder (output 3)
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: 0xD3FB: 
Parsing digital output script table
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms 
mode 0 on tmds encoder (output 1)
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Output DVI-I-1 
is running on CRTC 0 using output C
Apr 14 23:21:32 test1 kernel: [drm] nouveau 0000:01:00.0: Unhandled 
PGRAPH_INTR - 0x00000080
Apr 14 23:21:32 test1 kernel: PM: restore of devices complete after 
2416.491 msecs
Apr 14 23:21:32 test1 kernel: Restarting tasks ...
Apr 14 23:21:32 test1 kernel: done.
Apr 14 23:21:35 test1 kernel: [drm] nouveau 0000:01:00.0: fail 
pre-validate sync
Apr 14 23:21:35 test1 kernel: [drm] nouveau 0000:01:00.0: validate vram_list
Apr 14 23:21:35 test1 kernel: [drm] nouveau 0000:01:00.0: validate: -16
Apr 14 23:21:39 test1 kernel: [drm] nouveau 0000:01:00.0: fail 
pre-validate sync
Apr 14 23:21:39 test1 kernel: [drm] nouveau 0000:01:00.0: validate vram_list
Apr 14 23:21:39 test1 kernel: [drm] nouveau 0000:01:00.0: validate: -16
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: fail 
pre-validate sync
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: validate vram_list
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: validate: -16
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: fail 
pre-validate sync
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: validate vram_list
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: validate: -16
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: fail 
pre-validate sync
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: validate vram_list
Apr 14 23:21:47 test1 kernel: [drm] nouveau 0000:01:00.0: validate: -16
Apr 14 23:21:50 test1 kernel: [drm] nouveau 0000:01:00.0: fail 
pre-validate sync
Apr 14 23:21:50 test1 kernel: [drm] nouveau 0000:01:00.0: validate vram_list
Apr 14 23:21:50 test1 kernel: [drm] nouveau 0000:01:00.0: validate: -16
Apr 14 23:22:07 test1 abrt[13745]: saved core dump of pid 2113 
(/usr/bin/Xorg) to /var/spool/abrt/ccpp-1302819724-2113.new/coredump 
(39473152 bytes)
Apr 14 23:22:07 test1 kernel: [drm] nouveau 0000:01:00.0: 
nouveau_channel_free: freeing fifo 1
Apr 14 23:22:07 test1 abrtd: Directory 'ccpp-1302819724-2113' creation 
detected
Apr 14 23:22:10 test1 kernel: [drm] nouveau 0000:01:00.0: Failed to idle 
channel 1.
Apr 14 23:22:10 test1 kernel: [drm] nouveau 0000:01:00.0: RAMHT entry 
not found. ch=1, handle=0xd8000003
Apr 14 23:22:10 test1 kernel: [drm] nouveau 0000:01:00.0: RAMHT entry 
not found. ch=1, handle=0x80000006
Apr 14 23:22:10 test1 kernel: [drm] nouveau 0000:01:00.0: RAMHT entry 
not found. ch=1, handle=0x8000000e
Apr 14 23:22:10 test1 kernel: [drm] nouveau 0000:01:00.0: RAMHT entry 
not found. ch=1, handle=0xd8000001
Apr 14 23:22:12 test1 gnome-keyring-daemon[2310]: dbus failure 
unregistering from session: Connection is closed
Apr 14 23:22:15 test1 gnome-keyring-daemon[2310]: dbus failure 
unregistering from session: Connection is closed
Apr 14 23:22:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms 
mode 3 on tmds encoder (output 1)
Apr 14 23:22:28 test1 kernel: [drm] nouveau 0000:01:00.0: 0xD3FB: 
Parsing digital output script table
Apr 14 23:22:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms 
mode 0 on tmds encoder (output 1)
Apr 14 23:22:28 test1 kernel: [drm] nouveau 0000:01:00.0: Output DVI-I-1 
is running on CRTC 0 using output C
Apr 14 23:22:28 test1 kernel: [drm] nouveau 0000:01:00.0: GPU lockup - 
switching to software fbcon
Apr 14 23:22:28 test1 kernel: [drm] nouveau 0000:01:00.0: Allocating 
FIFO number 1
Apr 14 23:22:28 test1 kernel: [drm] nouveau 0000:01:00.0: 
nouveau_channel_alloc: initialised FIFO 1
Apr 14 23:22:32 test1 abrtd: New crash 
/var/spool/abrt/ccpp-1302819724-2113, processing
Apr 14 23:22:33 test1 abrtd: Registered Action plugin 'RunApp'
Apr 14 23:22:33 test1 abrtd: 
RunApp('/var/spool/abrt/ccpp-1302819724-2113','test x"`cat component`" = 
x"xorg-x11-server-Xorg" && cp /var/log/Xorg.0.log .')

This is part of my syslog when everything is OK on system start up after 
hibernation:

Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: We're back, 
enabling device...
Apr 13 10:52:28 test1 kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
Apr 13 10:52:28 test1 kernel: agpgart: pm-hibernate tried to set 
rate=x12. Setting to AGP3 x8 mode.
Apr 13 10:52:28 test1 kernel: agpgart-via 0000:00:00.0: putting AGP V3 
device into 8x mode
Apr 13 10:52:28 test1 kernel: nouveau 0000:01:00.0: putting AGP V3 
device into 8x mode
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: POSTing device...
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS 
init table 0 at offset 0xDFFC
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS 
init table 1 at offset 0xE8EF
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS 
init table 2 at offset 0xF310
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS 
init table 3 at offset 0xF48B
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Parsing VBIOS 
init table 4 at offset 0xF5DF
Apr 13 10:52:28 test1 kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
Apr 13 10:52:28 test1 kernel: agpgart: pm-hibernate tried to set 
rate=x12. Setting to AGP3 x8 mode.
Apr 13 10:52:28 test1 kernel: agpgart-via 0000:00:00.0: putting AGP V3 
device into 8x mode
Apr 13 10:52:28 test1 kernel: nouveau 0000:01:00.0: putting AGP V3 
device into 8x mode
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Reinitialising 
engines...
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Restoring GPU 
objects...
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Restoring mode...
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: 0xD3FB: 
Parsing digital output script table
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms 
mode 3 on tmds encoder (output 1)
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms 
mode 3 on vga encoder (output 0)
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms 
mode 3 on vga encoder (output 2)
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms 
mode 3 on TV encoder (output 3)
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: 0xD3FB: 
Parsing digital output script table
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Setting dpms 
mode 0 on tmds encoder (output 1)
Apr 13 10:52:28 test1 kernel: [drm] nouveau 0000:01:00.0: Output DVI-I-1 
is running on CRTC 0 using output C
Apr 13 10:52:28 test1 kernel: PM: restore of devices complete after 
2412.354 msecs
Apr 13 10:52:28 test1 kernel: Restarting tasks ...
Apr 13 10:52:28 test1 kernel: done.

Any idea on what might be the cause of this? It is very annoying problem 
because I am losing data when this happens and sometimes I get disk 
partition corruption as well, so it is quite a serious problem I need to 
content with. Any help would be appreciated! Thanks!
