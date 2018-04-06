From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100446] Backlight control not working on Pascal /
 GP106 using nouveau drivers
Date: Fri, 06 Apr 2018 00:20:27 +0000
Message-ID: <bug-100446-8800-fxja9fF8z2@http.bugs.freedesktop.org/>
References: <bug-100446-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1819590269=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100446-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1819590269==
Content-Type: multipart/alternative; boundary="15229740260.bD4b28.32456"
Content-Transfer-Encoding: 7bit


--15229740260.bD4b28.32456
Date: Fri, 6 Apr 2018 00:20:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100446

--- Comment #10 from Bernhard Rosenkraenzer <bero-Qev7zP1q8vftRgLqZ5aouw@public.gmane.org> ---
Created attachment 138646
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D138646&action=3Dedit
Proposed fix, relative to 4.16.0

The combination of the fix in 4.16-rc and the hint from the first comment on
the bug did it -- backlight control works (at least on my hp Omen) with this
patch on top of 4.16.0.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15229740260.bD4b28.32456
Date: Fri, 6 Apr 2018 00:20:26 +0000
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
   title=3D"NEW - Backlight control not working on Pascal / GP106 using nou=
veau drivers"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100446#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Backlight control not working on Pascal / GP106 using nou=
veau drivers"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100446">bug 10044=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bero&#64;lindev.ch" title=3D"Bernhard Rosenkraenzer &lt;bero&#64;lindev.ch&=
gt;"> <span class=3D"fn">Bernhard Rosenkraenzer</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D138646=
" name=3D"attach_138646" title=3D"Proposed fix, relative to 4.16.0">attachm=
ent 138646</a> <a href=3D"attachment.cgi?id=3D138646&amp;action=3Dedit" tit=
le=3D"Proposed fix, relative to 4.16.0">[details]</a></span> <a href=3D'pag=
e.cgi?id=3Dsplinter.html&amp;bug=3D100446&amp;attachment=3D138646'>[review]=
</a>
Proposed fix, relative to 4.16.0

The combination of the fix in 4.16-rc and the hint from the first comment on
the bug did it -- backlight control works (at least on my hp Omen) with this
patch on top of 4.16.0.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15229740260.bD4b28.32456--

--===============1819590269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1819590269==--
