From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87244] [NV94] X hangs,
 logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after
 101 spins, halt followed by an X trace
Date: Fri, 26 Dec 2014 12:52:15 +0000
Message-ID: <bug-87244-8800-eiaKFaPdsB@http.bugs.freedesktop.org/>
References: <bug-87244-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1568560167=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87244-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1568560167==
Content-Type: multipart/alternative; boundary="1419598335.bB8f12.13680"; charset="UTF-8"


--1419598335.bB8f12.13680
Date: Fri, 26 Dec 2014 12:52:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87244

--- Comment #3 from Zlatko Calusic <zcalusic-7aYyyD3GOf7R7s880joybQ@public.gmane.org> ---
Created attachment 111369
  --> https://bugs.freedesktop.org/attachment.cgi?id=111369&action=edit
Revert-drm-nouveau-fifo-g84-ack-non-stall-interrupt

Also G94 here, and the same bug. It works for a while then GPU locks up with
"still angry after 101 spins". But, I bisected and eventually 19a10828814aa
commit (drm/nouveau/fifo/g84-: ack non-stall interrupt before handling it) came
out as culprit. It's the last nouveau commit before 3.18 was releases.

If you can compile your own kernel, I'm attaching the patch that reverses that
commit. It fixes the issue for me completely, no more lockups.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419598335.bB8f12.13680
Date: Fri, 26 Dec 2014 12:52:15 +0000
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
   title="NEW - [NV94] X hangs, logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] X hangs, logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244">bug 87244</a>
              from <span class="vcard"><a class="email" href="mailto:zcalusic&#64;bitsync.net" title="Zlatko Calusic &lt;zcalusic&#64;bitsync.net&gt;"> <span class="fn">Zlatko Calusic</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=111369" name="attach_111369" title="Revert-drm-nouveau-fifo-g84-ack-non-stall-interrupt">attachment 111369</a> <a href="attachment.cgi?id=111369&amp;action=edit" title="Revert-drm-nouveau-fifo-g84-ack-non-stall-interrupt">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=87244&amp;attachment=111369'>[review]</a>
Revert-drm-nouveau-fifo-g84-ack-non-stall-interrupt

Also G94 here, and the same bug. It works for a while then GPU locks up with
&quot;still angry after 101 spins&quot;. But, I bisected and eventually 19a10828814aa
commit (drm/nouveau/fifo/g84-: ack non-stall interrupt before handling it) came
out as culprit. It's the last nouveau commit before 3.18 was releases.

If you can compile your own kernel, I'm attaching the patch that reverses that
commit. It fixes the issue for me completely, no more lockups.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419598335.bB8f12.13680--

--===============1568560167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1568560167==--
