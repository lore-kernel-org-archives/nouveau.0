From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 112070] H/W Acceleration sufficiently buggy on
 Debian to hard lock machine GeForce 7600 GO
Date: Sat, 19 Oct 2019 19:44:17 +0000
Message-ID: <bug-112070-8800-FEYeQNVTjG@http.bugs.freedesktop.org/>
References: <bug-112070-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0778258740=="
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


--===============0778258740==
Content-Type: multipart/alternative; boundary="15715142560.ca1B.22019"
Content-Transfer-Encoding: 7bit


--15715142560.ca1B.22019
Date: Sat, 19 Oct 2019 19:44:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112070

--- Comment #8 from Doobz <dooby.dave-J1btbF6uMEmsTnJN9+BGXg@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #7)
> (In reply to Doobz from comment #6)
> > (In reply to Ilia Mirkin from comment #5)
> > > (In reply to Doobz from comment #4)
> > > > It is a feature that used to work on the hardware, and now doesn't,=
 and I
> > > > have a hunch the reason for the proprietary driver not installing p=
roperly
> > > > is related.
> > >=20
> > > Sorry, I have no idea what a 360 degree video is. Can you tell me mor=
e about
> > > how one might go about reproducing the issue?
> >=20
> > Videos you can rotate the viewing direction with the mouse while they p=
lay.
> > Search 360 video on YouTube.
>=20
> How are you playing these back? Chrome blacklists nouveau for accel, I do=
ubt
> the nv4b you have provides high enough GL for firefox to do anything too
> useful...

Just with the default browser. Firefox and maybe Iceweael.

I have a laptop with a GF 8200 gpu, and it does not exhibit this bug. I don=
't
believe it has any h/w acceleration enabled tbh and didn't display a desktop
after trying to install the 340xx driver, but that's probably a subject for=
 a
different bug report.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15715142560.ca1B.22019
Date: Sat, 19 Oct 2019 19:44:16 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070">bug 11207=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dooby.dave&#64;virgin.net" title=3D"Doobz &lt;dooby.dave&#64;virgin.net&gt;=
"> <span class=3D"fn">Doobz</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D112=
070#c7">comment #7</a>)
<span class=3D"quote">&gt; (In reply to Doobz from <a href=3D"show_bug.cgi?=
id=3D112070#c6">comment #6</a>)
&gt; &gt; (In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D112070=
#c5">comment #5</a>)
&gt; &gt; &gt; (In reply to Doobz from <a href=3D"show_bug.cgi?id=3D112070#=
c4">comment #4</a>)
&gt; &gt; &gt; &gt; It is a feature that used to work on the hardware, and =
now doesn't, and I
&gt; &gt; &gt; &gt; have a hunch the reason for the proprietary driver not =
installing properly
&gt; &gt; &gt; &gt; is related.
&gt; &gt; &gt;=20
&gt; &gt; &gt; Sorry, I have no idea what a 360 degree video is. Can you te=
ll me more about
&gt; &gt; &gt; how one might go about reproducing the issue?
&gt; &gt;=20
&gt; &gt; Videos you can rotate the viewing direction with the mouse while =
they play.
&gt; &gt; Search 360 video on YouTube.
&gt;=20
&gt; How are you playing these back? Chrome blacklists nouveau for accel, I=
 doubt
&gt; the nv4b you have provides high enough GL for firefox to do anything t=
oo
&gt; useful...</span >

Just with the default browser. Firefox and maybe Iceweael.

I have a laptop with a GF 8200 gpu, and it does not exhibit this bug. I don=
't
believe it has any h/w acceleration enabled tbh and didn't display a desktop
after trying to install the 340xx driver, but that's probably a subject for=
 a
different bug report.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15715142560.ca1B.22019--

--===============0778258740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0778258740==--
