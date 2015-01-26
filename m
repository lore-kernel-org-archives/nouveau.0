From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Mon, 26 Jan 2015 19:43:44 +0000
Message-ID: <bug-70354-8800-ypcrhxeibS@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1793579589=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1793579589==
Content-Type: multipart/alternative; boundary="1422301424.603a04.24955"; charset="UTF-8"


--1422301424.603a04.24955
Date: Mon, 26 Jan 2015 19:43:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D70354

--- Comment #51 from Richard <rich-2ZpFXoJyzMtkMtayTlHv3w@public.gmane.org> ---
(In reply to bruno.pagani from comment #47)
> OK, I think you=E2=80=99re the only one with a SLI=C2=A0laptop. Every one=
 else here seems
> to have an Intel+NVIDIA setup, without being able to deactivate Intel.
I wouldn't say he's the only one... I have the same setup myself (comment 2=
3).
I have noted that the nouveau module loads reliably with no patches since at
least kernel 3.16.x (well after my original post), but it does go nuts when=
ever
I do anything with opengl. I haven't attempted to capture logs when it does
this - it shoots the CPU up to near 100% and becomes nearly unresponsive. I
usually have to shut it down hard to recover (and I'm careful now to only l=
oad
the nvidia driver when I intend to do opengl, and nouveau at all other time=
s).

(Not related to this bug: I haven't been able to get it to fire up with SLI
enabled (even with nvidia driver) outside of windows. Vitaly, was there
anything special you had to do to get SLI working on your Y510P?)

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1422301424.603a04.24955
Date: Mon, 26 Jan 2015 19:43:44 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn=
't help"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70354#c51">Commen=
t # 51</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn=
't help"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70354">bug 70354<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rich&#64;warfaresdl.com" title=3D"Richard &lt;rich&#64;warfaresdl.com&gt;">=
 <span class=3D"fn">Richard</span></a>
</span></b>
        <pre>(In reply to bruno.pagani from <a href=3D"show_bug.cgi?id=3D70=
354#c47">comment #47</a>)
<span class=3D"quote">&gt; OK, I think you=E2=80=99re the only one with a S=
LI=C2=A0laptop. Every one else here seems
&gt; to have an Intel+NVIDIA setup, without being able to deactivate Intel.=
</span >
I wouldn't say he's the only one... I have the same setup myself (<a href=
=3D"show_bug.cgi?id=3D70354#c23">comment 23</a>).
I have noted that the nouveau module loads reliably with no patches since at
least kernel 3.16.x (well after my original post), but it does go nuts when=
ever
I do anything with opengl. I haven't attempted to capture logs when it does
this - it shoots the CPU up to near 100% and becomes nearly unresponsive. I
usually have to shut it down hard to recover (and I'm careful now to only l=
oad
the nvidia driver when I intend to do opengl, and nouveau at all other time=
s).

(Not related to this bug: I haven't been able to get it to fire up with SLI
enabled (even with nvidia driver) outside of windows. Vitaly, was there
anything special you had to do to get SLI working on your Y510P?)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422301424.603a04.24955--

--===============1793579589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1793579589==--
