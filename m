From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Fri, 16 Mar 2018 03:54:56 +0000
Message-ID: <bug-75985-8800-kZHrnuMcUM@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1801363738=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75985-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1801363738==
Content-Type: multipart/alternative; boundary="15211724960.e6FCAb7f.25263"
Content-Transfer-Encoding: 7bit


--15211724960.e6FCAb7f.25263
Date: Fri, 16 Mar 2018 03:54:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #69 from Daniel Drake <dan-LrsmPHowOvpd3aXB8m+yKQ@public.gmane.org> ---
Thanks for the efforts here. I have tested the switcheroo_devlink_v2 branch
plus patches:

 [PATCH 1/3] PCI: Expose Nvidia HDA controllers=20
 [PATCH 2/3] PCI: Apply quirks on runtime resume despite being unbound
 [PATCH 3/3] ALSA: hda - Broaden VGA class matching=20

on Asus GL502VS with GP104M [GeForce GTX 1070].

The quirk works in that the HDMI audio PCI device now appears. I checked wi=
th
and without the quirk, the login screen idle power consumption from
/sys/class/power_supply/BAT0/power_now is 31W-32W in both cases (no differe=
nce
observed with the quirk).

However, with no graphics driver loaded, or with nouveau loaded, HDMI audio
does not work at all and the eld files in /proc/asound show that no HDMI
display is connected. If I load the proprietary nvidia driver and then star=
t X,
the eld files change their values to indicate a connected device, and HDMI
audio works. After suspend and resume the HDMI audio continues working.

I also tested GL702VMK with GP106M [GeForce GTX 1060], with the proprietary
nvidia driver, HDMI audio now works and also after suspend/resume.

Also tested Asus UX550GE with GP107M [GeForce GTX 1050 Ti Mobile] with the
proprietary driver. This one could not be worked around with previous users=
pace
approaches (setpci, remove, rescan) because after remove/rescan the magic b=
it
had gone back to zero. But this new kernel approach works, the magic bit ge=
ts
stuck on and HDMI audio works. Also tested suspend/resume and it still work=
s.

Results look good, but I have 2 concerns:
 1. The proprietary nvidia driver does something special on these platforms=
 to
make the HDMI audio work after it has appeared. nouveau does not do this, so
this will not fix HDMI audio for nouveau users on some platforms, something
else is needed too.
 2. Do we understand why the underlying nvidia/windows design is like this =
in
the first place? I previously confirmed that Windows dynamically
enables/disables this magic bit based on presence of a HDMI display - i.e.
Windows does not do the approach being considered here which makes it
always-on. Is there a good reason for this that we're missing?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15211724960.e6FCAb7f.25263
Date: Fri, 16 Mar 2018 03:54:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c69">Commen=
t # 69</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dan&#64;reactivated.net" title=3D"Daniel Drake &lt;dan&#64;reactivated.net&=
gt;"> <span class=3D"fn">Daniel Drake</span></a>
</span></b>
        <pre>Thanks for the efforts here. I have tested the switcheroo_devl=
ink_v2 branch
plus patches:

 [PATCH 1/3] PCI: Expose Nvidia HDA controllers=20
 [PATCH 2/3] PCI: Apply quirks on runtime resume despite being unbound
 [PATCH 3/3] ALSA: hda - Broaden VGA class matching=20

on Asus GL502VS with GP104M [GeForce GTX 1070].

The quirk works in that the HDMI audio PCI device now appears. I checked wi=
th
and without the quirk, the login screen idle power consumption from
/sys/class/power_supply/BAT0/power_now is 31W-32W in both cases (no differe=
nce
observed with the quirk).

However, with no graphics driver loaded, or with nouveau loaded, HDMI audio
does not work at all and the eld files in /proc/asound show that no HDMI
display is connected. If I load the proprietary nvidia driver and then star=
t X,
the eld files change their values to indicate a connected device, and HDMI
audio works. After suspend and resume the HDMI audio continues working.

I also tested GL702VMK with GP106M [GeForce GTX 1060], with the proprietary
nvidia driver, HDMI audio now works and also after suspend/resume.

Also tested Asus UX550GE with GP107M [GeForce GTX 1050 Ti Mobile] with the
proprietary driver. This one could not be worked around with previous users=
pace
approaches (setpci, remove, rescan) because after remove/rescan the magic b=
it
had gone back to zero. But this new kernel approach works, the magic bit ge=
ts
stuck on and HDMI audio works. Also tested suspend/resume and it still work=
s.

Results look good, but I have 2 concerns:
 1. The proprietary nvidia driver does something special on these platforms=
 to
make the HDMI audio work after it has appeared. nouveau does not do this, so
this will not fix HDMI audio for nouveau users on some platforms, something
else is needed too.
 2. Do we understand why the underlying nvidia/windows design is like this =
in
the first place? I previously confirmed that Windows dynamically
enables/disables this magic bit based on presence of a HDMI display - i.e.
Windows does not do the approach being considered here which makes it
always-on. Is there a good reason for this that we're missing?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15211724960.e6FCAb7f.25263--

--===============1801363738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1801363738==--
