From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94757] powerpc64 & 64Kb kernel pagesize not working
 with nouveau
Date: Thu, 25 Aug 2016 10:57:55 +0000
Message-ID: <bug-94757-8800-qGIobuuNZX@http.bugs.freedesktop.org/>
References: <bug-94757-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1827393812=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94757-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1827393812==
Content-Type: multipart/alternative; boundary="14721226753.D0b7e.1736";
 charset="UTF-8"


--14721226753.D0b7e.1736
Date: Thu, 25 Aug 2016 10:57:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94757

--- Comment #7 from Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> ---
There's an old patch of mind floating on the lists somewhere that did make =
it
somewhat work on my G5's nv43 but it only addressed part of the problem (the
kernel framebuffer basically).

There's also an issue in that the per-context registers that are meant to be
mapped into userspace are only 4K appart.

nVidia binary driver on POWER8 (for compute) works around that by using the
_PAGE_4K_PFN hack we have which allows a driver to create a user mapping fo=
r a
64K page that is made of 16 times the same underlying HW 4K page.

That requires unfortunately some trickery to deal with on both side of the
user/kernel interface, so it's not a "drop-in" fix in the existing stack.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14721226753.D0b7e.1736
Date: Thu, 25 Aug 2016 10:57:55 +0000
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
   title=3D"NEW - powerpc64 &amp; 64Kb kernel pagesize not working with nou=
veau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94757#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - powerpc64 &amp; 64Kb kernel pagesize not working with nou=
veau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94757">bug 94757<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
benh&#64;kernel.crashing.org" title=3D"Benjamin Herrenschmidt &lt;benh&#64;=
kernel.crashing.org&gt;"> <span class=3D"fn">Benjamin Herrenschmidt</span><=
/a>
</span></b>
        <pre>There's an old patch of mind floating on the lists somewhere t=
hat did make it
somewhat work on my G5's nv43 but it only addressed part of the problem (the
kernel framebuffer basically).

There's also an issue in that the per-context registers that are meant to be
mapped into userspace are only 4K appart.

nVidia binary driver on POWER8 (for compute) works around that by using the
_PAGE_4K_PFN hack we have which allows a driver to create a user mapping fo=
r a
64K page that is made of 16 times the same underlying HW 4K page.

That requires unfortunately some trickery to deal with on both side of the
user/kernel interface, so it's not a &quot;drop-in&quot; fix in the existin=
g stack.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14721226753.D0b7e.1736--

--===============1827393812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1827393812==--
