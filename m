From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100228] [NV137] bus: MMIO read of 00000000 FAULT at
 409800 [ TIMEOUT ]
Date: Tue, 04 Sep 2018 17:21:45 +0000
Message-ID: <bug-100228-8800-CP25dIxNdV@http.bugs.freedesktop.org/>
References: <bug-100228-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0664407774=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100228-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0664407774==
Content-Type: multipart/alternative; boundary="15360817067.B87B2.8919"
Content-Transfer-Encoding: 7bit


--15360817067.B87B2.8919
Date: Tue, 4 Sep 2018 17:21:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100228

--- Comment #22 from Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
So there's updated low-level firmware shipped by NVIDIA for the GP107 (and
other pre-GP108 Pascal GPUs) [0]. This might resolve or improve the situati=
on
for mobile GP107 users.

   nvidia: switch GP10[2467] to newer scrubber/ACR firmware (from GP108)

   This is being done to resolve issues being seen on a number of newer
   laptop systems which aren't compatible with the older binaries.

Users will likely need to wait for their distribution to ship the updated
firmware through the usual package update process, or get the firmware dire=
ctly
from upstream linux-firmware.git.

[0]
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git=
/commit/?id=3D85c5d90fc155d78531efa5d2b02e92aaef7e4b88

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15360817067.B87B2.8919
Date: Tue, 4 Sep 2018 17:21:46 +0000
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
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228#c22">Comme=
nt # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">bug 10022=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rhyskidd&#64;gmail.com" title=3D"Rhys Kidd &lt;rhyskidd&#64;gmail.com&gt;">=
 <span class=3D"fn">Rhys Kidd</span></a>
</span></b>
        <pre>So there's updated low-level firmware shipped by NVIDIA for th=
e GP107 (and
other pre-GP108 Pascal GPUs) [0]. This might resolve or improve the situati=
on
for mobile GP107 users.

   nvidia: switch GP10[2467] to newer scrubber/ACR firmware (from GP108)

   This is being done to resolve issues being seen on a number of newer
   laptop systems which aren't compatible with the older binaries.

Users will likely need to wait for their distribution to ship the updated
firmware through the usual package update process, or get the firmware dire=
ctly
from upstream linux-firmware.git.

[0]
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-f=
irmware.git/commit/?id=3D85c5d90fc155d78531efa5d2b02e92aaef7e4b88">https://=
git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/=
?id=3D85c5d90fc155d78531efa5d2b02e92aaef7e4b88</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15360817067.B87B2.8919--

--===============0664407774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0664407774==--
