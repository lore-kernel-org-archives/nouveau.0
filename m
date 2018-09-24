From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108047] New: No recognition of DVI-D monitor
Date: Mon, 24 Sep 2018 18:27:49 +0000
Message-ID: <bug-108047-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0582799422=="
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


--===============0582799422==
Content-Type: multipart/alternative; boundary="15378136690.a9CEd2FA6.4018"
Content-Transfer-Encoding: 7bit


--15378136690.a9CEd2FA6.4018
Date: Mon, 24 Sep 2018 18:27:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108047

            Bug ID: 108047
           Summary: No recognition of DVI-D monitor
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: wolle321-KuiJ5kEpwI6ELgA04lAiVw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 141717
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D141717&action=3Dedit
vbios.rom

Hello,=20

I try to get my external monitor to work with my laptop. But there is no si=
gnal
at the DVI output. Internal LVDS-1 works like expected.

I tried=20
    an other monitor,=20
    an other DVI-(dualchannel)-cable,=20
    HDMI output direct at the laptop.=20
Monitor(s) keep on saying "no signal".

Forcing kms video=3DDVI-D-1:e =3D> DVI-D-1 on with 1024x786
Forcing kms video=3DDVI-D-1:1600x1200e =3D>=20
    DVI-D-1 on 1600x1200 but my monitor has 1920x1200 native resolution
Forcing kms video=3DDVI-D-1:1920x1200e =3D>=20
    DVI-D-1 on picture is 1920x1200 but monitor=20
    reports 960x1200 and picture is pixelated


I'm on Ubuntu 18.04,=20
Device is a HP Elitebook8730w with docking station and DVI-D output.

As I saw, with the help of Ilia Mirkin from your team, there is no EDID data
reported in Xorg.log at DVI-D-1 (equal if forced kms or default boot)

There is a message "mxm: unmatched output device" in dmesg but it is also t=
here
when boot with unplugged DVI monitor. Ilia adviced me to add vbios.rom, to
check this.=20
/sys/class/drm/card0-DVI-D-1/edid is empty
/sys/class/drm/card0-LVDS-1/edid has data

Adding dmesg and Xorg.log with plugged and unplugged DVI, both without kms
forcing.=20

Thank you, Wolfgang

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15378136690.a9CEd2FA6.4018
Date: Mon, 24 Sep 2018 18:27:49 +0000
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
   title=3D"NEW - No recognition of DVI-D monitor"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108047">108047</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>No recognition of DVI-D monitor
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
          <td>wolle321&#64;freenet.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D141717=
" name=3D"attach_141717" title=3D"vbios.rom">attachment 141717</a> <a href=
=3D"attachment.cgi?id=3D141717&amp;action=3Dedit" title=3D"vbios.rom">[deta=
ils]</a></span>
vbios.rom

Hello,=20

I try to get my external monitor to work with my laptop. But there is no si=
gnal
at the DVI output. Internal LVDS-1 works like expected.

I tried=20
    an other monitor,=20
    an other DVI-(dualchannel)-cable,=20
    HDMI output direct at the laptop.=20
Monitor(s) keep on saying &quot;no signal&quot;.

Forcing kms video=3DDVI-D-1:e =3D&gt; DVI-D-1 on with 1024x786
Forcing kms video=3DDVI-D-1:1600x1200e =3D&gt;=20
    DVI-D-1 on 1600x1200 but my monitor has 1920x1200 native resolution
Forcing kms video=3DDVI-D-1:1920x1200e =3D&gt;=20
    DVI-D-1 on picture is 1920x1200 but monitor=20
    reports 960x1200 and picture is pixelated


I'm on Ubuntu 18.04,=20
Device is a HP Elitebook8730w with docking station and DVI-D output.

As I saw, with the help of Ilia Mirkin from your team, there is no EDID data
reported in Xorg.log at DVI-D-1 (equal if forced kms or default boot)

There is a message &quot;mxm: unmatched output device&quot; in dmesg but it=
 is also there
when boot with unplugged DVI monitor. Ilia adviced me to add vbios.rom, to
check this.=20
/sys/class/drm/card0-DVI-D-1/edid is empty
/sys/class/drm/card0-LVDS-1/edid has data

Adding dmesg and Xorg.log with plugged and unplugged DVI, both without kms
forcing.=20

Thank you, Wolfgang</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15378136690.a9CEd2FA6.4018--

--===============0582799422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0582799422==--
