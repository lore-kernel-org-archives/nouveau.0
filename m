From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111006] Adding a uniform-dependent if-statement in
 shader renders a different image
Date: Thu, 27 Jun 2019 14:46:00 +0000
Message-ID: <bug-111006-8800-IdtN3cnWS5@http.bugs.freedesktop.org/>
References: <bug-111006-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1201711023=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111006-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1201711023==
Content-Type: multipart/alternative; boundary="15616467600.2Ce4B7.17895"
Content-Transfer-Encoding: 7bit


--15616467600.2Ce4B7.17895
Date: Thu, 27 Jun 2019 14:46:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111006

--- Comment #4 from Abel Briggs <abelbriggs1-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> ---
If you're referring to the Meson(In reply to Paul from comment #2)
> Hi Abel.
>=20
> Could you provide your configure command, please?

If you mean the Meson configure command, the only things I changed from the
default is that I enabled ASAN with -Db_sanitize=3Daddress and I set the pr=
efix
to be a different location(along with the libdrm I compiled) so I wouldn't =
mess
up my normal graphics stack. I compiled with gcc 8.3.0.

I'm not sure of any other configure commands you may mean, so please let me
know if this isn't what you're looking for.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15616467600.2Ce4B7.17895
Date: Thu, 27 Jun 2019 14:46:00 +0000
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
   title=3D"NEW - Adding a uniform-dependent if-statement in shader renders=
 a different image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111006#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Adding a uniform-dependent if-statement in shader renders=
 a different image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111006">bug 11100=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
abelbriggs1&#64;hotmail.com" title=3D"Abel Briggs &lt;abelbriggs1&#64;hotma=
il.com&gt;"> <span class=3D"fn">Abel Briggs</span></a>
</span></b>
        <pre>If you're referring to the Meson(In reply to Paul from <a href=
=3D"show_bug.cgi?id=3D111006#c2">comment #2</a>)
<span class=3D"quote">&gt; Hi Abel.
&gt;=20
&gt; Could you provide your configure command, please?</span >

If you mean the Meson configure command, the only things I changed from the
default is that I enabled ASAN with -Db_sanitize=3Daddress and I set the pr=
efix
to be a different location(along with the libdrm I compiled) so I wouldn't =
mess
up my normal graphics stack. I compiled with gcc 8.3.0.

I'm not sure of any other configure commands you may mean, so please let me
know if this isn't what you're looking for.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15616467600.2Ce4B7.17895--

--===============1201711023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1201711023==--
