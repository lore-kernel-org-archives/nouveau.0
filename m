From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55980] New: X Segfault on second screen resize
Date: Sun, 14 Oct 2012 21:23:23 +0000
Message-ID: <bug-55980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2098930622=="
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


--===============2098930622==
Content-Type: multipart/alternative; boundary="1350249803.F88f1c441.19284"; charset="us-ascii"


--1350249803.F88f1c441.19284
Date: Sun, 14 Oct 2012 21:23:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55980

          Priority: medium
            Bug ID: 55980
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: X Segfault on second screen resize
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: geaaru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Hi, 
with last kernel 3.x I have a segfault of X server (v. 1.13.0).
When i start X (on kde4 or gnome3 environment) all start correctly. I have a
CRT monitor that support 1600x1200 resolution. Through these steps i have
always segfault:
1. X started with a resolution of 1600x1200
2. Change resolution to 1280x1024 (here resolution change correctly)
3. Change resolution to 1600x1200 (here Segfault)

resize called 1600 1200
resize called 1280 1024
resize called 1600 1200
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x36) [0x577a6e]
(EE) 1: /usr/bin/X (0x400000+0x17b429) [0x57b429]
(EE) 2: /lib64/libpthread.so.0 (0x7fb3af392000+0xef30) [0x7fb3af3a0f30]
(EE) 3: /lib64/libc.so.6 (0x7fb3ae01a000+0x1230f0) [0x7fb3ae13d0f0]
(EE) 4: /usr/lib64/xorg/modules/libexa.so (0x7fb3ac3f5000+0x5b75)
[0x7fb3ac3fab75]
(EE) 5: /usr/lib64/xorg/modules/libexa.so (0x7fb3ac3f5000+0x5eb4)
[0x7fb3ac3faeb4]
(EE) 6: /usr/lib64/xorg/modules/libexa.so (0x7fb3ac3f5000+0x87f0)
[0x7fb3ac3fd7f0]
(EE) 7: /usr/lib64/xorg/modules/libexa.so (0x7fb3ac3f5000+0x10c3e)
[0x7fb3ac405c3e]
(EE) 8: /usr/lib64/xorg/modules/libexa.so (0x7fb3ac3f5000+0x12692)
[0x7fb3ac407692]
(EE) 9: /usr/lib64/xorg/modules/libexa.so (0x7fb3ac3f5000+0xb803)
[0x7fb3ac400803]
(EE) 10: /usr/bin/X (0x400000+0x168a80) [0x568a80]
(EE) 11: /usr/bin/X (0x400000+0xb8fff) [0x4b8fff]
(EE) 12: /usr/bin/X (0x400000+0x31c5e) [0x431c5e]
(EE) 13: /usr/bin/X (0x400000+0x345eb) [0x4345eb]
(EE) 14: /usr/bin/X (0x400000+0x248fa) [0x4248fa]
(EE) 15: /lib64/libc.so.6 (__libc_start_main+0xec) [0x7fb3ae038ae8]
(EE) 16: /usr/bin/X (0x400000+0x24489) [0x424489]
(EE) 
(EE) Segmentation fault at address 0x8

Fatal server error:
Caught signal 11 (Segmentation fault). Server aborting

Same segfault happens if I leave my computer on poweron but with monitor on
poweroff. When i poweron monitor screen resolution automatically go to 1024x768
and then when i try to restore 1600x1200 resolution I have same segfault.

Hereinafter same informations about my env:

# uname -a
Linux golia2 3.6.0-rc6+ #1 SMP PREEMPT Sat Sep 29 11:29:58 CEST 2012 x86_64
Pentium(R) Dual-Core CPU E5200 @ 2.50GHz GenuineIntel GNU/Linux

# lspci | grep VGA  
01:00.0 VGA compatible controller: NVIDIA Corporation G92 [GeForce GTS 250]
(rev a2)

Mesa-9.0 and libdrm 2.4.39.

