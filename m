From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98582] A regression with nouveau under wayland+xorg:
 laptop doesn't resume properly from suspension
Date: Fri, 04 Nov 2016 23:49:04 +0000
Message-ID: <bug-98582-8800-otQzIeWqul@http.bugs.freedesktop.org/>
References: <bug-98582-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1399811104=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98582-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1399811104==
Content-Type: multipart/alternative; boundary="14783033430.B06D56d.4783";
 charset="UTF-8"


--14783033430.B06D56d.4783
Date: Fri, 4 Nov 2016 23:49:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98582

--- Comment #7 from hoboprimate-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Took a while to compile the 4.7 kernel :) (from fedora sources), and the
chipset was recognized with it (see attached log). Resuming from suspend al=
so
failed there.

Also attached acpidump output.

Also just realized, I have not been attaching *full* boot logs, i.e., up to=
 the
point it fails to wake from suspension. I will do that (right after this
comment) on the current 4.8.4 kernel.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14783033430.B06D56d.4783
Date: Fri, 4 Nov 2016 23:49:03 +0000
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
   title=3D"NEW - A regression with nouveau under wayland+xorg: laptop does=
n't resume properly from suspension"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98582#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - A regression with nouveau under wayland+xorg: laptop does=
n't resume properly from suspension"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98582">bug 98582<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hoboprimate&#64;gmail.com" title=3D"hoboprimate&#64;gmail.com">hoboprimate&=
#64;gmail.com</a>
</span></b>
        <pre>Took a while to compile the 4.7 kernel :) (from fedora sources=
), and the
chipset was recognized with it (see attached log). Resuming from suspend al=
so
failed there.

Also attached acpidump output.

Also just realized, I have not been attaching *full* boot logs, i.e., up to=
 the
point it fails to wake from suspension. I will do that (right after this
comment) on the current 4.8.4 kernel.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14783033430.B06D56d.4783--

--===============1399811104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1399811104==--
