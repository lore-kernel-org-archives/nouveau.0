From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sat, 28 Sep 2019 08:28:25 +0000
Message-ID: <bug-75985-8800-p5qSKcAV5I@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1854095538=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75985-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1854095538==
Content-Type: multipart/alternative; boundary="15696593050.F19785.19732"
Content-Transfer-Encoding: 7bit


--15696593050.F19785.19732
Date: Sat, 28 Sep 2019 08:28:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #81 from Przemys=C5=82aw Kopa <prymoo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Daniel Drake from comment #80)
> A patch titled "PCI: Enable NVIDIA HDA controllers" (effecively attachment
> #137939 [details] [review]) is headed into linux-next and potentially Lin=
ux
> 5.3. Testing appreciated!

Hello there! This commit prevents vga_switcheroo from turning off dGPU (Gef=
orce
540m) on my optimus machine as described here:
https://bbs.archlinux.org/viewtopic.php?pid=3D1865512#p1865512. I never had
problems with HDMI audio on this system - I think all connectors are connec=
ted
to the Intel GPU, yet NVIDIA HDA is still enabled by this patch.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15696593050.F19785.19732
Date: Sat, 28 Sep 2019 08:28:25 +0000
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
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c81">Commen=
t # 81</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
prymoo&#64;gmail.com" title=3D"Przemys=C5=82aw Kopa &lt;prymoo&#64;gmail.co=
m&gt;"> <span class=3D"fn">Przemys=C5=82aw Kopa</span></a>
</span></b>
        <pre>(In reply to Daniel Drake from <a href=3D"show_bug.cgi?id=3D75=
985#c80">comment #80</a>)
<span class=3D"quote">&gt; A patch titled &quot;PCI: Enable NVIDIA HDA cont=
rollers&quot; (effecively attachment
&gt; #137939 [details] [review]) is headed into linux-next and potentially =
Linux
&gt; 5.3. Testing appreciated!</span >

Hello there! This commit prevents vga_switcheroo from turning off dGPU (Gef=
orce
540m) on my optimus machine as described here:
<a href=3D"https://bbs.archlinux.org/viewtopic.php?pid=3D1865512#p1865512">=
https://bbs.archlinux.org/viewtopic.php?pid=3D1865512#p1865512</a>. I never=
 had
problems with HDMI audio on this system - I think all connectors are connec=
ted
to the Intel GPU, yet NVIDIA HDA is still enabled by this patch.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15696593050.F19785.19732--

--===============1854095538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1854095538==--
