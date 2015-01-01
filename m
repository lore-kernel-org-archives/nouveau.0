From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87942] [NVE7] Unable to use nouveau
Date: Thu, 01 Jan 2015 18:33:53 +0000
Message-ID: <bug-87942-8800-Wvqg7OZvnN@http.bugs.freedesktop.org/>
References: <bug-87942-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1443137749=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87942-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1443137749==
Content-Type: multipart/alternative; boundary="1420137233.25aad1.32188"; charset="UTF-8"


--1420137233.25aad1.32188
Date: Thu, 1 Jan 2015 18:33:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D87942

--- Comment #2 from bruno.pagani-vYW+cPY1g1pg9hUCZPvPmw@public.gmane.org ---
Created attachment 111620
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D111620&action=3Dedit
Xorg.8.log

Well, in Bumblebee, this result in the attached Xorg.8.log, this is when tr=
ying
to run glxinfo through optirun, and glxinfo works, but the output states th=
is
is not nouveau, but Gallium using LLVM pipe.

With bumblebee and bbswitch disabled, and after clean reboot, the result of
modprobing nouveau is naturally still the same, and I can=E2=80=99t use DRI=
_PRIME
since:

xrandr --listproviders
Providers: number : 1
Provider 0: id: 0x49 cap: 0xb, Source Output, Sink Output, Sink Offload crt=
cs:
4 outputs: 6 associated providers: 0 name:Intel

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1420137233.25aad1.32188
Date: Thu, 1 Jan 2015 18:33:53 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] Unable to use nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] Unable to use nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942">bug 87942<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bruno.pagani&#64;ens-lyon.org" title=3D"bruno.pagani&#64;ens-lyon.org">brun=
o.pagani&#64;ens-lyon.org</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D111620=
" name=3D"attach_111620" title=3D"Xorg.8.log">attachment 111620</a> <a href=
=3D"attachment.cgi?id=3D111620&amp;action=3Dedit" title=3D"Xorg.8.log">[det=
ails]</a></span>
Xorg.8.log

Well, in Bumblebee, this result in the attached Xorg.8.log, this is when tr=
ying
to run glxinfo through optirun, and glxinfo works, but the output states th=
is
is not nouveau, but Gallium using LLVM pipe.

With bumblebee and bbswitch disabled, and after clean reboot, the result of
modprobing nouveau is naturally still the same, and I can=E2=80=99t use DRI=
_PRIME
since:

xrandr --listproviders
Providers: number : 1
Provider 0: id: 0x49 cap: 0xb, Source Output, Sink Output, Sink Offload crt=
cs:
4 outputs: 6 associated providers: 0 name:Intel</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420137233.25aad1.32188--

--===============1443137749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1443137749==--
