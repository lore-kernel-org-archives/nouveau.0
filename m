From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98609] Firefox right click corrupted with DRI3
Date: Sun, 06 Nov 2016 16:51:23 +0000
Message-ID: <bug-98609-8800-fsqgcUFSnZ@http.bugs.freedesktop.org/>
References: <bug-98609-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1314179477=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98609-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1314179477==
Content-Type: multipart/alternative; boundary="14784510830.E2c5C42F4.11218";
 charset="UTF-8"


--14784510830.E2c5C42F4.11218
Date: Sun, 6 Nov 2016 16:51:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98609

--- Comment #6 from Paviluf <jeremy9856-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Peter Wu from comment #1)
> Do you have a screenshot, Xorg/dmesg logs or anything more detailled?
>=20
> What hardware and software? Laptop/desktop?

I uploaded 3 screenshots that show the Firefox right click corrupted. I hap=
pen
on X11 and wayland. I can add that sometimes it can be all black or sometim=
es
(at least on wayland) it can be "colorized". You can also find a dmesg log.

I use desktop with a Nvidia GT430. That happen on Fedora 24 and 25. If you =
need
anything more just say it.

Oh, by the way I'm not sure that this other bug is reported at the right pl=
ace
? Mesa/DRI/Nouveau seem more appropriate to me.

https://bugs.freedesktop.org/show_bug.cgi?id=3D97462

Thank you !

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14784510830.E2c5C42F4.11218
Date: Sun, 6 Nov 2016 16:51:23 +0000
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
   title=3D"NEW - Firefox right click corrupted with DRI3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98609#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Firefox right click corrupted with DRI3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98609">bug 98609<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jeremy9856&#64;gmail.com" title=3D"Paviluf &lt;jeremy9856&#64;gmail.com&gt;=
"> <span class=3D"fn">Paviluf</span></a>
</span></b>
        <pre>(In reply to Peter Wu from <a href=3D"show_bug.cgi?id=3D98609#=
c1">comment #1</a>)
<span class=3D"quote">&gt; Do you have a screenshot, Xorg/dmesg logs or any=
thing more detailled?
&gt;=20
&gt; What hardware and software? Laptop/desktop?</span >

I uploaded 3 screenshots that show the Firefox right click corrupted. I hap=
pen
on X11 and wayland. I can add that sometimes it can be all black or sometim=
es
(at least on wayland) it can be &quot;colorized&quot;. You can also find a =
dmesg log.

I use desktop with a Nvidia GT430. That happen on Fedora 24 and 25. If you =
need
anything more just say it.

Oh, by the way I'm not sure that this other bug is reported at the right pl=
ace
? Mesa/DRI/Nouveau seem more appropriate to me.

<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Graphics deadlock &quot;ILLEGAL_MTHD&quot; in nouveau wit=
h mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5"
   href=3D"show_bug.cgi?id=3D97462">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D97462</a>

Thank you !</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14784510830.E2c5C42F4.11218--

--===============1314179477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1314179477==--
