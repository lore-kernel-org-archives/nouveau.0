From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91535] [NVE7] Chrome can cause a nouveau 'multiple
 instances of buffer' message when overlaying a menu leading to X lockup
Date: Wed, 12 Aug 2015 13:27:41 +0000
Message-ID: <bug-91535-8800-h1mQYUlPF3@http.bugs.freedesktop.org/>
References: <bug-91535-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1149534883=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91535-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1149534883==
Content-Type: multipart/alternative; boundary="1439386061.A3a13.21479"; charset="UTF-8"


--1439386061.A3a13.21479
Date: Wed, 12 Aug 2015 13:27:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91535

--- Comment #3 from Arjen <arjen-eXgbS2E5kEI@public.gmane.org> ---
Also having X lockups, triggered by chromium and/or gnome-shell.

Linux 4.1.4-1-ARCH
libdrm-2.4.62-1
mesa-10.6.3-1

Running ArchLinux, so using all the latests versions.
Using XFCE does not fix the problem, as chromium alone can trigger it.

Aug 12 15:15:53 imac.office.nl kernel: nouveau E[chromium[2045]] fail
set_domain
Aug 12 15:15:53 imac.office.nl kernel: nouveau E[chromium[2045]] validating bo
list
Aug 12 15:15:53 imac.office.nl kernel: nouveau E[chromium[2045]] validate: -22
Aug 12 15:15:53 imac.office.nl kernel: nouveau E[chromium[2045]] fail
set_domain
Aug 12 15:15:53 imac.office.nl kernel: nouveau E[chromium[2045]] validating bo
list
Aug 12 15:15:53 imac.office.nl kernel: nouveau E[chromium[2045]] validate: -22

[..]

Aug 12 13:05:24 imac.office.nl kernel: nouveau E[   PFIFO][0000:01:00.0] write
fault at 0x0010fc0000 [PTE] from GR/GPC0/PROP_0 on channel 0x001f7d9000
[gnome-shell[906]]
Aug 12 13:05:24 imac.office.nl kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH
engine fault on channel 8, recovering...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1439386061.A3a13.21479
Date: Wed, 12 Aug 2015 13:27:41 +0000
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
   title="NEW - [NVE7] Chrome can cause a nouveau 'multiple instances of buffer' message when overlaying a menu leading to X lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91535#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] Chrome can cause a nouveau 'multiple instances of buffer' message when overlaying a menu leading to X lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91535">bug 91535</a>
              from <span class="vcard"><a class="email" href="mailto:arjen&#64;parse.nl" title="Arjen &lt;arjen&#64;parse.nl&gt;"> <span class="fn">Arjen</span></a>
</span></b>
        <pre>Also having X lockups, triggered by chromium and/or gnome-shell.

Linux 4.1.4-1-ARCH
libdrm-2.4.62-1
mesa-10.6.3-1

Running ArchLinux, so using all the latests versions.
Using XFCE does not fix the problem, as chromium alone can trigger it.

Aug 12 15:15:53 imac.office.nl kernel: nouveau E[chromium[2045]] fail
set_domain
Aug 12 15:15:53 imac.office.nl kernel: nouveau E[chromium[2045]] validating bo
list
Aug 12 15:15:53 imac.office.nl kernel: nouveau E[chromium[2045]] validate: -22
Aug 12 15:15:53 imac.office.nl kernel: nouveau E[chromium[2045]] fail
set_domain
Aug 12 15:15:53 imac.office.nl kernel: nouveau E[chromium[2045]] validating bo
list
Aug 12 15:15:53 imac.office.nl kernel: nouveau E[chromium[2045]] validate: -22

[..]

Aug 12 13:05:24 imac.office.nl kernel: nouveau E[   PFIFO][0000:01:00.0] write
fault at 0x0010fc0000 [PTE] from GR/GPC0/PROP_0 on channel 0x001f7d9000
[gnome-shell[906]]
Aug 12 13:05:24 imac.office.nl kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH
engine fault on channel 8, recovering...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1439386061.A3a13.21479--

--===============1149534883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1149534883==--
