From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102722] New: [regression] changing resolution hangs
 the display on Lenovo Thinkpad p51
Date: Thu, 14 Sep 2017 06:09:48 +0000
Message-ID: <bug-102722-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1200043347=="
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


--===============1200043347==
Content-Type: multipart/alternative; boundary="15053693880.fb9FA9CDc.23719";
 charset="UTF-8"


--15053693880.fb9FA9CDc.23719
Date: Thu, 14 Sep 2017 06:09:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102722

            Bug ID: 102722
           Summary: [regression] changing resolution hangs the display on
                    Lenovo Thinkpad p51
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: charmer-freedesktop.org-kYREfu93XNOEi8DpZVb4nw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

on my brand new, rather expensive, Lenovo Thinkpad p51 (model 20HHCTO1WW)
changing the display resolution from 4K to something readable causes the
display to go black.  the only way to recover is to power cycle the laptop.=
=20
this is a regression.

with the newer Nouveau driver included in Kubuntu 16.04.3 (Ubuntu 16.04.3),
changing the resolution from 4K (3840x2160) to 2K (1920x1080) (and probably=
 any
other resolution) causes the screen to go black.

with the older Nouveau driver included in Kubuntu 16.04.2 (Ubuntu 16.04.2)
changing the display resolution from 4K to 2K works fine.

Kubuntu 16.04.2 uses the xserver-xorg-video-nouveau-hwe-16.04 package at
version 1:1.0.12-2~16.04.1.

Kubuntu 16.04.3 uses the xserver-xorg-video-nouveau-hwe-16.04 package at
version
1:1.0.14-0ubuntu1

apparently the change from 1.0.12 --> 1.0.14 broke the ability to change the
screen resolution.  but on the plus side, the Nouveau driver in 16.04.3
(1:1.0.14-0ubuntu1) fixes an equally dire problem where the screen around t=
he
cursor is "corrupted" in a way that makes the 16.04.2 driver pretty much
unusable.

more details:

i just bought a Lenovo p51with the intention of running Ubuntu (Kubuntu) Li=
nux
on it.  so far the new laptop is unusable due to display driver issues (both
Nouveau and proprietary Nvidia drivers have issues that make them unusable).

my laptop configuration is tagged as model 20HHCTO1WW and includes a 3840x2=
160
display, "hybrid" NVIDIA Quadro M2200M 4GB, and Xeon E3-1505M. the driver s=
eems
to identify the Nvidai chip as "NVIDIA GM206 (126360a1)".  i'll attach the
dmesg output later.

the problem is easy to reproduce by booting off a "Live USB" version of Kub=
untu
16.04.3 (and the 16.04.2 Live USB if you want to see resolution change work=
ing
but areas near the cursor corrupted).

i marked this as Critical because its almost impossible to use the 15" scre=
en
on the laptop with a display resolution of 3840x2160 on Linux.  the default
text sizes make things unreadable unless i put my eyes about 3 inches (8 cm)
away from the screen.  if i change font sizes to be (much) larger, the labe=
ls
and icons do not scale as well so they are still very difficult to read.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15053693880.fb9FA9CDc.23719
Date: Thu, 14 Sep 2017 06:09:48 +0000
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
   title=3D"NEW - [regression] changing resolution hangs the display on Len=
ovo Thinkpad p51"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102722">102722</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[regression] changing resolution hangs the display on Lenovo =
Thinkpad p51
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
          <td>charmer-freedesktop.org&#64;punchdown.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>on my brand new, rather expensive, Lenovo Thinkpad p51 (model =
20HHCTO1WW)
changing the display resolution from 4K to something readable causes the
display to go black.  the only way to recover is to power cycle the laptop.=
=20
this is a regression.

with the newer Nouveau driver included in Kubuntu 16.04.3 (Ubuntu 16.04.3),
changing the resolution from 4K (3840x2160) to 2K (1920x1080) (and probably=
 any
other resolution) causes the screen to go black.

with the older Nouveau driver included in Kubuntu 16.04.2 (Ubuntu 16.04.2)
changing the display resolution from 4K to 2K works fine.

Kubuntu 16.04.2 uses the xserver-xorg-video-nouveau-hwe-16.04 package at
version 1:1.0.12-2~16.04.1.

Kubuntu 16.04.3 uses the xserver-xorg-video-nouveau-hwe-16.04 package at
version
1:1.0.14-0ubuntu1

apparently the change from 1.0.12 --&gt; 1.0.14 broke the ability to change=
 the
screen resolution.  but on the plus side, the Nouveau driver in 16.04.3
(1:1.0.14-0ubuntu1) fixes an equally dire problem where the screen around t=
he
cursor is &quot;corrupted&quot; in a way that makes the 16.04.2 driver pret=
ty much
unusable.

more details:

i just bought a Lenovo p51with the intention of running Ubuntu (Kubuntu) Li=
nux
on it.  so far the new laptop is unusable due to display driver issues (both
Nouveau and proprietary Nvidia drivers have issues that make them unusable).

my laptop configuration is tagged as model 20HHCTO1WW and includes a 3840x2=
160
display, &quot;hybrid&quot; NVIDIA Quadro M2200M 4GB, and Xeon E3-1505M. th=
e driver seems
to identify the Nvidai chip as &quot;NVIDIA GM206 (126360a1)&quot;.  i'll a=
ttach the
dmesg output later.

the problem is easy to reproduce by booting off a &quot;Live USB&quot; vers=
ion of Kubuntu
16.04.3 (and the 16.04.2 Live USB if you want to see resolution change work=
ing
but areas near the cursor corrupted).

i marked this as Critical because its almost impossible to use the 15&quot;=
 screen
on the laptop with a display resolution of 3840x2160 on Linux.  the default
text sizes make things unreadable unless i put my eyes about 3 inches (8 cm)
away from the screen.  if i change font sizes to be (much) larger, the labe=
ls
and icons do not scale as well so they are still very difficult to read.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15053693880.fb9FA9CDc.23719--

--===============1200043347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1200043347==--
