From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105173] [MCP79][Regression] Unhandled NULL pointer
 dereference in nvkm_object_unmap since kernel 4.15
Date: Sat, 17 Mar 2018 15:39:30 +0000
Message-ID: <bug-105173-8800-1Qy1TrBaNW@http.bugs.freedesktop.org/>
References: <bug-105173-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1726187137=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105173-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1726187137==
Content-Type: multipart/alternative; boundary="15213011702.DAAAFAA.10645"
Content-Transfer-Encoding: 7bit


--15213011702.DAAAFAA.10645
Date: Sat, 17 Mar 2018 15:39:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105173

--- Comment #18 from Maris Nartiss <maris.nartiss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to S=C3=A9rgio M. Basto from comment #17)
> I tested https://bugs.freedesktop.org/attachment.cgi?id=3D137730 on a
> kernel-4.15
> but doesn't fixed my boot problem .

Then, please, open a different bug and provide full kernel (dmesg) output. =
Or
even better =E2=80=93 as you can reproduce the bug, do a git bisect yoursel=
f. (It took
me one week to bisect the issue fixed by proposed patch.)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15213011702.DAAAFAA.10645
Date: Sat, 17 Mar 2018 15:39:30 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [MCP79][Regression] Unhandled NULL pointer der=
eference in nvkm_object_unmap since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173#c18">Comme=
nt # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [MCP79][Regression] Unhandled NULL pointer der=
eference in nvkm_object_unmap since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173">bug 10517=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
maris.nartiss&#64;gmail.com" title=3D"Maris Nartiss &lt;maris.nartiss&#64;g=
mail.com&gt;"> <span class=3D"fn">Maris Nartiss</span></a>
</span></b>
        <pre>(In reply to S=C3=A9rgio M. Basto from <a href=3D"show_bug.cgi=
?id=3D105173#c17">comment #17</a>)
<span class=3D"quote">&gt; I tested <a href=3D"https://bugs.freedesktop.org=
/attachment.cgi?id=3D137730">https://bugs.freedesktop.org/attachment.cgi?id=
=3D137730</a> on a
&gt; kernel-4.15
&gt; but doesn't fixed my boot problem .</span >

Then, please, open a different bug and provide full kernel (dmesg) output. =
Or
even better =E2=80=93 as you can reproduce the bug, do a git bisect yoursel=
f. (It took
me one week to bisect the issue fixed by proposed patch.)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15213011702.DAAAFAA.10645--

--===============1726187137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1726187137==--
