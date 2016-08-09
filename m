From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] Latest 4.6rc4 kernel, no booting on gtx970
Date: Tue, 09 Aug 2016 12:20:15 +0000
Message-ID: <bug-94990-8800-qEB0GAoX89@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0282576194=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0282576194==
Content-Type: multipart/alternative; boundary="14707452153.7c76Ba63C.9254";
 charset="UTF-8"


--14707452153.7c76Ba63C.9254
Date: Tue, 9 Aug 2016 12:20:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #51 from Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> ---
(In reply to Yann Golanski from comment #50)
> Could some kind soul write a how to modify grub2 configs to add the
> `nouveau.modeset=3D0` so we could test is that work on our setup?

Add it in /boot/grub2/grub.cfg to the kernel commandline for the kernel you
want to boot, or change the boot config inside grub2 for a oneshot (F12). B=
ut
you should have just googled that ;-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14707452153.7c76Ba63C.9254
Date: Tue, 9 Aug 2016 12:20:15 +0000
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
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c51">Commen=
t # 51</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tobias.klausmann&#64;mni.thm.de" title=3D"Tobias Klausmann &lt;tobias.klaus=
mann&#64;mni.thm.de&gt;"> <span class=3D"fn">Tobias Klausmann</span></a>
</span></b>
        <pre>(In reply to Yann Golanski from <a href=3D"show_bug.cgi?id=3D9=
4990#c50">comment #50</a>)
<span class=3D"quote">&gt; Could some kind soul write a how to modify grub2=
 configs to add the
&gt; `nouveau.modeset=3D0` so we could test is that work on our setup?</spa=
n >

Add it in /boot/grub2/grub.cfg to the kernel commandline for the kernel you
want to boot, or change the boot config inside grub2 for a oneshot (F12). B=
ut
you should have just googled that ;-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14707452153.7c76Ba63C.9254--

--===============0282576194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0282576194==--
