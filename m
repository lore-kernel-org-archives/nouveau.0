From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91037] New: desktop freezes shortly after boot with
 NV11 [GeForce2 MX/MX 400]
Date: Sat, 20 Jun 2015 12:38:09 +0000
Message-ID: <bug-91037-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0072389184=="
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


--===============0072389184==
Content-Type: multipart/alternative; boundary="1434803889.C3cD1.8543"; charset="UTF-8"


--1434803889.C3cD1.8543
Date: Sat, 20 Jun 2015 12:38:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91037

            Bug ID: 91037
           Summary: desktop freezes shortly after boot with NV11 [GeForce2
                    MX/MX 400]
           Product: xorg
           Version: unspecified
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: anonymissimus-KvP5wT2u2U0@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 116615
  --> https://bugs.freedesktop.org/attachment.cgi?id=116615&action=edit
dmesg > kernel_log.txt from ctrl+alt+F1 console after UI hangs in debian as
described

Using same computer/OS/packages as in
https://bugs.freedesktop.org/show_bug.cgi?id=91025 I plugged in my other
problematic card:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation NV11 [GeForce2
MX/MX 400] [10de:0110] (rev b2) (prog-if 00 [VGA controller])
    Subsystem: PROLINK Microsystems Corp MVGA-NVG11AM(400) [1554:1081]
    Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 11
    Memory at ee000000 (32-bit, non-prefetchable) [size=16M]
    Memory at f0000000 (32-bit, prefetchable) [size=128M]
    Expansion ROM at efff0000 [disabled] [size=64K]
    Capabilities: [60] Power Management version 2
    Capabilities: [44] AGP version 2.0
    Kernel driver in use: nouveau

symptoms:
Clicking a little around (opening/closing some windows from lxde's menu or
launcher) makes the UI hang quickly, usually after 10 seconds or less. After a
while (maybe 20 or 30 secs) the system reacts to me having pressed or pressing
ctrl+alt+F1 and I create log from that console. In case that I haven't pressed
that shortcut yet, the display is almost unusable, the menu is hardly displayed
when I try to open it, so there's nothing else left to do.
Problem also happened booting systemrescuecd-x86-4.5.3 (live CD) in very
similar way.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1434803889.C3cD1.8543
Date: Sat, 20 Jun 2015 12:38:09 +0000
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
   title="NEW - desktop freezes shortly after boot with NV11 [GeForce2 MX/MX 400]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91037">91037</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>desktop freezes shortly after boot with NV11 [GeForce2 MX/MX 400]
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>anonymissimus&#64;arcor.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=116615" name="attach_116615" title="dmesg &gt; kernel_log.txt from ctrl+alt+F1 console after UI hangs in debian as described">attachment 116615</a> <a href="attachment.cgi?id=116615&amp;action=edit" title="dmesg &gt; kernel_log.txt from ctrl+alt+F1 console after UI hangs in debian as described">[details]</a></span>
dmesg &gt; kernel_log.txt from ctrl+alt+F1 console after UI hangs in debian as
described

Using same computer/OS/packages as in
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau fails to run with NV5 [Riva TNT2 / TNT2 Pro]"
   href="show_bug.cgi?id=91025">https://bugs.freedesktop.org/show_bug.cgi?id=91025</a> I plugged in my other
problematic card:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation NV11 [GeForce2
MX/MX 400] [10de:0110] (rev b2) (prog-if 00 [VGA controller])
    Subsystem: PROLINK Microsystems Corp MVGA-NVG11AM(400) [1554:1081]
    Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 11
    Memory at ee000000 (32-bit, non-prefetchable) [size=16M]
    Memory at f0000000 (32-bit, prefetchable) [size=128M]
    Expansion ROM at efff0000 [disabled] [size=64K]
    Capabilities: [60] Power Management version 2
    Capabilities: [44] AGP version 2.0
    Kernel driver in use: nouveau

symptoms:
Clicking a little around (opening/closing some windows from lxde's menu or
launcher) makes the UI hang quickly, usually after 10 seconds or less. After a
while (maybe 20 or 30 secs) the system reacts to me having pressed or pressing
ctrl+alt+F1 and I create log from that console. In case that I haven't pressed
that shortcut yet, the display is almost unusable, the menu is hardly displayed
when I try to open it, so there's nothing else left to do.
Problem also happened booting systemrescuecd-x86-4.5.3 (live CD) in very
similar way.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434803889.C3cD1.8543--

--===============0072389184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0072389184==--
