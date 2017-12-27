From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
	rescan
Date: Wed, 27 Dec 2017 17:35:20 +0000
Message-ID: <bug-75985-8800-oEZ6widccu@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1039974294=="
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


--===============1039974294==
Content-Type: multipart/alternative; boundary="15143961193.770C3Ead.6808";
 charset="UTF-8"


--15143961193.770C3Ead.6808
Date: Wed, 27 Dec 2017 17:35:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #25 from Daniel Drake <dan-LrsmPHowOvpd3aXB8m+yKQ@public.gmane.org> ---
I found the difference. When I previously tested and found HDMI audio to be
working after the setpci,unload,rescan approach, I was using the nvidia
proprietary driver. HDMI audio PCI device was then detected, the ELD files =
show
the monitor detected, and HDMI audio works.

In the patch above, I am using nouveau. The HDMI audio PCI device is now
detected automatically, the HDMI video output is working and active, but the
ELD files show that no HDMI monitor was detected on the audio side.

I checked with HDA verbs directly:
# hda-verb /dev/snd/hwC1D0 6 GET_PIN_SENSE 0

With the setpci+unload+rescan approach on nouveau, this always returns valu=
e 0,
even with HDMI video output active and working.

With the setpci+unload+rescan approach on nvidia's proprietary drivers, this
returns 0 after loading the modules. However upon starting X, it starts
returning 0xc0000000 and HDMI audio output works fine.

So in addition to the games with the magic register, the nvidia proprietary
driver is doing something else as well which is needed to make HDMI audio w=
ork.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15143961193.770C3Ead.6808
Date: Wed, 27 Dec 2017 17:35:19 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c25">Commen=
t # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dan&#64;reactivated.net" title=3D"Daniel Drake &lt;dan&#64;reactivated.net&=
gt;"> <span class=3D"fn">Daniel Drake</span></a>
</span></b>
        <pre>I found the difference. When I previously tested and found HDM=
I audio to be
working after the setpci,unload,rescan approach, I was using the nvidia
proprietary driver. HDMI audio PCI device was then detected, the ELD files =
show
the monitor detected, and HDMI audio works.

In the patch above, I am using nouveau. The HDMI audio PCI device is now
detected automatically, the HDMI video output is working and active, but the
ELD files show that no HDMI monitor was detected on the audio side.

I checked with HDA verbs directly:
# hda-verb /dev/snd/hwC1D0 6 GET_PIN_SENSE 0

With the setpci+unload+rescan approach on nouveau, this always returns valu=
e 0,
even with HDMI video output active and working.

With the setpci+unload+rescan approach on nvidia's proprietary drivers, this
returns 0 after loading the modules. However upon starting X, it starts
returning 0xc0000000 and HDMI audio output works fine.

So in addition to the games with the magic register, the nvidia proprietary
driver is doing something else as well which is needed to make HDMI audio w=
ork.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15143961193.770C3Ead.6808--

--===============1039974294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1039974294==--
