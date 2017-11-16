From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103753] Visual glitches on GTX 1060 6GB/4.13.x
Date: Thu, 16 Nov 2017 05:23:39 +0000
Message-ID: <bug-103753-8800-4JIm6q1tAU@http.bugs.freedesktop.org/>
References: <bug-103753-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1266468348=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103753-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1266468348==
Content-Type: multipart/alternative; boundary="15108098180.cadE5E3.14164";
 charset="UTF-8"


--15108098180.cadE5E3.14164
Date: Thu, 16 Nov 2017 05:23:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103753

--- Comment #2 from Artem S. Tashkinov <t.artem-VInPYn6yXxRWk0Htik3J/w@public.gmane.org> ---
Created attachment 135509
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D135509&action=3Dedit
Xorg.0.log

(In reply to Ilia Mirkin from comment #1)
> Please confirm that you're using the nouveau ddx and not the modesetting
> ddx? [Include your xorg log.]

I've no idea what I'm using. I have a default Fedora 27 installation without
Xorg.conf file or any configuration for kernel modules.

>=20
> Was acceleration working for you with the 4.12.x kernel? I don't really s=
ee
> what would have changed in the kernel to affect this one way or the other.

I'm not sure what you're talking about. I don't use any applications which =
use
3D acceleration and I've no idea if 2D acceleration is in use.

>=20
> We're now using the full BAR2 amount (bar/gf100: fix access to upper half=
 of
> BAR2)... Could be somehow different on GP10x?

Er, no clue ;-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15108098180.cadE5E3.14164
Date: Thu, 16 Nov 2017 05:23:38 +0000
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
   title=3D"NEW - Visual glitches on GTX 1060 6GB/4.13.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103753#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Visual glitches on GTX 1060 6GB/4.13.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103753">bug 10375=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t.artem&#64;mailcity.com" title=3D"Artem S. Tashkinov &lt;t.artem&#64;mailc=
ity.com&gt;"> <span class=3D"fn">Artem S. Tashkinov</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D135509=
" name=3D"attach_135509" title=3D"Xorg.0.log">attachment 135509</a> <a href=
=3D"attachment.cgi?id=3D135509&amp;action=3Dedit" title=3D"Xorg.0.log">[det=
ails]</a></span>
Xorg.0.log

(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D103753#c1">comme=
nt #1</a>)
<span class=3D"quote">&gt; Please confirm that you're using the nouveau ddx=
 and not the modesetting
&gt; ddx? [Include your xorg log.]</span >

I've no idea what I'm using. I have a default Fedora 27 installation without
Xorg.conf file or any configuration for kernel modules.

<span class=3D"quote">&gt;=20
&gt; Was acceleration working for you with the 4.12.x kernel? I don't reall=
y see
&gt; what would have changed in the kernel to affect this one way or the ot=
her.</span >

I'm not sure what you're talking about. I don't use any applications which =
use
3D acceleration and I've no idea if 2D acceleration is in use.

<span class=3D"quote">&gt;=20
&gt; We're now using the full BAR2 amount (bar/gf100: fix access to upper h=
alf of
&gt; BAR2)... Could be somehow different on GP10x?</span >

Er, no clue ;-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15108098180.cadE5E3.14164--

--===============1266468348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1266468348==--
