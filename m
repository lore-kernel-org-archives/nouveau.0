From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101665] lspci blocks forever with a GP107M
Date: Tue, 12 Dec 2017 15:29:49 +0000
Message-ID: <bug-101665-8800-JHOrBkrJKp@http.bugs.freedesktop.org/>
References: <bug-101665-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0576235783=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101665-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0576235783==
Content-Type: multipart/alternative; boundary="15130925893.6AdBaBf02.30239";
 charset="UTF-8"


--15130925893.6AdBaBf02.30239
Date: Tue, 12 Dec 2017 15:29:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101665

--- Comment #10 from Etienne URBAH <eurbah-GANU6spQydw@public.gmane.org> ---
Created attachment 136105
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136105&action=3Dedit
lspci for GP107M [GeForce GTX 1050 Ti Mobile]

Lot of thanks to Pierre Moreau for his suggestions of options in the kernel
command line :

-  Adding just 'nouveau.runpm=3D0' prevents the whole machine to freeze, but
'nouveau' FAILS to manage an external display with resolution 3840 x 2160 at
60Hz through DisplayPort.

-  Adding just 'acpi_rev_override=3D5' does NOT prevent the whole machine to
freeze.

-  Adding just 'acpi_osi=3D! acpi_osi=3D"Windows 2009"' permits 'lspci' to =
succeed,
and 'nouveau' to successfully manage an external display with resolution 38=
40 x
2160 at 60Hz through DisplayPort.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15130925893.6AdBaBf02.30239
Date: Tue, 12 Dec 2017 15:29:49 +0000
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
   title=3D"NEW - lspci blocks forever with a GP107M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101665#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - lspci blocks forever with a GP107M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101665">bug 10166=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
eurbah&#64;free.fr" title=3D"Etienne URBAH &lt;eurbah&#64;free.fr&gt;"> <sp=
an class=3D"fn">Etienne URBAH</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136105=
" name=3D"attach_136105" title=3D"lspci for GP107M [GeForce GTX 1050 Ti Mob=
ile]">attachment 136105</a> <a href=3D"attachment.cgi?id=3D136105&amp;actio=
n=3Dedit" title=3D"lspci for GP107M [GeForce GTX 1050 Ti Mobile]">[details]=
</a></span>
lspci for GP107M [GeForce GTX 1050 Ti Mobile]

Lot of thanks to Pierre Moreau for his suggestions of options in the kernel
command line :

-  Adding just 'nouveau.runpm=3D0' prevents the whole machine to freeze, but
'nouveau' FAILS to manage an external display with resolution 3840 x 2160 at
60Hz through DisplayPort.

-  Adding just 'acpi_rev_override=3D5' does NOT prevent the whole machine to
freeze.

-  Adding just 'acpi_osi=3D! acpi_osi=3D&quot;Windows 2009&quot;' permits '=
lspci' to succeed,
and 'nouveau' to successfully manage an external display with resolution 38=
40 x
2160 at 60Hz through DisplayPort.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15130925893.6AdBaBf02.30239--

--===============0576235783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0576235783==--
