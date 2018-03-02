From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105319] DRM: EVO timeout with kernel 4.15.x
Date: Fri, 02 Mar 2018 00:01:14 +0000
Message-ID: <bug-105319-8800-1X0Js2K9GG@http.bugs.freedesktop.org/>
References: <bug-105319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1661745383=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1661745383==
Content-Type: multipart/alternative; boundary="15199488740.d0F5c.1321"
Content-Transfer-Encoding: 7bit


--15199488740.d0F5c.1321
Date: Fri, 2 Mar 2018 00:01:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105319

--- Comment #5 from S=C3=A9rgio M. Basto <sergio-iCFKjj3otdHQT0dZR+AlfA@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #4)
> (In reply to S=C3=A9rgio M. Basto from comment #3)
> > 01:00.0 VGA compatible controller: NVIDIA Corporation G98M [GeForce 930=
0M
> > GS] (rev a1)
>=20
> I meant more like what's connected to the card... screens and how they're
> hooked up.

sorry my previous comment was not a reply .
I have one laptop from 2007 , 2009 or so, (dual core dual with a good nvidi=
a at
the time )  it boots, it write boot log in vesa mode as usual , when switch
root and should load drm , it hangs ( when loading drm kernel module).=20=20

About bisect kernel , before that I tried just over and boot with kernel
4.1-rc3 [1], which also don't boot . I may try boot with=20
kernel-4.15.0-0.rc0.git3 [2]=20

It is not impossible I try bisect the kernel , but I don't build a kernel f=
or a
long time . The thing is I'm not the only one with problems with nvidia
/nouveau and kernel 4.15 . yeah also with nvidia drives it hangs .

[1]=20
https://fedoraproject.org/wiki/RawhideKernelNodebug

[2]
https://koji.fedoraproject.org/koji/buildinfo?buildID=3D999713

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15199488740.d0F5c.1321
Date: Fri, 2 Mar 2018 00:01:14 +0000
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
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319">bug 10531=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sergio&#64;serjux.com" title=3D"S=C3=A9rgio M. Basto &lt;sergio&#64;serjux.=
com&gt;"> <span class=3D"fn">S=C3=A9rgio M. Basto</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D105=
319#c4">comment #4</a>)
<span class=3D"quote">&gt; (In reply to S=C3=A9rgio M. Basto from <a href=
=3D"show_bug.cgi?id=3D105319#c3">comment #3</a>)
&gt; &gt; 01:00.0 VGA compatible controller: NVIDIA Corporation G98M [GeFor=
ce 9300M
&gt; &gt; GS] (rev a1)
&gt;=20
&gt; I meant more like what's connected to the card... screens and how they=
're
&gt; hooked up.</span >

sorry my previous comment was not a reply .
I have one laptop from 2007 , 2009 or so, (dual core dual with a good nvidi=
a at
the time )  it boots, it write boot log in vesa mode as usual , when switch
root and should load drm , it hangs ( when loading drm kernel module).=20=20

About bisect kernel , before that I tried just over and boot with kernel
4.1-rc3 [1], which also don't boot . I may try boot with=20
kernel-4.15.0-0.rc0.git3 [2]=20

It is not impossible I try bisect the kernel , but I don't build a kernel f=
or a
long time . The thing is I'm not the only one with problems with nvidia
/nouveau and kernel 4.15 . yeah also with nvidia drives it hangs .

[1]=20
<a href=3D"https://fedoraproject.org/wiki/RawhideKernelNodebug">https://fed=
oraproject.org/wiki/RawhideKernelNodebug</a>

[2]
<a href=3D"https://koji.fedoraproject.org/koji/buildinfo?buildID=3D999713">=
https://koji.fedoraproject.org/koji/buildinfo?buildID=3D999713</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15199488740.d0F5c.1321--

--===============1661745383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1661745383==--
