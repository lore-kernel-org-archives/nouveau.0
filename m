From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92504] New: [NVA5] Corruption in Plasma 5 on resume
 after changing screen configuration
Date: Fri, 16 Oct 2015 19:19:50 +0000
Message-ID: <bug-92504-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0075143505=="
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


--===============0075143505==
Content-Type: multipart/alternative; boundary="1445023190.b3f8d0.5388"; charset="UTF-8"


--1445023190.b3f8d0.5388
Date: Fri, 16 Oct 2015 19:19:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D92504

            Bug ID: 92504
           Summary: [NVA5] Corruption in Plasma 5 on resume after changing
                    screen configuration
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: alexander-fd-Bd8g6ntRJIRxuZdfhUSrJg@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 118931
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D118931&action=3Dedit
dmesg output (since boot)

Steps to reproduce:
 * Use laptop with "NVIDIA Corporation GT216M [GeForce GT 330M]" or similar
 * Install KDE Plasma 5
 * Reboot
 * Log in to Plasma 5 desktop

 * Open the main menu and do *Quit* -> *Suspend*
 * Wait for the system to suspend
 * Resume the system and unlock the screen
 * Disconnect or connect external monitor (use *Menu* -> *Computer* -> *Sys=
tem
settings* -> *Screen* to force screen detection if it doesn't happen
automatically)

 * Open the main menu and do *Quit* -> *Suspend*
 * Wait for the system to suspend
 * Resume the system and unlock the screen
 * Open the main menu, network indicator or any other menu from the panel
(`plasmashell`)


*What should happen?*

Nothing - it should "just work"

*What happens instead?*

Massive corruption the first time you open any menu

Also, after reproducing this error a few times without rebooting, the
corruption becomes worse on every suspend until the system hangs. I'm not s=
ure
if this is related through=E2=80=A6

*Where was this error produced?*

Tanglu Linux 4.0 ALPHA (Debian based) using:
 * Latest 4.2.0-trunk linux-image
 * MESA git snapshot or MESA 11.0.2
 * LibDRM 2.4.64
 * X11 1.17.2
 * xorg-video-nouveau 1.0.11

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445023190.b3f8d0.5388
Date: Fri, 16 Oct 2015 19:19:50 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVA5] Corruption in Plasma 5 on resume after changing sc=
reen configuration"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92504">92504</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVA5] Corruption in Plasma 5 on resume after changing screen=
 configuration
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>alexander-fd&#64;xmine128.tk
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D118931=
" name=3D"attach_118931" title=3D"dmesg output (since boot)">attachment 118=
931</a> <a href=3D"attachment.cgi?id=3D118931&amp;action=3Dedit" title=3D"d=
mesg output (since boot)">[details]</a></span>
dmesg output (since boot)

Steps to reproduce:
 * Use laptop with &quot;NVIDIA Corporation GT216M [GeForce GT 330M]&quot; =
or similar
 * Install KDE Plasma 5
 * Reboot
 * Log in to Plasma 5 desktop

 * Open the main menu and do *Quit* -&gt; *Suspend*
 * Wait for the system to suspend
 * Resume the system and unlock the screen
 * Disconnect or connect external monitor (use *Menu* -&gt; *Computer* -&gt=
; *System
settings* -&gt; *Screen* to force screen detection if it doesn't happen
automatically)

 * Open the main menu and do *Quit* -&gt; *Suspend*
 * Wait for the system to suspend
 * Resume the system and unlock the screen
 * Open the main menu, network indicator or any other menu from the panel
(`plasmashell`)


*What should happen?*

Nothing - it should &quot;just work&quot;

*What happens instead?*

Massive corruption the first time you open any menu

Also, after reproducing this error a few times without rebooting, the
corruption becomes worse on every suspend until the system hangs. I'm not s=
ure
if this is related through=E2=80=A6

*Where was this error produced?*

Tanglu Linux 4.0 ALPHA (Debian based) using:
 * Latest 4.2.0-trunk linux-image
 * MESA git snapshot or MESA 11.0.2
 * LibDRM 2.4.64
 * X11 1.17.2
 * xorg-video-nouveau 1.0.11</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445023190.b3f8d0.5388--

--===============0075143505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0075143505==--
