From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105319] DRM: EVO timeout with kernel 4.15.x
Date: Mon, 18 Mar 2019 21:15:10 +0000
Message-ID: <bug-105319-8800-2U7UTLb715@http.bugs.freedesktop.org/>
References: <bug-105319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0553454919=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0553454919==
Content-Type: multipart/alternative; boundary="15529437100.a0d8BBD.8853"
Content-Transfer-Encoding: 7bit


--15529437100.a0d8BBD.8853
Date: Mon, 18 Mar 2019 21:15:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105319

--- Comment #33 from Paulo Castro <pauloedgarcastro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Not ideal but, adding nouveau.noaccel=3D1 to grub in 4.20.13-200.fc29.x86_64
seems to help.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15529437100.a0d8BBD.8853
Date: Mon, 18 Mar 2019 21:15:10 +0000
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
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319#c33">Comme=
nt # 33</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319">bug 10531=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pauloedgarcastro&#64;gmail.com" title=3D"Paulo Castro &lt;pauloedgarcastro&=
#64;gmail.com&gt;"> <span class=3D"fn">Paulo Castro</span></a>
</span></b>
        <pre>Not ideal but, adding nouveau.noaccel=3D1 to grub in 4.20.13-2=
00.fc29.x86_64
seems to help.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15529437100.a0d8BBD.8853--

--===============0553454919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0553454919==--
