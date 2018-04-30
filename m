From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106324] Sporadic freezes under load with Chromium
Date: Mon, 30 Apr 2018 17:45:11 +0000
Message-ID: <bug-106324-8800-Q2nqM1I5om@http.bugs.freedesktop.org/>
References: <bug-106324-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1926778983=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-106324-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1926778983==
Content-Type: multipart/alternative; boundary="15251103112.725eb4f5B.19323"
Content-Transfer-Encoding: 7bit


--15251103112.725eb4f5B.19323
Date: Mon, 30 Apr 2018 17:45:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106324

--- Comment #1 from Darek <dz1125.bug.tracker-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This [1] patch prevents random xserver freezes
tested:
GPU GTX 550Ti
mesa 18.1.0rc2
xorg-server 1.19.99.905
xf86-video-nouveau-git 1.0.15.r5.gac8f7b9
DRI3 enabled

I noted the same behavior with:
mesa 18.0.1-1
xorg-server 1.19.6+13+gd0d1a694f-2
xf86-video-nouveau-git 1.0.15.r5.gac8f7b9
DRI3 enabled

[1] https://patchwork.freedesktop.org/series/41258/ (rev 4)

I'm not sure if it is related, but it's worth mentioning

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15251103112.725eb4f5B.19323
Date: Mon, 30 Apr 2018 17:45:11 +0000
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
   title=3D"NEW - Sporadic freezes under load with Chromium"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106324#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sporadic freezes under load with Chromium"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106324">bug 10632=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dz1125.bug.tracker&#64;gmail.com" title=3D"Darek &lt;dz1125.bug.tracker&#64=
;gmail.com&gt;"> <span class=3D"fn">Darek</span></a>
</span></b>
        <pre>This [1] patch prevents random xserver freezes
tested:
GPU GTX 550Ti
mesa 18.1.0rc2
xorg-server 1.19.99.905
xf86-video-nouveau-git 1.0.15.r5.gac8f7b9
DRI3 enabled

I noted the same behavior with:
mesa 18.0.1-1
xorg-server 1.19.6+13+gd0d1a694f-2
xf86-video-nouveau-git 1.0.15.r5.gac8f7b9
DRI3 enabled

[1] <a href=3D"https://patchwork.freedesktop.org/series/41258/">https://pat=
chwork.freedesktop.org/series/41258/</a> (rev 4)

I'm not sure if it is related, but it's worth mentioning</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15251103112.725eb4f5B.19323--

--===============1926778983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1926778983==--
