From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109952] New: nv106 nv108 confusion
Date: Sun, 10 Mar 2019 21:18:00 +0000
Message-ID: <bug-109952-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1279701392=="
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


--===============1279701392==
Content-Type: multipart/alternative; boundary="15522526810.fBAfc.28441"
Content-Transfer-Encoding: 7bit


--15522526810.fBAfc.28441
Date: Sun, 10 Mar 2019 21:18:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109952

            Bug ID: 109952
           Summary: nv106 nv108 confusion
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: moebius1-GANU6spQydw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 143619
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D143619&action=3Dedit
hope it's the good one (the internal nvidia card is not in use, but...)

Bonjour,
I own a MSI GT 710
I'm running a debian buster
Here are the outputs of different commands :
lshw : GK208 [GeForce GT 710B]

dmesg : [    6.211259] nouveau 0000:02:00.0: NVIDIA GK208B (b060b0b1)

vainfo: Driver version: Mesa Gallium driver 18.3.4 for NV106

And just an example of syslog that shows that nouveau is looking for nv106
drivers  and fails to load them because I've renamed the firmware directory:
Direct firmware load for nouveau/nv106_fuc084 failed with error -2

In fact, I suppose that, for nouveau driver the card is a nv106 (GK208B, GT
720) but, in fact, it's a nv108 (GK208, GT 710B).

So I've rename /lib/firmware/nouveau/ directory in nouveau.ori to avoid
kaffeine to crash (and vlc too when selecting VDPAU output). But doing so, I
can't expect any hardware acceleration.

PS : I don't know how to find version number of nouveau driver but kernel i=
s=20
4.19.0-2-rt-amd64 SMP preempt

Thank's for your work

cordialement,

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15522526810.fBAfc.28441
Date: Sun, 10 Mar 2019 21:18:01 +0000
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
   title=3D"NEW - nv106 nv108 confusion"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109952">109952</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nv106 nv108 confusion
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
          <td>moebius1&#64;free.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D143619=
" name=3D"attach_143619" title=3D"hope it's the good one (the internal nvid=
ia card is not in use, but...)">attachment 143619</a> <a href=3D"attachment=
.cgi?id=3D143619&amp;action=3Dedit" title=3D"hope it's the good one (the in=
ternal nvidia card is not in use, but...)">[details]</a></span>
hope it's the good one (the internal nvidia card is not in use, but...)

Bonjour,
I own a MSI GT 710
I'm running a debian buster
Here are the outputs of different commands :
lshw : GK208 [GeForce GT 710B]

dmesg : [    6.211259] nouveau 0000:02:00.0: NVIDIA GK208B (b060b0b1)

vainfo: Driver version: Mesa Gallium driver 18.3.4 for NV106

And just an example of syslog that shows that nouveau is looking for nv106
drivers  and fails to load them because I've renamed the firmware directory:
Direct firmware load for nouveau/nv106_fuc084 failed with error -2

In fact, I suppose that, for nouveau driver the card is a nv106 (GK208B, GT
720) but, in fact, it's a nv108 (GK208, GT 710B).

So I've rename /lib/firmware/nouveau/ directory in nouveau.ori to avoid
kaffeine to crash (and vlc too when selecting VDPAU output). But doing so, I
can't expect any hardware acceleration.

PS : I don't know how to find version number of nouveau driver but kernel i=
s=20
4.19.0-2-rt-amd64 SMP preempt

Thank's for your work

cordialement,</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15522526810.fBAfc.28441--

--===============1279701392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1279701392==--
