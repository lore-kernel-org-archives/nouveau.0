From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105319] DRM: EVO timeout with kernel 4.15.x
Date: Wed, 29 Aug 2018 00:06:14 +0000
Message-ID: <bug-105319-8800-TGn3K0GEz0@http.bugs.freedesktop.org/>
References: <bug-105319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1868907096=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1868907096==
Content-Type: multipart/alternative; boundary="15355011743.68Dcf2.2081"
Content-Transfer-Encoding: 7bit


--15355011743.68Dcf2.2081
Date: Wed, 29 Aug 2018 00:06:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105319

--- Comment #27 from S=C3=A9rgio M. Basto <sergio-iCFKjj3otdHQT0dZR+AlfA@public.gmane.org> ---
Created attachment 141327
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D141327&action=3Dedit
the commit which start evo timeout

And result of git bisect start v4.15-rc6 ead68f216110 is [1]

This is the commit when switch graphics at boot startup starts to fail, I'm
thinking in the revert it in kernel-4.15.0-0.rc6.git1.1.fc28 which already =
have
the good interrupts, to see if I can boot correctly again .
Or should I seek for commit that fix delivery interrupts ?=20
what do you think ?=20


[1]
# bad: [30a7acd573899fd8b8ac39236eff6468b195ac7d] Linux 4.15-rc6
# good: [ead68f216110170ec729e2c4dec0aad6d38259d7] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net

Skip some commits because all are good, just almost the last one is the bad
commit ...

# good: [64e05d118e357bb52a084b609436acf292ce7944] x86/apic: Update the 'ap=
ic=3D'
description of setting APIC driver

# bad: [f39d7d78b70e0f39facb1e4fab77ad3df5c52a35] Merge branch 'x86/urgent'=
 of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip

# bad: [a31e58e129f73ab5b04016330b13ed51fde7a961] x86/apic: Switch all APIC=
s to
Fixed delivery mode

# first bad commit: [a31e58e129f73ab5b04016330b13ed51fde7a961] x86/apic: Sw=
itch
all APICs to Fixed delivery mode

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15355011743.68Dcf2.2081
Date: Wed, 29 Aug 2018 00:06:14 +0000
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
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319#c27">Comme=
nt # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319">bug 10531=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sergio&#64;serjux.com" title=3D"S=C3=A9rgio M. Basto &lt;sergio&#64;serjux.=
com&gt;"> <span class=3D"fn">S=C3=A9rgio M. Basto</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D141327=
" name=3D"attach_141327" title=3D"the commit which start evo timeout">attac=
hment 141327</a> <a href=3D"attachment.cgi?id=3D141327&amp;action=3Dedit" t=
itle=3D"the commit which start evo timeout">[details]</a></span> <a href=3D=
'page.cgi?id=3Dsplinter.html&amp;bug=3D105319&amp;attachment=3D141327'>[rev=
iew]</a>
the commit which start evo timeout

And result of git bisect start v4.15-rc6 ead68f216110 is [1]

This is the commit when switch graphics at boot startup starts to fail, I'm
thinking in the revert it in kernel-4.15.0-0.rc6.git1.1.fc28 which already =
have
the good interrupts, to see if I can boot correctly again .
Or should I seek for commit that fix delivery interrupts ?=20
what do you think ?=20


[1]
# bad: [30a7acd573899fd8b8ac39236eff6468b195ac7d] Linux 4.15-rc6
# good: [ead68f216110170ec729e2c4dec0aad6d38259d7] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net

Skip some commits because all are good, just almost the last one is the bad
commit ...

# good: [64e05d118e357bb52a084b609436acf292ce7944] x86/apic: Update the 'ap=
ic=3D'
description of setting APIC driver

# bad: [f39d7d78b70e0f39facb1e4fab77ad3df5c52a35] Merge branch 'x86/urgent'=
 of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip

# bad: [a31e58e129f73ab5b04016330b13ed51fde7a961] x86/apic: Switch all APIC=
s to
Fixed delivery mode

# first bad commit: [a31e58e129f73ab5b04016330b13ed51fde7a961] x86/apic: Sw=
itch
all APICs to Fixed delivery mode</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15355011743.68Dcf2.2081--

--===============1868907096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1868907096==--
