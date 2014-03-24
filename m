From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76483] [NV50, bisected,
 RFC patch] xset dpms force {on, off} does not work over DP
Date: Mon, 24 Mar 2014 09:21:25 +0000
Message-ID: <bug-76483-8800-hOQCsyuCa5@http.bugs.freedesktop.org/>
References: <bug-76483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1891659292=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76483-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1891659292==
Content-Type: multipart/alternative; boundary="1395652884.dfbA1.31711"; charset="us-ascii"


--1395652884.dfbA1.31711
Date: Mon, 24 Mar 2014 09:21:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D76483

--- Comment #2 from Damien Diederen <dd-IPhqJjDoDR/z1n+OaKNE4w@public.gmane.org> ---
Created attachment 96281
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D96281&action=3Dedit
[WIP,BROKEN] drm/nv50: Hack FORCE_DP_TRAIN method for DPMS  power-on

Hi Ben,

Excellent!  (FYI: I, for one, don't need any backports.)

In the meantime, I tried to kludge my way into getting the monitor to
wake up with another horrible hack (attached), but did not succeed
before running out of time.  Any idea?

I understand that both patches suffer from the race condition you were
trying to avoid in the first place, but an always on/off monitor is a
bit of a handicap :)

Alternatively/in addition, I would welcome hints on how to make Nouveau
survive power-cycling the monitor (e.g. by running a command over SSH to
reset the display).  The current behaviour is:

             [On, displaying]
                    =E2=86=93           Turn off
                  [Off]
                    =E2=86=93           Turn on
                [Booting]
                    =E2=8B=AE
      [OSD: No input; shutting down]
                    =E2=8B=AE
                [Standby]

Of course, feel free to suggest proper fixes, docs to read, and/or
patches to test.

Cheers, -D

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1395652884.dfbA1.31711
Date: Mon, 24 Mar 2014 09:21:24 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} =
does not work over DP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D76483#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} =
does not work over DP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D76483">bug 76483<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dd&#64;crosstwine.com" title=3D"Damien Diederen &lt;dd&#64;crosstwine.com&g=
t;"> <span class=3D"fn">Damien Diederen</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D96281"=
 name=3D"attach_96281" title=3D"[WIP,BROKEN] drm/nv50: Hack FORCE_DP_TRAIN =
method for DPMS  power-on">attachment 96281</a> <a href=3D"attachment.cgi?i=
d=3D96281&amp;action=3Dedit" title=3D"[WIP,BROKEN] drm/nv50: Hack FORCE_DP_=
TRAIN method for DPMS  power-on">[details]</a></span> <a href=3D'page.cgi?i=
d=3Dsplinter.html&amp;bug=3D76483&amp;attachment=3D96281'>[review]</a>
[WIP,BROKEN] drm/nv50: Hack FORCE_DP_TRAIN method for DPMS  power-on

Hi Ben,

Excellent!  (FYI: I, for one, don't need any backports.)

In the meantime, I tried to kludge my way into getting the monitor to
wake up with another horrible hack (attached), but did not succeed
before running out of time.  Any idea?

I understand that both patches suffer from the race condition you were
trying to avoid in the first place, but an always on/off monitor is a
bit of a handicap :)

Alternatively/in addition, I would welcome hints on how to make Nouveau
survive power-cycling the monitor (e.g. by running a command over SSH to
reset the display).  The current behaviour is:

             [On, displaying]
                    =E2=86=93           Turn off
                  [Off]
                    =E2=86=93           Turn on
                [Booting]
                    =E2=8B=AE
      [OSD: No input; shutting down]
                    =E2=8B=AE
                [Standby]

Of course, feel free to suggest proper fixes, docs to read, and/or
patches to test.

Cheers, -D</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395652884.dfbA1.31711--

--===============1891659292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1891659292==--
