From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103721] [GM107] Frequent freezes with nouveau on
 Thinkpad P50
Date: Mon, 12 Mar 2018 13:45:58 +0000
Message-ID: <bug-103721-8800-pK3pU73Isd@http.bugs.freedesktop.org/>
References: <bug-103721-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0259182609=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103721-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0259182609==
Content-Type: multipart/alternative; boundary="15208623584.BeCCCd.667"
Content-Transfer-Encoding: 7bit


--15208623584.BeCCCd.667
Date: Mon, 12 Mar 2018 13:45:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103721

--- Comment #10 from James Hewitt <james.hewitt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I haven't seen a freeze for a while, I'm guessing that a recent kernel upda=
te
has resolved the freeze.

Instead, I occasionally get a chrome tab going screwy with a segfault in
nouveau:
Mar 12 13:40:23 ibm007470 kernel: nouveau 0000:01:00.0: Xorg[2838]: Unknown
handle 0x01c69fda
Mar 12 13:40:23 ibm007470 kernel: nouveau 0000:01:00.0: Xorg[2838]:
validate_init
Mar 12 13:40:23 ibm007470 kernel: nouveau 0000:01:00.0: Xorg[2838]: validat=
e:
-2
Mar 12 13:40:23 ibm007470 kernel: show_signal_msg: 6 callbacks suppressed
Mar 12 13:40:23 ibm007470 kernel: chrome[6053]: segfault at fffff5c81b30075=
a ip
00007f10c41be05c sp 00007ffd499625b0 error 5 in
libdrm_nouveau.so.2.0.0[7f10c41bb000+7000]

Going to raise that with the chromium team to see if they can get more debug
info that could address a potential underlying cause.

Current kernel: Linux ibm007470 4.15.6-300.fc27.x86_64 #1 SMP Mon Feb 26
18:43:03 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15208623584.BeCCCd.667
Date: Mon, 12 Mar 2018 13:45:58 +0000
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
   title=3D"NEW - [GM107] Frequent freezes with nouveau on Thinkpad P50"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103721#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM107] Frequent freezes with nouveau on Thinkpad P50"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103721">bug 10372=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
james.hewitt&#64;gmail.com" title=3D"James Hewitt &lt;james.hewitt&#64;gmai=
l.com&gt;"> <span class=3D"fn">James Hewitt</span></a>
</span></b>
        <pre>I haven't seen a freeze for a while, I'm guessing that a recen=
t kernel update
has resolved the freeze.

Instead, I occasionally get a chrome tab going screwy with a segfault in
nouveau:
Mar 12 13:40:23 ibm007470 kernel: nouveau 0000:01:00.0: Xorg[2838]: Unknown
handle 0x01c69fda
Mar 12 13:40:23 ibm007470 kernel: nouveau 0000:01:00.0: Xorg[2838]:
validate_init
Mar 12 13:40:23 ibm007470 kernel: nouveau 0000:01:00.0: Xorg[2838]: validat=
e:
-2
Mar 12 13:40:23 ibm007470 kernel: show_signal_msg: 6 callbacks suppressed
Mar 12 13:40:23 ibm007470 kernel: chrome[6053]: segfault at fffff5c81b30075=
a ip
00007f10c41be05c sp 00007ffd499625b0 error 5 in
libdrm_nouveau.so.2.0.0[7f10c41bb000+7000]

Going to raise that with the chromium team to see if they can get more debug
info that could address a potential underlying cause.

Current kernel: Linux ibm007470 4.15.6-300.fc27.x86_64 #1 SMP Mon Feb 26
18:43:03 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15208623584.BeCCCd.667--

--===============0259182609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0259182609==--
