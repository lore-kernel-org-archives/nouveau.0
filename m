From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107780] New: Screen is periodically replaced with
 image of screen from some time since boot
Date: Sat, 01 Sep 2018 15:27:27 +0000
Message-ID: <bug-107780-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1035790256=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1035790256==
Content-Type: multipart/alternative; boundary="15358156470.B3CcB.29180"
Content-Transfer-Encoding: 7bit


--15358156470.B3CcB.29180
Date: Sat, 1 Sep 2018 15:27:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107780

            Bug ID: 107780
           Summary: Screen is periodically replaced with image of screen
                    from some time since boot
           Product: Mesa
           Version: 18.1
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: z.figura12-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 141406
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D141406&action=3Dedit
dmesg output

Sorry for the somewhat strange title, it's kind of hard to describe this bu=
g.

Every few seconds, simply while normally using the desktop, the entire cont=
ents
of the screen will be replaced by the contents, as they were apparently
captured at some fixed point since boot. That is, it is as if at some point=
 the
contents of the screen will be captured, and thereafter swapped to the scre=
en
every few seconds. The screen is wholly and cleanly replaced, i.e. there are
none of the usual signs of "garbage". Parts of the screen will update as
normally, if they are triggered to be repainted, but the rest of the screen
will contain this old image.

It's not clear to me what triggers this. Sometimes it will start almost
immediately after starting an X session, sometimes it will take a long time=
 to
start happening. The frequency may similarly vary=E2=80=94to generalize, I'=
d estimate
about every 5-15 seconds.

Regardless, the fact that it happens every few seconds makes the computer
extremely frustrating to use.

I've actually experienced this bug since a fairly long time ago, probably on
the order of a couple years. My solution to it then was just to install the
Nvidia binary driver, which did not present me with this problem. However, =
my
priorities have changed, and now I would really quite like to fix this bug =
and
be able to use the Nouveau driver. I've tried to follow all of the instruct=
ions
for bug reporting; please let me know if there's any information I'm missin=
g,
or extra logs or testing that I can provide. Knowing that developer resourc=
es
are scarce I'm even willing to try to debug this myself, if nudged in the r=
ight
direction.

zeb@terabithia:~$ inxi -SG --display :0
System:    Host: terabithia Kernel: 4.9.124-3-MANJARO x86_64 bits: 64 Deskt=
op:
Xfce Distro: Manjaro Linux=20
Graphics:  Device-1: NVIDIA GM107 [GeForce GTX 750] driver: nouveau v: kern=
el=20
           Display: x11 server: X.Org 1.20.1 driver: nouveau resolution:
1280x1024~75Hz, 1366x768~60Hz=20
           OpenGL: renderer: NV117 v: 4.3 Mesa 18.1.6

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15358156470.B3CcB.29180
Date: Sat, 1 Sep 2018 15:27:27 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen is periodically replaced with image of screen from=
 some time since boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107780">107780</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Screen is periodically replaced with image of screen from som=
e time since boot
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>18.1
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
          <td>z.figura12&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D141406=
" name=3D"attach_141406" title=3D"dmesg output">attachment 141406</a> <a hr=
ef=3D"attachment.cgi?id=3D141406&amp;action=3Dedit" title=3D"dmesg output">=
[details]</a></span>
dmesg output

Sorry for the somewhat strange title, it's kind of hard to describe this bu=
g.

Every few seconds, simply while normally using the desktop, the entire cont=
ents
of the screen will be replaced by the contents, as they were apparently
captured at some fixed point since boot. That is, it is as if at some point=
 the
contents of the screen will be captured, and thereafter swapped to the scre=
en
every few seconds. The screen is wholly and cleanly replaced, i.e. there are
none of the usual signs of &quot;garbage&quot;. Parts of the screen will up=
date as
normally, if they are triggered to be repainted, but the rest of the screen
will contain this old image.

It's not clear to me what triggers this. Sometimes it will start almost
immediately after starting an X session, sometimes it will take a long time=
 to
start happening. The frequency may similarly vary=E2=80=94to generalize, I'=
d estimate
about every 5-15 seconds.

Regardless, the fact that it happens every few seconds makes the computer
extremely frustrating to use.

I've actually experienced this bug since a fairly long time ago, probably on
the order of a couple years. My solution to it then was just to install the
Nvidia binary driver, which did not present me with this problem. However, =
my
priorities have changed, and now I would really quite like to fix this bug =
and
be able to use the Nouveau driver. I've tried to follow all of the instruct=
ions
for bug reporting; please let me know if there's any information I'm missin=
g,
or extra logs or testing that I can provide. Knowing that developer resourc=
es
are scarce I'm even willing to try to debug this myself, if nudged in the r=
ight
direction.

zeb&#64;terabithia:~$ inxi -SG --display :0
System:    Host: terabithia Kernel: 4.9.124-3-MANJARO x86_64 bits: 64 Deskt=
op:
Xfce Distro: Manjaro Linux=20
Graphics:  Device-1: NVIDIA GM107 [GeForce GTX 750] driver: nouveau v: kern=
el=20
           Display: x11 server: X.Org 1.20.1 driver: nouveau resolution:
1280x1024~75Hz, 1366x768~60Hz=20
           OpenGL: renderer: NV117 v: 4.3 Mesa 18.1.6</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15358156470.B3CcB.29180--

--===============1035790256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1035790256==--
