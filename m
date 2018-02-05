From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100423] MMIO read of 00000000 FAULT at 022554 [ IBUS
 ]
Date: Mon, 05 Feb 2018 09:48:01 +0000
Message-ID: <bug-100423-8800-FCCZEGMxuk@http.bugs.freedesktop.org/>
References: <bug-100423-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2125136064=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100423-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2125136064==
Content-Type: multipart/alternative; boundary="15178240811.F9daA3.13082"
Content-Transfer-Encoding: 7bit


--15178240811.F9daA3.13082
Date: Mon, 5 Feb 2018 09:48:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

--- Comment #11 from Alex <alex-kas-KPKq5HT772e2XYtdXyGjWypxlwaOVQ5f@public.gmane.org> ---
Hi folks,
I have the very similar issue about drm, bus read FAULT, etc. However, my
problem is more severe than just red lines in dmesg.

I have ideapad 700 with HD Graphics 530 as the integrated and GeForce GTX 9=
50M
as the discrete card. I sit on gentoo with Linux-4.15.1.
The first point is that if I use nvidia drivers than my brightness buttons =
do
not work (not visible for anything). Summing this up with the total no need=
 of
a powerful graphics I decided to go to the bumblebee just in case I will in=
deed
need a better gpu in action. That is to fire up the discrete card on demand.

My problem is that upon starting some glx-aware program at the moment when
bumblebee is trying to start a separate hidden X server with nouveau as the
driver my primary X server restarts.
After this restart and in attempt to run some glx-aware program again I see=
 X
errors and nothing good. They boil down to the fact that drm cannot ecquire=
 an
access to card0 and card1 because of permission issues. Well, the primary X
server now does not restart though.

I tried all what bumblebee guys suggest - no way. Also, everything is smooth
with the nvidia driver in this config.

I think it is those red messages in dmesg are the primary indicator of my
troubles.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15178240811.F9daA3.13082
Date: Mon, 5 Feb 2018 09:48:01 +0000
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
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alex-kas&#64;privatecyberspace.net" title=3D"Alex &lt;alex-kas&#64;privatec=
yberspace.net&gt;"> <span class=3D"fn">Alex</span></a>
</span></b>
        <pre>Hi folks,
I have the very similar issue about drm, bus read FAULT, etc. However, my
problem is more severe than just red lines in dmesg.

I have ideapad 700 with HD Graphics 530 as the integrated and GeForce GTX 9=
50M
as the discrete card. I sit on gentoo with Linux-4.15.1.
The first point is that if I use nvidia drivers than my brightness buttons =
do
not work (not visible for anything). Summing this up with the total no need=
 of
a powerful graphics I decided to go to the bumblebee just in case I will in=
deed
need a better gpu in action. That is to fire up the discrete card on demand.

My problem is that upon starting some glx-aware program at the moment when
bumblebee is trying to start a separate hidden X server with nouveau as the
driver my primary X server restarts.
After this restart and in attempt to run some glx-aware program again I see=
 X
errors and nothing good. They boil down to the fact that drm cannot ecquire=
 an
access to card0 and card1 because of permission issues. Well, the primary X
server now does not restart though.

I tried all what bumblebee guys suggest - no way. Also, everything is smooth
with the nvidia driver in this config.

I think it is those red messages in dmesg are the primary indicator of my
troubles.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15178240811.F9daA3.13082--

--===============2125136064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2125136064==--
