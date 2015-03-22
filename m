From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Sun, 22 Mar 2015 21:26:54 +0000
Message-ID: <bug-89558-8800-BZNwS7kLeE@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0815480457=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89558-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0815480457==
Content-Type: multipart/alternative; boundary="1427059614.fee8fA0a3.20746"; charset="UTF-8"


--1427059614.fee8fA0a3.20746
Date: Sun, 22 Mar 2015 21:26:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89558

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Without firmware, you won't get acceleration. (And my script only extracts
pgraph fw from 325.15 which doesn't have maxwell firmware.) However you will
get (open) firmware with Ben's latest tree:

http://cgit.freedesktop.org/~darktama/nouveau

Perhaps it could work. It sounds like just using the GM107 logic isn't quite
enough, your log is full of

[    5.961431] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    5.962869] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    5.964311] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    5.965752] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    5.967194] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    5.968605] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    5.970034] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    5.970303] nouveau E[   PFIFO][0000:03:00.0] runlist 4 update timeout

Perhaps Ben knows what that is. Could you try to increase your kernel log size
so that you get the start of those messages? May be interesting. [Also, please
avoid attaching things gzipped, makes one _much_ less likely to read them since
modern browsers force you to download... oh the Mozilla 0.99 days when it just
displayed whatever in the browser...]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427059614.fee8fA0a3.20746
Date: Sun, 22 Mar 2015 21:26:54 +0000
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
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Without firmware, you won't get acceleration. (And my script only extracts
pgraph fw from 325.15 which doesn't have maxwell firmware.) However you will
get (open) firmware with Ben's latest tree:

<a href="http://cgit.freedesktop.org/~darktama/nouveau">http://cgit.freedesktop.org/~darktama/nouveau</a>

Perhaps it could work. It sounds like just using the GM107 logic isn't quite
enough, your log is full of

[    5.961431] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    5.962869] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    5.964311] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    5.965752] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    5.967194] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    5.968605] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    5.970034] nouveau E[   PFIFO][0000:03:00.0] SCHED_ERROR [ UNK06 ]
[    5.970303] nouveau E[   PFIFO][0000:03:00.0] runlist 4 update timeout

Perhaps Ben knows what that is. Could you try to increase your kernel log size
so that you get the start of those messages? May be interesting. [Also, please
avoid attaching things gzipped, makes one _much_ less likely to read them since
modern browsers force you to download... oh the Mozilla 0.99 days when it just
displayed whatever in the browser...]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427059614.fee8fA0a3.20746--

--===============0815480457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0815480457==--
