From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97588] Disconnecting/Reconnecting monitor results in
 'laggy' graphics and disappearing mouse cursor
Date: Sun, 04 Sep 2016 10:34:58 +0000
Message-ID: <bug-97588-8800-vhS7xe3zpM@http.bugs.freedesktop.org/>
References: <bug-97588-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1987842116=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97588-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1987842116==
Content-Type: multipart/alternative; boundary="14729852971.96EfA8.1865";
 charset="UTF-8"


--14729852971.96EfA8.1865
Date: Sun, 4 Sep 2016 10:34:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97588

--- Comment #14 from rik-2ntFt4fPDM4@public.gmane.org ---
Ok cool, I have a horrible work around! I installed Arandr, now if I discon=
nect
the monitor and reconnect, the graphics are screwed up (laggy and does not =
seem
to be updated).

If I then just do a ctrl-return in Arandr (apply settings) all is back to
normal.

Does this maybe give a clue of what happens? I wonder if there is a way of
connecting a script to the reconnect event to do this underwater. It ain't
pretty but at least it is somewhat workable.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14729852971.96EfA8.1865
Date: Sun, 4 Sep 2016 10:34:57 +0000
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
   title=3D"NEW - Disconnecting/Reconnecting monitor results in 'laggy' gra=
phics and disappearing mouse cursor"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97588#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Disconnecting/Reconnecting monitor results in 'laggy' gra=
phics and disappearing mouse cursor"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97588">bug 97588<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rik&#64;mief.nl" title=3D"rik&#64;mief.nl">rik&#64;mief.nl</a>
</span></b>
        <pre>Ok cool, I have a horrible work around! I installed Arandr, no=
w if I disconnect
the monitor and reconnect, the graphics are screwed up (laggy and does not =
seem
to be updated).

If I then just do a ctrl-return in Arandr (apply settings) all is back to
normal.

Does this maybe give a clue of what happens? I wonder if there is a way of
connecting a script to the reconnect event to do this underwater. It ain't
pretty but at least it is somewhat workable.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14729852971.96EfA8.1865--

--===============1987842116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1987842116==--
