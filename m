From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94374] transparent window with DRI_PRIME=1,
 depending on size of used textures
Date: Thu, 22 Dec 2016 08:08:26 +0000
Message-ID: <bug-94374-8800-jhLJIgPgyG@http.bugs.freedesktop.org/>
References: <bug-94374-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1301434261=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94374-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1301434261==
Content-Type: multipart/alternative; boundary="14823941060.C2f3ffA3e.30451";
 charset="UTF-8"


--14823941060.C2f3ffA3e.30451
Date: Thu, 22 Dec 2016 08:08:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94374

--- Comment #11 from Dongmin Kim <kim135797531g-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
* For note - Get the same issue at Ubuntu 16.04 LTS 64-bit.

- Intel Ivy-bridge & AMD HD 7650M Hybrid graphics
- DRI2 for default
- Kernel 4.4.0-53
- Mesa 11.2.0

It happened with texture sizes over than 256, but when I use DRI3, it never
happens anymore.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14823941060.C2f3ffA3e.30451
Date: Thu, 22 Dec 2016 08:08:26 +0000
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
   title=3D"RESOLVED WORKSFORME - transparent window with DRI_PRIME=3D1, de=
pending on size of used textures"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94374#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - transparent window with DRI_PRIME=3D1, de=
pending on size of used textures"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94374">bug 94374<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kim135797531g&#64;gmail.com" title=3D"Dongmin Kim &lt;kim135797531g&#64;gma=
il.com&gt;"> <span class=3D"fn">Dongmin Kim</span></a>
</span></b>
        <pre>* For note - Get the same issue at Ubuntu 16.04 LTS 64-bit.

- Intel Ivy-bridge &amp; AMD HD 7650M Hybrid graphics
- DRI2 for default
- Kernel 4.4.0-53
- Mesa 11.2.0

It happened with texture sizes over than 256, but when I use DRI3, it never
happens anymore.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14823941060.C2f3ffA3e.30451--

--===============1301434261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1301434261==--
