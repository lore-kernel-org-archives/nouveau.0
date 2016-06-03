From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Fri, 03 Jun 2016 23:29:18 +0000
Message-ID: <bug-59069-8800-JusC0Zqn2Q@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0505007609=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0505007609==
Content-Type: multipart/alternative; boundary="14649965586.2B1b52.3674";
 charset="UTF-8"


--14649965586.2B1b52.3674
Date: Fri, 3 Jun 2016 23:29:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D59069

--- Comment #46 from Matt Whitlock <freedesktop-wf/ZkUcLzLDBWRuVRseHprNAH6kLmebB@public.gmane.org> ---
I discovered several failed capacitors on my motherboard. After replacing t=
hem,
my system stability issues (including some single-bit I/O errors I was
observing fairly frequently) have been resolved.

(In reply to Ilia Mirkin from comment #45)
> Matt, if you're looking for advice on a GPU to buy, try IRC (#nouveau on
> freenode). My quick recommendation is: "not NVIDIA". If you're set on
> NVIDIA, happy to discuss the various trade-offs on IRC.

Thank you for the recommendation. I have switched to a Radeon R7 360 (GCN 1=
.1
microarchitecture, Bonaire Pro chipset) and could not be happier with the
open-source Radeon driver and the resulting desktop graphics performance on=
 my
system. Kudos to AMD for releasing enough documentation on their chipsets to
allow development of a proper (non-reversed-engineered) driver. What a
difference it makes. I'll never go back to Nvidia.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14649965586.2B1b52.3674
Date: Fri, 3 Jun 2016 23:29:18 +0000
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
   title=3D"RESOLVED INVALID - nouveau E[ DRM] fail ttm_validate"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59069#c46">Commen=
t # 46</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - nouveau E[ DRM] fail ttm_validate"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59069">bug 59069<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;mattwhitlock.name" title=3D"Matt Whitlock &lt;freedesktop&#=
64;mattwhitlock.name&gt;"> <span class=3D"fn">Matt Whitlock</span></a>
</span></b>
        <pre>I discovered several failed capacitors on my motherboard. Afte=
r replacing them,
my system stability issues (including some single-bit I/O errors I was
observing fairly frequently) have been resolved.

(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D59069#c45">comme=
nt #45</a>)
<span class=3D"quote">&gt; Matt, if you're looking for advice on a GPU to b=
uy, try IRC (#nouveau on
&gt; freenode). My quick recommendation is: &quot;not NVIDIA&quot;. If you'=
re set on
&gt; NVIDIA, happy to discuss the various trade-offs on IRC.</span >

Thank you for the recommendation. I have switched to a Radeon R7 360 (GCN 1=
.1
microarchitecture, Bonaire Pro chipset) and could not be happier with the
open-source Radeon driver and the resulting desktop graphics performance on=
 my
system. Kudos to AMD for releasing enough documentation on their chipsets to
allow development of a proper (non-reversed-engineered) driver. What a
difference it makes. I'll never go back to Nvidia.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14649965586.2B1b52.3674--

--===============0505007609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0505007609==--
