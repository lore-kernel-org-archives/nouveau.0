From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88868] PowerPC e5500, kernel crash, GT520, GT610
Date: Sun, 01 Feb 2015 22:34:02 +0000
Message-ID: <bug-88868-8800-aftyd1kzhA@http.bugs.freedesktop.org/>
References: <bug-88868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1687525872=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88868-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1687525872==
Content-Type: multipart/alternative; boundary="1422830042.2D4D1.25039"; charset="UTF-8"


--1422830042.2D4D1.25039
Date: Sun, 1 Feb 2015 22:34:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88868

--- Comment #16 from Dmitriy <oboturoff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 113026
  --> https://bugs.freedesktop.org/attachment.cgi?id=113026&action=edit
incorrect image

Dear Ben and Ilia. Thank you for your answers.

There is no BIOS on our device. We have u-boot instead of it. But that patch
from Ben is necessary even in kernel of the version 3.18.5.

The result of the monitor connection is in attach picture. The image is
incorrect. I tested both video cards GT520 and GT610, the result is the same.

There are some errors in the initialisation log.
nouveau E[   PFIFO][0000:01:00.0] PBDMA0: (unknown bits 0x00004000)
nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 1 [DRM] subc 0 mthd 0x0000 data
0x00000000
.......
nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
nouveau 0000:01:00.0: registered panic notifier

Could the wrong work of video card  be the reason of these errors?  Or what
else is to be tested to find out the cause of wrong function.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422830042.2D4D1.25039
Date: Sun, 1 Feb 2015 22:34:02 +0000
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
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868">bug 88868</a>
              from <span class="vcard"><a class="email" href="mailto:oboturoff&#64;gmail.com" title="Dmitriy &lt;oboturoff&#64;gmail.com&gt;"> <span class="fn">Dmitriy</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=113026" name="attach_113026" title="incorrect image">attachment 113026</a> <a href="attachment.cgi?id=113026&amp;action=edit" title="incorrect image">[details]</a></span>
incorrect image

Dear Ben and Ilia. Thank you for your answers.

There is no BIOS on our device. We have u-boot instead of it. But that patch
from Ben is necessary even in kernel of the version 3.18.5.

The result of the monitor connection is in attach picture. The image is
incorrect. I tested both video cards GT520 and GT610, the result is the same.

There are some errors in the initialisation log.
nouveau E[   PFIFO][0000:01:00.0] PBDMA0: (unknown bits 0x00004000)
nouveau E[   PFIFO][0000:01:00.0] PBDMA0: ch 1 [DRM] subc 0 mthd 0x0000 data
0x00000000
.......
nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
nouveau 0000:01:00.0: registered panic notifier

Could the wrong work of video card  be the reason of these errors?  Or what
else is to be tested to find out the cause of wrong function.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422830042.2D4D1.25039--

--===============1687525872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1687525872==--
