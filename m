From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101887] gtx 970 black screen
Date: Sun, 23 Jul 2017 21:57:14 +0000
Message-ID: <bug-101887-8800-c7AdJtahdi@http.bugs.freedesktop.org/>
References: <bug-101887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0483259723=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0483259723==
Content-Type: multipart/alternative; boundary="15008470330.68dDBAFC.11008";
 charset="UTF-8"


--15008470330.68dDBAFC.11008
Date: Sun, 23 Jul 2017 21:57:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101887

--- Comment #10 from fariouche-Qt13gs6zZMY@public.gmane.org ---
I'm may be too tired, I will go to sleep.
before that, here are the logs with 4.13.0 git kernel with skeggsb github
nouveau driver.

Hotplug hdmi does not blank the console anymore....
I can see in the logs that the DP display is correctly reporting the 4K
resolution in Xorg.log (good)

But, I still do not have any console on DP (no signal displayed by the moni=
tor)
and same for the HDMI TV.

Also, when starting xorg, (xfce4) I see nothing but a blank console, DP mon=
itor
switches on then off (so something is sent over the DP link that waked up t=
he
monitor)...
It's worse here, since I do not even see a brief desktop. And it is very lo=
ng
before  I can get the control over the console again (timeout?)
I'm uploading the logs now

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15008470330.68dDBAFC.11008
Date: Sun, 23 Jul 2017 21:57:13 +0000
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
   title=3D"NEW - gtx 970 black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101887#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gtx 970 black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101887">bug 10188=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fariouche&#64;yahoo.fr" title=3D"fariouche&#64;yahoo.fr">fariouche&#64;yaho=
o.fr</a>
</span></b>
        <pre>I'm may be too tired, I will go to sleep.
before that, here are the logs with 4.13.0 git kernel with skeggsb github
nouveau driver.

Hotplug hdmi does not blank the console anymore....
I can see in the logs that the DP display is correctly reporting the 4K
resolution in Xorg.log (good)

But, I still do not have any console on DP (no signal displayed by the moni=
tor)
and same for the HDMI TV.

Also, when starting xorg, (xfce4) I see nothing but a blank console, DP mon=
itor
switches on then off (so something is sent over the DP link that waked up t=
he
monitor)...
It's worse here, since I do not even see a brief desktop. And it is very lo=
ng
before  I can get the control over the console again (timeout?)
I'm uploading the logs now</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15008470330.68dDBAFC.11008--

--===============0483259723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0483259723==--
