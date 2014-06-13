From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76483] [NV50, bisected,
 RFC patch] xset dpms force {on, off} does not work over DP
Date: Fri, 13 Jun 2014 07:56:41 +0000
Message-ID: <bug-76483-8800-c6Scrae1Pr@http.bugs.freedesktop.org/>
References: <bug-76483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1333935055=="
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


--===============1333935055==
Content-Type: multipart/alternative; boundary="1402646201.0bca3.2683"; charset="us-ascii"


--1402646201.0bca3.2683
Date: Fri, 13 Jun 2014 07:56:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D76483

--- Comment #8 from Damien Diederen <dd-IPhqJjDoDR/z1n+OaKNE4w@public.gmane.org> ---
(In reply to comment #5)

Hi Ilia, Ben,

I gave a shot at drm-next as of the following commit:

> commit bc1dfff04a5d4064ba0db1fab13f84ab4f333d2b
> Merge: c1a6e9f 1ae5a62
> Author: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date:   Wed Jun 11 16:28:10 2014 +1000
>=20
>     Merge branch 'drm-nouveau-next' of git://anongit.freedesktop.org/git/=
nouveau
>=20=20=20=20=20
>     display rework fixes lots of displayport issues.

I have been running that kernel for a large part of a work day, and, so
far, it has worked pretty well.

Many thanks!

Below are a couple remaining issues, none of which are blocking in my
case (GeForce 9400/DP/Dell U2711), but which may be worth investigating
if they also happen with other hardware combinations:

 1. The display does not wake up from (timed-out or forced) sleep on
    keypress or mouse move as it used to.  Activating the OSD menu wakes
    up the panel; Nouveau seems to pick that up as a hint to get going;

 2. The panel's backlight flickers very noticeably after a soft power
    cycle.  It also flickers, but less noticeably, after a hard unplug/
    re-plug.  Force-switching to an unconnected input source and back
    makes it stable again.

Let me know if there's any way I can assist you further.  In the
meantime, thanks again=E2=80=94it seems I'm not stuck with 3.8 anymore!

Cheers, -D

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1402646201.0bca3.2683
Date: Fri, 13 Jun 2014 07:56:41 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D76483#c8">Comment=
 # 8</a>
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
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D76483#c5">comment #5=
</a>)

Hi Ilia, Ben,

I gave a shot at drm-next as of the following commit:

<span class=3D"quote">&gt; commit bc1dfff04a5d4064ba0db1fab13f84ab4f333d2b
&gt; Merge: c1a6e9f 1ae5a62
&gt; Author: Dave Airlie &lt;<a href=3D"mailto:airlied&#64;redhat.com">airl=
ied&#64;redhat.com</a>&gt;
&gt; Date:   Wed Jun 11 16:28:10 2014 +1000
&gt;=20
&gt;     Merge branch 'drm-nouveau-next' of git://anongit.freedesktop.org/g=
it/nouveau
&gt;=20=20=20=20=20
&gt;     display rework fixes lots of displayport issues.</span >

I have been running that kernel for a large part of a work day, and, so
far, it has worked pretty well.

Many thanks!

Below are a couple remaining issues, none of which are blocking in my
case (GeForce 9400/DP/Dell U2711), but which may be worth investigating
if they also happen with other hardware combinations:

 1. The display does not wake up from (timed-out or forced) sleep on
    keypress or mouse move as it used to.  Activating the OSD menu wakes
    up the panel; Nouveau seems to pick that up as a hint to get going;

 2. The panel's backlight flickers very noticeably after a soft power
    cycle.  It also flickers, but less noticeably, after a hard unplug/
    re-plug.  Force-switching to an unconnected input source and back
    makes it stable again.

Let me know if there's any way I can assist you further.  In the
meantime, thanks again=E2=80=94it seems I'm not stuck with 3.8 anymore!

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

--1402646201.0bca3.2683--

--===============1333935055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1333935055==--
