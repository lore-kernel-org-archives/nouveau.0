From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99335] nouveau graphics often freezes when using KDE
	Plasma 5
Date: Wed, 11 Jan 2017 18:35:55 +0000
Message-ID: <bug-99335-8800-MDrbWfpSrD@http.bugs.freedesktop.org/>
References: <bug-99335-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0475649202=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99335-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0475649202==
Content-Type: multipart/alternative; boundary="14841597550.dF9AC1C.12521";
 charset="UTF-8"


--14841597550.dF9AC1C.12521
Date: Wed, 11 Jan 2017 18:35:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99335

--- Comment #11 from Alexander <alexander.persh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Oh, I see. I thought you meant I should add this by saying "You must have a
LIBGL_ALWAYS_SOFTWARE=3D1 left somewhere." My apologies.

I have removed it and now I have=20
# glxinfo | grep -E "nouveau | llvmpipe"
    Vendor: nouveau (0x10de)

Will test it for some time. Thank you.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14841597550.dF9AC1C.12521
Date: Wed, 11 Jan 2017 18:35:55 +0000
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
   title=3D"NEW - nouveau graphics often freezes when using KDE Plasma 5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99335#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau graphics often freezes when using KDE Plasma 5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99335">bug 99335<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexander.persh&#64;gmail.com" title=3D"Alexander &lt;alexander.persh&#64;g=
mail.com&gt;"> <span class=3D"fn">Alexander</span></a>
</span></b>
        <pre>Oh, I see. I thought you meant I should add this by saying &qu=
ot;You must have a
LIBGL_ALWAYS_SOFTWARE=3D1 left somewhere.&quot; My apologies.

I have removed it and now I have=20
# glxinfo | grep -E &quot;nouveau | llvmpipe&quot;
    Vendor: nouveau (0x10de)

Will test it for some time. Thank you.</pre>
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

--14841597550.dF9AC1C.12521--

--===============0475649202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0475649202==--
