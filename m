From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98398] Vgaswitcharoo fails to turn off GPU properly
Date: Sat, 22 Oct 2016 23:16:29 +0000
Message-ID: <bug-98398-8800-r50e6lESlh@http.bugs.freedesktop.org/>
References: <bug-98398-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0308587437=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98398-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0308587437==
Content-Type: multipart/alternative; boundary="14771781880.985b29.23806";
 charset="UTF-8"


--14771781880.985b29.23806
Date: Sat, 22 Oct 2016 23:16:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98398

--- Comment #5 from rick.2889-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Adding pcie_port_pm=3Doff to my kernel command line causes the card to turn=
 off
and powertop to report ~7.5W of power usage. According to Lekensteyn this
reverts nouveau to the 4.7 and lower behavior of using DSM, so I think this=
 is
a regression from using the new method.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14771781880.985b29.23806
Date: Sat, 22 Oct 2016 23:16:28 +0000
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
   title=3D"NEW - [Nouveau] Vgaswitcharoo fails to turn off GPU properly"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98398#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Nouveau] Vgaswitcharoo fails to turn off GPU properly"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98398">bug 98398<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rick.2889&#64;gmail.com" title=3D"rick.2889&#64;gmail.com">rick.2889&#64;gm=
ail.com</a>
</span></b>
        <pre>Adding pcie_port_pm=3Doff to my kernel command line causes the=
 card to turn off
and powertop to report ~7.5W of power usage. According to Lekensteyn this
reverts nouveau to the 4.7 and lower behavior of using DSM, so I think this=
 is
a regression from using the new method.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14771781880.985b29.23806--

--===============0308587437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0308587437==--
