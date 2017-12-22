From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88272] [NVAC] Flickering screen on 1920x1080 monitor
 with 9400M in MacbookPro 5, 5
Date: Fri, 22 Dec 2017 16:42:36 +0000
Message-ID: <bug-88272-8800-sarTqACqR8@http.bugs.freedesktop.org/>
References: <bug-88272-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1769658297=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88272-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1769658297==
Content-Type: multipart/alternative; boundary="15139609560.d651bDe6.16460";
 charset="UTF-8"


--15139609560.d651bDe6.16460
Date: Fri, 22 Dec 2017 16:42:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D88272

--- Comment #12 from mbazzinotti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I've got great news! I believe certain members of #nouveau and I have found=
 a
fix!

`config=3DNvForcePost=3D1`

append appropriately to your modprobe statement or use
`nouveau.config=3DNvForcePost=3D1` in your kernel cmdline!

I will use this setting longer and report back on its effectiveness at a la=
ter
date.

=3D=3D Background Story =3D=3D

I noticed that screen flicker problems disappeared after waking from a
`pm-suspend`. After reporting this to #nouveau, some more light was shed. s=
ee
the following IRC snippet (more @
https://people.freedesktop.org/~cbrill/dri-log/index.php?channel=3Dnouveau&=
date=3D2017-12-22)

-- snip --
(regarding why pm-suspend solves the flicker bug)
15:58 imirkin: on resume we run the vbios scripts=20
15:58 imirkin: on boot, we probably don't because the vbios already has

16:02 imirkin: but it could be that the interpreter skimps on DP support an=
d so
some bits don't run=20
16:02 imirkin: or it could be something else entirely=20
-- end --

=3D=3D Tests =3D=3D

I have tested this new config option under the following scenarios

1) Boot with mDP adapter plugged in. OK
2) Boot without mDP adapter plugged in. Then, plug in after X has started. =
OK

Because it works without the mDP adapter being plugged in on boot, it's saf=
e to
say that no "mDP hint" at bootup is required to get some "optional" vbios c=
ode
to run. force POSTing is solving the problem, but we don't know why yet. Wh=
at
is happening differently from normal bootup by this force post?

Perhaps another 2 mmiotrace bootup logs would shed light on this, or someone
more familiar with gpu.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15139609560.d651bDe6.16460
Date: Fri, 22 Dec 2017 16:42:36 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9=
400M in MacbookPro 5,5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88272#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [NVAC] Flickering screen on 1920x1080 monitor with 9=
400M in MacbookPro 5,5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88272">bug 88272<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mbazzinotti&#64;gmail.com" title=3D"mbazzinotti&#64;gmail.com">mbazzinotti&=
#64;gmail.com</a>
</span></b>
        <pre>I've got great news! I believe certain members of #nouveau and=
 I have found a
fix!

`config=3DNvForcePost=3D1`

append appropriately to your modprobe statement or use
`nouveau.config=3DNvForcePost=3D1` in your kernel cmdline!

I will use this setting longer and report back on its effectiveness at a la=
ter
date.

=3D=3D Background Story =3D=3D

I noticed that screen flicker problems disappeared after waking from a
`pm-suspend`. After reporting this to #nouveau, some more light was shed. s=
ee
the following IRC snippet (more &#64;
<a href=3D"https://people.freedesktop.org/~cbrill/dri-log/index.php?channel=
=3Dnouveau&amp;date=3D2017-12-22">https://people.freedesktop.org/~cbrill/dr=
i-log/index.php?channel=3Dnouveau&amp;date=3D2017-12-22</a>)

-- snip --
(regarding why pm-suspend solves the flicker bug)
15:58 imirkin: on resume we run the vbios scripts=20
15:58 imirkin: on boot, we probably don't because the vbios already has

16:02 imirkin: but it could be that the interpreter skimps on DP support an=
d so
some bits don't run=20
16:02 imirkin: or it could be something else entirely=20
-- end --

=3D=3D Tests =3D=3D

I have tested this new config option under the following scenarios

1) Boot with mDP adapter plugged in. OK
2) Boot without mDP adapter plugged in. Then, plug in after X has started. =
OK

Because it works without the mDP adapter being plugged in on boot, it's saf=
e to
say that no &quot;mDP hint&quot; at bootup is required to get some &quot;op=
tional&quot; vbios code
to run. force POSTing is solving the problem, but we don't know why yet. Wh=
at
is happening differently from normal bootup by this force post?

Perhaps another 2 mmiotrace bootup logs would shed light on this, or someone
more familiar with gpu.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15139609560.d651bDe6.16460--

--===============1769658297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1769658297==--
