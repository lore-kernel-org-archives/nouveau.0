From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79820] [NVE6] Strange readout on fan1_input when
	pwm1_min < 33
Date: Mon, 09 Jun 2014 16:27:53 +0000
Message-ID: <bug-79820-8800-qpyUVRgz0O@http.bugs.freedesktop.org/>
References: <bug-79820-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1487985681=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79820-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1487985681==
Content-Type: multipart/alternative; boundary="1402331273.CB8eABF31.11962"; charset="us-ascii"


--1402331273.CB8eABF31.11962
Date: Mon, 9 Jun 2014 16:27:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D79820

--- Comment #3 from freedesk.apriori-w1QkCcy0X+BxKfgMtfWJuA@public.gmane.org ---
The noise didn=E2=80=99t really noticeably increase. And I just checked the=
 values
reported by nvidia-settings. When idle, these always seem to jump in increm=
ents
of 30 RPM (usually between 1050 and 1080). With nouveau, the output value j=
umps
in increments of 60 RPM, so you are probably right and the difference is on=
ly
nominal.

In any case, I=E2=80=99m attaching the BIOS file obtained from nvagetbios -=
s prom. No
warnings were reported this time.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1402331273.CB8eABF31.11962
Date: Mon, 9 Jun 2014 16:27:53 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE6] Strange readout on fan1_input when pwm1_min &l=
t; 33"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D79820#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE6] Strange readout on fan1_input when pwm1_min &l=
t; 33"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D79820">bug 79820<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesk.apriori&#64;spamgourmet.com" title=3D"freedesk.apriori&#64;spamgou=
rmet.com">freedesk.apriori&#64;spamgourmet.com</a>
</span></b>
        <pre>The noise didn=E2=80=99t really noticeably increase. And I jus=
t checked the values
reported by nvidia-settings. When idle, these always seem to jump in increm=
ents
of 30 RPM (usually between 1050 and 1080). With nouveau, the output value j=
umps
in increments of 60 RPM, so you are probably right and the difference is on=
ly
nominal.

In any case, I=E2=80=99m attaching the BIOS file obtained from nvagetbios -=
s prom. No
warnings were reported this time.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402331273.CB8eABF31.11962--

--===============1487985681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1487985681==--
