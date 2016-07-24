From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97066] Blank screen when starting KMS on a GTX970
 for kernel 4.6 series
Date: Sun, 24 Jul 2016 18:21:12 +0000
Message-ID: <bug-97066-8800-JeDMndgHgR@http.bugs.freedesktop.org/>
References: <bug-97066-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1196671972=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97066-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1196671972==
Content-Type: multipart/alternative; boundary="14693844721.27ecAadf7.11580";
 charset="UTF-8"


--14693844721.27ecAadf7.11580
Date: Sun, 24 Jul 2016 18:21:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97066

--- Comment #4 from smmilut <pil.smmilut-zJpx2rpV7r/QT0dZR+AlfA@public.gmane.org> ---
Indeed, and the exact commercial model name is "Msi GTX970 Gaming 4G".

When booting with :
nouveau.noaccel=3D1 nouveau.nofbaccel=3D1
i have a normal image on screen when entering KMS, and get my normal high
resolution tty.
However, i am unable to start Xorg.
(attached are the corresponding Xorg.log and dmesg)

When you say "moving the secboot firmware out of the way", does it mean i j=
ust
have to temporarily rename the directory "/lib/firmware/nvidia/gm204" ?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14693844721.27ecAadf7.11580
Date: Sun, 24 Jul 2016 18:21:12 +0000
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
   title=3D"NEW - Blank screen when starting KMS on a GTX970 for kernel 4.6=
 series"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97066#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Blank screen when starting KMS on a GTX970 for kernel 4.6=
 series"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97066">bug 97066<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pil.smmilut&#64;yandex.com" title=3D"smmilut &lt;pil.smmilut&#64;yandex.com=
&gt;"> <span class=3D"fn">smmilut</span></a>
</span></b>
        <pre>Indeed, and the exact commercial model name is &quot;Msi GTX97=
0 Gaming 4G&quot;.

When booting with :
nouveau.noaccel=3D1 nouveau.nofbaccel=3D1
i have a normal image on screen when entering KMS, and get my normal high
resolution tty.
However, i am unable to start Xorg.
(attached are the corresponding Xorg.log and dmesg)

When you say &quot;moving the secboot firmware out of the way&quot;, does i=
t mean i just
have to temporarily rename the directory &quot;/lib/firmware/nvidia/gm204&q=
uot; ?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14693844721.27ecAadf7.11580--

--===============1196671972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1196671972==--
