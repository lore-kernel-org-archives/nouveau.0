From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89484] New: xrandr no output to DisplayPort with
 GeForce GT 520M.
Date: Sat, 07 Mar 2015 19:02:18 +0000
Message-ID: <bug-89484-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0874589470=="
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


--===============0874589470==
Content-Type: multipart/alternative; boundary="1425754938.4FBb5321.26766"; charset="UTF-8"


--1425754938.4FBb5321.26766
Date: Sat, 7 Mar 2015 19:02:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89484

            Bug ID: 89484
           Summary: xrandr no output to DisplayPort with GeForce GT 520M.
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: corey.quixote-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Originially posted in Archlinux BBS:
https://bbs.archlinux.org/viewtopic.php?id=193143

DisplayPort fails to show output when using xrandr to set display.  Monitor
shown as "connected" and displays correct modes, however no output is sent to
the attached monitor. 

dmesg and xorg.0.log are showing errors related to Nouveau driver (see
attachments in subsequent posts).

xorg.conf is empty (defaults).

Machine uses descrete graphics (Optimus), with DisplayPort attached to the
Nvidia card:

00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core
Processor Family Integrated Graphics Controller (rev 09)

01:00.0 VGA compatible controller: NVIDIA Corporation GF119M 
[GeForce GT 520M] (rev a1)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1425754938.4FBb5321.26766
Date: Sat, 7 Mar 2015 19:02:18 +0000
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
   title="NEW - xrandr no output to DisplayPort with GeForce GT 520M."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89484">89484</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>xrandr no output to DisplayPort with GeForce GT 520M.
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
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
          <td>corey.quixote&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Originially posted in Archlinux BBS:
<a href="https://bbs.archlinux.org/viewtopic.php?id=193143">https://bbs.archlinux.org/viewtopic.php?id=193143</a>

DisplayPort fails to show output when using xrandr to set display.  Monitor
shown as &quot;connected&quot; and displays correct modes, however no output is sent to
the attached monitor. 

dmesg and xorg.0.log are showing errors related to Nouveau driver (see
attachments in subsequent posts).

xorg.conf is empty (defaults).

Machine uses descrete graphics (Optimus), with DisplayPort attached to the
Nvidia card:

00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core
Processor Family Integrated Graphics Controller (rev 09)

01:00.0 VGA compatible controller: NVIDIA Corporation GF119M 
[GeForce GT 520M] (rev a1)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1425754938.4FBb5321.26766--

--===============0874589470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0874589470==--
