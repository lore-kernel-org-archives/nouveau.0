From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92420] New: X crash when with 2nd display connected
 via Display Port
Date: Sat, 10 Oct 2015 22:46:16 +0000
Message-ID: <bug-92420-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0832704728=="
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


--===============0832704728==
Content-Type: multipart/alternative; boundary="1444517176.2efd1.26234"; charset="UTF-8"


--1444517176.2efd1.26234
Date: Sat, 10 Oct 2015 22:46:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92420

            Bug ID: 92420
           Summary: X crash when with 2nd display connected via Display
                    Port
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: rhbugzilla-hzqV2YXAeqW1Z/+hSey0Gg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 118807
  --> https://bugs.freedesktop.org/attachment.cgi?id=118807&action=edit
dmesg.display_port_problem.4.2.3-300.fc23.x86_64

I get a flood of kernel events from nouveau when connecting and disconnecting
my 2nd display via the display port cable.

Events start with this:

nouveau E[   PDISP][0000:01:00.0] INVALID_VALUE [UNK84] chid 0 mthd 0x0700 data
0x00052002


modinfo nouveau -n
/lib/modules/4.2.3-300.fc23.x86_64/kernel/drivers/gpu/drm/nouveau/nouveau.ko.xz

lspci -v | grep -i vga
01:00.0 VGA compatible controller: NVIDIA Corporation G92GLM [Quadro FX 2800M]
(rev a2) (prog-if 00 [VGA controller])

Errors come and go with connection/disconnection of the Display Port cable.  So
long as I stay running in init 3, the primary laptop LCD continues to function.
 Once I go init 5, X appears to start, and then just hangs.

I've attached dmesg output for boot-up, when I connect the display port, and
when I disconnect the display port.

Please let me know if I can help in any way.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444517176.2efd1.26234
Date: Sat, 10 Oct 2015 22:46:16 +0000
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
   title="NEW - X crash when with 2nd display connected via Display Port"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92420">92420</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>X crash when with 2nd display connected via Display Port
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
          <td>critical
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
          <td>rhbugzilla&#64;vontersch.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118807" name="attach_118807" title="dmesg.display_port_problem.4.2.3-300.fc23.x86_64">attachment 118807</a> <a href="attachment.cgi?id=118807&amp;action=edit" title="dmesg.display_port_problem.4.2.3-300.fc23.x86_64">[details]</a></span>
dmesg.display_port_problem.4.2.3-300.fc23.x86_64

I get a flood of kernel events from nouveau when connecting and disconnecting
my 2nd display via the display port cable.

Events start with this:

nouveau E[   PDISP][0000:01:00.0] INVALID_VALUE [UNK84] chid 0 mthd 0x0700 data
0x00052002


modinfo nouveau -n
/lib/modules/4.2.3-300.fc23.x86_64/kernel/drivers/gpu/drm/nouveau/nouveau.ko.xz

lspci -v | grep -i vga
01:00.0 VGA compatible controller: NVIDIA Corporation G92GLM [Quadro FX 2800M]
(rev a2) (prog-if 00 [VGA controller])

Errors come and go with connection/disconnection of the Display Port cable.  So
long as I stay running in init 3, the primary laptop LCD continues to function.
 Once I go init 5, X appears to start, and then just hangs.

I've attached dmesg output for boot-up, when I connect the display port, and
when I disconnect the display port.

Please let me know if I can help in any way.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444517176.2efd1.26234--

--===============0832704728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0832704728==--
