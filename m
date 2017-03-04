From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99922] [NVE4] [regression,
 bisected] 4.10 (atomic): X shows black screen with cursor after
 monitors turn off
Date: Sat, 04 Mar 2017 07:38:36 +0000
Message-ID: <bug-99922-8800-SRtQyBm6es@http.bugs.freedesktop.org/>
References: <bug-99922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1952387328=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99922-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1952387328==
Content-Type: multipart/alternative; boundary="14886131163.Ba1d4aFc2.19842";
 charset="UTF-8"


--14886131163.Ba1d4aFc2.19842
Date: Sat, 4 Mar 2017 07:38:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99922

--- Comment #9 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ben Skeggs from comment #6)
> (In reply to kevin from comment #5)
> > Created attachment 129896 [details]
> > Normal Xorg logs on Linux 4.10 with xf86-video-modesetting
> >=20
> > Interestingly, the bug does not appear with the generic modesetting dri=
ver!
> > I've attached the Xorg log, but it seems normal.
>=20
> Yeah, the nouveau 2D driver doesn't handle page flips failing correctly f=
or
> some reason (this can happen under atomic when DPMS is set to a power-sav=
ing
> mode).
>=20
> I wasn't able to reproduce this with the nouveau DDX running in its
> (default) DRI2 mode, only DRI3, so I hadn't prioritized looking into it.

Lyude has posted a patch[1] which should address this issue.

Ben.

[1] https://lists.freedesktop.org/archives/nouveau/2017-March/027422.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14886131163.Ba1d4aFc2.19842
Date: Sat, 4 Mar 2017 07:38:36 +0000
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
   title=3D"NEW - [NVE4] [regression, bisected] 4.10 (atomic): X shows blac=
k screen with cursor after monitors turn off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99922#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE4] [regression, bisected] 4.10 (atomic): X shows blac=
k screen with cursor after monitors turn off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99922">bug 99922<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
skeggsb&#64;gmail.com" title=3D"Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> =
<span class=3D"fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to Ben Skeggs from <a href=3D"show_bug.cgi?id=3D9992=
2#c6">comment #6</a>)
<span class=3D"quote">&gt; (In reply to kevin from <a href=3D"show_bug.cgi?=
id=3D99922#c5">comment #5</a>)
&gt; &gt; Created <span class=3D""><a href=3D"attachment.cgi?id=3D129896" n=
ame=3D"attach_129896" title=3D"Normal Xorg logs on Linux 4.10 with xf86-vid=
eo-modesetting">attachment 129896</a> <a href=3D"attachment.cgi?id=3D129896=
&amp;action=3Dedit" title=3D"Normal Xorg logs on Linux 4.10 with xf86-video=
-modesetting">[details]</a></span>
&gt; &gt; Normal Xorg logs on Linux 4.10 with xf86-video-modesetting
&gt; &gt;=20
&gt; &gt; Interestingly, the bug does not appear with the generic modesetti=
ng driver!
&gt; &gt; I've attached the Xorg log, but it seems normal.
&gt;=20
&gt; Yeah, the nouveau 2D driver doesn't handle page flips failing correctl=
y for
&gt; some reason (this can happen under atomic when DPMS is set to a power-=
saving
&gt; mode).
&gt;=20
&gt; I wasn't able to reproduce this with the nouveau DDX running in its
&gt; (default) DRI2 mode, only DRI3, so I hadn't prioritized looking into i=
t.</span >

Lyude has posted a patch[1] which should address this issue.

Ben.

[1] <a href=3D"https://lists.freedesktop.org/archives/nouveau/2017-March/02=
7422.html">https://lists.freedesktop.org/archives/nouveau/2017-March/027422=
.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14886131163.Ba1d4aFc2.19842--

--===============1952387328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1952387328==--
