From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101665] lspci blocks forever with a GP107M
Date: Wed, 09 Jan 2019 09:54:58 +0000
Message-ID: <bug-101665-8800-OKsEDhzUHS@http.bugs.freedesktop.org/>
References: <bug-101665-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1391090452=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101665-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1391090452==
Content-Type: multipart/alternative; boundary="15470276981.33ab.8987"
Content-Transfer-Encoding: 7bit


--15470276981.33ab.8987
Date: Wed, 9 Jan 2019 09:54:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101665

--- Comment #17 from Andrey Melentyev <andrey+freedesktop-TVrNfIo4idvLoDKTGw+V6w@public.gmane.org> ---
Created attachment 143032
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D143032&action=3Dedit
dmesg from thinkpad x1 extreme / GTX 1050 Ti on kernel 4.20 with discrete o=
nly
graphics

Not sure if that helps with the diagnostics, but on the same Thinkpad X1
Extreme laptop with "Discrete only" BIOS setting, lspci works fine, X starts
and works, but there's a timeout logged by nouveau.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15470276981.33ab.8987
Date: Wed, 9 Jan 2019 09:54:58 +0000
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
   title=3D"NEW - lspci blocks forever with a GP107M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101665#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - lspci blocks forever with a GP107M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101665">bug 10166=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrey+freedesktop&#64;psyduck.se" title=3D"Andrey Melentyev &lt;andrey+fre=
edesktop&#64;psyduck.se&gt;"> <span class=3D"fn">Andrey Melentyev</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D143032=
" name=3D"attach_143032" title=3D"dmesg from thinkpad x1 extreme / GTX 1050=
 Ti on kernel 4.20 with discrete only graphics">attachment 143032</a> <a hr=
ef=3D"attachment.cgi?id=3D143032&amp;action=3Dedit" title=3D"dmesg from thi=
nkpad x1 extreme / GTX 1050 Ti on kernel 4.20 with discrete only graphics">=
[details]</a></span>
dmesg from thinkpad x1 extreme / GTX 1050 Ti on kernel 4.20 with discrete o=
nly
graphics

Not sure if that helps with the diagnostics, but on the same Thinkpad X1
Extreme laptop with &quot;Discrete only&quot; BIOS setting, lspci works fin=
e, X starts
and works, but there's a timeout logged by nouveau.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15470276981.33ab.8987--

--===============1391090452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1391090452==--
