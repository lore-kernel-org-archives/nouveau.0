From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100760] Rapid flickering when an app is placed on
 the second Nouveau ZaphodHeads display
Date: Sun, 23 Apr 2017 12:53:21 +0000
Message-ID: <bug-100760-8800-4K96iJU8hW@http.bugs.freedesktop.org/>
References: <bug-100760-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1345654770=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100760-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1345654770==
Content-Type: multipart/alternative; boundary="14929520000.c239928e.12093";
 charset="UTF-8"


--14929520000.c239928e.12093
Date: Sun, 23 Apr 2017 12:53:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100760

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
If you have a second machine you can ssh in from, I'd recommend taking MATE=
/etc
out of the equation.

What I mean by that is that on the target machine, start X by just running =
"X"
on the terminal. This should light up both screens but have a black backgro=
und
(as the old greyish mask was removed some time back). Then ssh in and run
DISPLAY=3D:0.1 xterm . If this doesn't work, that means that your second sc=
reen
(by which I mean X screen btw) is not set up properly. In such a case, plea=
se
provide your xorg log and xorg.conf.

Most people use Zaphod to merge heads from multiple GPUs into a single logi=
cal
screen with Xinerama. However I believe at least Mario Kleiner has, in the
past, tested something more akin to your use-case (and helped diagnose/fix
related bugs).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14929520000.c239928e.12093
Date: Sun, 23 Apr 2017 12:53:20 +0000
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
   title=3D"NEW - Rapid flickering when an app is placed on the second Nouv=
eau ZaphodHeads display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100760#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Rapid flickering when an app is placed on the second Nouv=
eau ZaphodHeads display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100760">bug 10076=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>If you have a second machine you can ssh in from, I'd recommen=
d taking MATE/etc
out of the equation.

What I mean by that is that on the target machine, start X by just running =
&quot;X&quot;
on the terminal. This should light up both screens but have a black backgro=
und
(as the old greyish mask was removed some time back). Then ssh in and run
DISPLAY=3D:0.1 xterm . If this doesn't work, that means that your second sc=
reen
(by which I mean X screen btw) is not set up properly. In such a case, plea=
se
provide your xorg log and xorg.conf.

Most people use Zaphod to merge heads from multiple GPUs into a single logi=
cal
screen with Xinerama. However I believe at least Mario Kleiner has, in the
past, tested something more akin to your use-case (and helped diagnose/fix
related bugs).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14929520000.c239928e.12093--

--===============1345654770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1345654770==--
