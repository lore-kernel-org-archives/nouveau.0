From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91535] [NVE7] Chrome can cause a nouveau 'multiple
 instances of buffer' message when overlaying a menu leading to X lockup
Date: Mon, 03 Aug 2015 01:00:57 +0000
Message-ID: <bug-91535-8800-MzgfGOtFH7@http.bugs.freedesktop.org/>
References: <bug-91535-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1416878006=="
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


--===============1416878006==
Content-Type: multipart/alternative; boundary="1438563657.7Ace3352.30774"; charset="UTF-8"


--1438563657.7Ace3352.30774
Date: Mon, 3 Aug 2015 01:00:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91535

--- Comment #2 from Bryan O'Donoghue <pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org> ---
Compositor : I've tried on gnome+metacity, fluxbox, lxde and KDE.

DRI:
Looks like DRI2

[     8.723] (--) Depth 24 pixmap format is 32 bpp
[     8.725] (II) NOUVEAU(0): Opened GPU channel 0
[     8.728] (II) NOUVEAU(0): [DRI2] Setup complete
[     8.728] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[     8.728] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau

GLAMOR:
and so therefore not using GLAMOR + DRI3

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1438563657.7Ace3352.30774
Date: Mon, 3 Aug 2015 01:00:57 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91535#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] Chrome can cause a nouveau 'multiple instances of buffer' message when overlaying a menu leading to X lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91535">bug 91535</a>
              from <span class="vcard"><a class="email" href="mailto:pure.logic&#64;nexus-software.ie" title="Bryan O'Donoghue &lt;pure.logic&#64;nexus-software.ie&gt;"> <span class="fn">Bryan O'Donoghue</span></a>
</span></b>
        <pre>Compositor : I've tried on gnome+metacity, fluxbox, lxde and KDE.

DRI:
Looks like DRI2

[     8.723] (--) Depth 24 pixmap format is 32 bpp
[     8.725] (II) NOUVEAU(0): Opened GPU channel 0
[     8.728] (II) NOUVEAU(0): [DRI2] Setup complete
[     8.728] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[     8.728] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau

GLAMOR:
and so therefore not using GLAMOR + DRI3</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1438563657.7Ace3352.30774--

--===============1416878006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1416878006==--
