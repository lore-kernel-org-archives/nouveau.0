From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97065] memory leak under Xwayland with old sdl1
	applications
Date: Sun, 24 Jul 2016 21:16:34 +0000
Message-ID: <bug-97065-8800-cvUlmDrj7b@http.bugs.freedesktop.org/>
References: <bug-97065-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0795022831=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97065-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0795022831==
Content-Type: multipart/alternative; boundary="14693949930.Bf6D.16894";
 charset="UTF-8"


--14693949930.Bf6D.16894
Date: Sun, 24 Jul 2016 21:16:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97065

--- Comment #6 from Hussam Al-Tayeb <me-rYJ0iO+mrgIiq3RsQ1AnAw@public.gmane.org> ---
(In reply to Link Mauve from comment #5)
> Hi again Hussam, please also run xrestop and report whether something
> actually increases there.

I tried that. Xwayland's memory usage increases without an increase in pixm=
aps
memory count according to xrestop.
Simply using a sdl1, or gtk2 application or firefox slowly makes Xwayland
memory usage increase.

When I close firefox, the total pixmap memory usage according to xrestop
decreases but xwayland never frees memory. It seems to just use more as I u=
se
my computer.
Switching windows sometimes causes an increase. It even suddenly used 200k =
more
while I switched between gnome-terminal and firefox.

In either case, the reading according to xrestop seems to be stable. No
increases there unless I open more applications.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14693949930.Bf6D.16894
Date: Sun, 24 Jul 2016 21:16:33 +0000
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
   title=3D"NEW - memory leak under Xwayland with old sdl1 applications"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97065#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - memory leak under Xwayland with old sdl1 applications"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97065">bug 97065<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
me&#64;hussam.eu.org" title=3D"Hussam Al-Tayeb &lt;me&#64;hussam.eu.org&gt;=
"> <span class=3D"fn">Hussam Al-Tayeb</span></a>
</span></b>
        <pre>(In reply to Link Mauve from <a href=3D"show_bug.cgi?id=3D9706=
5#c5">comment #5</a>)
<span class=3D"quote">&gt; Hi again Hussam, please also run xrestop and rep=
ort whether something
&gt; actually increases there.</span >

I tried that. Xwayland's memory usage increases without an increase in pixm=
aps
memory count according to xrestop.
Simply using a sdl1, or gtk2 application or firefox slowly makes Xwayland
memory usage increase.

When I close firefox, the total pixmap memory usage according to xrestop
decreases but xwayland never frees memory. It seems to just use more as I u=
se
my computer.
Switching windows sometimes causes an increase. It even suddenly used 200k =
more
while I switched between gnome-terminal and firefox.

In either case, the reading according to xrestop seems to be stable. No
increases there unless I open more applications.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14693949930.Bf6D.16894--

--===============0795022831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0795022831==--
