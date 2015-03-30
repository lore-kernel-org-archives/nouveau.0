From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82714] [G84] nouveau fails to properly initialize GPU
Date: Mon, 30 Mar 2015 18:19:40 +0000
Message-ID: <bug-82714-8800-maoH6891ot@http.bugs.freedesktop.org/>
References: <bug-82714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1154984024=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1154984024==
Content-Type: multipart/alternative; boundary="1427739580.A1dC6BdA2.10817"; charset="UTF-8"


--1427739580.A1dC6BdA2.10817
Date: Mon, 30 Mar 2015 18:19:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82714

--- Comment #8 from Bruno <bonbons-lhzhVDjRGQBulxpn9UvDqw@public.gmane.org> ---
Created attachment 114731
  --> https://bugs.freedesktop.org/attachment.cgi?id=114731&action=edit
dmesg with 3.19 but runpm=0

Same kernel, kernel log starting at loading nouveau with `modprobe nouveau
debug=debug runpm=0` and running Xorg on top of it:

Xorg.0.log tail:
[   235.286]    ABI class: X.Org ANSI C Emulation, version 0.4
[   235.286] (II) Loading sub module "shadowfb"
[   235.286] (II) LoadModule: "shadowfb"
[   235.286] (II) Loading /usr/lib64/xorg/modules/libshadowfb.so
[   235.286] (II) Module shadowfb: vendor="X.Org Foundation"
[   235.286]    compiled for 1.16.4, module version = 1.0.0
[   235.286]    ABI class: X.Org ANSI C Emulation, version 0.4
[   235.286] (--) Depth 24 pixmap format is 32 bpp
[   235.294] (II) NOUVEAU(0): Channel setup complete.
[   257.296] (EE) NOUVEAU(0): [COPY] failed to allocate class.

Once Xorg is started system gets sluggish until it completely freezes (even
netconsole can't send more data). This kernel load was gathered via netconsole
while the previous one was collected locally.
As system froze, I have no state information for Xorg.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427739580.A1dC6BdA2.10817
Date: Mon, 30 Mar 2015 18:19:40 +0000
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
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons&#64;sysophe.eu" title="Bruno &lt;bonbons&#64;sysophe.eu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=114731" name="attach_114731" title="dmesg with 3.19 but runpm=0">attachment 114731</a> <a href="attachment.cgi?id=114731&amp;action=edit" title="dmesg with 3.19 but runpm=0">[details]</a></span>
dmesg with 3.19 but runpm=0

Same kernel, kernel log starting at loading nouveau with `modprobe nouveau
debug=debug runpm=0` and running Xorg on top of it:

Xorg.0.log tail:
[   235.286]    ABI class: X.Org ANSI C Emulation, version 0.4
[   235.286] (II) Loading sub module &quot;shadowfb&quot;
[   235.286] (II) LoadModule: &quot;shadowfb&quot;
[   235.286] (II) Loading /usr/lib64/xorg/modules/libshadowfb.so
[   235.286] (II) Module shadowfb: vendor=&quot;X.Org Foundation&quot;
[   235.286]    compiled for 1.16.4, module version = 1.0.0
[   235.286]    ABI class: X.Org ANSI C Emulation, version 0.4
[   235.286] (--) Depth 24 pixmap format is 32 bpp
[   235.294] (II) NOUVEAU(0): Channel setup complete.
[   257.296] (EE) NOUVEAU(0): [COPY] failed to allocate class.

Once Xorg is started system gets sluggish until it completely freezes (even
netconsole can't send more data). This kernel load was gathered via netconsole
while the previous one was collected locally.
As system froze, I have no state information for Xorg.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427739580.A1dC6BdA2.10817--

--===============1154984024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1154984024==--
