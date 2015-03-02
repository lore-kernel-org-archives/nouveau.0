From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69349] Random image corruptions (in Debian Wheezy
 with Linux 3.2)
Date: Mon, 02 Mar 2015 07:44:09 +0000
Message-ID: <bug-69349-8800-5Ser0BgxtO@http.bugs.freedesktop.org/>
References: <bug-69349-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1626106620=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69349-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1626106620==
Content-Type: multipart/alternative; boundary="1425282249.D2Be74112.16189"; charset="UTF-8"


--1425282249.D2Be74112.16189
Date: Mon, 2 Mar 2015 07:44:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D69349

--- Comment #5 from Paul Menzel <paulepanter-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org> ---
(In reply to Tobias Klausmann from comment #4)
> Is this still a problem with newer software (kernel/xf86-video-nouveau)?

Yes, I am still able to reproduce this with Debian Jessie/testing, which
currently has Linux kernel 3.19.x and `xserver-xorg-video-nouveau` 1:1.0.11=
-1.

Suddenly the corruptions start on the left side of the monitor and then I c=
an
see how slow the window of uxterm is rendered line by line (takes maybe two
seconds). If I do not shut the system down, it=E2=80=99ll eventually freeze.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1425282249.D2Be74112.16189
Date: Mon, 2 Mar 2015 07:44:09 +0000
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
   title=3D"NEW - Random image corruptions (in Debian Wheezy with Linux 3.2=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69349#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Random image corruptions (in Debian Wheezy with Linux 3.2=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69349">bug 69349<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
paulepanter&#64;users.sourceforge.net" title=3D"Paul Menzel &lt;paulepanter=
&#64;users.sourceforge.net&gt;"> <span class=3D"fn">Paul Menzel</span></a>
</span></b>
        <pre>(In reply to Tobias Klausmann from <a href=3D"show_bug.cgi?id=
=3D69349#c4">comment #4</a>)
<span class=3D"quote">&gt; Is this still a problem with newer software (ker=
nel/xf86-video-nouveau)?</span >

Yes, I am still able to reproduce this with Debian Jessie/testing, which
currently has Linux kernel 3.19.x and `xserver-xorg-video-nouveau` 1:1.0.11=
-1.

Suddenly the corruptions start on the left side of the monitor and then I c=
an
see how slow the window of uxterm is rendered line by line (takes maybe two
seconds). If I do not shut the system down, it=E2=80=99ll eventually freeze=
.</pre>
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

--1425282249.D2Be74112.16189--

--===============1626106620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1626106620==--
