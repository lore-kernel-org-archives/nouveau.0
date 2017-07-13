From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101782] New: GTX1050TI (GP107 / NV137): HDMI output
	not working
Date: Thu, 13 Jul 2017 13:08:07 +0000
Message-ID: <bug-101782-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0732014843=="
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


--===============0732014843==
Content-Type: multipart/alternative; boundary="14999512870.ef18.29822";
 charset="UTF-8"


--14999512870.ef18.29822
Date: Thu, 13 Jul 2017 13:08:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101782

            Bug ID: 101782
           Summary: GTX1050TI (GP107 / NV137): HDMI output not working
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 132664
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D132664&action=3Dedit
log_attaching_detaching

The same hardware as for https://bugs.freedesktop.org/show_bug.cgi?id=3D101=
764

When the HDMI cable is connected there is no signal for the external monitor
and the internal panel keeps working as expected.

The journal when the cable is attached and then detached is attached to this
ticket. What's interesting to me is:

gdm-Xorg-:0[551]: (EE) NOUVEAU(G0): failed to set mode: No space left on de=
vice

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14999512870.ef18.29822
Date: Thu, 13 Jul 2017 13:08:07 +0000
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
   title=3D"NEW - GTX1050TI (GP107 / NV137): HDMI output not working"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101782">101782</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GTX1050TI (GP107 / NV137): HDMI output not working
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
          <td>carlo&#64;caione.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D132664=
" name=3D"attach_132664" title=3D"log_attaching_detaching">attachment 13266=
4</a> <a href=3D"attachment.cgi?id=3D132664&amp;action=3Dedit" title=3D"log=
_attaching_detaching">[details]</a></span>
log_attaching_detaching

The same hardware as for <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [regression] eaa2c988033b breaks GTX1050TI (GP107 / NV137=
)"
   href=3D"show_bug.cgi?id=3D101764">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D101764</a>

When the HDMI cable is connected there is no signal for the external monitor
and the internal panel keeps working as expected.

The journal when the cable is attached and then detached is attached to this
ticket. What's interesting to me is:

gdm-Xorg-:0[551]: (EE) NOUVEAU(G0): failed to set mode: No space left on de=
vice</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14999512870.ef18.29822--

--===============0732014843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0732014843==--
