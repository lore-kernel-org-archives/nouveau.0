From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104652] None of the video outputs are usable for GTX
 1060 - jerky video every few seconds
Date: Tue, 16 Jan 2018 12:17:48 +0000
Message-ID: <bug-104652-8800-ar4rA3FbY3@http.bugs.freedesktop.org/>
References: <bug-104652-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1090858020=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104652-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1090858020==
Content-Type: multipart/alternative; boundary="15161050681.5Bf5.27444"
Content-Transfer-Encoding: 7bit


--15161050681.5Bf5.27444
Date: Tue, 16 Jan 2018 12:17:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104652

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #2)
> Are you using xf86-video-nouveau or modesetting? If the latter, please try
> to use xf86-vidoe-nouveau.
>=20
> Frames showing out of order is a frequent issue when copying the contents=
 of
> the frame takes too long (and so the "old" frame being displayed actually
> ends up with "new" contents written over it). I have a hard time imagining
> that this would happen with -vo xv and xf86-video-nouveau, but who knows.

Oh, another way this comes up is if your CPU is too slow to decode the vide=
o --
the display thread thinks it has a "good" buffer, but it actually shows an =
old
frame. There's no video decoding acceleration in nouveau since the GM10x
family, so you're doing this all with CPU.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15161050681.5Bf5.27444
Date: Tue, 16 Jan 2018 12:17:48 +0000
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
   title=3D"NEW - None of the video outputs are usable for GTX 1060 - jerky=
 video every few seconds"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104652#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - None of the video outputs are usable for GTX 1060 - jerky=
 video every few seconds"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104652">bug 10465=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D104=
652#c2">comment #2</a>)
<span class=3D"quote">&gt; Are you using xf86-video-nouveau or modesetting?=
 If the latter, please try
&gt; to use xf86-vidoe-nouveau.
&gt;=20
&gt; Frames showing out of order is a frequent issue when copying the conte=
nts of
&gt; the frame takes too long (and so the &quot;old&quot; frame being displ=
ayed actually
&gt; ends up with &quot;new&quot; contents written over it). I have a hard =
time imagining
&gt; that this would happen with -vo xv and xf86-video-nouveau, but who kno=
ws.</span >

Oh, another way this comes up is if your CPU is too slow to decode the vide=
o --
the display thread thinks it has a &quot;good&quot; buffer, but it actually=
 shows an old
frame. There's no video decoding acceleration in nouveau since the GM10x
family, so you're doing this all with CPU.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15161050681.5Bf5.27444--

--===============1090858020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1090858020==--
