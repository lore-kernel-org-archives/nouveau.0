From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93828] Xorg hangs randomly with nouveau driver
Date: Wed, 13 Sep 2017 15:24:59 +0000
Message-ID: <bug-93828-8800-OhHBQJ3y85@http.bugs.freedesktop.org/>
References: <bug-93828-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2083562158=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93828-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2083562158==
Content-Type: multipart/alternative; boundary="15053162991.23D41.29507";
 charset="UTF-8"


--15053162991.23D41.29507
Date: Wed, 13 Sep 2017 15:24:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93828

--- Comment #19 from BitPit-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org ---
The nouveau driver hangs with mythfrontend.  My system is a desktop intel i7
onboard graphics running kde plasma and a separate user (seat) running
mythfrontend directly on X (not kde) using an nvidia GT240   The allows me =
to
use my desktop system at the same time the TV is running mythtv in an adjac=
ent
room.  When the nouveau driver hangs it has no affect on the desktop system,
the last frame or menu remains static on the TV even after restarting the
mythfrontend application.

I can reliably cause the hang by stopping the video player using the remote
control then trying to stop it again before it completes the first stop.  I=
 see
the last frame of video and the remote no longer works.  Restarting the
mythfrontend application, as root on the desktop, blanks the screen then the
last frame of video is shown on the TV even though the application has not
started a player.  Restarting should display a menu, but once hung the pict=
ure
does not change.

I suspect the some internal registers or kernel data structures are not
finished being cleaned up and the second stop does not allow this to comple=
te.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15053162991.23D41.29507
Date: Wed, 13 Sep 2017 15:24:59 +0000
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
   title=3D"NEW - Xorg hangs randomly with nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93828#c19">Commen=
t # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg hangs randomly with nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93828">bug 93828<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
BitPit&#64;earthlink.net" title=3D"BitPit&#64;earthlink.net">BitPit&#64;ear=
thlink.net</a>
</span></b>
        <pre>The nouveau driver hangs with mythfrontend.  My system is a de=
sktop intel i7
onboard graphics running kde plasma and a separate user (seat) running
mythfrontend directly on X (not kde) using an nvidia GT240   The allows me =
to
use my desktop system at the same time the TV is running mythtv in an adjac=
ent
room.  When the nouveau driver hangs it has no affect on the desktop system,
the last frame or menu remains static on the TV even after restarting the
mythfrontend application.

I can reliably cause the hang by stopping the video player using the remote
control then trying to stop it again before it completes the first stop.  I=
 see
the last frame of video and the remote no longer works.  Restarting the
mythfrontend application, as root on the desktop, blanks the screen then the
last frame of video is shown on the TV even though the application has not
started a player.  Restarting should display a menu, but once hung the pict=
ure
does not change.

I suspect the some internal registers or kernel data structures are not
finished being cleaned up and the second stop does not allow this to comple=
te.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15053162991.23D41.29507--

--===============2083562158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2083562158==--
