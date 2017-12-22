From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
	rescan
Date: Fri, 22 Dec 2017 19:15:41 +0000
Message-ID: <bug-75985-8800-UsizgL5Ord@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1205719160=="
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


--===============1205719160==
Content-Type: multipart/alternative; boundary="15139701422.3ad2bBc5.18833";
 charset="UTF-8"


--15139701422.3ad2bBc5.18833
Date: Fri, 22 Dec 2017 19:15:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #22 from Daniel Drake <dan-LrsmPHowOvpd3aXB8m+yKQ@public.gmane.org> ---
Created attachment 136369
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136369&action=3Dedit
GP104: enable HDMI audio device function

On Asus GL502VS I investigated why the gfx device must be removed before re=
scan
in the above workarounds.

The reason is that when Linux first probes the device (before you attempt t=
he
workaround), pci_setup_device() notes that the device is not multifunction
capable. This causes pci_scan_slot() to not bother scanning the non-zero
functions (per the behaviour inside next_fn()).

I checked and I found that when the 0x488 magic bit is not set, the gfx dev=
ice
advertises as non-multifunction. After the bit is set, the device advertise=
s as
multi-function. So, after setting the magic bit, removing the device will c=
ause
Linux to re-probe it during the next rescan, taking note at that point that=
 it
is a multi-function device, and proceeding to scan the functions, finding t=
he
audio device at function 1.

Based on that I have a first attempt at a fix. It's not working though, aud=
io
output is silent (but I did have it working with the previous workarounds).
I'll look closer next week.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15139701422.3ad2bBc5.18833
Date: Fri, 22 Dec 2017 19:15:42 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c22">Commen=
t # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dan&#64;reactivated.net" title=3D"Daniel Drake &lt;dan&#64;reactivated.net&=
gt;"> <span class=3D"fn">Daniel Drake</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136369=
" name=3D"attach_136369" title=3D"GP104: enable HDMI audio device function"=
>attachment 136369</a> <a href=3D"attachment.cgi?id=3D136369&amp;action=3De=
dit" title=3D"GP104: enable HDMI audio device function">[details]</a></span=
> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D75985&amp;attachment=3D1=
36369'>[review]</a>
GP104: enable HDMI audio device function

On Asus GL502VS I investigated why the gfx device must be removed before re=
scan
in the above workarounds.

The reason is that when Linux first probes the device (before you attempt t=
he
workaround), pci_setup_device() notes that the device is not multifunction
capable. This causes pci_scan_slot() to not bother scanning the non-zero
functions (per the behaviour inside next_fn()).

I checked and I found that when the 0x488 magic bit is not set, the gfx dev=
ice
advertises as non-multifunction. After the bit is set, the device advertise=
s as
multi-function. So, after setting the magic bit, removing the device will c=
ause
Linux to re-probe it during the next rescan, taking note at that point that=
 it
is a multi-function device, and proceeding to scan the functions, finding t=
he
audio device at function 1.

Based on that I have a first attempt at a fix. It's not working though, aud=
io
output is silent (but I did have it working with the previous workarounds).
I'll look closer next week.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15139701422.3ad2bBc5.18833--

--===============1205719160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1205719160==--
