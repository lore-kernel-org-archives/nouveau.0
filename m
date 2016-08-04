From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97192] SuperTuxkart graphic errors [NVE4 - GK104]
Date: Thu, 04 Aug 2016 14:01:09 +0000
Message-ID: <bug-97192-8800-Zdnn73Tyn6@http.bugs.freedesktop.org/>
References: <bug-97192-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0006608389=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97192-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0006608389==
Content-Type: multipart/alternative; boundary="14703192691.2438C1C.24113";
 charset="UTF-8"


--14703192691.2438C1C.24113
Date: Thu, 4 Aug 2016 14:01:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97192

--- Comment #16 from Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 125530
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125530&action=3Dedit
workaround

nouveau: kernel rejected pushbuf: Device or resource busy
nouveau: ch6: krec 0 pushes 511 bufs 83 relocs 0

This is bad and it happens when we submit data too fast and then the command
stream is rejected. I already saw that issue with a dEQP test but not yet f=
ixed
it.

Can you try to apply the attached workaround patch?

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14703192691.2438C1C.24113
Date: Thu, 4 Aug 2016 14:01:09 +0000
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
   title=3D"NEW - SuperTuxkart graphic errors [NVE4 - GK104]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97192#c16">Commen=
t # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - SuperTuxkart graphic errors [NVE4 - GK104]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97192">bug 97192<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
samuel.pitoiset&#64;gmail.com" title=3D"Samuel Pitoiset &lt;samuel.pitoiset=
&#64;gmail.com&gt;"> <span class=3D"fn">Samuel Pitoiset</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D125530=
" name=3D"attach_125530" title=3D"workaround">attachment 125530</a> <a href=
=3D"attachment.cgi?id=3D125530&amp;action=3Dedit" title=3D"workaround">[det=
ails]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D97192&amp=
;attachment=3D125530'>[review]</a>
workaround

nouveau: kernel rejected pushbuf: Device or resource busy
nouveau: ch6: krec 0 pushes 511 bufs 83 relocs 0

This is bad and it happens when we submit data too fast and then the command
stream is rejected. I already saw that issue with a dEQP test but not yet f=
ixed
it.

Can you try to apply the attached workaround patch?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14703192691.2438C1C.24113--

--===============0006608389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0006608389==--