This error happens with both vanilla kernel or nouveau-kernel from git.

How can i help you to fix this bug ?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1350249803.F88f1c441.19284
Date: Sun, 14 Oct 2012 21:23:23 +0000
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
   title="NEW --- - X Segfault on second screen resize"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55980">55980</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>X Segfault on second screen resize
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
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
          <td>geaaru&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi, 
with last kernel 3.x I have a segfault of X server (v. 1.13.0).
When i start X (on kde4 or gnome3 environment) all start correctly. I have a
CRT monitor that support 1600x1200 resolution. Through these steps i have
always segfault:
1. X started with a resolution of 1600x1200
2. Change resolution to 1280x1024 (here resolution change correctly)
3. Change resolution to 1600x1200 (here Segfault)

resize called 1600 1200
resize called 1280 1024
resize called 1600 1200
(EE) 
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x36) [0x577a6e]
(EE) 1: /usr/bin/X (0x400000+0x17b429) [0x57b429]
(EE) 2: /lib64/libpthread.so.0 (0x7fb3af392000+0xef30) [0x7fb3af3a0f30]
(EE) 3: /lib64/libc.so.6 (0x7fb3ae01a000+0x1230f0) [0x7fb3ae13d0f0]
(EE) 4: /usr/lib64/xorg/modules/libexa.so (0x7fb3ac3f5000+0x5b75)
[0x7fb3ac3fab75]
(EE) 5: /usr/lib64/xorg/modules/libexa.so (0x7fb3ac3f5000+0x5eb4)
[0x7fb3ac3faeb4]
(EE) 6: /usr/lib64/xorg/modules/libexa.so (0x7fb3ac3f5000+0x87f0)
[0x7fb3ac3fd7f0]
(EE) 7: /usr/lib64/xorg/modules/libexa.so (0x7fb3ac3f5000+0x10c3e)
[0x7fb3ac405c3e]
(EE) 8: /usr/lib64/xorg/modules/libexa.so (0x7fb3ac3f5000+0x12692)
[0x7fb3ac407692]
(EE) 9: /usr/lib64/xorg/modules/libexa.so (0x7fb3ac3f5000+0xb803)
[0x7fb3ac400803]
(EE) 10: /usr/bin/X (0x400000+0x168a80) [0x568a80]
(EE) 11: /usr/bin/X (0x400000+0xb8fff) [0x4b8fff]
(EE) 12: /usr/bin/X (0x400000+0x31c5e) [0x431c5e]
(EE) 13: /usr/bin/X (0x400000+0x345eb) [0x4345eb]
(EE) 14: /usr/bin/X (0x400000+0x248fa) [0x4248fa]
(EE) 15: /lib64/libc.so.6 (__libc_start_main+0xec) [0x7fb3ae038ae8]
(EE) 16: /usr/bin/X (0x400000+0x24489) [0x424489]
(EE) 
(EE) Segmentation fault at address 0x8

Fatal server error:
Caught signal 11 (Segmentation fault). Server aborting

Same segfault happens if I leave my computer on poweron but with monitor on
poweroff. When i poweron monitor screen resolution automatically go to 1024x768
and then when i try to restore 1600x1200 resolution I have same segfault.

Hereinafter same informations about my env:

# uname -a
Linux golia2 3.6.0-rc6+ #1 SMP PREEMPT Sat Sep 29 11:29:58 CEST 2012 x86_64
Pentium(R) Dual-Core CPU E5200 &#64; 2.50GHz GenuineIntel GNU/Linux

# lspci | grep VGA  
01:00.0 VGA compatible controller: NVIDIA Corporation G92 [GeForce GTS 250]
(rev a2)

Mesa-9.0 and libdrm 2.4.39.

This error happens with both vanilla kernel or nouveau-kernel from git.

How can i help you to fix this bug ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1350249803.F88f1c441.19284--

--===============2098930622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2098930622==--
