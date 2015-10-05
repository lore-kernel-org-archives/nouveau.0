From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92287] New: Display errors in Qt applications after
 using Android Virtual Devices
Date: Mon, 05 Oct 2015 14:28:07 +0000
Message-ID: <bug-92287-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2121533621=="
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


--===============2121533621==
Content-Type: multipart/alternative; boundary="1444055287.D5ea0.4390"; charset="UTF-8"


--1444055287.D5ea0.4390
Date: Mon, 5 Oct 2015 14:28:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92287

            Bug ID: 92287
           Summary: Display errors in Qt applications after using Android
                    Virtual Devices
           Product: Mesa
           Version: 11.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: guido-WHizhSsHnEbSgI/GaPOurUTU+k/KrAxG@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 118670
  --> https://bugs.freedesktop.org/attachment.cgi?id=118670&action=edit
Screenshot showing the problems

After using an Android Virtual Machine (from Android Studio,
https://developer.android.com/sdk/index.html) and stopping it, Qt/KDE
application will show weird display errors. Pixmaps get drawn poorly aligned or
with parts of them corrupted or just not at all, some windows are translucent
when they should not be, drop down menus are not drawn fully (some items do not
get drawn, although the space for them is still reserved) and have horizontal
bars, either black or of various weird colors, through them. Most applications
affected by this become unusable. I will attach a screenshot that shows the
problem.

Only Qt/KDE applications seem to be affected by this, as far as I can tell.
Only applications that are newly started after this will be affected, not
applications that have been running before but have opened new windows. When
these problems start to happen, only restarting the computer seems to fix them,
simply restarting the X server is not enough.

On two occasions so far, the problems were even worse: The X display froze
completely, except for mouse movements, and I could no longer switch the
keyboards NumLuck LED on or off by pressing Numlock. I had to reset the machine
with a SysRq sequence.

This problem is not always reproducible, but seems to happen more often when
running two AVDs simultaneously and then quitting them. The AVDs need to be
configured to "Use Host GPU". I have not found any other way to reproduce this.

My system:

Gentoo Linux on x86_64
X server: xorg-server 1.17.2-r1
Display driver: 1.0.11
Mesa: 11.0.2
Kernel version: 4.2.2

This also happened with earlier versions of the X server and Mesa. I upgraded
those after this problem first started,

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1444055287.D5ea0.4390
Date: Mon, 5 Oct 2015 14:28:07 +0000
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
   title="NEW - Display errors in Qt applications after using Android Virtual Devices"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92287">92287</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Display errors in Qt applications after using Android Virtual Devices
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.0
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
          <td>guido&#64;ambient-entertainment.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118670" name="attach_118670" title="Screenshot showing the problems">attachment 118670</a> <a href="attachment.cgi?id=118670&amp;action=edit" title="Screenshot showing the problems">[details]</a></span>
Screenshot showing the problems

After using an Android Virtual Machine (from Android Studio,
<a href="https://developer.android.com/sdk/index.html">https://developer.android.com/sdk/index.html</a>) and stopping it, Qt/KDE
application will show weird display errors. Pixmaps get drawn poorly aligned or
with parts of them corrupted or just not at all, some windows are translucent
when they should not be, drop down menus are not drawn fully (some items do not
get drawn, although the space for them is still reserved) and have horizontal
bars, either black or of various weird colors, through them. Most applications
affected by this become unusable. I will attach a screenshot that shows the
problem.

Only Qt/KDE applications seem to be affected by this, as far as I can tell.
Only applications that are newly started after this will be affected, not
applications that have been running before but have opened new windows. When
these problems start to happen, only restarting the computer seems to fix them,
simply restarting the X server is not enough.

On two occasions so far, the problems were even worse: The X display froze
completely, except for mouse movements, and I could no longer switch the
keyboards NumLuck LED on or off by pressing Numlock. I had to reset the machine
with a SysRq sequence.

This problem is not always reproducible, but seems to happen more often when
running two AVDs simultaneously and then quitting them. The AVDs need to be
configured to &quot;Use Host GPU&quot;. I have not found any other way to reproduce this.

My system:

Gentoo Linux on x86_64
X server: xorg-server 1.17.2-r1
Display driver: 1.0.11
Mesa: 11.0.2
Kernel version: 4.2.2

This also happened with earlier versions of the X server and Mesa. I upgraded
those after this problem first started,</pre>
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

--1444055287.D5ea0.4390--

--===============2121533621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2121533621==--
