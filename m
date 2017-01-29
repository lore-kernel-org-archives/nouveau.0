From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99584] XVMC on nv43 class card broken with recent
 mesa + kernel.
Date: Sun, 29 Jan 2017 21:42:34 +0000
Message-ID: <bug-99584-8800-GUaOXNi3b8@http.bugs.freedesktop.org/>
References: <bug-99584-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0101569981=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99584-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0101569981==
Content-Type: multipart/alternative; boundary="14857261540.C57C.21511";
 charset="UTF-8"


--14857261540.C57C.21511
Date: Sun, 29 Jan 2017 21:42:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99584

--- Comment #3 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
Sorry, my mesa tree was not properly cleaned, and this resulted in weird me=
sa
git version string. After running  make distclean +  git clean -fdx +=20
./autogen.sh --prefix=3D/usr --disable-dri3 --with-gallium-drivers=3Dnouveau
--enable-texture-float --enable-debug --with-dri-drivers=3Dswrast
PKG_CONFIG_PATH=3D/usr/local/lib/pkgconfig:/usr/lib/pkgconfig it shows more
correct rendering string :

OpenGL version string: 2.1 Mesa 17.1.0-devel (git-ce7a045)

but issue with xvmc still here.

I tried to boot old Slackware kernel (vmlinuz-huge-smp-3.14.29-smp) and
unfortunately it behaved like my 4.2.0 with new mesa/libdrm: no correct ima=
ge.

vmlinuz-huge-smp-4.4.14-smp (new Slackware kernel) behaves like my
self-compiled 4.10-rc5: "Creation failed: No such device (-19)"

So, I think for now I can conclude new userspace simply doesn't work for xv=
mc
on old kernels on my hardware, and try to move forward by investigating why=
 new
kernel  failed to create device/object for pmpeg...

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14857261540.C57C.21511
Date: Sun, 29 Jan 2017 21:42:34 +0000
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
   title=3D"NEW - XVMC on nv43 class card broken with recent mesa + kernel."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99584#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - XVMC on nv43 class card broken with recent mesa + kernel."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99584">bug 99584<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
randrik&#64;mail.ru" title=3D"Andrew Randrianasulu &lt;randrik&#64;mail.ru&=
gt;"> <span class=3D"fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>Sorry, my mesa tree was not properly cleaned, and this resulte=
d in weird mesa
git version string. After running  make distclean +  git clean -fdx +=20
./autogen.sh --prefix=3D/usr --disable-dri3 --with-gallium-drivers=3Dnouveau
--enable-texture-float --enable-debug --with-dri-drivers=3Dswrast
PKG_CONFIG_PATH=3D/usr/local/lib/pkgconfig:/usr/lib/pkgconfig it shows more
correct rendering string :

OpenGL version string: 2.1 Mesa 17.1.0-devel (git-ce7a045)

but issue with xvmc still here.

I tried to boot old Slackware kernel (vmlinuz-huge-smp-3.14.29-smp) and
unfortunately it behaved like my 4.2.0 with new mesa/libdrm: no correct ima=
ge.

vmlinuz-huge-smp-4.4.14-smp (new Slackware kernel) behaves like my
self-compiled 4.10-rc5: &quot;Creation failed: No such device (-19)&quot;

So, I think for now I can conclude new userspace simply doesn't work for xv=
mc
on old kernels on my hardware, and try to move forward by investigating why=
 new
kernel  failed to create device/object for pmpeg...</pre>
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

--14857261540.C57C.21511--

--===============0101569981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0101569981==--
