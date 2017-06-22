From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101559] New: Displays fail to wake up when booting
 machine away from Display Port KVM switch
Date: Thu, 22 Jun 2017 16:36:51 +0000
Message-ID: <bug-101559-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0071343351=="
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


--===============0071343351==
Content-Type: multipart/alternative; boundary="14981494111.9A49.14681";
 charset="UTF-8"


--14981494111.9A49.14681
Date: Thu, 22 Jun 2017 16:36:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101559

            Bug ID: 101559
           Summary: Displays fail to wake up when booting machine away
                    from Display Port KVM switch
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: dhruv.a.thakkar-taCtA1Gr/WzQT0dZR+AlfA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 132142
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D132142&action=3Dedit
Xorg.0.log

Description of problem:

We are trying to solve an issue in which displays fail to wake up when boot=
ing
a Rhel 7.3 machine (Machine A) connected to a Display Port KVM while the KV=
M is
pointing to Machine B. The unusual bit is that xorg logs in /var/log/Xorg.0=
.log
indicate that everything comes up correctly, and a "ps -ef |grep X|xinit" s=
hows
that X and xinit are up and running. If we boot Machine A while the KVM is
pointing to it, the displays come up with no issues.

We have KMS parameters set to force the output of the video
(video=3DDP-1:2560x1600D and video=3DDP-2:2560x1600D) as well as options to=
 load
the EDID information. These parameters have worked in the past for us when =
we
used DVI connections through KVMs, but DisplayPort is not showing the same
results. Note that we have additional kernel options added for extra debug
information (log_buf_len=3D8M nouveau.debug=3Ddisp=3Dtrace,i2c=3Dtrace,bios=
=3Dtrace)

Using Xrandr and Udev rules with a script allow us to turn off and then bac=
k on
the displays automatically, allowing us a workaround, but it still does not
solve the core issue of that nouveau is not waking up the monitors.

Please see the attached logs/config files and diagram below for more
information.

|Machine A| |Machine B|
\               /
 \             /
  \ _________ /
   |DPort KVM|
   |_________|
   /         \
  /           \
 /             \
|Monitor 2| |Monitor 1|

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14981494111.9A49.14681
Date: Thu, 22 Jun 2017 16:36:51 +0000
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
   title=3D"NEW - Displays fail to wake up when booting machine away from D=
isplay Port KVM switch"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101559">101559</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Displays fail to wake up when booting machine away from Displ=
ay Port KVM switch
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
          <td>dhruv.a.thakkar&#64;leidos.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D132142=
" name=3D"attach_132142" title=3D"Xorg.0.log">attachment 132142</a> <a href=
=3D"attachment.cgi?id=3D132142&amp;action=3Dedit" title=3D"Xorg.0.log">[det=
ails]</a></span>
Xorg.0.log

Description of problem:

We are trying to solve an issue in which displays fail to wake up when boot=
ing
a Rhel 7.3 machine (Machine A) connected to a Display Port KVM while the KV=
M is
pointing to Machine B. The unusual bit is that xorg logs in /var/log/Xorg.0=
.log
indicate that everything comes up correctly, and a &quot;ps -ef |grep X|xin=
it&quot; shows
that X and xinit are up and running. If we boot Machine A while the KVM is
pointing to it, the displays come up with no issues.

We have KMS parameters set to force the output of the video
(video=3DDP-1:2560x1600D and video=3DDP-2:2560x1600D) as well as options to=
 load
the EDID information. These parameters have worked in the past for us when =
we
used DVI connections through KVMs, but DisplayPort is not showing the same
results. Note that we have additional kernel options added for extra debug
information (log_buf_len=3D8M nouveau.debug=3Ddisp=3Dtrace,i2c=3Dtrace,bios=
=3Dtrace)

Using Xrandr and Udev rules with a script allow us to turn off and then bac=
k on
the displays automatically, allowing us a workaround, but it still does not
solve the core issue of that nouveau is not waking up the monitors.

Please see the attached logs/config files and diagram below for more
information.

|Machine A| |Machine B|
\               /
 \             /
  \ _________ /
   |DPort KVM|
   |_________|
   /         \
  /           \
 /             \
|Monitor 2| |Monitor 1|</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14981494111.9A49.14681--

--===============0071343351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0071343351==--
