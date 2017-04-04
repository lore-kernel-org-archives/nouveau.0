From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100567] New: Nouveau system freeze fifo: SCHED_ERROR
 0a [CTXSW_TIMEOUT]
Date: Tue, 04 Apr 2017 20:09:12 +0000
Message-ID: <bug-100567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0194753435=="
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


--===============0194753435==
Content-Type: multipart/alternative; boundary="14913365520.ba58bfD9.13525";
 charset="UTF-8"


--14913365520.ba58bfD9.13525
Date: Tue, 4 Apr 2017 20:09:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

            Bug ID: 100567
           Summary: Nouveau system freeze fifo: SCHED_ERROR 0a
                    [CTXSW_TIMEOUT]
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jeremy.booker-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 130676
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D130676&action=3Dedit
journalctl output for last boot to crash

I'm experiencing a random, but consistent hard-free (cannot switch virtual
terminals) running an nVidia card with three monitors under Fedora 25. Rece=
nt
kernel and driver updates have seemed to make this freeze much more frequent
(5-6 times in two work days).

Journalctl -b -1 output is attached. Most relevant lines are:

kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
kernel: nouveau 0000:01:00.0: fifo: gr engine fault on channel 12,
recovering...
kernel: [drm:drm_atomic_helper_swap_state [drm_kms_helper]] *ERROR*
[CRTC:37:head-0] hw_done timed out
kernel: [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERR=
OR*
[CRTC:37:head-0] hw_done timed out
kernel: [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERR=
OR*
[CRTC:37:head-0] flip_done timed out

A possibly related bug is #96562, but it is old and hasn't received any
attention, so I'm opening a new one.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14913365520.ba58bfD9.13525
Date: Tue, 4 Apr 2017 20:09:12 +0000
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
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">100567</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
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
          <td>jeremy.booker&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D130676=
" name=3D"attach_130676" title=3D"journalctl output for last boot to crash"=
>attachment 130676</a> <a href=3D"attachment.cgi?id=3D130676&amp;action=3De=
dit" title=3D"journalctl output for last boot to crash">[details]</a></span>
journalctl output for last boot to crash

I'm experiencing a random, but consistent hard-free (cannot switch virtual
terminals) running an nVidia card with three monitors under Fedora 25. Rece=
nt
kernel and driver updates have seemed to make this freeze much more frequent
(5-6 times in two work days).

Journalctl -b -1 output is attached. Most relevant lines are:

kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
kernel: nouveau 0000:01:00.0: fifo: gr engine fault on channel 12,
recovering...
kernel: [drm:drm_atomic_helper_swap_state [drm_kms_helper]] *ERROR*
[CRTC:37:head-0] hw_done timed out
kernel: [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERR=
OR*
[CRTC:37:head-0] hw_done timed out
kernel: [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERR=
OR*
[CRTC:37:head-0] flip_done timed out

A possibly related bug is #96562, but it is old and hasn't received any
attention, so I'm opening a new one.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14913365520.ba58bfD9.13525--

--===============0194753435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0194753435==--
