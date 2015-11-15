From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92959] New: [NV1F celcius GeForce4 MX] Rendering
 artifacts, screen corruption, system reset.
Date: Sun, 15 Nov 2015 10:19:04 +0000
Message-ID: <bug-92959-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1342724484=="
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


--===============1342724484==
Content-Type: multipart/alternative; boundary="1447582744.A6C5d20.24130"; charset="UTF-8"


--1447582744.A6C5d20.24130
Date: Sun, 15 Nov 2015 10:19:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92959

            Bug ID: 92959
           Summary: [NV1F celcius GeForce4 MX] Rendering artifacts, screen
                    corruption, system reset.
           Product: Mesa
           Version: unspecified
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: eximius.dux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 119671
  --> https://bugs.freedesktop.org/attachment.cgi?id=119671&action=edit
dmesg after booting.

The system displays rendering artifacts. 

The first ones to appear are thin lines flashing around on the lower half of
the screen. Once a single (or multiple) program(s) is opened which use Opengl
the screen will become partially distorted  and usually (but not always) in the
lower half area. 

Typical glitches seem to be made up of fragments of what is shown on screen.

In most cases the computer needs a reboot to get back to a nearly clean
desktop.

It gets triggered, or rather worsened by programs which use Opengl.

Vlc media player, while using the Xvideo output(XCB), will only suffer the
anoying twitching glitch on the lower part of the screen, which also affects
the desktop.

This happened twice and will not be tested again for the sake of my hardware ;
The system will reset without warning if running Opengl video, games, programs
in full screen for prolonged times.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1447582744.A6C5d20.24130
Date: Sun, 15 Nov 2015 10:19:04 +0000
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
   title="NEW - [NV1F celcius GeForce4 MX] Rendering artifacts, screen corruption, system reset."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92959">92959</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV1F celcius GeForce4 MX] Rendering artifacts, screen corruption, system reset.
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
          <td>major
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
          <td>eximius.dux&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=119671" name="attach_119671" title="dmesg after booting.">attachment 119671</a> <a href="attachment.cgi?id=119671&amp;action=edit" title="dmesg after booting.">[details]</a></span>
dmesg after booting.

The system displays rendering artifacts. 

The first ones to appear are thin lines flashing around on the lower half of
the screen. Once a single (or multiple) program(s) is opened which use Opengl
the screen will become partially distorted  and usually (but not always) in the
lower half area. 

Typical glitches seem to be made up of fragments of what is shown on screen.

In most cases the computer needs a reboot to get back to a nearly clean
desktop.

It gets triggered, or rather worsened by programs which use Opengl.

Vlc media player, while using the Xvideo output(XCB), will only suffer the
anoying twitching glitch on the lower part of the screen, which also affects
the desktop.

This happened twice and will not be tested again for the sake of my hardware ;
The system will reset without warning if running Opengl video, games, programs
in full screen for prolonged times.</pre>
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

--1447582744.A6C5d20.24130--

--===============1342724484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1342724484==--
