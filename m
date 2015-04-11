From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89985] New: system video hangs on video switch to
	fullscreen
Date: Sat, 11 Apr 2015 20:01:48 +0000
Message-ID: <bug-89985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1847391925=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1847391925==
Content-Type: multipart/alternative; boundary="1428782508.8EAA840.6783"; charset="UTF-8"


--1428782508.8EAA840.6783
Date: Sat, 11 Apr 2015 20:01:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89985

            Bug ID: 89985
           Summary: system video hangs on video switch to fullscreen
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mbarrera-KK0ffGbhmjU@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Occasionally, when switching any video playback into full-screen, all system
video, except for the mouse pointer, hangs until reboot. It is possible to SSH
into the machine for a while until it freezes completely.

Video card: NVIDIA Corporation GK104M [GeForce GTX 670MX] (rev a1)
Operating system: Archlinux with linux 3.19.3-3-ARCH

nouveau-fw is installed and nouveau.config=NvGrUseFW=1 is in the kernel
parameters.

I logged in via SSH into the blocked machine and dumped dmesg's output, it
produced a 6MiB sized file of only:

[  432.267634] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267645] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267647] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267658] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267661] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267672] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267674] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267685] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267687] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267698] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267701] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267712] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267714] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267725] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267727] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267738] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267741] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267752] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267754] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267765] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267767] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267777] systemd-journald[276]: /dev/kmsg buffer overrun, some messages
lost.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1428782508.8EAA840.6783
Date: Sat, 11 Apr 2015 20:01:48 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - system video hangs on video switch to fullscreen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89985">89985</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>system video hangs on video switch to fullscreen
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>blocker
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mbarrera&#64;gmx.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Occasionally, when switching any video playback into full-screen, all system
video, except for the mouse pointer, hangs until reboot. It is possible to SSH
into the machine for a while until it freezes completely.

Video card: NVIDIA Corporation GK104M [GeForce GTX 670MX] (rev a1)
Operating system: Archlinux with linux 3.19.3-3-ARCH

nouveau-fw is installed and nouveau.config=NvGrUseFW=1 is in the kernel
parameters.

I logged in via SSH into the blocked machine and dumped dmesg's output, it
produced a 6MiB sized file of only:

[  432.267634] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267645] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267647] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267658] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267661] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267672] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267674] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267685] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267687] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267698] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267701] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267712] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267714] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267725] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267727] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267738] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267741] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267752] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267754] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267765] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: METHOD
[  432.267767] nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 6
[gstglcontext[1984]] subc 0 mthd 0x000c data 0x2001054e
[  432.267777] systemd-journald[276]: /dev/kmsg buffer overrun, some messages
lost.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1428782508.8EAA840.6783--

--===============1847391925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1847391925==--
