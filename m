From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105687] BUG: unable to handle kernel NULL pointer
 dereference at 0000000000000ca0
Date: Tue, 24 Apr 2018 14:04:41 +0000
Message-ID: <bug-105687-8800-VIt0gcW8Hn@http.bugs.freedesktop.org/>
References: <bug-105687-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1840176774=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105687-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1840176774==
Content-Type: multipart/alternative; boundary="15245786812.fAeb9e7Bc.3897"
Content-Transfer-Encoding: 7bit


--15245786812.fAeb9e7Bc.3897
Date: Tue, 24 Apr 2018 14:04:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105687

--- Comment #5 from Stefano Biagiotti <stefano.biagiotti-h53T4Qt7PfY@public.gmane.org> ---
Created attachment 139057
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D139057&action=3Dedit
journalctl -k

Bug still present with kernel-4.15.17-300.fc27.x86_64.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15245786812.fAeb9e7Bc.3897
Date: Tue, 24 Apr 2018 14:04:41 +0000
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
   title=3D"NEW - BUG: unable to handle kernel NULL pointer dereference at =
0000000000000ca0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105687#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - BUG: unable to handle kernel NULL pointer dereference at =
0000000000000ca0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105687">bug 10568=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stefano.biagiotti&#64;gtn.it" title=3D"Stefano Biagiotti &lt;stefano.biagio=
tti&#64;gtn.it&gt;"> <span class=3D"fn">Stefano Biagiotti</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D139057=
" name=3D"attach_139057" title=3D"journalctl -k">attachment 139057</a> <a h=
ref=3D"attachment.cgi?id=3D139057&amp;action=3Dedit" title=3D"journalctl -k=
">[details]</a></span>
journalctl -k

Bug still present with kernel-4.15.17-300.fc27.x86_64.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15245786812.fAeb9e7Bc.3897--

--===============1840176774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1840176774==--
