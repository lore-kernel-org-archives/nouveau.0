From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104609] [G96,
 9500 GT] Removing nouveau module results in BUG: unable to handle
 kernel NULL pointer dereference at 00000000000000b8
Date: Sat, 13 Jan 2018 12:14:39 +0000
Message-ID: <bug-104609-8800-3KIvJfF1ow@http.bugs.freedesktop.org/>
References: <bug-104609-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0477184284=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104609-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0477184284==
Content-Type: multipart/alternative; boundary="15158456790.DDEeCDcD.31371"
Content-Transfer-Encoding: 7bit


--15158456790.DDEeCDcD.31371
Date: Sat, 13 Jan 2018 12:14:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104609

--- Comment #2 from Vedran Mileti=C4=87 <vedran-v8Fv/IwHOXbR7s880joybQ@public.gmane.org> ---
No, I can retry. What are the odds that ther machine reboots nicely without
hard reset after this? I have:

$ lsmod | grep nouveau
nouveau              1904640  -1
...

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15158456790.DDEeCDcD.31371
Date: Sat, 13 Jan 2018 12:14:39 +0000
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
   title=3D"NEW - [G96, 9500 GT] Removing nouveau module results in BUG: un=
able to handle kernel NULL pointer dereference at 00000000000000b8"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104609#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [G96, 9500 GT] Removing nouveau module results in BUG: un=
able to handle kernel NULL pointer dereference at 00000000000000b8"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104609">bug 10460=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
vedran&#64;miletic.net" title=3D"Vedran Mileti=C4=87 &lt;vedran&#64;miletic=
.net&gt;"> <span class=3D"fn">Vedran Mileti=C4=87</span></a>
</span></b>
        <pre>No, I can retry. What are the odds that ther machine reboots n=
icely without
hard reset after this? I have:

$ lsmod | grep nouveau
nouveau              1904640  -1
...</pre>
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

--15158456790.DDEeCDcD.31371--

--===============0477184284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0477184284==--
