From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64493] New: X server crashes when launch Savage XR
Date: Sun, 12 May 2013 14:43:58 +0000
Message-ID: <bug-64493-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0147748970=="
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


--===============0147748970==
Content-Type: multipart/alternative; boundary="1368369838.FBFD785b0.18282"; charset="us-ascii"


--1368369838.FBFD785b0.18282
Date: Sun, 12 May 2013 14:43:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64493

          Priority: medium
            Bug ID: 64493
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: X server crashes when launch Savage XR
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: ginermail-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: 9.1
         Component: Drivers/DRI/nouveau
           Product: Mesa

Savage XR wasn't stable on nouveau before but now I can't launch it because it
craches X server.

OS: Arch Linux

$ pacman -Q | grep -i nouveau
nouveau-dri 9.1.2-1
xf86-video-nouveau 1.0.7-1

$ pacman -Qi xorg-server | grep Version
Version        : 1.14.1-1

$ uname -a
Linux giner-arch 3.9.2-1-ARCH #1 SMP PREEMPT Sat May 11 21:11:14 CEST 2013 i686
GNU/Linux

$ lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation G84 [GeForce 8600 GT]
(rev a1)

$ sudo grep -i nouveau /var/log/kern.log | tail
*****************************************************************************
May 12 17:21:02 giner-arch kernel: [  513.858894] nouveau E[ 
PGRAPH][0000:01:00.0] ch 4 [0x001f939000 gnome-shell[1542]] subc 3 class 0x8297
mthd 0x0e04 data 0xff380000
May 12 17:21:02 giner-arch kernel: [  513.858909] nouveau E[ 
PGRAPH][0000:01:00.0] DATA_ERROR INVALID_VALUE
May 12 17:21:02 giner-arch kernel: [  513.858913] nouveau E[ 
PGRAPH][0000:01:00.0]  DATA_ERROR
May 12 17:21:02 giner-arch kernel: [  513.858917] nouveau E[ 
PGRAPH][0000:01:00.0] ch 4 [0x001f939000 gnome-shell[1542]] subc 3 class 0x8297
mthd 0x0e08 data 0xffd30000
May 12 18:33:35 giner-arch kernel: [ 4866.200937] nouveau E[ 
PGRAPH][0000:01:00.0] DATA_ERROR INVALID_VALUE
May 12 18:33:35 giner-arch kernel: [ 4866.200943] nouveau E[ 
PGRAPH][0000:01:00.0]  DATA_ERROR
May 12 18:33:35 giner-arch kernel: [ 4866.200948] nouveau E[ 
PGRAPH][0000:01:00.0] ch 4 [0x001f939000 gnome-shell[2500]] subc 3 class 0x8297
mthd 0x0e04 data 0xff380000
May 12 18:33:35 giner-arch kernel: [ 4866.200967] nouveau E[ 
PGRAPH][0000:01:00.0] DATA_ERROR INVALID_VALUE
May 12 18:33:35 giner-arch kernel: [ 4866.200971] nouveau E[ 
PGRAPH][0000:01:00.0]  DATA_ERROR
May 12 18:33:35 giner-arch kernel: [ 4866.200975] nouveau E[ 
PGRAPH][0000:01:00.0] ch 4 [0x001f939000 gnome-shell[2500]] subc 3 class 0x8297
mthd 0x0e08 data 0xffd30000
*****************************************************************************

$ tail -n 30 /var/log/Xorg.0.log.old
*****************************************************************************
[   529.737] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   529.737] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[  4863.472] (EE) 
[  4863.472] (EE) Backtrace:
[  4863.494] (EE) 0: /usr/bin/Xorg (xorg_backtrace+0x49) [0x81d7ae9]
[  4863.494] (EE) 1: /usr/bin/Xorg (0x8048000+0x193854) [0x81db854]
[  4863.494] (EE) 2: linux-gate.so.1 (__kernel_rt_sigreturn+0x0) [0xb775d40c]
[  4863.494] (EE) 3: /usr/lib/xorg/modules/dri/nouveau_dri.so
(0xb5639000+0x24b065) [0xb5884065]
[  4863.494] (EE) 4: /usr/lib/xorg/modules/extensions/libglx.so
(0xb6f1e000+0xbd98) [0xb6f29d98]
[  4863.494] (EE) 5: /usr/lib/xorg/modules/extensions/libglx.so
(0xb6f1e000+0x40300) [0xb6f5e300]
[  4863.494] (EE) 6: /usr/lib/xorg/modules/extensions/libglx.so
(0xb6f1e000+0x42a2e) [0xb6f60a2e]
[  4863.494] (EE) 7: /usr/bin/Xorg (0x8048000+0x3144d) [0x807944d]
[  4863.494] (EE) 8: /usr/bin/Xorg (0x8048000+0x1f625) [0x8067625]
[  4863.494] (EE) 9: /usr/lib/libc.so.6 (__libc_start_main+0xf3) [0xb73937c3]
[  4863.494] (EE) 10: /usr/bin/Xorg (0x8048000+0x1f9f9) [0x80679f9]
[  4863.494] (EE) 
[  4863.494] (EE) Segmentation fault at address 0xde5
[  4863.494] 
Fatal server error:
[  4863.494] Caught signal 11 (Segmentation fault). Server aborting
[  4863.494] 
[  4863.494] (EE) 
Please consult the The X.Org Foundation support 
     at http://wiki.x.org
 for help. 
