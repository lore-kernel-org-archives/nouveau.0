From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109371] Textures seem to be byteswapped on big
 endian architectures
Date: Sat, 19 Jan 2019 20:31:58 +0000
Message-ID: <bug-109371-8800-HSBpcVAoGK@http.bugs.freedesktop.org/>
References: <bug-109371-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1758521130=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-109371-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1758521130==
Content-Type: multipart/alternative; boundary="15479299180.9dd12EbD.15121"
Content-Transfer-Encoding: 7bit


--15479299180.9dd12EbD.15121
Date: Sat, 19 Jan 2019 20:31:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109371

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Unfortunately it appears that my G5 is dead. It half-booted once (died right
around nfsroot load time). Then for a bit it would turn on, with fans going=
 but
no light and no chime. Now the fans don't even turn on. So I think that's t=
he
end.

The things I would have done:

1. Check whether the textures look OK in qapitrace's inspector
2. Look at the transfer methods being used (in nv30_transfer.c). Try commen=
ting
some out, although that can also lead to failures.
3. Try to create a simple program based on the apitrace which reproduces the
issue, and debug it step by step, to figure out where the byteswap might be
happening.

A few bits of info:

The GPUs are LE deep down inside. However they have BE modes which byteswap
"some stuff". So like MMIO accesses, FIFO commands, etc. So they can still =
be
packed like integers as usual, without an extra byteswap, and the GPU will
"take care of it". I don't have a clean idea of whether and how byteswapping
happens between GART and VRAM, as well as in various "blit"/copy methods, w=
here
the byteswap would be different depending on whether it's u8, u16, or u32
datatype. This is most relevant to index buffers though, not textures. [Like
let's say you're feeding the data via FIFO commands, there's an implicit
byteswap there, etc.]

Have a look at nv30_format.c for the supported texture formats/etc.

As always, feel free to ask stuff in #nouveau.

It should be noted that with a patch to apitrace
(https://github.com/apitrace/apitrace/issues/601#issuecomment-455019551), t=
he
attached trace replays fine on both nv42 and nv34 on x86.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15479299180.9dd12EbD.15121
Date: Sat, 19 Jan 2019 20:31:58 +0000
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
   title=3D"NEW - Textures seem to be byteswapped on big endian architectur=
es"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109371#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Textures seem to be byteswapped on big endian architectur=
es"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109371">bug 10937=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Unfortunately it appears that my G5 is dead. It half-booted on=
ce (died right
around nfsroot load time). Then for a bit it would turn on, with fans going=
 but
no light and no chime. Now the fans don't even turn on. So I think that's t=
he
end.

The things I would have done:

1. Check whether the textures look OK in qapitrace's inspector
2. Look at the transfer methods being used (in nv30_transfer.c). Try commen=
ting
some out, although that can also lead to failures.
3. Try to create a simple program based on the apitrace which reproduces the
issue, and debug it step by step, to figure out where the byteswap might be
happening.

A few bits of info:

The GPUs are LE deep down inside. However they have BE modes which byteswap
&quot;some stuff&quot;. So like MMIO accesses, FIFO commands, etc. So they =
can still be
packed like integers as usual, without an extra byteswap, and the GPU will
&quot;take care of it&quot;. I don't have a clean idea of whether and how b=
yteswapping
happens between GART and VRAM, as well as in various &quot;blit&quot;/copy =
methods, where
the byteswap would be different depending on whether it's u8, u16, or u32
datatype. This is most relevant to index buffers though, not textures. [Like
let's say you're feeding the data via FIFO commands, there's an implicit
byteswap there, etc.]

Have a look at nv30_format.c for the supported texture formats/etc.

As always, feel free to ask stuff in #nouveau.

It should be noted that with a patch to apitrace
(<a href=3D"https://github.com/apitrace/apitrace/issues/601#issuecomment-45=
5019551">https://github.com/apitrace/apitrace/issues/601#issuecomment-45501=
9551</a>), the
attached trace replays fine on both nv42 and nv34 on x86.</pre>
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

--15479299180.9dd12EbD.15121--

--===============1758521130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1758521130==--
