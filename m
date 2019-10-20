From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 112070] H/W Acceleration sufficiently buggy on
 Debian to hard lock machine GeForce 7600 GO
Date: Sun, 20 Oct 2019 16:02:47 +0000
Message-ID: <bug-112070-8800-lLxxfYPwFD@http.bugs.freedesktop.org/>
References: <bug-112070-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0553005363=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-112070-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0553005363==
Content-Type: multipart/alternative; boundary="15715873672.A946F3BD.10901"
Content-Transfer-Encoding: 7bit


--15715873672.A946F3BD.10901
Date: Sun, 20 Oct 2019 16:02:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112070

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Doobz from comment #9)
> Does nouveau need any firmware for my card? I thought it didn't, but look=
ing
> here it appears it might.
> https://nouveau.freedesktop.org/wiki/VideoAcceleration/

It would need it for hypothetical VP1 support. However there is no software
support for the VP1 decoding engine, and according to all reports, it didn't
make anything actually faster (on Windows). The MPEG decoding engine should
work fine (via XvMC ... IIRC VDPAU didn't quite work, and XvMC is a better
match anyways).

This is all for accelerated video decoding, which is not in play for the vi=
deos
you're talking about.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15715873672.A946F3BD.10901
Date: Sun, 20 Oct 2019 16:02:47 +0000
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
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070">bug 11207=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Doobz from <a href=3D"show_bug.cgi?id=3D112070#c9=
">comment #9</a>)
<span class=3D"quote">&gt; Does nouveau need any firmware for my card? I th=
ought it didn't, but looking
&gt; here it appears it might.
&gt; <a href=3D"https://nouveau.freedesktop.org/wiki/VideoAcceleration/">ht=
tps://nouveau.freedesktop.org/wiki/VideoAcceleration/</a></span >

It would need it for hypothetical VP1 support. However there is no software
support for the VP1 decoding engine, and according to all reports, it didn't
make anything actually faster (on Windows). The MPEG decoding engine should
work fine (via XvMC ... IIRC VDPAU didn't quite work, and XvMC is a better
match anyways).

This is all for accelerated video decoding, which is not in play for the vi=
deos
you're talking about.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15715873672.A946F3BD.10901--

--===============0553005363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0553005363==--
