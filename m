From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Tue, 24 Apr 2018 20:27:10 +0000
Message-ID: <bug-75985-8800-MbPyu6MOQ5@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1815468783=="
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


--===============1815468783==
Content-Type: multipart/alternative; boundary="15246016304.Ed3AF.3392"
Content-Transfer-Encoding: 7bit


--15246016304.Ed3AF.3392
Date: Tue, 24 Apr 2018 20:27:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #70 from Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> ---
How the audio and video drivers interact is described a bit in [1]: The aud=
io
function and the graphics function work hand-in-hand to provide audio suppo=
rt.
At modeset time, the graphics driver extracts information from the display's
EDID and the mode timings and sticks it into registers in the graphics
function. These get processed by the hardware and spit out the other side v=
ia
the "EDID-Like Data" fields in the audio function, described in [2].

I'm not completely sure how this works on Windows, but my understanding is =
that
the display driver enables or disables the audio function at modeset time, =
and
Windows handles that as a PCI hot-plug or -unplug, loading or unloading the
audio driver as necessary. On Linux, I think the nouveau and nvidia-modeset
drivers would need to call into some hypothetical new audio power module to
coordinate that, so the kernel can know when to rescan or remove the audio
device.

[1]
https://download.nvidia.com/XFree86/gpu-hdmi-audio-document/#_driver_archit=
ecture
[2]
https://www.intel.com/content/www/us/en/standards/high-definition-audio-spe=
cification.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15246016304.Ed3AF.3392
Date: Tue, 24 Apr 2018 20:27:10 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c70">Commen=
t # 70</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
aplattner&#64;nvidia.com" title=3D"Aaron Plattner &lt;aplattner&#64;nvidia.=
com&gt;"> <span class=3D"fn">Aaron Plattner</span></a>
</span></b>
        <pre>How the audio and video drivers interact is described a bit in=
 [1]: The audio
function and the graphics function work hand-in-hand to provide audio suppo=
rt.
At modeset time, the graphics driver extracts information from the display's
EDID and the mode timings and sticks it into registers in the graphics
function. These get processed by the hardware and spit out the other side v=
ia
the &quot;EDID-Like Data&quot; fields in the audio function, described in [=
2].

I'm not completely sure how this works on Windows, but my understanding is =
that
the display driver enables or disables the audio function at modeset time, =
and
Windows handles that as a PCI hot-plug or -unplug, loading or unloading the
audio driver as necessary. On Linux, I think the nouveau and nvidia-modeset
drivers would need to call into some hypothetical new audio power module to
coordinate that, so the kernel can know when to rescan or remove the audio
device.

[1]
<a href=3D"https://download.nvidia.com/XFree86/gpu-hdmi-audio-document/#_dr=
iver_architecture">https://download.nvidia.com/XFree86/gpu-hdmi-audio-docum=
ent/#_driver_architecture</a>
[2]
<a href=3D"https://www.intel.com/content/www/us/en/standards/high-definitio=
n-audio-specification.html">https://www.intel.com/content/www/us/en/standar=
ds/high-definition-audio-specification.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15246016304.Ed3AF.3392--

--===============1815468783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1815468783==--
