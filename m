From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105117] desktop freeze playing video nouveau:
 DATA_ERROR INVALID_BITFIELD
Date: Mon, 29 Oct 2018 02:32:56 +0000
Message-ID: <bug-105117-8800-CIEVBLreAz@http.bugs.freedesktop.org/>
References: <bug-105117-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1329372446=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105117-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1329372446==
Content-Type: multipart/alternative; boundary="15407803750.dd0bd9Eb.24203"
Content-Transfer-Encoding: 7bit


--15407803750.dd0bd9Eb.24203
Date: Mon, 29 Oct 2018 02:32:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105117

--- Comment #3 from rcoe-TsGEh1ee8XYAvxtiuMwx3w@public.gmane.org ---
I added the environment variable=20
export WEBKIT_DISABLE_COMPOSITING_MODE=3D1
and I tested running videos.
I ran several videos without issue where before the X server would hang but=
 the
mouse would still move.
I see WebKitWebProcess is using wayland, and it is multi-threaded.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15407803750.dd0bd9Eb.24203
Date: Mon, 29 Oct 2018 02:32:55 +0000
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
   title=3D"NEW - desktop freeze playing video nouveau: DATA_ERROR INVALID_=
BITFIELD"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105117#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - desktop freeze playing video nouveau: DATA_ERROR INVALID_=
BITFIELD"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105117">bug 10511=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rcoe&#64;wi.rr.com" title=3D"rcoe&#64;wi.rr.com">rcoe&#64;wi.rr.com</a>
</span></b>
        <pre>I added the environment variable=20
export WEBKIT_DISABLE_COMPOSITING_MODE=3D1
and I tested running videos.
I ran several videos without issue where before the X server would hang but=
 the
mouse would still move.
I see WebKitWebProcess is using wayland, and it is multi-threaded.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15407803750.dd0bd9Eb.24203--

--===============1329372446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1329372446==--
