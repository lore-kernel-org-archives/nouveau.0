From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106294] New: GM204/modesetting DDX: Odd corruption
 (red backgrounds) introduced by Mesa
Date: Sat, 28 Apr 2018 11:07:44 +0000
Message-ID: <bug-106294-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1807113218=="
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


--===============1807113218==
Content-Type: multipart/alternative; boundary="15249136640.F0D9FeD8D.26615"
Content-Transfer-Encoding: 7bit


--15249136640.F0D9FeD8D.26615
Date: Sat, 28 Apr 2018 11:07:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106294

            Bug ID: 106294
           Summary: GM204/modesetting DDX: Odd corruption (red
                    backgrounds) introduced by Mesa
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: freedesktop-bugs-dADiZSo7rdJAfugRpC6u6w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

I apologise if I have selected the wrong product for this bug, as I think I
probably have. If I need to open a new bug, please let me know.

I use an NVidia GeForce GTX 970, with kernel version 4.15.4-gentoo and the
modesetting driver in Xorg. (More detailed descriptions of packages install=
ed
at the bottom of this description.)

My distribution (Gentoo) has packages for Mesa 17.2.8, 17.3.8, and a few ot=
her
higher versions (currently marked as unstable). When I use Mesa 17.3.8 or
higher, I see odd types of corruption involving red backgrounds on menus and
widgets, and some checkboxes appear unticked when they should be ticked. I
recorded this behaviour using OBS:

* Incorrect behaviour on 17.3.8 and higher:
    https://www.youtube.com/watch?v=3DpuSC7a_osw0

* Expected behaviour on 17.2.8:
    https://www.youtube.com/watch?v=3DLbjCoIX4DKE

I dug out git and have confirmed that the bug still exists as of commit
https://cgit.freedesktop.org/mesa/mesa/commit/?id=3D8b7358fe4376aecee0c29ea=
622f88f9ef07e6b11
(the latest commit on master as of an hour ago or so).

After bisection, I discovered that the bug was introduced by
https://cgit.freedesktop.org/mesa/mesa/commit/?id=3Dfcbb93e860246375d03f280=
f927f79d3645a8988
, which is actually *before* the 17.2.x branchpoint. It turns out that this
commit was reverted in the 17.2.x branch in commit
https://cgit.freedesktop.org/mesa/mesa/commit/?id=3D17a3e4891bf4fa09785fe9d=
22db5c79a949004db
to fix bug #101983. This was not committed to the 'master' branch, as the f=
ixes
in master apparently would have been rather invasive. This explains why my
tests of 17.2.8 worked fine.

This issue only appears when using the "modesetting" DDX drivers. When using
the "nouveau" DDX drivers, the issue does not appear. (The "nouveau" DDX
drivers also fix other issues for me so I'll probably switch to using that =
from
now on for normal use, but I'm willing to switch back to help debug this is=
sue
if needed.)

System summary:

I have the following graphics card, as shown by lspci -nn:
> 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM204 [GeFor=
ce GTX 970] [10de:13c2] (rev a1)

I am running Gentoo Linux with the sys-kernel/gentoo-sources-4.15.4 kernel,
with the following (relevant) packages installed:

* x11-base/xorg-server-1.19.5-r1
* x11-base/xorg-drivers-1.19 (with VIDEO_CARDS=3D"nouveau")

In my kernel configuration, CONFIG_DRM_NOUVEAU is set to "m".

Please let me know if you need any more information.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15249136640.F0D9FeD8D.26615
Date: Sat, 28 Apr 2018 11:07:44 +0000
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
   title=3D"NEW - GM204/modesetting DDX: Odd corruption (red backgrounds) i=
ntroduced by Mesa"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106294">106294</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GM204/modesetting DDX: Odd corruption (red backgrounds) intro=
duced by Mesa
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
          <td>freedesktop-bugs&#64;theblob.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I apologise if I have selected the wrong product for this bug,=
 as I think I
probably have. If I need to open a new bug, please let me know.

I use an NVidia GeForce GTX 970, with kernel version 4.15.4-gentoo and the
modesetting driver in Xorg. (More detailed descriptions of packages install=
ed
at the bottom of this description.)

My distribution (Gentoo) has packages for Mesa 17.2.8, 17.3.8, and a few ot=
her
higher versions (currently marked as unstable). When I use Mesa 17.3.8 or
higher, I see odd types of corruption involving red backgrounds on menus and
widgets, and some checkboxes appear unticked when they should be ticked. I
recorded this behaviour using OBS:

* Incorrect behaviour on 17.3.8 and higher:
    <a href=3D"https://www.youtube.com/watch?v=3DpuSC7a_osw0">https://www.y=
outube.com/watch?v=3DpuSC7a_osw0</a>

* Expected behaviour on 17.2.8:
    <a href=3D"https://www.youtube.com/watch?v=3DLbjCoIX4DKE">https://www.y=
outube.com/watch?v=3DLbjCoIX4DKE</a>

I dug out git and have confirmed that the bug still exists as of commit
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/?id=3D8b7358fe4376=
aecee0c29ea622f88f9ef07e6b11">https://cgit.freedesktop.org/mesa/mesa/commit=
/?id=3D8b7358fe4376aecee0c29ea622f88f9ef07e6b11</a>
(the latest commit on master as of an hour ago or so).

After bisection, I discovered that the bug was introduced by
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/?id=3Dfcbb93e86024=
6375d03f280f927f79d3645a8988">https://cgit.freedesktop.org/mesa/mesa/commit=
/?id=3Dfcbb93e860246375d03f280f927f79d3645a8988</a>
, which is actually *before* the 17.2.x branchpoint. It turns out that this
commit was reverted in the 17.2.x branch in commit
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/?id=3D17a3e4891bf4=
fa09785fe9d22db5c79a949004db">https://cgit.freedesktop.org/mesa/mesa/commit=
/?id=3D17a3e4891bf4fa09785fe9d22db5c79a949004db</a>
to fix <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [G33] ES2-CTS.functional.shaders.struct.unifor=
m.sampler_nested* regression"
   href=3D"show_bug.cgi?id=3D101983">bug #101983</a>. This was not committe=
d to the 'master' branch, as the fixes
in master apparently would have been rather invasive. This explains why my
tests of 17.2.8 worked fine.

This issue only appears when using the &quot;modesetting&quot; DDX drivers.=
 When using
the &quot;nouveau&quot; DDX drivers, the issue does not appear. (The &quot;=
nouveau&quot; DDX
drivers also fix other issues for me so I'll probably switch to using that =
from
now on for normal use, but I'm willing to switch back to help debug this is=
sue
if needed.)

System summary:

I have the following graphics card, as shown by lspci -nn:
<span class=3D"quote">&gt; 01:00.0 VGA compatible controller [0300]: NVIDIA=
 Corporation GM204 [GeForce GTX 970] [10de:13c2] (rev a1)</span >

I am running Gentoo Linux with the sys-kernel/gentoo-sources-4.15.4 kernel,
with the following (relevant) packages installed:

* x11-base/xorg-server-1.19.5-r1
* x11-base/xorg-drivers-1.19 (with VIDEO_CARDS=3D&quot;nouveau&quot;)

In my kernel configuration, CONFIG_DRM_NOUVEAU is set to &quot;m&quot;.

Please let me know if you need any more information.</pre>
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

--15249136640.F0D9FeD8D.26615--

--===============1807113218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1807113218==--
