From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Thu, 01 Mar 2018 10:42:30 +0000
Message-ID: <bug-75985-8800-YxvcQbeMA0@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0768704644=="
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


--===============0768704644==
Content-Type: multipart/alternative; boundary="15199009501.687CF4c.21819"
Content-Transfer-Encoding: 7bit


--15199009501.687CF4c.21819
Date: Thu, 1 Mar 2018 10:42:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #36 from Maik Freudenberg <hhfeuer-Mmb7MZpHnFY@public.gmane.org> ---
I don't know about the current state of this, I would put some effort into =
it
if nobody else is working on it. Daniel Drake's patch is a good starting po=
int
for that.
Currently, it looks like the problem lies in that the audio dev is only ever
looked after on nouveau drm module load. Instead, the state of it should be
checked/toggled on
- connector connected/disconected
- poweron/off the corresponding gpu
e.g remove the audio dev on suspend if it has been previously enabled, on
resume check if any connector is connected that needs it and enabled it aga=
in
in that case.
This would also work around the quirks of some laptop's acpi toggling the b=
it
either on boot [1] or on suspend [2].
Desktop cards should not be affected by that because they start with audio =
dev
enabled, so it will not be touched.
Quirks will have to be added for nForce chipsets with IGP since those have a
separate audio dev.

BTW, the kernel module has moved to:
https://github.com/hhfeuer/nvhda


[1]
https://devtalk.nvidia.com/default/topic/1024022/linux/gtx-1060-no-audio-ov=
er-hdmi-only-hda-intel-detected-azalia/post/5228002/#5228002
[2]
https://devtalk.nvidia.com/default/topic/1024022/linux/gtx-1060-no-audio-ov=
er-hdmi-only-hda-intel-detected-azalia/post/5234127/#5234127

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15199009501.687CF4c.21819
Date: Thu, 1 Mar 2018 10:42:30 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c36">Commen=
t # 36</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hhfeuer&#64;gmx.de" title=3D"Maik Freudenberg &lt;hhfeuer&#64;gmx.de&gt;"> =
<span class=3D"fn">Maik Freudenberg</span></a>
</span></b>
        <pre>I don't know about the current state of this, I would put some=
 effort into it
if nobody else is working on it. Daniel Drake's patch is a good starting po=
int
for that.
Currently, it looks like the problem lies in that the audio dev is only ever
looked after on nouveau drm module load. Instead, the state of it should be
checked/toggled on
- connector connected/disconected
- poweron/off the corresponding gpu
e.g remove the audio dev on suspend if it has been previously enabled, on
resume check if any connector is connected that needs it and enabled it aga=
in
in that case.
This would also work around the quirks of some laptop's acpi toggling the b=
it
either on boot [1] or on suspend [2].
Desktop cards should not be affected by that because they start with audio =
dev
enabled, so it will not be touched.
Quirks will have to be added for nForce chipsets with IGP since those have a
separate audio dev.

BTW, the kernel module has moved to:
<a href=3D"https://github.com/hhfeuer/nvhda">https://github.com/hhfeuer/nvh=
da</a>


[1]
<a href=3D"https://devtalk.nvidia.com/default/topic/1024022/linux/gtx-1060-=
no-audio-over-hdmi-only-hda-intel-detected-azalia/post/5228002/#5228002">ht=
tps://devtalk.nvidia.com/default/topic/1024022/linux/gtx-1060-no-audio-over=
-hdmi-only-hda-intel-detected-azalia/post/5228002/#5228002</a>
[2]
<a href=3D"https://devtalk.nvidia.com/default/topic/1024022/linux/gtx-1060-=
no-audio-over-hdmi-only-hda-intel-detected-azalia/post/5234127/#5234127">ht=
tps://devtalk.nvidia.com/default/topic/1024022/linux/gtx-1060-no-audio-over=
-hdmi-only-hda-intel-detected-azalia/post/5234127/#5234127</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15199009501.687CF4c.21819--

--===============0768704644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0768704644==--
