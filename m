From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104441] New: drm/nouveau: drm_hwcomposer cannot get
 rotation property/does not work
Date: Mon, 01 Jan 2018 23:45:51 +0000
Message-ID: <bug-104441-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2139475882=="
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


--===============2139475882==
Content-Type: multipart/alternative; boundary="15148503511.a3eb.1093";
 charset="UTF-8"


--15148503511.a3eb.1093
Date: Mon, 1 Jan 2018 23:45:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104441

            Bug ID: 104441
           Summary: drm/nouveau: drm_hwcomposer cannot get rotation
                    property/does not work
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 136475
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136475&action=3Dedit
logcat showing hwc errors

Hi,

while testing drm_hwcomposer (hwc v1),

having enabled atomic ioctl for drm/nouveau a series of properties can be
enquired, but rotation property returns an error in drmplane.cpp:123

01-02 00:05:42.626  2300  2300 E hwc-drm-plane: Could not get rotation prop=
erty
01-02 00:05:42.626  2300  2300 I hwc-drm-plane: Could not get alpha property

Since ALOGE() is used, an error is signalled,
could you please check why rotation property not available and why
drm_hwcomposer is not working with drm/nouveau?

01-02 00:05:42.628  2300  2300 E hwc-drm-resources: Could not find a suitab=
le
encoder/crtc for display 2
01-02 00:05:42.628  2300  2300 E hwc-drm-resources: Failed CreateDisplayPip=
e 49
with -19
01-02 00:05:42.628  2300  2300 E hwcomposer-drm: Can't initialize Drm object
-19
01-02 00:05:42.629  2300  2300 E SurfaceFlinger: composer device failed to
initialize (No such device)
01-02 00:05:42.629  2300  2300 E SurfaceFlinger: ERROR: failed to open
framebuffer (Invalid argument), aborting
--------- beginning of crash
01-02 00:05:42.629  2300  2300 F libc    : Fatal signal 6 (SIGABRT), code -=
6 in
tid 2300 (surfaceflinger), pid 2300 (surfaceflinger)


Another question is about alpha property,
is it correct/safe to assume that being only logged as info, with ALOGI()
it is not preventing drm_hwcomposer from working properly?

Full logcat attached
Mauro

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15148503511.a3eb.1093
Date: Mon, 1 Jan 2018 23:45:51 +0000
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
   title=3D"NEW - drm/nouveau: drm_hwcomposer cannot get rotation property/=
does not work"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104441">104441</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>drm/nouveau: drm_hwcomposer cannot get rotation property/does=
 not work
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
          <td>issor.oruam&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136475=
" name=3D"attach_136475" title=3D"logcat showing hwc errors">attachment 136=
475</a> <a href=3D"attachment.cgi?id=3D136475&amp;action=3Dedit" title=3D"l=
ogcat showing hwc errors">[details]</a></span>
logcat showing hwc errors

Hi,

while testing drm_hwcomposer (hwc v1),

having enabled atomic ioctl for drm/nouveau a series of properties can be
enquired, but rotation property returns an error in drmplane.cpp:123

01-02 00:05:42.626  2300  2300 E hwc-drm-plane: Could not get rotation prop=
erty
01-02 00:05:42.626  2300  2300 I hwc-drm-plane: Could not get alpha property

Since ALOGE() is used, an error is signalled,
could you please check why rotation property not available and why
drm_hwcomposer is not working with drm/nouveau?

01-02 00:05:42.628  2300  2300 E hwc-drm-resources: Could not find a suitab=
le
encoder/crtc for display 2
01-02 00:05:42.628  2300  2300 E hwc-drm-resources: Failed CreateDisplayPip=
e 49
with -19
01-02 00:05:42.628  2300  2300 E hwcomposer-drm: Can't initialize Drm object
-19
01-02 00:05:42.629  2300  2300 E SurfaceFlinger: composer device failed to
initialize (No such device)
01-02 00:05:42.629  2300  2300 E SurfaceFlinger: ERROR: failed to open
framebuffer (Invalid argument), aborting
--------- beginning of crash
01-02 00:05:42.629  2300  2300 F libc    : Fatal signal 6 (SIGABRT), code -=
6 in
tid 2300 (surfaceflinger), pid 2300 (surfaceflinger)


Another question is about alpha property,
is it correct/safe to assume that being only logged as info, with ALOGI()
it is not preventing drm_hwcomposer from working properly?

Full logcat attached
Mauro</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15148503511.a3eb.1093--

--===============2139475882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2139475882==--
