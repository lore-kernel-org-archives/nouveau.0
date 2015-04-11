From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89842] Nvidia nouveau drivers hangs all gnome when
 open the new legacy tray in 3.16.0
Date: Sat, 11 Apr 2015 00:50:15 +0000
Message-ID: <bug-89842-8800-acDFzlmDCK@http.bugs.freedesktop.org/>
References: <bug-89842-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0586975240=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89842-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0586975240==
Content-Type: multipart/alternative; boundary="1428713414.C3DA412.21579"; charset="UTF-8"


--1428713414.C3DA412.21579
Date: Sat, 11 Apr 2015 00:50:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89842

--- Comment #6 from Rennie <renatao.garcia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I have the same issue and can confirm that downgrading
from libdrm-2.4.60 to libdrm-2.4.59 seems to stop the issue from
happening as there are no more hangs.

Thanks,
Rennie

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1428713414.C3DA412.21579
Date: Sat, 11 Apr 2015 00:50:14 +0000
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
   title="NEW - Nvidia nouveau drivers hangs all gnome when open the new legacy tray in 3.16.0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89842#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nvidia nouveau drivers hangs all gnome when open the new legacy tray in 3.16.0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89842">bug 89842</a>
              from <span class="vcard"><a class="email" href="mailto:renatao.garcia&#64;gmail.com" title="Rennie &lt;renatao.garcia&#64;gmail.com&gt;"> <span class="fn">Rennie</span></a>
</span></b>
        <pre>I have the same issue and can confirm that downgrading
from libdrm-2.4.60 to libdrm-2.4.59 seems to stop the issue from
happening as there are no more hangs.

Thanks,
Rennie</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1428713414.C3DA412.21579--

--===============0586975240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0586975240==--
