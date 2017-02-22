From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99913] [G96] Reclocking fails on voltage
Date: Wed, 22 Feb 2017 19:31:27 +0000
Message-ID: <bug-99913-8800-gtSatHwgQd@http.bugs.freedesktop.org/>
References: <bug-99913-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0612301515=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99913-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0612301515==
Content-Type: multipart/alternative; boundary="14877918870.B7890.1392";
 charset="UTF-8"


--14877918870.B7890.1392
Date: Wed, 22 Feb 2017 19:31:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99913

--- Comment #4 from Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #2)
> Without looking at your VBIOS, I suspect if you first clock to 07 and then
> to 0f, you'll be able to get 07's core/shader speeds and the faster memory
> clock.

That's a good idea, and it indeed seems to be working. I ended up with:

03: core 169 MHz shader 338 MHz memory 100 MHz
05: core 275 MHz shader 550 MHz memory 300 MHz
07: core 400 MHz shader 800 MHz memory 300 MHz
0f: core 625 MHz shader 1563 MHz memory 800 MHz AC DC *
AC: core 400 MHz shader 800 MHz memory 799 MHz

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14877918870.B7890.1392
Date: Wed, 22 Feb 2017 19:31:27 +0000
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
   title=3D"NEW - [G96] Reclocking fails on voltage"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99913#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [G96] Reclocking fails on voltage"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99913">bug 99913<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ppaalanen&#64;gmail.com" title=3D"Pekka Paalanen &lt;ppaalanen&#64;gmail.co=
m&gt;"> <span class=3D"fn">Pekka Paalanen</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D999=
13#c2">comment #2</a>)
<span class=3D"quote">&gt; Without looking at your VBIOS, I suspect if you =
first clock to 07 and then
&gt; to 0f, you'll be able to get 07's core/shader speeds and the faster me=
mory
&gt; clock.</span >

That's a good idea, and it indeed seems to be working. I ended up with:

03: core 169 MHz shader 338 MHz memory 100 MHz
05: core 275 MHz shader 550 MHz memory 300 MHz
07: core 400 MHz shader 800 MHz memory 300 MHz
0f: core 625 MHz shader 1563 MHz memory 800 MHz AC DC *
AC: core 400 MHz shader 800 MHz memory 799 MHz</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14877918870.B7890.1392--

--===============0612301515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0612301515==--
