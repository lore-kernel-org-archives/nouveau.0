From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90453] [NVE4] Desktop freezes & PDISP errors
Date: Thu, 14 May 2015 21:18:09 +0000
Message-ID: <bug-90453-8800-en9jHREk8A@http.bugs.freedesktop.org/>
References: <bug-90453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1895176367=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90453-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1895176367==
Content-Type: multipart/alternative; boundary="1431638288.A3c2411.2497"; charset="UTF-8"


--1431638288.A3c2411.2497
Date: Thu, 14 May 2015 21:18:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90453

--- Comment #10 from Michiel Helvensteijn <mhelvens-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I was finally able to connect to my pc *after* a freeze-up using SSH. Here is
the coinciding dmesg output:

[ 8970.897260] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
[ 8970.897265] nouveau E[   PFIFO][0000:01:00.0] PGR engine fault on channel 6,
recovering...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431638288.A3c2411.2497
Date: Thu, 14 May 2015 21:18:08 +0000
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
   title="NEW - [NVE4] Desktop freezes &amp; PDISP errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] Desktop freezes &amp; PDISP errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453">bug 90453</a>
              from <span class="vcard"><a class="email" href="mailto:mhelvens&#64;gmail.com" title="Michiel Helvensteijn &lt;mhelvens&#64;gmail.com&gt;"> <span class="fn">Michiel Helvensteijn</span></a>
</span></b>
        <pre>I was finally able to connect to my pc *after* a freeze-up using SSH. Here is
the coinciding dmesg output:

[ 8970.897260] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
[ 8970.897265] nouveau E[   PFIFO][0000:01:00.0] PGR engine fault on channel 6,
recovering...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431638288.A3c2411.2497--

--===============1895176367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1895176367==--
