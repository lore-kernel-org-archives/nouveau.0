From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94637] system crash, no messages, GT215,
 ubuntu 16.04 when running glmark2 for a few minutes.
Date: Thu, 19 May 2016 21:03:51 +0000
Message-ID: <bug-94637-8800-84YLtJQOaU@http.bugs.freedesktop.org/>
References: <bug-94637-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1869202295=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94637-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1869202295==
Content-Type: multipart/alternative; boundary="14636918310.8681feF8.25652";
 charset="UTF-8"


--14636918310.8681feF8.25652
Date: Thu, 19 May 2016 21:03:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94637

--- Comment #13 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Just that single line? That=E2=80=99s sad=E2=80=A6
Which version of Mesa are you using?

What happen if you boot with `nouveau.config=3DNvForcePost=3D1` on the kern=
el
command line, and start Minecraft or glmark2 without doing any suspend/resu=
me
in between booting and starting the application? Probably more far fetched,=
 but
what happens if you reclock to a higher clock before starting the applicati=
on?

* On 4.4, boot with nouveau.pstate=3D1 on the kernel command line, and run =
`echo
XX > /sys/class/drm/card0/device/pstate` as root, where XX is a performance
level; you can find the different performance level available on your card =
by
cat=E2=80=99ing that file.
* On 4.5+, run `echo XX > /sys/kernel/debug/dri/0/pstate` as root, where XX=
 is
a performance level; you can find the different performance level available=
 on
your card by cat=E2=80=99ing that file.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14636918310.8681feF8.25652
Date: Thu, 19 May 2016 21:03:51 +0000
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
   title=3D"NEW - system crash, no messages, GT215, ubuntu 16.04 when runni=
ng glmark2 for a few minutes."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94637#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - system crash, no messages, GT215, ubuntu 16.04 when runni=
ng glmark2 for a few minutes."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94637">bug 94637<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>Just that single line? That=E2=80=99s sad=E2=80=A6
Which version of Mesa are you using?

What happen if you boot with `nouveau.config=3DNvForcePost=3D1` on the kern=
el
command line, and start Minecraft or glmark2 without doing any suspend/resu=
me
in between booting and starting the application? Probably more far fetched,=
 but
what happens if you reclock to a higher clock before starting the applicati=
on?

* On 4.4, boot with nouveau.pstate=3D1 on the kernel command line, and run =
`echo
XX &gt; /sys/class/drm/card0/device/pstate` as root, where XX is a performa=
nce
level; you can find the different performance level available on your card =
by
cat=E2=80=99ing that file.
* On 4.5+, run `echo XX &gt; /sys/kernel/debug/dri/0/pstate` as root, where=
 XX is
a performance level; you can find the different performance level available=
 on
your card by cat=E2=80=99ing that file.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14636918310.8681feF8.25652--

--===============1869202295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1869202295==--
