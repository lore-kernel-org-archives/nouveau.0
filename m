From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108047] No recognition of DVI-D monitor
Date: Mon, 08 Oct 2018 06:57:51 +0000
Message-ID: <bug-108047-8800-41wamyCxJj@http.bugs.freedesktop.org/>
References: <bug-108047-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0216254383=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108047-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0216254383==
Content-Type: multipart/alternative; boundary="15389818711.de00a8.15341"
Content-Transfer-Encoding: 7bit


--15389818711.de00a8.15341
Date: Mon, 8 Oct 2018 06:57:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108047

--- Comment #10 from Wolfgang <wolle321-KuiJ5kEpwI6ELgA04lAiVw@public.gmane.org> ---
Finally I got a workaround, with a lot of pain.
The problem, that Nouveau doesnt find my connected DVI-display still persis=
ts.

I tried to load a custom EDID-file from /lib/firmware/edid/.
This failed, it seems that the driver doesnt load EDID for "not connected"
displays. Forcing enabled DVI-D-1 didnt help too, I think the display is
enabled to late. But for those, who want to fix wrong EDID-Data this wight
work:

The kms-parameter was on older kernels:
drm_kms_helper.edid_firmware=3Dedid/your_custom_edid.bin
actually with newer kernels it is=20
drm.edid_firmware=3Dedid/your_custom_edid.bin

But the idea was not so bad: how to get correct EDID-data for my DVI-monito=
r:
I installed nvidia-driver (which freezes after 20 min but detects the monit=
ior
out of the box).
The same thing like under nouveau: only the LVDS-monitor EDID is found with
get-edid, but xrandr --verbose showed me the EDID of the DVI-Monitor (why?
thanks you xrandr!).
I wrote the EDID in a Hex-editor and parsed it with parse-edid. So I got the
definitely working modeline for 1920x1200 for my DVI-Monitor.
(It looks different from cvt-generated one, and I think the kernel uses the
same algorithm, when I force the resolution with kms video=3DDVI-D-1:1920x1=
200e,
which produced the 960x1200 monitor resolution with the 1920x1200 desktop
resolution behind).

So the final workaround back on nouveau is:=20
1.booting with video=3DDVI-D-1:e and starting up with 1024x768 kernel defau=
lt
resolution.=20
1.1 Also add a grub entry without enabling the DVI port because the LVDS do=
esnt
show the LightDM login dialog, when DVI is forced enabled but not plugged i=
n.
2.When logging in calling a script, what creates, adds and calls the right
modline (stolen from nvidia-driver) for my DVI-display.

Not very nice, but works.=20
Could you explain, why nouveu doesnt detect the DVI-monitor, but nvidia doe=
s?
Is this a bug?

Thanks to Ilia Mirkin, who how gave me some hints.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15389818711.de00a8.15341
Date: Mon, 8 Oct 2018 06:57:51 +0000
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
   title=3D"NEW - No recognition of DVI-D monitor"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108047#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - No recognition of DVI-D monitor"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108047">bug 10804=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wolle321&#64;freenet.de" title=3D"Wolfgang &lt;wolle321&#64;freenet.de&gt;"=
> <span class=3D"fn">Wolfgang</span></a>
</span></b>
        <pre>Finally I got a workaround, with a lot of pain.
The problem, that Nouveau doesnt find my connected DVI-display still persis=
ts.

I tried to load a custom EDID-file from /lib/firmware/edid/.
This failed, it seems that the driver doesnt load EDID for &quot;not connec=
ted&quot;
displays. Forcing enabled DVI-D-1 didnt help too, I think the display is
enabled to late. But for those, who want to fix wrong EDID-Data this wight
work:

The kms-parameter was on older kernels:
drm_kms_helper.edid_firmware=3Dedid/your_custom_edid.bin
actually with newer kernels it is=20
drm.edid_firmware=3Dedid/your_custom_edid.bin

But the idea was not so bad: how to get correct EDID-data for my DVI-monito=
r:
I installed nvidia-driver (which freezes after 20 min but detects the monit=
ior
out of the box).
The same thing like under nouveau: only the LVDS-monitor EDID is found with
get-edid, but xrandr --verbose showed me the EDID of the DVI-Monitor (why?
thanks you xrandr!).
I wrote the EDID in a Hex-editor and parsed it with parse-edid. So I got the
definitely working modeline for 1920x1200 for my DVI-Monitor.
(It looks different from cvt-generated one, and I think the kernel uses the
same algorithm, when I force the resolution with kms video=3DDVI-D-1:1920x1=
200e,
which produced the 960x1200 monitor resolution with the 1920x1200 desktop
resolution behind).

So the final workaround back on nouveau is:=20
1.booting with video=3DDVI-D-1:e and starting up with 1024x768 kernel defau=
lt
resolution.=20
1.1 Also add a grub entry without enabling the DVI port because the LVDS do=
esnt
show the LightDM login dialog, when DVI is forced enabled but not plugged i=
n.
2.When logging in calling a script, what creates, adds and calls the right
modline (stolen from nvidia-driver) for my DVI-display.

Not very nice, but works.=20
Could you explain, why nouveu doesnt detect the DVI-monitor, but nvidia doe=
s?
Is this a bug?

Thanks to Ilia Mirkin, who how gave me some hints.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15389818711.de00a8.15341--

--===============0216254383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0216254383==--
