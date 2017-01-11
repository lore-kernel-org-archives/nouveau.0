From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94727] [NV30/NV40] nouveau/pushbuf.c:238:
 pushbuf_krel: Assertion `bkref` failed.
Date: Wed, 11 Jan 2017 15:49:47 +0000
Message-ID: <bug-94727-8800-TkXOU840la@http.bugs.freedesktop.org/>
References: <bug-94727-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1611168197=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94727-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1611168197==
Content-Type: multipart/alternative; boundary="14841497870.adF351.2144";
 charset="UTF-8"


--14841497870.adF351.2144
Date: Wed, 11 Jan 2017 15:49:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94727

--- Comment #15 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Olivier Fourdan from comment #14)
> The patch did not apply cleanly on top of 13.0.3 nor master though (in
> src/gallium/drivers/nouveau/nvc0/nvc0_query_hw.c line 406 [1]) so I chang=
ed
> "nouveau_pushbuf_space(push, 16, 2, 0);" to "nouveau_pushbuf_space(push, =
32,
> 3, 0);" to match the content of your patch, I hope this is right (sorry, =
I'm
> not familiar with this code).

Ah yeah, that sounds right. I have some local changes trying to fix that co=
de
(unsuccessfully). But that in no way affects your situation - the issue the=
re
is a functional one, not a crashing one.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14841497870.adF351.2144
Date: Wed, 11 Jan 2017 15:49:47 +0000
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
   title=3D"NEW - [NV30/NV40] nouveau/pushbuf.c:238: pushbuf_krel: Assertio=
n `bkref` failed."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94727#c15">Commen=
t # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV30/NV40] nouveau/pushbuf.c:238: pushbuf_krel: Assertio=
n `bkref` failed."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94727">bug 94727<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Olivier Fourdan from <a href=3D"show_bug.cgi?id=
=3D94727#c14">comment #14</a>)
<span class=3D"quote">&gt; The patch did not apply cleanly on top of 13.0.3=
 nor master though (in
&gt; src/gallium/drivers/nouveau/nvc0/nvc0_query_hw.c line 406 [1]) so I ch=
anged
&gt; &quot;nouveau_pushbuf_space(push, 16, 2, 0);&quot; to &quot;nouveau_pu=
shbuf_space(push, 32,
&gt; 3, 0);&quot; to match the content of your patch, I hope this is right =
(sorry, I'm
&gt; not familiar with this code).</span >

Ah yeah, that sounds right. I have some local changes trying to fix that co=
de
(unsuccessfully). But that in no way affects your situation - the issue the=
re
is a functional one, not a crashing one.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14841497870.adF351.2144--

--===============1611168197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1611168197==--
