From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91333] New: Connecting second of two monitors to a
 Lenovo W520 causes displays to go crazy
Date: Tue, 14 Jul 2015 01:46:55 +0000
Message-ID: <bug-91333-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1902983515=="
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


--===============1902983515==
Content-Type: multipart/alternative; boundary="1436838416.E5Be7Fa1.32657"; charset="UTF-8"


--1436838416.E5Be7Fa1.32657
Date: Tue, 14 Jul 2015 01:46:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91333

            Bug ID: 91333
           Summary: Connecting second of two monitors to a Lenovo W520
                    causes displays to go crazy
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: cjashfor-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 117104
  --> https://bugs.freedesktop.org/attachment.cgi?id=117104&action=edit
dmesg output from start to connecting the two monitors, then disconnecting the
VGA monitor

I am using a Lenovo W520 on Fedora 22.  What I'd like to be able to do is close
the laptop's display and use two external monitors.

I know that Optimus is troublesome in Linux, so I have disabled it, and am
using discrete graphics only (Nvidia Quadro 1000M, 108GLM).

When I plug in the first of the two external monitors via the Displayport
(converted to HDMI), everything works fine; I am able to use the laptop's
internal display and the external monitor.

When I plug in a second display via the VGA port, all of the screens go blank
for a time, and then only the Displayport-connected monitor comes up.  It is
usable for about 10 seconds, and then the internal display shows some boot up
messages, and the displayport-connected monitor shows the desktop, but I cannot
type anything.  About every three seconds, all screens blank out, and then the
process repeats.

My next step is to then disconnect the VGA monitor, and after about 10 seconds,
it puts me back at the Gnome desktop login.  From there I was able to log back
in and get the dmesg output (attached).

Looking at the dmesg output, there is a segfault in libmutter.  Perhaps this is
what is causing the problem.  I don't know.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436838416.E5Be7Fa1.32657
Date: Tue, 14 Jul 2015 01:46:56 +0000
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
   title="NEW - Connecting second of two monitors to a Lenovo W520 causes displays to go crazy"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91333">91333</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Connecting second of two monitors to a Lenovo W520 causes displays to go crazy
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>cjashfor&#64;us.ibm.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=117104" name="attach_117104" title="dmesg output from start to connecting the two monitors, then disconnecting the VGA monitor">attachment 117104</a> <a href="attachment.cgi?id=117104&amp;action=edit" title="dmesg output from start to connecting the two monitors, then disconnecting the VGA monitor">[details]</a></span>
dmesg output from start to connecting the two monitors, then disconnecting the
VGA monitor

I am using a Lenovo W520 on Fedora 22.  What I'd like to be able to do is close
the laptop's display and use two external monitors.

I know that Optimus is troublesome in Linux, so I have disabled it, and am
using discrete graphics only (Nvidia Quadro 1000M, 108GLM).

When I plug in the first of the two external monitors via the Displayport
(converted to HDMI), everything works fine; I am able to use the laptop's
internal display and the external monitor.

When I plug in a second display via the VGA port, all of the screens go blank
for a time, and then only the Displayport-connected monitor comes up.  It is
usable for about 10 seconds, and then the internal display shows some boot up
messages, and the displayport-connected monitor shows the desktop, but I cannot
type anything.  About every three seconds, all screens blank out, and then the
process repeats.

My next step is to then disconnect the VGA monitor, and after about 10 seconds,
it puts me back at the Gnome desktop login.  From there I was able to log back
in and get the dmesg output (attached).

Looking at the dmesg output, there is a segfault in libmutter.  Perhaps this is
what is causing the problem.  I don't know.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436838416.E5Be7Fa1.32657--

--===============1902983515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1902983515==--
