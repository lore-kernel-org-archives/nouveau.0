From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85495] New: nouveau: xft fonts not rendered on Dell
 M4800 (QHD+)
Date: Mon, 27 Oct 2014 00:23:28 +0000
Message-ID: <bug-85495-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1694404601=="
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


--===============1694404601==
Content-Type: multipart/alternative; boundary="1414369408.Ba484ca1.25953"; charset="UTF-8"


--1414369408.Ba484ca1.25953
Date: Mon, 27 Oct 2014 00:23:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85495

            Bug ID: 85495
           Summary: nouveau: xft fonts not rendered on Dell M4800 (QHD+)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: freedesktop-aVMt7ygKTj2t/hvpvFFPbQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 108483
  --> https://bugs.freedesktop.org/attachment.cgi?id=108483&action=edit
Xorg.0.log

This is not a useful report (yet). I'm sorry: I don't know the right terms to
use and this is a hard-to-describe situation.

Nouveau X server comes up but text sometimes doesn't: on my xdm login the
"Welcome to ..." appears, and the Login text, but entering my username the
cursor just moves right and a few (2-3) pixel-sized dots appear where letters
should.

Emacs, with this in .Xdefaults:

    Emacs.font: DejaVu Sans Mono-14

...comes up but blank: no menus, no mode bar, no "This buffer is for" in my
*scratch* buffer. Grabbing the windowmanager titlebar and dragging the window
just a pixel or two makes all text appear, until I change virtual desktops and
come back again. Then all text is gone just like the start.

xterms, using:

    *font: -misc-fixed-medium-r-normal-*-20-*-*-*-*-*-iso10646-1

...are all fine. No problems ever.

Dell M4800 
    # d ~ # lspci |grep VGA
    01:00.0 VGA compatible controller: NVIDIA Corporation GK106GLM [Quadro
K2100M] (rev a1)

    # uname -r
    3.16.6-gentoo

Xorg.0.log attached but I doubt it shows anything useful. I have no idea what
*would* be useful but I'd love to offer what I may. I am highly motivated to
use this over the proprietary nvidia driver.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414369408.Ba484ca1.25953
Date: Mon, 27 Oct 2014 00:23:28 +0000
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
   title="NEW - nouveau: xft fonts not rendered on Dell M4800 (QHD+)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85495">85495</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau: xft fonts not rendered on Dell M4800 (QHD+)
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
          <td>freedesktop&#64;edsantiago.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=108483" name="attach_108483" title="Xorg.0.log">attachment 108483</a> <a href="attachment.cgi?id=108483&amp;action=edit" title="Xorg.0.log">[details]</a></span>
Xorg.0.log

This is not a useful report (yet). I'm sorry: I don't know the right terms to
use and this is a hard-to-describe situation.

Nouveau X server comes up but text sometimes doesn't: on my xdm login the
&quot;Welcome to ...&quot; appears, and the Login text, but entering my username the
cursor just moves right and a few (2-3) pixel-sized dots appear where letters
should.

Emacs, with this in .Xdefaults:

    Emacs.font: DejaVu Sans Mono-14

...comes up but blank: no menus, no mode bar, no &quot;This buffer is for&quot; in my
*scratch* buffer. Grabbing the windowmanager titlebar and dragging the window
just a pixel or two makes all text appear, until I change virtual desktops and
come back again. Then all text is gone just like the start.

xterms, using:

    *font: -misc-fixed-medium-r-normal-*-20-*-*-*-*-*-iso10646-1

...are all fine. No problems ever.

Dell M4800 
    # d ~ # lspci |grep VGA
    01:00.0 VGA compatible controller: NVIDIA Corporation GK106GLM [Quadro
K2100M] (rev a1)

    # uname -r
    3.16.6-gentoo

Xorg.0.log attached but I doubt it shows anything useful. I have no idea what
*would* be useful but I'd love to offer what I may. I am highly motivated to
use this over the proprietary nvidia driver.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414369408.Ba484ca1.25953--

--===============1694404601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1694404601==--
