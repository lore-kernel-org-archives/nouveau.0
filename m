From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103383] "xset dpms force on" does not unblank laptop
 screen after "xset dpms force off" is run (or system enters sleep mode)
Date: Fri, 06 Apr 2018 00:22:45 +0000
Message-ID: <bug-103383-8800-Wc2LHBWmQe@http.bugs.freedesktop.org/>
References: <bug-103383-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1642641810=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103383-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1642641810==
Content-Type: multipart/alternative; boundary="15229741652.caf27ddda.32217"
Content-Transfer-Encoding: 7bit


--15229741652.caf27ddda.32217
Date: Fri, 6 Apr 2018 00:22:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103383

--- Comment #3 from Bernhard Rosenkraenzer <bero-Qev7zP1q8vftRgLqZ5aouw@public.gmane.org> ---
This problem persists after fixing the backlight control problem (bug 10044=
6).

Turning the backlight all the way to 0 suspends the display to a state from
which it will wake up by adjusting brightness -- but after "xset dpms force
off", nothing (xset dpms force on or adjusting brightness up) brings the
display back to life.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15229741652.caf27ddda.32217
Date: Fri, 6 Apr 2018 00:22:45 +0000
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
   title=3D"NEW - &quot;xset dpms force on&quot; does not unblank laptop sc=
reen after &quot;xset dpms force off&quot; is run (or system enters sleep m=
ode)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103383#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - &quot;xset dpms force on&quot; does not unblank laptop sc=
reen after &quot;xset dpms force off&quot; is run (or system enters sleep m=
ode)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103383">bug 10338=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bero&#64;lindev.ch" title=3D"Bernhard Rosenkraenzer &lt;bero&#64;lindev.ch&=
gt;"> <span class=3D"fn">Bernhard Rosenkraenzer</span></a>
</span></b>
        <pre>This problem persists after fixing the backlight control probl=
em (<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Backlight control not working on Pascal / GP106 using nou=
veau drivers"
   href=3D"show_bug.cgi?id=3D100446">bug 100446</a>).

Turning the backlight all the way to 0 suspends the display to a state from
which it will wake up by adjusting brightness -- but after &quot;xset dpms =
force
off&quot;, nothing (xset dpms force on or adjusting brightness up) brings t=
he
display back to life.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15229741652.caf27ddda.32217--

--===============1642641810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1642641810==--
