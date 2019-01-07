From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109230] [crash] Xorg is crashing on startup with
 enabled xinerama
Date: Mon, 07 Jan 2019 07:42:07 +0000
Message-ID: <bug-109230-8800-T8jYW4D6Cc@http.bugs.freedesktop.org/>
References: <bug-109230-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1779013929=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-109230-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1779013929==
Content-Type: multipart/alternative; boundary="15468469271.a9c81Ae.28418"
Content-Transfer-Encoding: 7bit


--15468469271.a9c81Ae.28418
Date: Mon, 7 Jan 2019 07:42:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109230

--- Comment #4 from Mariusz Bia=C5=82o=C5=84czyk <manio-RFXG7K41k5GsTnJN9+BGXg@public.gmane.org> ---
Hi Ilia,
> Do you have a debug symbols package you could install? Or perhaps build
> xf86-video-nouveau yourself?
yes - I installed it, but the line:
"unw_get_proc_name failed: no unwind info found"
was still there, so I compiled nouveau myself and installed with debug symb=
ols
but it doesn't help to full unwind, so finally I compiled whole xorg+debug
symbols and complete unwind still doesn't happen.
Isn't it that this unwind is for some libc calls which is irrelevant?
I am attaching new backtrace from console output.

> Also, to eliminate some potential complications -- try commenting out the
> RADEON bit and ensure that it keeps failing. (Not that that shouldn't wor=
k,
> but good to know for debugging purposes.)
No, it is not failing with nouveau alone (and commented radeon driver).

I was also trying to disable xinerama (with radeon+nouveau) - then it is al=
so
not failing. It seems this is triggering only with enabled xinerama and both
radeon and nouveau drivers loaded.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15468469271.a9c81Ae.28418
Date: Mon, 7 Jan 2019 07:42:07 +0000
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
   title=3D"NEW - [crash] Xorg is crashing on startup with enabled xinerama"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109230#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [crash] Xorg is crashing on startup with enabled xinerama"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109230">bug 10923=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
manio&#64;skyboo.net" title=3D"Mariusz Bia=C5=82o=C5=84czyk &lt;manio&#64;s=
kyboo.net&gt;"> <span class=3D"fn">Mariusz Bia=C5=82o=C5=84czyk</span></a>
</span></b>
        <pre>Hi Ilia,
<span class=3D"quote">&gt; Do you have a debug symbols package you could in=
stall? Or perhaps build
&gt; xf86-video-nouveau yourself?</span >
yes - I installed it, but the line:
&quot;unw_get_proc_name failed: no unwind info found&quot;
was still there, so I compiled nouveau myself and installed with debug symb=
ols
but it doesn't help to full unwind, so finally I compiled whole xorg+debug
symbols and complete unwind still doesn't happen.
Isn't it that this unwind is for some libc calls which is irrelevant?
I am attaching new backtrace from console output.

<span class=3D"quote">&gt; Also, to eliminate some potential complications =
-- try commenting out the
&gt; RADEON bit and ensure that it keeps failing. (Not that that shouldn't =
work,
&gt; but good to know for debugging purposes.)</span >
No, it is not failing with nouveau alone (and commented radeon driver).

I was also trying to disable xinerama (with radeon+nouveau) - then it is al=
so
not failing. It seems this is triggering only with enabled xinerama and both
radeon and nouveau drivers loaded.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15468469271.a9c81Ae.28418--

--===============1779013929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1779013929==--
