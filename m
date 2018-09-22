From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108022] New: Cannot resume from standby - Link
 training fails
Date: Sat, 22 Sep 2018 18:02:51 +0000
Message-ID: <bug-108022-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1020540484=="
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


--===============1020540484==
Content-Type: multipart/alternative; boundary="15376393710.5F3c7Dc3b.22037"
Content-Transfer-Encoding: 7bit


--15376393710.5F3c7Dc3b.22037
Date: Sat, 22 Sep 2018 18:02:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108022

            Bug ID: 108022
           Summary: Cannot resume from standby - Link training fails
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: barry-RiHDFbPRhGT6V6G2DxALlg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 141689
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D141689&action=3Dedit
DMESG with nvkm_dp_train_pattern failure.  At 3468 is the manual re-plug

My computer (X10DAX motherboard, Nvidia GTX 980, dual Xeon E5) fails to come
back if it goes to DPMS standby with:
WARNING: CPU: 3 PID: 8 at drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h=
:170
nvkm_dp_train_pattern+0x12e/0x150 [nouveau]

I am running 4.18.9 of the kernel.

The GTX 980s are hooked to dual Dell P2715Q monitors.  The monitors have a
steady glowing power LED until I attempt to resume by moving the mouse at w=
hich
point they say not connected and the power led starts flashing.

If I remove the re-insert the DP cable(s) the monitors come back.

Note that I am doing no suspending nor hibernation.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15376393710.5F3c7Dc3b.22037
Date: Sat, 22 Sep 2018 18:02:51 +0000
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
   title=3D"NEW - Cannot resume from standby - Link training fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108022">108022</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Cannot resume from standby - Link training fails
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
          <td>barry&#64;grussling.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D141689=
" name=3D"attach_141689" title=3D"DMESG with nvkm_dp_train_pattern failure.=
  At 3468 is the manual re-plug">attachment 141689</a> <a href=3D"attachmen=
t.cgi?id=3D141689&amp;action=3Dedit" title=3D"DMESG with nvkm_dp_train_patt=
ern failure.  At 3468 is the manual re-plug">[details]</a></span>
DMESG with nvkm_dp_train_pattern failure.  At 3468 is the manual re-plug

My computer (X10DAX motherboard, Nvidia GTX 980, dual Xeon E5) fails to come
back if it goes to DPMS standby with:
WARNING: CPU: 3 PID: 8 at drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h=
:170
nvkm_dp_train_pattern+0x12e/0x150 [nouveau]

I am running 4.18.9 of the kernel.

The GTX 980s are hooked to dual Dell P2715Q monitors.  The monitors have a
steady glowing power LED until I attempt to resume by moving the mouse at w=
hich
point they say not connected and the power led starts flashing.

If I remove the re-insert the DP cable(s) the monitors come back.

Note that I am doing no suspending nor hibernation.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15376393710.5F3c7Dc3b.22037--

--===============1020540484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1020540484==--
