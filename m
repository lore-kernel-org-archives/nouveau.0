From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99289] New: Display freezes after "gr: TRAP ch 6"
Date: Thu, 05 Jan 2017 19:48:02 +0000
Message-ID: <bug-99289-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0248465440=="
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


--===============0248465440==
Content-Type: multipart/alternative; boundary="14836456820.030DD40d6.32035";
 charset="UTF-8"


--14836456820.030DD40d6.32035
Date: Thu, 5 Jan 2017 19:48:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99289

            Bug ID: 99289
           Summary: Display freezes after "gr: TRAP ch 6"
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: afn2-HmMyXyqgL2CVc3sceRu5cw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 128783
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D128783&action=3Dedit
dmesg showing error

Intermittently (a few times a day), my display will completely freeze and
doesn't recover. Although the kernel doesn't hang and I can ssh in, I can't
chvt to a non-graphical VT.

Whenever this occurs, I see a message like this in dmesg:

[12535.260195] nouveau 0000:01:00.0: gr: TRAP ch 6 [007f778000 Xwayland[854=
]]
[12535.260211] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 00000000=
 []
warp 3d0001 [STACK_ERROR]
[12539.595312] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[12539.595318] nouveau 0000:01:00.0: fifo: gr engine fault on channel 5,
recovering...

Despite the "recovering..." message it never actually recovers and only a
reboot solves the problem.

I'm using GNOME on Wayland, and I'm typically running gnome-terminal, Firef=
ox,
and/or Chromium. So far I haven't identified any specific action that trigg=
ers
this failure.

My computer is a mid-2014 Macbook Pro with a GeForce 750M (GK107). I'm runn=
ing
nouveau with "nouveau.nofbaccel=3D1". I've tried adding
"nouveau.config=3DNvGrUseFW=3D1" but it complains about not finding
/lib/firmware/nvidia/gk107/fecs_inst.bin. Is there an external firmware blob
available for this card?

I recently updated my kernel and several relevant packages, and have seen no
difference in behavior. I'm running linux 4.9.0, and the latest version of =
mesa
from git (36b5f1d200).

See my attached dmesg output. Is there any debug flag I can enable to shed =
more
light on the situation?

Thanks!
Tony

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14836456820.030DD40d6.32035
Date: Thu, 5 Jan 2017 19:48:02 +0000
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
   title=3D"NEW - Display freezes after &quot;gr: TRAP ch 6&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99289">99289</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Display freezes after &quot;gr: TRAP ch 6&quot;
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
          <td>afn2&#64;cornell.edu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D128783=
" name=3D"attach_128783" title=3D"dmesg showing error">attachment 128783</a=
> <a href=3D"attachment.cgi?id=3D128783&amp;action=3Dedit" title=3D"dmesg s=
howing error">[details]</a></span>
dmesg showing error

Intermittently (a few times a day), my display will completely freeze and
doesn't recover. Although the kernel doesn't hang and I can ssh in, I can't
chvt to a non-graphical VT.

Whenever this occurs, I see a message like this in dmesg:

[12535.260195] nouveau 0000:01:00.0: gr: TRAP ch 6 [007f778000 Xwayland[854=
]]
[12535.260211] nouveau 0000:01:00.0: gr: GPC0/TPC1/MP trap: global 00000000=
 []
warp 3d0001 [STACK_ERROR]
[12539.595312] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[12539.595318] nouveau 0000:01:00.0: fifo: gr engine fault on channel 5,
recovering...

Despite the &quot;recovering...&quot; message it never actually recovers an=
d only a
reboot solves the problem.

I'm using GNOME on Wayland, and I'm typically running gnome-terminal, Firef=
ox,
and/or Chromium. So far I haven't identified any specific action that trigg=
ers
this failure.

My computer is a mid-2014 Macbook Pro with a GeForce 750M (GK107). I'm runn=
ing
nouveau with &quot;nouveau.nofbaccel=3D1&quot;. I've tried adding
&quot;nouveau.config=3DNvGrUseFW=3D1&quot; but it complains about not findi=
ng
/lib/firmware/nvidia/gk107/fecs_inst.bin. Is there an external firmware blob
available for this card?

I recently updated my kernel and several relevant packages, and have seen no
difference in behavior. I'm running linux 4.9.0, and the latest version of =
mesa
from git (36b5f1d200).

See my attached dmesg output. Is there any debug flag I can enable to shed =
more
light on the situation?

Thanks!
Tony</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14836456820.030DD40d6.32035--

--===============0248465440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0248465440==--
