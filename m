From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91025] nouveau fails to run with NV5 [Riva TNT2 /
	TNT2 Pro]
Date: Fri, 19 Jun 2015 09:54:14 +0000
Message-ID: <bug-91025-8800-3h42QMbuJ2@http.bugs.freedesktop.org/>
References: <bug-91025-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0106368675=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91025-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0106368675==
Content-Type: multipart/alternative; boundary="1434707654.212c1.23603"; charset="UTF-8"


--1434707654.212c1.23603
Date: Fri, 19 Jun 2015 09:54:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91025

--- Comment #5 from anonymissimus-KvP5wT2u2U0@public.gmane.org ---
Sorry, I only know how to apply git c source code patches onto a git
repository, not a Linux OS.
What I was expecting needing to do is to checkout nouveau's fixed code, build
it and somehow install it over the version in the package manager/this
distribution, at which point I would hopefully have a working driver.

In my first post I of course meant "jessie", not "stretch" (testing).

I succeeded at building nvagetbios and nvbios, but both fail:

anonymissimus@debian:/media/HD3_SOURCE/envytools/nva$ ./nvagetbios
WARN: Can't probe 0000:01:00.0
PCI init failure!

anonymissimus@debian:/media/HD3_SOURCE/envytools/nvbios$ ./nvbios mybios.rom
warning: No strap specified
fopen: No such file or directory
Failed to read VBIOS!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1434707654.212c1.23603
Date: Fri, 19 Jun 2015 09:54:14 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau fails to run with NV5 [Riva TNT2 / TNT2 Pro]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91025#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau fails to run with NV5 [Riva TNT2 / TNT2 Pro]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91025">bug 91025</a>
              from <span class="vcard"><a class="email" href="mailto:anonymissimus&#64;arcor.de" title="anonymissimus&#64;arcor.de">anonymissimus&#64;arcor.de</a>
</span></b>
        <pre>Sorry, I only know how to apply git c source code patches onto a git
repository, not a Linux OS.
What I was expecting needing to do is to checkout nouveau's fixed code, build
it and somehow install it over the version in the package manager/this
distribution, at which point I would hopefully have a working driver.

In my first post I of course meant &quot;jessie&quot;, not &quot;stretch&quot; (testing).

I succeeded at building nvagetbios and nvbios, but both fail:

anonymissimus&#64;debian:/media/HD3_SOURCE/envytools/nva$ ./nvagetbios
WARN: Can't probe 0000:01:00.0
PCI init failure!

anonymissimus&#64;debian:/media/HD3_SOURCE/envytools/nvbios$ ./nvbios mybios.rom
warning: No strap specified
fopen: No such file or directory
Failed to read VBIOS!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434707654.212c1.23603--

--===============0106368675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0106368675==--
