From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 38074] [NV96] Dual head doesn't work for some
 combination of monitors (second screen still off)
Date: Tue, 21 Apr 2015 14:44:05 +0000
Message-ID: <bug-38074-8800-vRF4tuyi5V@http.bugs.freedesktop.org/>
References: <bug-38074-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1055246794=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-38074-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1055246794==
Content-Type: multipart/alternative; boundary="1429627445.4aaA3.31556"; charset="UTF-8"


--1429627445.4aaA3.31556
Date: Tue, 21 Apr 2015 14:44:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=38074

--- Comment #27 from Harald Linden <harald.linden-5DDqXab0xuWsTnJN9+BGXg@public.gmane.org> ---
Problem still exists on Fedora 21. Versions and hardware::

01:00.0 VGA compatible controller: NVIDIA Corporation G96GL [Quadro FX 380]
(rev a1)

Linux 3.19.3-200.fc21.x86_64 #1 SMP Thu Mar 26 21:39:42 UTC 2015 x86_64 x86_64
x86_64 GNU/Linux

Dual screens, both 1280x1024 connected via DVI. Both are connected and active
according to xrandr, only one shows a picture.

Xorg.0.log and dmesg - see attachment.

Was also reproducable on a current Gentoo with kernel 3.19.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1429627445.4aaA3.31556
Date: Tue, 21 Apr 2015 14:44:05 +0000
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
   title="REOPENED - [NV96] Dual head doesn't work for some combination of monitors (second screen still off)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=38074#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [NV96] Dual head doesn't work for some combination of monitors (second screen still off)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=38074">bug 38074</a>
              from <span class="vcard"><a class="email" href="mailto:harald.linden&#64;thelow.net" title="Harald Linden &lt;harald.linden&#64;thelow.net&gt;"> <span class="fn">Harald Linden</span></a>
</span></b>
        <pre>Problem still exists on Fedora 21. Versions and hardware::

01:00.0 VGA compatible controller: NVIDIA Corporation G96GL [Quadro FX 380]
(rev a1)

Linux 3.19.3-200.fc21.x86_64 #1 SMP Thu Mar 26 21:39:42 UTC 2015 x86_64 x86_64
x86_64 GNU/Linux

Dual screens, both 1280x1024 connected via DVI. Both are connected and active
according to xrandr, only one shows a picture.

Xorg.0.log and dmesg - see attachment.

Was also reproducable on a current Gentoo with kernel 3.19.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1429627445.4aaA3.31556--

--===============1055246794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1055246794==--
