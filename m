From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101322] GM108/NV118: 0 MiB DDR3 and boot crash in
 gf100_ltc_oneinit_tag_ram
Date: Wed, 18 Oct 2017 19:07:17 +0000
Message-ID: <bug-101322-8800-EimXX2XJiy@http.bugs.freedesktop.org/>
References: <bug-101322-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0519993057=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101322-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0519993057==
Content-Type: multipart/alternative; boundary="15083536361.d4145F5.8618";
 charset="UTF-8"


--15083536361.d4145F5.8618
Date: Wed, 18 Oct 2017 19:07:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101322

--- Comment #12 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This patch should (hopefully) help with the issues faced while tracing the
binary driver, it will apply to their kernel shim layer sourcecode that can=
 be
found if you extract the installer package with --extract-only (and run
./nvidia-installer inside the extracted directory to build the patched kern=
el
module).

https://paste.fedoraproject.org/paste/LkiC1cJdfPGOLc~NlKWkcA

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15083536361.d4145F5.8618
Date: Wed, 18 Oct 2017 19:07:16 +0000
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
   title=3D"NEW - GM108/NV118: 0 MiB DDR3 and boot crash in gf100_ltc_onein=
it_tag_ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101322#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GM108/NV118: 0 MiB DDR3 and boot crash in gf100_ltc_onein=
it_tag_ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101322">bug 10132=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
skeggsb&#64;gmail.com" title=3D"Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> =
<span class=3D"fn">Ben Skeggs</span></a>
</span></b>
        <pre>This patch should (hopefully) help with the issues faced while=
 tracing the
binary driver, it will apply to their kernel shim layer sourcecode that can=
 be
found if you extract the installer package with --extract-only (and run
./nvidia-installer inside the extracted directory to build the patched kern=
el
module).

<a href=3D"https://paste.fedoraproject.org/paste/LkiC1cJdfPGOLc~NlKWkcA">ht=
tps://paste.fedoraproject.org/paste/LkiC1cJdfPGOLc~NlKWkcA</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15083536361.d4145F5.8618--

--===============0519993057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0519993057==--
