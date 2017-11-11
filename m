From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
	rescan
Date: Sat, 11 Nov 2017 00:59:10 +0000
Message-ID: <bug-75985-8800-wIQRFqviLY@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0542668183=="
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


--===============0542668183==
Content-Type: multipart/alternative; boundary="15103619500.FCb61Aff.30873";
 charset="UTF-8"


--15103619500.FCb61Aff.30873
Date: Sat, 11 Nov 2017 00:59:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #20 from Maik Freudenberg <hhfeuer-Mmb7MZpHnFY@public.gmane.org> ---
(In reply to Denis Lisov from comment #19)
> Ready to test patches.
Try the workaround in
https://devtalk.nvidia.com/default/topic/1024022/linux/gtx-1060-no-audio-ov=
er-hdmi-only-hda-intel-detected-azalia/post/5211273/#5211273
for now.
Some implications met. Workaround seems to have effects/depends on ACPI,
backlight control not working, sleep/resume breaking audio, see same thread.
Most interesting issue met in
https://devtalk.nvidia.com/default/topic/1025831/linux/gtx-1060m-with-linux=
-no-hdmi-audio-device-/
Workaround there works on linux 4.4 but not on 4.9, turning acpi off makes
audio device appear on 4.9 without workaround.
Another green acpi hell needing kernel quirks?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15103619500.FCb61Aff.30873
Date: Sat, 11 Nov 2017 00:59:10 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c20">Commen=
t # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hhfeuer&#64;gmx.de" title=3D"Maik Freudenberg &lt;hhfeuer&#64;gmx.de&gt;"> =
<span class=3D"fn">Maik Freudenberg</span></a>
</span></b>
        <pre>(In reply to Denis Lisov from <a href=3D"show_bug.cgi?id=3D759=
85#c19">comment #19</a>)
<span class=3D"quote">&gt; Ready to test patches.</span >
Try the workaround in
<a href=3D"https://devtalk.nvidia.com/default/topic/1024022/linux/gtx-1060-=
no-audio-over-hdmi-only-hda-intel-detected-azalia/post/5211273/#5211273">ht=
tps://devtalk.nvidia.com/default/topic/1024022/linux/gtx-1060-no-audio-over=
-hdmi-only-hda-intel-detected-azalia/post/5211273/#5211273</a>
for now.
Some implications met. Workaround seems to have effects/depends on ACPI,
backlight control not working, sleep/resume breaking audio, see same thread.
Most interesting issue met in
<a href=3D"https://devtalk.nvidia.com/default/topic/1025831/linux/gtx-1060m=
-with-linux-no-hdmi-audio-device-/">https://devtalk.nvidia.com/default/topi=
c/1025831/linux/gtx-1060m-with-linux-no-hdmi-audio-device-/</a>
Workaround there works on linux 4.4 but not on 4.9, turning acpi off makes
audio device appear on 4.9 without workaround.
Another green acpi hell needing kernel quirks?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15103619500.FCb61Aff.30873--

--===============0542668183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0542668183==--
