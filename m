From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92852] NV34: WARNING: ... at
 drivers/gpu/drm/drm_irq.c:924 drm_vblank_count_and_time+0x71/0x80 [drm]()
Date: Sat, 07 Nov 2015 05:29:32 +0000
Message-ID: <bug-92852-8800-OSVhCzNRsv@http.bugs.freedesktop.org/>
References: <bug-92852-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0800768176=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92852-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0800768176==
Content-Type: multipart/alternative; boundary="1446874172.a63b1.26596"; charset="UTF-8"


--1446874172.a63b1.26596
Date: Sat, 7 Nov 2015 05:29:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92852

--- Comment #4 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

How to reproduce:

Run xfce4-session with display compositing enabled:
$ xfconf-query --channel xfwm4 --property /general/use_compositing
true

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446874172.a63b1.26596
Date: Sat, 7 Nov 2015 05:29:32 +0000
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
   title="NEW - NV34: WARNING: ... at drivers/gpu/drm/drm_irq.c:924 drm_vblank_count_and_time+0x71/0x80 [drm]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92852#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV34: WARNING: ... at drivers/gpu/drm/drm_irq.c:924 drm_vblank_count_and_time+0x71/0x80 [drm]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92852">bug 92852</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
How to reproduce:

Run xfce4-session with display compositing enabled:
$ xfconf-query --channel xfwm4 --property /general/use_compositing
true</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446874172.a63b1.26596--

--===============0800768176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0800768176==--
