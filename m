From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96390] New: [GK208] DISP failure while using PRIME
	offloading
Date: Sun, 05 Jun 2016 16:21:31 +0000
Message-ID: <bug-96390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2087689186=="
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


--===============2087689186==
Content-Type: multipart/alternative; boundary="14651436900.EcFAcb.28619";
 charset="UTF-8"


--14651436900.EcFAcb.28619
Date: Sun, 5 Jun 2016 16:21:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96390

            Bug ID: 96390
           Summary: [GK208] DISP failure while using PRIME offloading
           Product: xorg
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 124333
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D124333&action=3Dedit
disp error dump

With a GK208B (NV106) and GT215 (NVA3) [and NV34] plugged in, I went to run
warsow 2.1 with DRI_PRIME=3D1 (to offload onto the GT215). I got this error=
 and a
hung display. 02:00:00 is the GK208 (which is where the monitor is connecte=
d):

02:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK208 [GeForce=
 GT
730] [10de:1287] (rev a1)
04:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT215 [GeForce=
 GT
240] [10de:0ca3] (rev a2)
09:01.0 VGA compatible controller [0300]: NVIDIA Corporation NV34 [GeForce =
FX
5200] [10de:0322] (rev a1)

Note the "moving pinned object" note too - can't be good. This happened rig=
ht
as I launched warsow, the picture left-over on the desktop was one of my
original desktop, shifted up by 16-32 pixels. (And I could see the original
bottom pixels duplicated.)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14651436900.EcFAcb.28619
Date: Sun, 5 Jun 2016 16:21:30 +0000
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
   title=3D"NEW - [GK208] DISP failure while using PRIME offloading"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96390">96390</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[GK208] DISP failure while using PRIME offloading
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>imirkin&#64;alum.mit.edu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D124333=
" name=3D"attach_124333" title=3D"disp error dump">attachment 124333</a> <a=
 href=3D"attachment.cgi?id=3D124333&amp;action=3Dedit" title=3D"disp error =
dump">[details]</a></span>
disp error dump

With a GK208B (NV106) and GT215 (NVA3) [and NV34] plugged in, I went to run
warsow 2.1 with DRI_PRIME=3D1 (to offload onto the GT215). I got this error=
 and a
hung display. 02:00:00 is the GK208 (which is where the monitor is connecte=
d):

02:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK208 [GeForce=
 GT
730] [10de:1287] (rev a1)
04:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT215 [GeForce=
 GT
240] [10de:0ca3] (rev a2)
09:01.0 VGA compatible controller [0300]: NVIDIA Corporation NV34 [GeForce =
FX
5200] [10de:0322] (rev a1)

Note the &quot;moving pinned object&quot; note too - can't be good. This ha=
ppened right
as I launched warsow, the picture left-over on the desktop was one of my
original desktop, shifted up by 16-32 pixels. (And I could see the original
bottom pixels duplicated.)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14651436900.EcFAcb.28619--

--===============2087689186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2087689186==--
