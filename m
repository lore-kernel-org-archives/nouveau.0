From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91373] Nouveau fills kern.log with gigabytes of data
 when molecule screensaver is run
Date: Fri, 17 Jul 2015 16:27:04 +0000
Message-ID: <bug-91373-8800-EfedcRpalo@http.bugs.freedesktop.org/>
References: <bug-91373-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1238633424=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91373-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1238633424==
Content-Type: multipart/alternative; boundary="1437150424.B34BA8d1.25258"; charset="UTF-8"


--1437150424.B34BA8d1.25258
Date: Fri, 17 Jul 2015 16:27:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91373

--- Comment #2 from Olivier Diotte <vhann3000+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
v3.19 is no go.

============8< CUT HERE 8<======================
$ grep 'nouveau' /var/log/syslog | head -n 100
Jul 17 10:48:09 dioo-XPS kernel: [    5.463520] fb: switching to nouveaufb from
VESA VGA
Jul 17 10:48:09 dioo-XPS kernel: [    5.465859] nouveau  [ 
DEVICE][0000:01:00.0] BOOT0  : 0x108060a1
Jul 17 10:48:09 dioo-XPS kernel: [    5.465862] nouveau  [ 
DEVICE][0000:01:00.0] Chipset: GK208 (NV108)
Jul 17 10:48:09 dioo-XPS kernel: [    5.465863] nouveau  [ 
DEVICE][0000:01:00.0] Family : NVE0
Jul 17 10:48:09 dioo-XPS kernel: [    5.578886] nouveau  [  
VBIOS][0000:01:00.0] using image from PROM
Jul 17 10:48:09 dioo-XPS kernel: [    5.579066] nouveau  [  
VBIOS][0000:01:00.0] BIT signature found
Jul 17 10:48:09 dioo-XPS kernel: [    5.579067] nouveau  [  
VBIOS][0000:01:00.0] version 80.28.56.00.01
Jul 17 10:48:09 dioo-XPS kernel: [    5.579752] nouveau  [    
PMC][0000:01:00.0] MSI interrupts enabled
Jul 17 10:48:09 dioo-XPS kernel: [    5.579792] nouveau  [    
PFB][0000:01:00.0] RAM type: DDR3
Jul 17 10:48:09 dioo-XPS kernel: [    5.579793] nouveau  [    
PFB][0000:01:00.0] RAM size: 1024 MiB
Jul 17 10:48:09 dioo-XPS kernel: [    5.579794] nouveau  [    
PFB][0000:01:00.0]    ZCOMP: 0 tags
Jul 17 10:48:09 dioo-XPS kernel: [    5.581061] nouveau  [   
VOLT][0000:01:00.0] GPU voltage: 850000uv
Jul 17 10:48:10 dioo-XPS kernel: [    6.879231] nouveau  [ 
PTHERM][0000:01:00.0] FAN control: toggle
Jul 17 10:48:10 dioo-XPS kernel: [    6.879242] nouveau  [ 
PTHERM][0000:01:00.0] fan management: automatic
Jul 17 10:48:10 dioo-XPS kernel: [    6.879280] nouveau  [ 
PTHERM][0000:01:00.0] internal sensor: yes
Jul 17 10:48:10 dioo-XPS kernel: [    6.879321] nouveau  [    
CLK][0000:01:00.0] 07: core 405 MHz memory 810 MHz 
Jul 17 10:48:10 dioo-XPS kernel: [    6.879354] nouveau  [    
CLK][0000:01:00.0] 0f: core 967 MHz memory 2002 MHz 
Jul 17 10:48:10 dioo-XPS kernel: [    6.879414] nouveau  [    
CLK][0000:01:00.0] --: core 405 MHz memory 810 MHz 
Jul 17 10:48:10 dioo-XPS kernel: [    6.943833] nouveau  [     DRM] VRAM: 1024
MiB
Jul 17 10:48:10 dioo-XPS kernel: [    6.943834] nouveau  [     DRM] GART:
1048576 MiB
Jul 17 10:48:10 dioo-XPS kernel: [    6.943837] nouveau  [     DRM] TMDS table
version 2.0
Jul 17 10:48:10 dioo-XPS kernel: [    6.943838] nouveau  [     DRM] DCB version
4.0
Jul 17 10:48:10 dioo-XPS kernel: [    6.943839] nouveau  [     DRM] DCB outp
00: 01000f02 00020030
Jul 17 10:48:10 dioo-XPS kernel: [    6.943840] nouveau  [     DRM] DCB outp
01: 02011f62 00020010
Jul 17 10:48:10 dioo-XPS kernel: [    6.943841] nouveau  [     DRM] DCB outp
02: 02022f10 00000000
Jul 17 10:48:10 dioo-XPS kernel: [    6.943841] nouveau  [     DRM] DCB conn
00: 00001031
Jul 17 10:48:10 dioo-XPS kernel: [    6.943843] nouveau  [     DRM] DCB conn
01: 00002161
Jul 17 10:48:10 dioo-XPS kernel: [    6.943843] nouveau  [     DRM] DCB conn
02: 00000200
Jul 17 10:48:10 dioo-XPS kernel: [    6.949791] nouveau  [     DRM] MM: using
COPY for buffer copies
Jul 17 10:48:11 dioo-XPS kernel: [    7.186686] nouveau  [     DRM] allocated
1920x1080 fb: 0x60000, bo ffff8802128c1c00
Jul 17 10:48:11 dioo-XPS kernel: [    7.186814] fbcon: nouveaufb (fb0) is
primary device
Jul 17 10:48:11 dioo-XPS kernel: [    7.412257] nouveau 0000:01:00.0: fb0:
nouveaufb frame buffer device
Jul 17 10:48:11 dioo-XPS kernel: [    7.412258] nouveau 0000:01:00.0:
registered panic notifier
Jul 17 10:48:11 dioo-XPS kernel: [    7.415034] [drm] Initialized nouveau 1.2.2
20120801 for 0000:01:00.0 on minor 0
Jul 17 10:50:16 dioo-XPS kernel: [  131.177645] nouveau E[  
PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
Jul 17 10:50:16 dioo-XPS kernel: [  131.177651] nouveau E[  
PFIFO][0000:01:00.0] PGRAPH engine fault on channel 7, recovering...
Jul 17 10:50:45 dioo-XPS kernel: [  160.403618] nouveau E[molecule[2408]]
failed to idle channel 0xcccc0000 [molecule[2408]]
Jul 17 10:51:00 dioo-XPS kernel: [  175.398186] nouveau E[molecule[2408]]
failed to idle channel 0xcccc0000 [molecule[2408]]
Jul 17 11:09:38 dioo-XPS kernel: [ 1293.243951] nouveau E[  
PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
Jul 17 11:09:38 dioo-XPS kernel: [ 1293.243957] nouveau E[  
PFIFO][0000:01:00.0] PGRAPH engine fault on channel 6, recovering...
Jul 17 11:10:14 dioo-XPS kernel: [ 1328.576624] molecule[2657]: segfault at 38
ip 00007fbb4cdc8770 sp 00007ffd655351b8 error 4 in
nouveau_dri.so[7fbb4cabd000+746000]
Jul 17 11:10:14 dioo-XPS kernel: [ 1328.812565] molecule[2658]: segfault at 38
ip 00007f15962d0770 sp 00007ffd1e3a8da8 error 4 in
nouveau_dri.so[7f1595fc5000+746000]
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332138] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ACQUIRE
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332145] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[2343]] subc 0 mthd 0x001c data
0x00001004
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332160] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ACQUIRE
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332163] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[2343]] subc 0 mthd 0x001c data
0x00001004
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332176] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ACQUIRE
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332178] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[2343]] subc 0 mthd 0x001c data
0x00001004
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332194] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ACQUIRE
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332196] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[2343]] subc 0 mthd 0x001c data
0x00001004
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332211] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ACQUIRE
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332215] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[2343]] subc 0 mthd 0x001c data
0x00001004
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332234] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ACQUIRE
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332239] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[2343]] subc 0 mthd 0x001c data
0x00001004
==================8< CUT HERE 8<============================================

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1437150424.B34BA8d1.25258
Date: Fri, 17 Jul 2015 16:27:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau fills kern.log with gigabytes of data when molecule screensaver is run"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91373#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau fills kern.log with gigabytes of data when molecule screensaver is run"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91373">bug 91373</a>
              from <span class="vcard"><a class="email" href="mailto:vhann3000+freedesktop&#64;gmail.com" title="Olivier Diotte &lt;vhann3000+freedesktop&#64;gmail.com&gt;"> <span class="fn">Olivier Diotte</span></a>
