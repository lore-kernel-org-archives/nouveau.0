From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105174] [GF108][Regression] Unable to handle NULL
 pointer dereference in nouveau_mem_host since kernel 4.15.3
Date: Mon, 26 Mar 2018 09:47:26 +0000
Message-ID: <bug-105174-8800-TDQ1LNbhrx@http.bugs.freedesktop.org/>
References: <bug-105174-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1602171288=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105174-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1602171288==
Content-Type: multipart/alternative; boundary="15220576460.c0fDCDC86.1801"
Content-Transfer-Encoding: 7bit


--15220576460.c0fDCDC86.1801
Date: Mon, 26 Mar 2018 09:47:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105174

--- Comment #18 from Stefano Biagiotti <stefano.biagiotti-h53T4Qt7PfY@public.gmane.org> ---
Created attachment 138354
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D138354&action=3Dedit
journalctl (kernel-4.15.12-301.fc27.x86_64

Fedora kernel-4.15.12-301.fc27.x86_64 from updates-testing repository still
doesn't resolve.

Display adapter (from lspci) is:
01:00.0 VGA compatible controller: NVIDIA Corporation G98 [GeForce 8400 GS =
Rev.
2] (rev a1)

Attach is an excerpt from "journalctl -k -b -1 --no-pager --no-hostname".

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15220576460.c0fDCDC86.1801
Date: Mon, 26 Mar 2018 09:47:26 +0000
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
   title=3D"RESOLVED FIXED - [GF108][Regression] Unable to handle NULL poin=
ter dereference in nouveau_mem_host since kernel 4.15.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174#c18">Comme=
nt # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [GF108][Regression] Unable to handle NULL poin=
ter dereference in nouveau_mem_host since kernel 4.15.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174">bug 10517=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stefano.biagiotti&#64;gtn.it" title=3D"Stefano Biagiotti &lt;stefano.biagio=
tti&#64;gtn.it&gt;"> <span class=3D"fn">Stefano Biagiotti</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D138354=
" name=3D"attach_138354" title=3D"journalctl (kernel-4.15.12-301.fc27.x86_6=
4">attachment 138354</a> <a href=3D"attachment.cgi?id=3D138354&amp;action=
=3Dedit" title=3D"journalctl (kernel-4.15.12-301.fc27.x86_64">[details]</a>=
</span>
journalctl (kernel-4.15.12-301.fc27.x86_64

Fedora kernel-4.15.12-301.fc27.x86_64 from updates-testing repository still
doesn't resolve.

Display adapter (from lspci) is:
01:00.0 VGA compatible controller: NVIDIA Corporation G98 [GeForce 8400 GS =
Rev.
2] (rev a1)

Attach is an excerpt from &quot;journalctl -k -b -1 --no-pager --no-hostnam=
e&quot;.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15220576460.c0fDCDC86.1801--

--===============1602171288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1602171288==--
