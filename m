From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105045] System freeze with nouveau
Date: Sun, 11 Feb 2018 19:56:02 +0000
Message-ID: <bug-105045-8800-LpXnzLMXIT@http.bugs.freedesktop.org/>
References: <bug-105045-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0813143257=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105045-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0813143257==
Content-Type: multipart/alternative; boundary="15183789620.fef0.29245"
Content-Transfer-Encoding: 7bit


--15183789620.fef0.29245
Date: Sun, 11 Feb 2018 19:56:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105045

--- Comment #8 from Sergey Tereschenko <serg.partizan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Sergey Tereschenko from comment #7)
> (In reply to Ilia Mirkin from comment #5)
> > (In reply to Sergey Tereschenko from comment #4)
> > > Can i just apply that patch to 17.3 or better build everything from g=
it?
> >=20
> > You can just apply it. There's other stuff that's gone in though... I w=
as
> > just pointing out one thing I did. A bunch of people had issues with 17=
.3
> > and resizing stuff as I recall... other things too. I'd basically recom=
mend
> > running mesa master -- mesa is not very good at backporting fixes. And
> > master's very rarely in a broken state.
>=20
> I found there is also 18.0.0-rc4, and looks like it almost recently relea=
sed.
> I just built it, it working but now i can't click anything with mouse nor
> gdm nor after login into gnome-shell.
>=20
> But under weston it is working.

Switching from wayland to xorg fixed issue with mouse in gnome. But issues =
with
xorg it is what get me to use nouveau+wayland (under xorg there is broken
keyboard switching using grp:shift_caps_switch).

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15183789620.fef0.29245
Date: Sun, 11 Feb 2018 19:56:02 +0000
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
   title=3D"NEW - System freeze with nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105045#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System freeze with nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105045">bug 10504=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
serg.partizan&#64;gmail.com" title=3D"Sergey Tereschenko &lt;serg.partizan&=
#64;gmail.com&gt;"> <span class=3D"fn">Sergey Tereschenko</span></a>
</span></b>
        <pre>(In reply to Sergey Tereschenko from <a href=3D"show_bug.cgi?i=
d=3D105045#c7">comment #7</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D105045#c5">comment #5</a>)
&gt; &gt; (In reply to Sergey Tereschenko from <a href=3D"show_bug.cgi?id=
=3D105045#c4">comment #4</a>)
&gt; &gt; &gt; Can i just apply that patch to 17.3 or better build everythi=
ng from git?
&gt; &gt;=20
&gt; &gt; You can just apply it. There's other stuff that's gone in though.=
.. I was
&gt; &gt; just pointing out one thing I did. A bunch of people had issues w=
ith 17.3
&gt; &gt; and resizing stuff as I recall... other things too. I'd basically=
 recommend
&gt; &gt; running mesa master -- mesa is not very good at backporting fixes=
. And
&gt; &gt; master's very rarely in a broken state.
&gt;=20
&gt; I found there is also 18.0.0-rc4, and looks like it almost recently re=
leased.
&gt; I just built it, it working but now i can't click anything with mouse =
nor
&gt; gdm nor after login into gnome-shell.
&gt;=20
&gt; But under weston it is working.</span >

Switching from wayland to xorg fixed issue with mouse in gnome. But issues =
with
xorg it is what get me to use nouveau+wayland (under xorg there is broken
keyboard switching using grp:shift_caps_switch).</pre>
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

--15183789620.fef0.29245--

--===============0813143257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0813143257==--
