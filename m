From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103383] "xset dpms force on" does not unblank laptop
 screen after "xset dpms force off" is run (or system enters sleep mode)
Date: Sat, 21 Oct 2017 22:00:26 +0000
Message-ID: <bug-103383-8800-YWVi1ES3tR@http.bugs.freedesktop.org/>
References: <bug-103383-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0960130892=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103383-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0960130892==
Content-Type: multipart/alternative; boundary="15086232261.D2Bb.22255";
 charset="UTF-8"


--15086232261.D2Bb.22255
Date: Sat, 21 Oct 2017 22:00:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103383

--- Comment #2 from marko <techau-sFbbPxZDHXw0n/F98K4Iww@public.gmane.org> ---
Thx, if any additional details / logs are needed from my end, I am here.=20

This issue also affects live ISOs (at least the ones that include the updat=
ed
nouveau package that support GTX 10xx cards). What happens is, the Live ISO
starts, it enters Xorg and the laptop screen turns off...

I can see things via the external monitors but my primary screen (the lapto=
p's
display) is off so it's quite annoying. The option nomodeset works but when=
 in
use it doesn't detect the external monitors so it's one or the other! :(

So annoying, I hope someone can fix this.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15086232261.D2Bb.22255
Date: Sat, 21 Oct 2017 22:00:26 +0000
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
   title=3D"NEW - &quot;xset dpms force on&quot; does not unblank laptop sc=
reen after &quot;xset dpms force off&quot; is run (or system enters sleep m=
ode)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103383#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - &quot;xset dpms force on&quot; does not unblank laptop sc=
reen after &quot;xset dpms force off&quot; is run (or system enters sleep m=
ode)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103383">bug 10338=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
techau&#64;optusnet.com.au" title=3D"marko &lt;techau&#64;optusnet.com.au&g=
t;"> <span class=3D"fn">marko</span></a>
</span></b>
        <pre>Thx, if any additional details / logs are needed from my end, =
I am here.=20

This issue also affects live ISOs (at least the ones that include the updat=
ed
nouveau package that support GTX 10xx cards). What happens is, the Live ISO
starts, it enters Xorg and the laptop screen turns off...

I can see things via the external monitors but my primary screen (the lapto=
p's
display) is off so it's quite annoying. The option nomodeset works but when=
 in
use it doesn't detect the external monitors so it's one or the other! :(

So annoying, I hope someone can fix this.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15086232261.D2Bb.22255--

--===============0960130892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0960130892==--
