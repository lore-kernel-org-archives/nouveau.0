From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sat, 03 Mar 2018 14:55:42 +0000
Message-ID: <bug-75985-8800-5777vnGsGz@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2034978868=="
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


--===============2034978868==
Content-Type: multipart/alternative; boundary="15200889441.C80dae.15732"
Content-Transfer-Encoding: 7bit


--15200889441.C80dae.15732
Date: Sat, 3 Mar 2018 14:55:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #41 from Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> ---
(In reply to Maik Freudenberg from comment #39)
> Lukas, unconditionally enabling the nvidia hda shouldn't be done. In my
> case, having a "3D controller" meaning a dGPU without outputs this would
> lead to having a broken HDA device visible.

Hm, broken in what way? My expectation would be that it just reports all
connectors as disconnected. That might be irritating to some users, but oth=
er
than that I don't see a real downside. If the HDA controller is runtime
suspended to D3cold, power consumption is identical to the status quo ante.

But yes, just matching for PCI_CLASS_DISPLAY_VGA << 8 instead of
PCI_BASE_CLASS_DISPLAY << 16 would also work, assuming that vendors always =
got
this right and never used PCI_CLASS_DISPLAY_3D for a GPU with connectors.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15200889441.C80dae.15732
Date: Sat, 3 Mar 2018 14:55:44 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c41">Commen=
t # 41</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukas&#64;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <s=
pan class=3D"fn">Lukas Wunner</span></a>
</span></b>
        <pre>(In reply to Maik Freudenberg from <a href=3D"show_bug.cgi?id=
=3D75985#c39">comment #39</a>)
<span class=3D"quote">&gt; Lukas, unconditionally enabling the nvidia hda s=
houldn't be done. In my
&gt; case, having a &quot;3D controller&quot; meaning a dGPU without output=
s this would
&gt; lead to having a broken HDA device visible.</span >

Hm, broken in what way? My expectation would be that it just reports all
connectors as disconnected. That might be irritating to some users, but oth=
er
than that I don't see a real downside. If the HDA controller is runtime
suspended to D3cold, power consumption is identical to the status quo ante.

But yes, just matching for PCI_CLASS_DISPLAY_VGA &lt;&lt; 8 instead of
PCI_BASE_CLASS_DISPLAY &lt;&lt; 16 would also work, assuming that vendors a=
lways got
this right and never used PCI_CLASS_DISPLAY_3D for a GPU with connectors.</=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15200889441.C80dae.15732--

--===============2034978868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2034978868==--
