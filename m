From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69882] [NVE6] GPU lockups
Date: Tue, 19 Apr 2016 21:54:05 +0000
Message-ID: <bug-69882-8800-Q5b9aShJoi@http.bugs.freedesktop.org/>
References: <bug-69882-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0020613031=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69882-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0020613031==
Content-Type: multipart/alternative; boundary="14611028450.bdE0A.7151";
 charset="UTF-8"


--14611028450.bdE0A.7151
Date: Tue, 19 Apr 2016 21:54:05 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=69882

--- Comment #20 from Lucas Ribeiro <lucasout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Also having random lockups on a GTX 660 Ti (NVE4 according to glxinfo), since
kernel 4.1 I guess, using DRI2.
[    0.267666] nouveau 0000:02:00.0: NVIDIA GK104 (0e4030a2)
[    0.378583] nouveau 0000:02:00.0: bios: version 80.04.4b.00.1a
[    0.379302] nouveau 0000:02:00.0: fb: 2048 MiB GDDR5

Now on gentoo ~amd64 using:

sys-kernel/gentoo-sources-4.5.1
x11-base/xorg-server-1.18.3
x11-drivers/xf86-video-nouveau-1.0.12


Should I make a new entry for this card?

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14611028450.bdE0A.7151
Date: Tue, 19 Apr 2016 21:54:05 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [NVE6] GPU lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69882#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [NVE6] GPU lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69882">bug 69882</a>
              from <span class="vcard"><a class="email" href="mailto:lucasout&#64;gmail.com" title="Lucas Ribeiro &lt;lucasout&#64;gmail.com&gt;"> <span class="fn">Lucas Ribeiro</span></a>
</span></b>
        <pre>Also having random lockups on a GTX 660 Ti (NVE4 according to glxinfo), since
kernel 4.1 I guess, using DRI2.
[    0.267666] nouveau 0000:02:00.0: NVIDIA GK104 (0e4030a2)
[    0.378583] nouveau 0000:02:00.0: bios: version 80.04.4b.00.1a
[    0.379302] nouveau 0000:02:00.0: fb: 2048 MiB GDDR5

Now on gentoo ~amd64 using:

sys-kernel/gentoo-sources-4.5.1
x11-base/xorg-server-1.18.3
x11-drivers/xf86-video-nouveau-1.0.12


Should I make a new entry for this card?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14611028450.bdE0A.7151--

--===============0020613031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0020613031==--
