From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101027] Monitor turns black - only system reset helps
Date: Mon, 23 Oct 2017 21:40:07 +0000
Message-ID: <bug-101027-8800-QHOqaKh6Tv@http.bugs.freedesktop.org/>
References: <bug-101027-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1971382565=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101027-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1971382565==
Content-Type: multipart/alternative; boundary="15087948070.EF2872E3.7505";
 charset="UTF-8"


--15087948070.EF2872E3.7505
Date: Mon, 23 Oct 2017 21:40:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101027

--- Comment #1 from Bruce <bkorb-P4Gpa63ZLlY@public.gmane.org> ---
Me, too. It's been plaguing me since about May also.
Is there a programmatic way to tell the thing is hung so
I can at least start up a daemon to kill and restart the
desktop when this happens?

    $ lspci | grep -i vga ; uname -a
    01:00.0 VGA compatible controller: NVIDIA Corporation GK107 [GeForce GT
740] (rev a1)
    Linux bach 4.10.0-35-generic #39~16.04.1-Ubuntu SMP Wed Sep 13 09:02:42=
 UTC
2017 x86_64 x86_64 x86_64 GNU/Linux

None of my logs have anything interesting preceding the forced reset.

Oh, another little thingy: after a forced reset, the auto-hide feature of t=
he
system tray fails. It requires another reboot to clear the problem.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15087948070.EF2872E3.7505
Date: Mon, 23 Oct 2017 21:40:07 +0000
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
   title=3D"NEW - Monitor turns black - only system reset helps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101027#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Monitor turns black - only system reset helps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101027">bug 10102=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bkorb&#64;ntp.org" title=3D"Bruce &lt;bkorb&#64;ntp.org&gt;"> <span class=
=3D"fn">Bruce</span></a>
</span></b>
        <pre>Me, too. It's been plaguing me since about May also.
Is there a programmatic way to tell the thing is hung so
I can at least start up a daemon to kill and restart the
desktop when this happens?

    $ lspci | grep -i vga ; uname -a
    01:00.0 VGA compatible controller: NVIDIA Corporation GK107 [GeForce GT
740] (rev a1)
    Linux bach 4.10.0-35-generic #39~16.04.1-Ubuntu SMP Wed Sep 13 09:02:42=
 UTC
2017 x86_64 x86_64 x86_64 GNU/Linux

None of my logs have anything interesting preceding the forced reset.

Oh, another little thingy: after a forced reset, the auto-hide feature of t=
he
system tray fails. It requires another reboot to clear the problem.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15087948070.EF2872E3.7505--

--===============1971382565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1971382565==--
