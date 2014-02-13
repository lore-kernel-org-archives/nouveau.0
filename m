From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74903] [NV34] TV Load not detected in X
Date: Thu, 13 Feb 2014 16:25:04 +0000
Message-ID: <bug-74903-8800-iMpwlbnCnY@http.bugs.freedesktop.org/>
References: <bug-74903-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1933903956=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74903-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1933903956==
Content-Type: multipart/alternative; boundary="1392308704.efe346781.19064"; charset="us-ascii"


--1392308704.efe346781.19064
Date: Thu, 13 Feb 2014 16:25:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D74903

--- Comment #5 from Alexandre <alexandre.nunes-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #4)
> (In reply to comment #3)
> > I tried booting with param video=3DTV1:e as (poorly) documented way to =
force
>=20
> I think you want TV-1:e.
>=20

Sorry for the typo, I was using that. As I said, it makes drm/x sees the
display as existant, but with no video output. Perhaps there could be some
hooking between this higher layer and lower ones (eg. nv17_tv_detect) in or=
der
to maintain coherence. I say that because even tought this option didn't he=
lp,
after your suggestion, I was able to hack into nv17_tv_detect making it ret=
urn
connector_status_connected whenever it would return disconnected/unknown, a=
nd
it's working (for me=E2=84=A2).=20


> There's a nouveau.tv_disable which is listed as "Disable TV-out detection=
".
> I kind of assume it just ignores the outputs entirely, but who knows. You
> may want to peruse drivers/gpu/drm/nouveau/dispnv04/tvnv17.c:nv17_tv_dete=
ct
>=20
> It has special exceptions for a couple of cards with quirks. There's a way
> to return a "status unknown" -- try that?
>=20

Returning connector_status_unknown wasn't enough, but connected did the tri=
ck.

> But it's a little odd that it worked fine before -- what was the "before"
> kernel?


I'm not sure anymore, but it wasn't so ancient. 3.8.x perhaps. I'll leave t=
he
(dirty, bad mannered) patch attached just in case someone else as lazy as me
happens to find this report.=20

The patch doens't fix the issue, only works around it.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1392308704.efe346781.19064
Date: Thu, 13 Feb 2014 16:25:04 +0000
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
   title=3D"NEW --- - [NV34] TV Load not detected in X"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D74903#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV34] TV Load not detected in X"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D74903">bug 74903<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexandre.nunes&#64;gmail.com" title=3D"Alexandre &lt;alexandre.nunes&#64;g=
mail.com&gt;"> <span class=3D"fn">Alexandre</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D74903#c4">comment #4=
</a>)
<span class=3D"quote">&gt; (In reply to <a href=3D"show_bug.cgi?id=3D74903#=
c3">comment #3</a>)
&gt; &gt; I tried booting with param video=3DTV1:e as (poorly) documented w=
ay to force
&gt;=20
&gt; I think you want TV-1:e.
&gt; </span >

Sorry for the typo, I was using that. As I said, it makes drm/x sees the
display as existant, but with no video output. Perhaps there could be some
hooking between this higher layer and lower ones (eg. nv17_tv_detect) in or=
der
to maintain coherence. I say that because even tought this option didn't he=
lp,
after your suggestion, I was able to hack into nv17_tv_detect making it ret=
urn
connector_status_connected whenever it would return disconnected/unknown, a=
nd
it's working (for me=E2=84=A2).=20


<span class=3D"quote">&gt; There's a nouveau.tv_disable which is listed as =
&quot;Disable TV-out detection&quot;.
&gt; I kind of assume it just ignores the outputs entirely, but who knows. =
You
&gt; may want to peruse drivers/gpu/drm/nouveau/dispnv04/tvnv17.c:nv17_tv_d=
etect
&gt;=20
&gt; It has special exceptions for a couple of cards with quirks. There's a=
 way
&gt; to return a &quot;status unknown&quot; -- try that?
&gt; </span >

Returning connector_status_unknown wasn't enough, but connected did the tri=
ck.

<span class=3D"quote">&gt; But it's a little odd that it worked fine before=
 -- what was the &quot;before&quot;
&gt; kernel?</span >


I'm not sure anymore, but it wasn't so ancient. 3.8.x perhaps. I'll leave t=
he
(dirty, bad mannered) patch attached just in case someone else as lazy as me
happens to find this report.=20

The patch doens't fix the issue, only works around it.</pre>
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

--1392308704.efe346781.19064--

--===============1933903956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1933903956==--