[  4863.494] (EE) Please also check the log file at "/var/log/Xorg.0.log" for
additional information.
[  4863.494] (EE) 
[  4863.494] (II) AIGLX: Suspending AIGLX clients for VT switch
[  4863.494] (II) NOUVEAU(0): NVLeaveVT is called.
[  4863.527] Server terminated with error (1). Closing log file.
*****************************************************************************

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368369838.FBFD785b0.18282
Date: Sun, 12 May 2013 14:43:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X server crashes when launch Savage XR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64493">64493</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>X server crashes when launch Savage XR
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ginermail&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>9.1
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Savage XR wasn't stable on nouveau before but now I can't launch it because it
craches X server.

OS: Arch Linux

$ pacman -Q | grep -i nouveau
nouveau-dri 9.1.2-1
xf86-video-nouveau 1.0.7-1

$ pacman -Qi xorg-server | grep Version
Version        : 1.14.1-1

$ uname -a
Linux giner-arch 3.9.2-1-ARCH #1 SMP PREEMPT Sat May 11 21:11:14 CEST 2013 i686
GNU/Linux

$ lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation G84 [GeForce 8600 GT]
(rev a1)

$ sudo grep -i nouveau /var/log/kern.log | tail
*****************************************************************************
May 12 17:21:02 giner-arch kernel: [  513.858894] nouveau E[ 
PGRAPH][0000:01:00.0] ch 4 [0x001f939000 gnome-shell[1542]] subc 3 class 0x8297
mthd 0x0e04 data 0xff380000
May 12 17:21:02 giner-arch kernel: [  513.858909] nouveau E[ 
PGRAPH][0000:01:00.0] DATA_ERROR INVALID_VALUE
May 12 17:21:02 giner-arch kernel: [  513.858913] nouveau E[ 
PGRAPH][0000:01:00.0]  DATA_ERROR
May 12 17:21:02 giner-arch kernel: [  513.858917] nouveau E[ 
PGRAPH][0000:01:00.0] ch 4 [0x001f939000 gnome-shell[1542]] subc 3 class 0x8297
mthd 0x0e08 data 0xffd30000
May 12 18:33:35 giner-arch kernel: [ 4866.200937] nouveau E[ 
PGRAPH][0000:01:00.0] DATA_ERROR INVALID_VALUE
May 12 18:33:35 giner-arch kernel: [ 4866.200943] nouveau E[ 
PGRAPH][0000:01:00.0]  DATA_ERROR
May 12 18:33:35 giner-arch kernel: [ 4866.200948] nouveau E[ 
PGRAPH][0000:01:00.0] ch 4 [0x001f939000 gnome-shell[2500]] subc 3 class 0x8297
mthd 0x0e04 data 0xff380000
May 12 18:33:35 giner-arch kernel: [ 4866.200967] nouveau E[ 
PGRAPH][0000:01:00.0] DATA_ERROR INVALID_VALUE
May 12 18:33:35 giner-arch kernel: [ 4866.200971] nouveau E[ 
PGRAPH][0000:01:00.0]  DATA_ERROR
May 12 18:33:35 giner-arch kernel: [ 4866.200975] nouveau E[ 
PGRAPH][0000:01:00.0] ch 4 [0x001f939000 gnome-shell[2500]] subc 3 class 0x8297
mthd 0x0e08 data 0xffd30000
*****************************************************************************

$ tail -n 30 /var/log/Xorg.0.log.old
*****************************************************************************
[   529.737] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   529.737] (II) NOUVEAU(0): Modeline &quot;1280x960&quot;x0.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[  4863.472] (EE) 
[  4863.472] (EE) Backtrace:
[  4863.494] (EE) 0: /usr/bin/Xorg (xorg_backtrace+0x49) [0x81d7ae9]
[  4863.494] (EE) 1: /usr/bin/Xorg (0x8048000+0x193854) [0x81db854]
[  4863.494] (EE) 2: linux-gate.so.1 (__kernel_rt_sigreturn+0x0) [0xb775d40c]
[  4863.494] (EE) 3: /usr/lib/xorg/modules/dri/nouveau_dri.so
(0xb5639000+0x24b065) [0xb5884065]
[  4863.494] (EE) 4: /usr/lib/xorg/modules/extensions/libglx.so
(0xb6f1e000+0xbd98) [0xb6f29d98]
[  4863.494] (EE) 5: /usr/lib/xorg/modules/extensions/libglx.so
(0xb6f1e000+0x40300) [0xb6f5e300]
[  4863.494] (EE) 6: /usr/lib/xorg/modules/extensions/libglx.so
(0xb6f1e000+0x42a2e) [0xb6f60a2e]
[  4863.494] (EE) 7: /usr/bin/Xorg (0x8048000+0x3144d) [0x807944d]
[  4863.494] (EE) 8: /usr/bin/Xorg (0x8048000+0x1f625) [0x8067625]
[  4863.494] (EE) 9: /usr/lib/libc.so.6 (__libc_start_main+0xf3) [0xb73937c3]
[  4863.494] (EE) 10: /usr/bin/Xorg (0x8048000+0x1f9f9) [0x80679f9]
[  4863.494] (EE) 
[  4863.494] (EE) Segmentation fault at address 0xde5
[  4863.494] 
Fatal server error:
[  4863.494] Caught signal 11 (Segmentation fault). Server aborting
[  4863.494] 
[  4863.494] (EE) 
Please consult the The X.Org Foundation support 
     at <a href="http://wiki.x.org">http://wiki.x.org</a>
 for help. 
[  4863.494] (EE) Please also check the log file at &quot;/var/log/Xorg.0.log&quot; for
additional information.
[  4863.494] (EE) 
[  4863.494] (II) AIGLX: Suspending AIGLX clients for VT switch
[  4863.494] (II) NOUVEAU(0): NVLeaveVT is called.
[  4863.527] Server terminated with error (1). Closing log file.
*****************************************************************************</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368369838.FBFD785b0.18282--

--===============0147748970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0147748970==--
