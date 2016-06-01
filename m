From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96306] New: BUG: KASAN: slab-out-of-bounds in
 OUT_RINGp (via nvc0_fbcon_imageblit)
Date: Wed, 01 Jun 2016 11:44:07 +0000
Message-ID: <bug-96306-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2078764757=="
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


--===============2078764757==
Content-Type: multipart/alternative; boundary="14647814471.D5ca4.15812";
 charset="UTF-8"


--14647814471.D5ca4.15812
Date: Wed, 1 Jun 2016 11:44:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96306

            Bug ID: 96306
           Summary: BUG: KASAN: slab-out-of-bounds in OUT_RINGp (via
                    nvc0_fbcon_imageblit)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: peter-VTkQYDcBqhK7DlmcbJSQ7g@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 124231
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D124231&action=3Dedit
dmesg output for v4.7-rc1 containing the KASAN report

Previously reported by others to mailing lists (with no replies):

[4.4-rc1] nouveau: BUG: KASAN: slab-out-of-bounds in memcpy+0x1d/0x40
https://lists.freedesktop.org/archives/dri-devel/2015-November/095100.html

[3.10] BUG: drm, nouveau: slab-out-of-bounds read access in
nv50_fbcon_imageblit()
https://lists.freedesktop.org/archives/dri-devel/2016-May/108270.html


Hardware:
Optimus laptop with inteldrmfb being the primary framebuffer, an external
monitor is connected to DP-1 on the Nvidia card (GTX 965M, 10de:13d9).

Steps to reproduce the out-of-bounds issue in my environment:
 0. Avoid continuously triggering the error: dmesg -D
 1. modprobe nouveau runpm=3D0 (or be sure to wake the device before using
con2fbmap, there is a nasty (unrelated) deadlock in there due to recursive
console_lockup.)
 2. con2fbmap 1 2 (bind console 2 to nouveaufb (1)). This invokes
ioctl(/dev/fb0, FBIOPUT_CON2FBMAP, (u32[2]){2, 1})).
 3. If you are not there already, switch to tty2 on the nouveau display.
 4. Press Enter until you are at the last line of the console (or past it, I
forgot).
 5. Go to a different tty (e.g. the Intel one) and notice the KASAN report =
in
dmesg.

Attached is yet another log (looks similar to the other ones) for v4.7-rc1
(with two unrelated patchsets applied on top).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14647814471.D5ca4.15812
Date: Wed, 1 Jun 2016 11:44:07 +0000
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
   title=3D"NEW - BUG: KASAN: slab-out-of-bounds in OUT_RINGp (via nvc0_fbc=
on_imageblit)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96306">96306</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>BUG: KASAN: slab-out-of-bounds in OUT_RINGp (via nvc0_fbcon_i=
mageblit)
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
          <td>peter&#64;lekensteyn.nl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D124231=
" name=3D"attach_124231" title=3D"dmesg output for v4.7-rc1 containing the =
KASAN report">attachment 124231</a> <a href=3D"attachment.cgi?id=3D124231&a=
mp;action=3Dedit" title=3D"dmesg output for v4.7-rc1 containing the KASAN r=
eport">[details]</a></span>
dmesg output for v4.7-rc1 containing the KASAN report

Previously reported by others to mailing lists (with no replies):

[4.4-rc1] nouveau: BUG: KASAN: slab-out-of-bounds in memcpy+0x1d/0x40
<a href=3D"https://lists.freedesktop.org/archives/dri-devel/2015-November/0=
95100.html">https://lists.freedesktop.org/archives/dri-devel/2015-November/=
095100.html</a>

[3.10] BUG: drm, nouveau: slab-out-of-bounds read access in
nv50_fbcon_imageblit()
<a href=3D"https://lists.freedesktop.org/archives/dri-devel/2016-May/108270=
.html">https://lists.freedesktop.org/archives/dri-devel/2016-May/108270.htm=
l</a>


Hardware:
Optimus laptop with inteldrmfb being the primary framebuffer, an external
monitor is connected to DP-1 on the Nvidia card (GTX 965M, 10de:13d9).

Steps to reproduce the out-of-bounds issue in my environment:
 0. Avoid continuously triggering the error: dmesg -D
 1. modprobe nouveau runpm=3D0 (or be sure to wake the device before using
con2fbmap, there is a nasty (unrelated) deadlock in there due to recursive
console_lockup.)
 2. con2fbmap 1 2 (bind console 2 to nouveaufb (1)). This invokes
ioctl(/dev/fb0, FBIOPUT_CON2FBMAP, (u32[2]){2, 1})).
 3. If you are not there already, switch to tty2 on the nouveau display.
 4. Press Enter until you are at the last line of the console (or past it, I
forgot).
 5. Go to a different tty (e.g. the Intel one) and notice the KASAN report =
in
dmesg.

Attached is yet another log (looks similar to the other ones) for v4.7-rc1
(with two unrelated patchsets applied on top).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14647814471.D5ca4.15812--

--===============2078764757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2078764757==--
