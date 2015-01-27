From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87244] [NV94] X hangs,
 logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after
 101 spins, halt followed by an X trace
Date: Tue, 27 Jan 2015 08:09:23 +0000
Message-ID: <bug-87244-8800-TURFjtQEWD@http.bugs.freedesktop.org/>
References: <bug-87244-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2115947268=="
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


--===============2115947268==
Content-Type: multipart/alternative; boundary="1422346163.458EB302.16681"; charset="UTF-8"


--1422346163.458EB302.16681
Date: Tue, 27 Jan 2015 08:09:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87244

--- Comment #10 from Zlatko Calusic <zcalusic-7aYyyD3GOf7R7s880joybQ@public.gmane.org> ---
Created attachment 112875
  --> https://bugs.freedesktop.org/attachment.cgi?id=112875&action=edit
fifo-nv04-remove-the-loop-from-the-interrupt-handler

Would not apply cleanly to 3.19.0-rc6+, so I modified it and attached the patch
that I have currently applied and testing. I'd give it at least 2 days before
we can be reasonably sure it fixes the issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422346163.458EB302.16681
Date: Tue, 27 Jan 2015 08:09:23 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] X hangs, logs show kernel: nouveau E[ PFIFO][0000:01:00.0] still angry after 101 spins, halt followed by an X trace"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87244">bug 87244</a>
              from <span class="vcard"><a class="email" href="mailto:zcalusic&#64;bitsync.net" title="Zlatko Calusic &lt;zcalusic&#64;bitsync.net&gt;"> <span class="fn">Zlatko Calusic</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=112875" name="attach_112875" title="fifo-nv04-remove-the-loop-from-the-interrupt-handler">attachment 112875</a> <a href="attachment.cgi?id=112875&amp;action=edit" title="fifo-nv04-remove-the-loop-from-the-interrupt-handler">[details]</a></span>
fifo-nv04-remove-the-loop-from-the-interrupt-handler

Would not apply cleanly to 3.19.0-rc6+, so I modified it and attached the patch
that I have currently applied and testing. I'd give it at least 2 days before
we can be reasonably sure it fixes the issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422346163.458EB302.16681--

--===============2115947268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2115947268==--
