From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98582] A regression with nouveau under wayland+xorg:
 laptop doesn't resume properly from suspension
Date: Fri, 04 Nov 2016 07:48:05 +0000
Message-ID: <bug-98582-8800-EOxOZ2uxU4@http.bugs.freedesktop.org/>
References: <bug-98582-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0293615525=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98582-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0293615525==
Content-Type: multipart/alternative; boundary="14782456841.D2Ac7Ecf4.21522";
 charset="UTF-8"


--14782456841.D2Ac7Ecf4.21522
Date: Fri, 4 Nov 2016 07:48:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98582

--- Comment #4 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Support for GM108 chipsets was merged in Linux 4.7, which was released end =
of
July 2016, so I assume that it worked before as Nouveau failed to recognise=
 the
chipset, and therefore did nothing.

Trying Linux 4.7 and making sure that the chipset is recognised would be ni=
ce,
to rule out a possible regression. Could you also please add the output of
acpidump to the bug report?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14782456841.D2Ac7Ecf4.21522
Date: Fri, 4 Nov 2016 07:48:04 +0000
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
   title=3D"NEW - A regression with nouveau under wayland+xorg: laptop does=
n't resume properly from suspension"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98582#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - A regression with nouveau under wayland+xorg: laptop does=
n't resume properly from suspension"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98582">bug 98582<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>Support for GM108 chipsets was merged in Linux 4.7, which was =
released end of
July 2016, so I assume that it worked before as Nouveau failed to recognise=
 the
chipset, and therefore did nothing.

Trying Linux 4.7 and making sure that the chipset is recognised would be ni=
ce,
to rule out a possible regression. Could you also please add the output of
acpidump to the bug report?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14782456841.D2Ac7Ecf4.21522--

--===============0293615525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0293615525==--
