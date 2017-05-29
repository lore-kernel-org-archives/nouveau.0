From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101184] [NVE6] [bisected] Panic on boot with GK106
Date: Mon, 29 May 2017 10:57:53 +0000
Message-ID: <bug-101184-8800-ebhaOeYRPU@http.bugs.freedesktop.org/>
References: <bug-101184-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1807132844=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101184-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1807132844==
Content-Type: multipart/alternative; boundary="14960554730.599B3de.2142";
 charset="UTF-8"


--14960554730.599B3de.2142
Date: Mon, 29 May 2017 10:57:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101184

--- Comment #4 from S. Gilles <sgilles-8yXg+M/94Z32fBVCVOL8/A@public.gmane.org> ---
Created attachment 131565
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D131565&action=3Dedit
output of dmesg on (working) 4.11.0-rc4 with nouveau.debug=3Ddebug

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14960554730.599B3de.2142
Date: Mon, 29 May 2017 10:57:53 +0000
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
   title=3D"NEW - [NVE6] [bisected] Panic on boot with GK106"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101184#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] [bisected] Panic on boot with GK106"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101184">bug 10118=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sgilles&#64;math.umd.edu" title=3D"S. Gilles &lt;sgilles&#64;math.umd.edu&g=
t;"> <span class=3D"fn">S. Gilles</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D131565=
" name=3D"attach_131565" title=3D"output of dmesg on (working) 4.11.0-rc4 w=
ith nouveau.debug=3Ddebug">attachment 131565</a> <a href=3D"attachment.cgi?=
id=3D131565&amp;action=3Dedit" title=3D"output of dmesg on (working) 4.11.0=
-rc4 with nouveau.debug=3Ddebug">[details]</a></span>
output of dmesg on (working) 4.11.0-rc4 with nouveau.debug=3Ddebug</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14960554730.599B3de.2142--

--===============1807132844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1807132844==--