</span></b>
        <pre>v3.19 is no go.

============8&lt; CUT HERE 8&lt;======================
$ grep 'nouveau' /var/log/syslog | head -n 100
Jul 17 10:48:09 dioo-XPS kernel: [    5.463520] fb: switching to nouveaufb from
VESA VGA
Jul 17 10:48:09 dioo-XPS kernel: [    5.465859] nouveau  [ 
DEVICE][0000:01:00.0] BOOT0  : 0x108060a1
Jul 17 10:48:09 dioo-XPS kernel: [    5.465862] nouveau  [ 
DEVICE][0000:01:00.0] Chipset: GK208 (NV108)
Jul 17 10:48:09 dioo-XPS kernel: [    5.465863] nouveau  [ 
DEVICE][0000:01:00.0] Family : NVE0
Jul 17 10:48:09 dioo-XPS kernel: [    5.578886] nouveau  [  
VBIOS][0000:01:00.0] using image from PROM
Jul 17 10:48:09 dioo-XPS kernel: [    5.579066] nouveau  [  
VBIOS][0000:01:00.0] BIT signature found
Jul 17 10:48:09 dioo-XPS kernel: [    5.579067] nouveau  [  
VBIOS][0000:01:00.0] version 80.28.56.00.01
Jul 17 10:48:09 dioo-XPS kernel: [    5.579752] nouveau  [    
PMC][0000:01:00.0] MSI interrupts enabled
Jul 17 10:48:09 dioo-XPS kernel: [    5.579792] nouveau  [    
PFB][0000:01:00.0] RAM type: DDR3
Jul 17 10:48:09 dioo-XPS kernel: [    5.579793] nouveau  [    
PFB][0000:01:00.0] RAM size: 1024 MiB
Jul 17 10:48:09 dioo-XPS kernel: [    5.579794] nouveau  [    
PFB][0000:01:00.0]    ZCOMP: 0 tags
Jul 17 10:48:09 dioo-XPS kernel: [    5.581061] nouveau  [   
VOLT][0000:01:00.0] GPU voltage: 850000uv
Jul 17 10:48:10 dioo-XPS kernel: [    6.879231] nouveau  [ 
PTHERM][0000:01:00.0] FAN control: toggle
Jul 17 10:48:10 dioo-XPS kernel: [    6.879242] nouveau  [ 
PTHERM][0000:01:00.0] fan management: automatic
Jul 17 10:48:10 dioo-XPS kernel: [    6.879280] nouveau  [ 
PTHERM][0000:01:00.0] internal sensor: yes
Jul 17 10:48:10 dioo-XPS kernel: [    6.879321] nouveau  [    
CLK][0000:01:00.0] 07: core 405 MHz memory 810 MHz 
Jul 17 10:48:10 dioo-XPS kernel: [    6.879354] nouveau  [    
CLK][0000:01:00.0] 0f: core 967 MHz memory 2002 MHz 
Jul 17 10:48:10 dioo-XPS kernel: [    6.879414] nouveau  [    
CLK][0000:01:00.0] --: core 405 MHz memory 810 MHz 
Jul 17 10:48:10 dioo-XPS kernel: [    6.943833] nouveau  [     DRM] VRAM: 1024
MiB
Jul 17 10:48:10 dioo-XPS kernel: [    6.943834] nouveau  [     DRM] GART:
1048576 MiB
Jul 17 10:48:10 dioo-XPS kernel: [    6.943837] nouveau  [     DRM] TMDS table
version 2.0
Jul 17 10:48:10 dioo-XPS kernel: [    6.943838] nouveau  [     DRM] DCB version
4.0
Jul 17 10:48:10 dioo-XPS kernel: [    6.943839] nouveau  [     DRM] DCB outp
00: 01000f02 00020030
Jul 17 10:48:10 dioo-XPS kernel: [    6.943840] nouveau  [     DRM] DCB outp
01: 02011f62 00020010
Jul 17 10:48:10 dioo-XPS kernel: [    6.943841] nouveau  [     DRM] DCB outp
02: 02022f10 00000000
Jul 17 10:48:10 dioo-XPS kernel: [    6.943841] nouveau  [     DRM] DCB conn
00: 00001031
Jul 17 10:48:10 dioo-XPS kernel: [    6.943843] nouveau  [     DRM] DCB conn
01: 00002161
Jul 17 10:48:10 dioo-XPS kernel: [    6.943843] nouveau  [     DRM] DCB conn
02: 00000200
Jul 17 10:48:10 dioo-XPS kernel: [    6.949791] nouveau  [     DRM] MM: using
COPY for buffer copies
Jul 17 10:48:11 dioo-XPS kernel: [    7.186686] nouveau  [     DRM] allocated
1920x1080 fb: 0x60000, bo ffff8802128c1c00
Jul 17 10:48:11 dioo-XPS kernel: [    7.186814] fbcon: nouveaufb (fb0) is
primary device
Jul 17 10:48:11 dioo-XPS kernel: [    7.412257] nouveau 0000:01:00.0: fb0:
nouveaufb frame buffer device
Jul 17 10:48:11 dioo-XPS kernel: [    7.412258] nouveau 0000:01:00.0:
registered panic notifier
Jul 17 10:48:11 dioo-XPS kernel: [    7.415034] [drm] Initialized nouveau 1.2.2
20120801 for 0000:01:00.0 on minor 0
Jul 17 10:50:16 dioo-XPS kernel: [  131.177645] nouveau E[  
PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
Jul 17 10:50:16 dioo-XPS kernel: [  131.177651] nouveau E[  
PFIFO][0000:01:00.0] PGRAPH engine fault on channel 7, recovering...
Jul 17 10:50:45 dioo-XPS kernel: [  160.403618] nouveau E[molecule[2408]]
failed to idle channel 0xcccc0000 [molecule[2408]]
Jul 17 10:51:00 dioo-XPS kernel: [  175.398186] nouveau E[molecule[2408]]
failed to idle channel 0xcccc0000 [molecule[2408]]
Jul 17 11:09:38 dioo-XPS kernel: [ 1293.243951] nouveau E[  
PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
Jul 17 11:09:38 dioo-XPS kernel: [ 1293.243957] nouveau E[  
PFIFO][0000:01:00.0] PGRAPH engine fault on channel 6, recovering...
Jul 17 11:10:14 dioo-XPS kernel: [ 1328.576624] molecule[2657]: segfault at 38
ip 00007fbb4cdc8770 sp 00007ffd655351b8 error 4 in
nouveau_dri.so[7fbb4cabd000+746000]
Jul 17 11:10:14 dioo-XPS kernel: [ 1328.812565] molecule[2658]: segfault at 38
ip 00007f15962d0770 sp 00007ffd1e3a8da8 error 4 in
nouveau_dri.so[7f1595fc5000+746000]
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332138] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ACQUIRE
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332145] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[2343]] subc 0 mthd 0x001c data
0x00001004
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332160] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ACQUIRE
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332163] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[2343]] subc 0 mthd 0x001c data
0x00001004
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332176] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ACQUIRE
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332178] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[2343]] subc 0 mthd 0x001c data
0x00001004
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332194] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ACQUIRE
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332196] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[2343]] subc 0 mthd 0x001c data
0x00001004
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332211] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ACQUIRE
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332215] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[2343]] subc 0 mthd 0x001c data
0x00001004
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332234] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ACQUIRE
Jul 17 11:47:01 dioo-XPS kernel: [ 3535.332239] nouveau E[  
PFIFO][0000:01:00.0] PBDMA0: ch 2 [Xorg[2343]] subc 0 mthd 0x001c data
0x00001004
==================8&lt; CUT HERE 8&lt;============================================</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437150424.B34BA8d1.25258--

--===============1238633424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1238633424==--
