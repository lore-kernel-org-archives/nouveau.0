From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99487] [NV110] HP Pavilion 15 with Maxwell 950M
 fails to read BIOS (fix included)
Date: Sun, 22 Jan 2017 04:31:25 +0000
Message-ID: <bug-99487-8800-PEUzGVmDX5@http.bugs.freedesktop.org/>
References: <bug-99487-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1065007822=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99487-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1065007822==
Content-Type: multipart/alternative; boundary="14850594851.ca2Ddcc.4534";
 charset="UTF-8"


--14850594851.ca2Ddcc.4534
Date: Sun, 22 Jan 2017 04:31:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99487

--- Comment #1 from Ryan Underwood <nemesis-RBwgCYbvQ+vk1uMJSBkQmQ@public.gmane.org> ---
By the way, I am not proposing that my workaround is sufficient, though it =
is
beneficial for a user to be able to directly work around via trying differe=
nt
module options.

I think we need to fix BIOS retrieval scoring such that if there is a ROM
signature and/or checksum failure, the score is heavily penalized in favor =
of
attempting the slow retrieval.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14850594851.ca2Ddcc.4534
Date: Sun, 22 Jan 2017 04:31:25 +0000
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
   title=3D"NEW - [NV110] HP Pavilion 15 with Maxwell 950M fails to read BI=
OS (fix included)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99487#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV110] HP Pavilion 15 with Maxwell 950M fails to read BI=
OS (fix included)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99487">bug 99487<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nemesis&#64;icequake.net" title=3D"Ryan Underwood &lt;nemesis&#64;icequake.=
net&gt;"> <span class=3D"fn">Ryan Underwood</span></a>
</span></b>
        <pre>By the way, I am not proposing that my workaround is sufficien=
t, though it is
beneficial for a user to be able to directly work around via trying differe=
nt
module options.

I think we need to fix BIOS retrieval scoring such that if there is a ROM
signature and/or checksum failure, the score is heavily penalized in favor =
of
attempting the slow retrieval.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14850594851.ca2Ddcc.4534--

--===============1065007822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1065007822==--
