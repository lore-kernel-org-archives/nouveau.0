From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92032] NV34: WARNING: CPU: 0 PID: 290 at
 lib/dma-debug.c:1205 check_sync+0x169/0x6e0()
Date: Wed, 16 Dec 2015 10:59:15 +0000
Message-ID: <bug-92032-8800-fw9sFRrZhb@http.bugs.freedesktop.org/>
References: <bug-92032-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1184074520=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92032-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1184074520==
Content-Type: multipart/alternative; boundary="1450263555.F8ee76031.15919"; charset="UTF-8"


--1450263555.F8ee76031.15919
Date: Wed, 16 Dec 2015 10:59:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92032

--- Comment #6 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 120544
  --> https://bugs.freedesktop.org/attachment.cgi?id=120544&action=edit
4.4.0-0.rc5.git0.1.fc24.i686+debug nouveau sync DMA memory not allocated


WARNING: CPU: 0 PID: 340 at lib/dma-debug.c:1205 check_sync+0x16b/0x7d0()
nouveau 0000:01:00.0: DMA-API: device driver tries to sync DMA memory it has
not allocated [device address=0x00000000c0c09508] [size=4096 bytes]
Modules linked in: nouveau(+) mxm_wmi wmi video i2c_algo_bit ttm drm_kms_helper
drm ...
CPU: 0 PID: 340 Comm: systemd-udevd Not tainted
4.4.0-0.rc5.git0.1.fc24.i686+debug #1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1450263555.F8ee76031.15919
Date: Wed, 16 Dec 2015 10:59:15 +0000
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
   title="NEW - NV34: WARNING: CPU: 0 PID: 290 at lib/dma-debug.c:1205 check_sync+0x169/0x6e0()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92032#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV34: WARNING: CPU: 0 PID: 290 at lib/dma-debug.c:1205 check_sync+0x169/0x6e0()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92032">bug 92032</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=120544" name="attach_120544" title="4.4.0-0.rc5.git0.1.fc24.i686+debug nouveau sync DMA memory not allocated">attachment 120544</a> <a href="attachment.cgi?id=120544&amp;action=edit" title="4.4.0-0.rc5.git0.1.fc24.i686+debug nouveau sync DMA memory not allocated">[details]</a></span>
4.4.0-0.rc5.git0.1.fc24.i686+debug nouveau sync DMA memory not allocated


WARNING: CPU: 0 PID: 340 at lib/dma-debug.c:1205 check_sync+0x16b/0x7d0()
nouveau 0000:01:00.0: DMA-API: device driver tries to sync DMA memory it has
not allocated [device address=0x00000000c0c09508] [size=4096 bytes]
Modules linked in: nouveau(+) mxm_wmi wmi video i2c_algo_bit ttm drm_kms_helper
drm ...
CPU: 0 PID: 340 Comm: systemd-udevd Not tainted
4.4.0-0.rc5.git0.1.fc24.i686+debug #1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1450263555.F8ee76031.15919--

--===============1184074520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1184074520==--
