From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110407] /sys/class/backlight/nv_backlight doesn't
 work on Dell Precision 7530 GP107GLM [Quadro P1000 Mobile]
Date: Fri, 12 Apr 2019 15:10:12 +0000
Message-ID: <bug-110407-8800-wGQpVItcUA@http.bugs.freedesktop.org/>
References: <bug-110407-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2115982173=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110407-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2115982173==
Content-Type: multipart/alternative; boundary="15550818122.aCF6.28064"
Content-Transfer-Encoding: 7bit


--15550818122.aCF6.28064
Date: Fri, 12 Apr 2019 15:10:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110407

--- Comment #2 from Kai-Heng Feng <kai.heng.feng-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #1)
> When in non-switchable mode, are there other things in /sys/class/backlig=
ht?
> e.g. acpi_video0?

No, nv_backlight (or nvidia_0) is the only interface.

I also tried to call _BCM directly via acpidbg, but both Intel's and Nvidia=
's
_BCM method changes nothing.

Please refer to the original bug report [1].

>=20
> Also, presumably this is on v5.0 or later? Prior to that, there was no
> backlight support for Pascal.

Yes, on both v5.0 and linux-next.

[1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1821882

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15550818122.aCF6.28064
Date: Fri, 12 Apr 2019 15:10:12 +0000
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
   title=3D"NEW - /sys/class/backlight/nv_backlight doesn't work on Dell Pr=
ecision 7530 GP107GLM [Quadro P1000 Mobile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110407#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - /sys/class/backlight/nv_backlight doesn't work on Dell Pr=
ecision 7530 GP107GLM [Quadro P1000 Mobile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110407">bug 11040=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kai.heng.feng&#64;canonical.com" title=3D"Kai-Heng Feng &lt;kai.heng.feng&#=
64;canonical.com&gt;"> <span class=3D"fn">Kai-Heng Feng</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D110=
407#c1">comment #1</a>)
<span class=3D"quote">&gt; When in non-switchable mode, are there other thi=
ngs in /sys/class/backlight?
&gt; e.g. acpi_video0?</span >

No, nv_backlight (or nvidia_0) is the only interface.

I also tried to call _BCM directly via acpidbg, but both Intel's and Nvidia=
's
_BCM method changes nothing.

Please refer to the original bug report [1].

<span class=3D"quote">&gt;=20
&gt; Also, presumably this is on v5.0 or later? Prior to that, there was no
&gt; backlight support for Pascal.</span >

Yes, on both v5.0 and linux-next.

[1] <a href=3D"https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1821882=
">https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1821882</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15550818122.aCF6.28064--

--===============2115982173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2115982173==--
