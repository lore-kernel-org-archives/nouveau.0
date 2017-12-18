From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
	rescan
Date: Mon, 18 Dec 2017 16:06:55 +0000
Message-ID: <bug-75985-8800-r5Ttzd7xFt@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0860105968=="
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


--===============0860105968==
Content-Type: multipart/alternative; boundary="15136132151.C2C3.14537";
 charset="UTF-8"


--15136132151.C2C3.14537
Date: Mon, 18 Dec 2017 16:06:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #21 from Daniel Drake <dan-LrsmPHowOvpd3aXB8m+yKQ@public.gmane.org> ---
I checked the behaviour under Windows and it appears that Windows is doing =
the
above-mentioned PCI config space write when a HDMI cable is plugged in. I'm
fairly sure that this is done "natively" by the windows driver (not in ACPI
stuff). More info:
https://devtalk.nvidia.com/default/topic/1024022/linux/gtx-1060-no-audio-ov=
er-hdmi-only-hda-intel-detected-azalia/post/5227504/#5227504

What would be the best way to implement this in nouveau? I'm unsure about t=
he
conditions we would want to do this under. Maybe something like:
 1. nouveau is driving the HDMI output using its own display controller, and
 2. HDMI cable is connected? (or maybe we enable HDMI audio all the time li=
ke
other platforms?)
 3. Only on GTX1060/GTX1070 which are the only cards where the 0x448 regist=
er
write has been confirmed to work?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15136132151.C2C3.14537
Date: Mon, 18 Dec 2017 16:06:55 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c21">Commen=
t # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dan&#64;reactivated.net" title=3D"Daniel Drake &lt;dan&#64;reactivated.net&=
gt;"> <span class=3D"fn">Daniel Drake</span></a>
</span></b>
        <pre>I checked the behaviour under Windows and it appears that Wind=
ows is doing the
above-mentioned PCI config space write when a HDMI cable is plugged in. I'm
fairly sure that this is done &quot;natively&quot; by the windows driver (n=
ot in ACPI
stuff). More info:
<a href=3D"https://devtalk.nvidia.com/default/topic/1024022/linux/gtx-1060-=
no-audio-over-hdmi-only-hda-intel-detected-azalia/post/5227504/#5227504">ht=
tps://devtalk.nvidia.com/default/topic/1024022/linux/gtx-1060-no-audio-over=
-hdmi-only-hda-intel-detected-azalia/post/5227504/#5227504</a>

What would be the best way to implement this in nouveau? I'm unsure about t=
he
conditions we would want to do this under. Maybe something like:
 1. nouveau is driving the HDMI output using its own display controller, and
 2. HDMI cable is connected? (or maybe we enable HDMI audio all the time li=
ke
other platforms?)
 3. Only on GTX1060/GTX1070 which are the only cards where the 0x448 regist=
er
write has been confirmed to work?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15136132151.C2C3.14537--

--===============0860105968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0860105968==--
