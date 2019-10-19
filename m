From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 112070] H/W Acceleration sufficiently buggy on
 Debian to hard lock machine GeForce 7600 GO
Date: Sat, 19 Oct 2019 19:31:53 +0000
Message-ID: <bug-112070-8800-DrEQGcxHDh@http.bugs.freedesktop.org/>
References: <bug-112070-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0420164385=="
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


--===============0420164385==
Content-Type: multipart/alternative; boundary="15715135121.c86B0.19475"
Content-Transfer-Encoding: 7bit


--15715135121.c86B0.19475
Date: Sat, 19 Oct 2019 19:31:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112070

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Doobz from comment #6)
> (In reply to Ilia Mirkin from comment #5)
> > (In reply to Doobz from comment #4)
> > > It is a feature that used to work on the hardware, and now doesn't, a=
nd I
> > > have a hunch the reason for the proprietary driver not installing pro=
perly
> > > is related.
> >=20
> > Sorry, I have no idea what a 360 degree video is. Can you tell me more =
about
> > how one might go about reproducing the issue?
>=20
> Videos you can rotate the viewing direction with the mouse while they pla=
y.
> Search 360 video on YouTube.

How are you playing these back? Chrome blacklists nouveau for accel, I doubt
the nv4b you have provides high enough GL for firefox to do anything too
useful...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15715135121.c86B0.19475
Date: Sat, 19 Oct 2019 19:31:52 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070#c7">Commen=
t # 7</a>
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
        <pre>(In reply to Doobz from <a href=3D"show_bug.cgi?id=3D112070#c6=
">comment #6</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D112070#c5">comment #5</a>)
&gt; &gt; (In reply to Doobz from <a href=3D"show_bug.cgi?id=3D112070#c4">c=
omment #4</a>)
&gt; &gt; &gt; It is a feature that used to work on the hardware, and now d=
oesn't, and I
&gt; &gt; &gt; have a hunch the reason for the proprietary driver not insta=
lling properly
&gt; &gt; &gt; is related.
&gt; &gt;=20
&gt; &gt; Sorry, I have no idea what a 360 degree video is. Can you tell me=
 more about
&gt; &gt; how one might go about reproducing the issue?
&gt;=20
&gt; Videos you can rotate the viewing direction with the mouse while they =
play.
&gt; Search 360 video on YouTube.</span >

How are you playing these back? Chrome blacklists nouveau for accel, I doubt
the nv4b you have provides high enough GL for firefox to do anything too
useful...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15715135121.c86B0.19475--

--===============0420164385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0420164385==--
