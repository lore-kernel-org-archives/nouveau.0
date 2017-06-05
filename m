From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101184] [NVE6] [bisected] Panic on boot with GK106
Date: Mon, 05 Jun 2017 07:27:14 +0000
Message-ID: <bug-101184-8800-3zF4KfQ5CF@http.bugs.freedesktop.org/>
References: <bug-101184-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1291354834=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101184-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1291354834==
Content-Type: multipart/alternative; boundary="14966476340.F97E.20035";
 charset="UTF-8"


--14966476340.F97E.20035
Date: Mon, 5 Jun 2017 07:27:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101184

--- Comment #6 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 131704
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D131704&action=3Dedit
test fix

Can you give this patch a try please?

I'm not 100% convinced this is the issue here, but I'd like to rule it in/o=
ut.=20
I have identical hardware to a couple of the other reporters of this issue,=
 but
have been completely unable to reproduce for unknown reasons.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14966476340.F97E.20035
Date: Mon, 5 Jun 2017 07:27:14 +0000
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
   title=3D"NEW - [NVE6] [bisected] Panic on boot with GK106"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101184#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] [bisected] Panic on boot with GK106"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101184">bug 10118=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
skeggsb&#64;gmail.com" title=3D"Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> =
<span class=3D"fn">Ben Skeggs</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D131704=
" name=3D"attach_131704" title=3D"test fix">attachment 131704</a> <a href=
=3D"attachment.cgi?id=3D131704&amp;action=3Dedit" title=3D"test fix">[detai=
ls]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D101184&amp;=
attachment=3D131704'>[review]</a>
test fix

Can you give this patch a try please?

I'm not 100% convinced this is the issue here, but I'd like to rule it in/o=
ut.=20
I have identical hardware to a couple of the other reporters of this issue,=
 but
have been completely unable to reproduce for unknown reasons.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14966476340.F97E.20035--

--===============1291354834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1291354834==--
