From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81072] [NVC1] GPU lockup after "read fault at
 0x0000039000 [PAGE_NOT_PRESENT] from PCOPY0"
Date: Mon, 05 Oct 2015 11:28:31 +0000
Message-ID: <bug-81072-8800-9BvjL3gQdd@http.bugs.freedesktop.org/>
References: <bug-81072-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1400457348=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81072-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1400457348==
Content-Type: multipart/alternative; boundary="1444044511.82D18202.1542"; charset="UTF-8"


--1444044511.82D18202.1542
Date: Mon, 5 Oct 2015 11:28:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81072

--- Comment #4 from Patryk Zawadzki <patrys-k0Z414SquRyhPH1hqNUYSQ@public.gmane.org> ---
I am getting a slightly different error and am not sure whether it's the same
issue:

nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0011980000 [PAGE_NOT_PRESENT]
from PGRAPH/GPC0/PROP on channel 0x00bf739000 [Xorg[2305]]
nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel 10,
recovering...

After that the screen freezes and I need to do a hard reset. Applications
continue running and I can SSH in but restarting Xorg and trying to soft reboot
do not help.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444044511.82D18202.1542
Date: Mon, 5 Oct 2015 11:28:31 +0000
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
   title="NEW - [NVC1] GPU lockup after &quot;read fault at 0x0000039000 [PAGE_NOT_PRESENT] from PCOPY0&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81072#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] GPU lockup after &quot;read fault at 0x0000039000 [PAGE_NOT_PRESENT] from PCOPY0&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81072">bug 81072</a>
              from <span class="vcard"><a class="email" href="mailto:patrys&#64;pld-linux.org" title="Patryk Zawadzki &lt;patrys&#64;pld-linux.org&gt;"> <span class="fn">Patryk Zawadzki</span></a>
</span></b>
        <pre>I am getting a slightly different error and am not sure whether it's the same
issue:

nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0011980000 [PAGE_NOT_PRESENT]
from PGRAPH/GPC0/PROP on channel 0x00bf739000 [Xorg[2305]]
nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel 10,
recovering...

After that the screen freezes and I need to do a hard reset. Applications
continue running and I can SSH in but restarting Xorg and trying to soft reboot
do not help.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444044511.82D18202.1542--

--===============1400457348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1400457348==--
