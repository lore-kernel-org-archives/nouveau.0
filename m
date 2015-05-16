From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90453] [NVE4] Desktop freezes & PDISP, PFIFO,
 PGRAPH and PGR errors
Date: Sat, 16 May 2015 10:58:20 +0000
Message-ID: <bug-90453-8800-yhzswAEuuU@http.bugs.freedesktop.org/>
References: <bug-90453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0742449620=="
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


--===============0742449620==
Content-Type: multipart/alternative; boundary="1431773900.1Fa0A1.21707"; charset="UTF-8"


--1431773900.1Fa0A1.21707
Date: Sat, 16 May 2015 10:58:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90453

--- Comment #18 from Michiel Helvensteijn <mhelvens-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This latest instance is also interesting, and might help diagnose the problem.
I was watching a YouTube video, and this time only the Chromium browser froze,
and I got a 'page unresponsive' popup. For a while, I could still move the
mouse and interact with other windows. After about 30 seconds, everything froze
once again. dmesg output:

[ 7583.945899] nouveau E[     PGR][0000:01:00.0] TRAP ch 8 [0x007f2f2000
gnome-shell[1189]]
[ 7583.945909] nouveau E[     PGR][0000:01:00.0] GPC2/PROP trap: (unknown enum
0x00000002)
[ 7583.945912] nouveau E[     PGR][0000:01:00.0] x = 3488, y = 104, format = 0,
storage type = 0
[ 7588.249980] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
[ 7588.249985] nouveau E[   PFIFO][0000:01:00.0] PGR engine fault on channel
10, recovering...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431773900.1Fa0A1.21707
Date: Sat, 16 May 2015 10:58:20 +0000
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
   title="NEW - [NVE4] Desktop freezes &amp; PDISP, PFIFO, PGRAPH and PGR errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] Desktop freezes &amp; PDISP, PFIFO, PGRAPH and PGR errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453">bug 90453</a>
              from <span class="vcard"><a class="email" href="mailto:mhelvens&#64;gmail.com" title="Michiel Helvensteijn &lt;mhelvens&#64;gmail.com&gt;"> <span class="fn">Michiel Helvensteijn</span></a>
</span></b>
        <pre>This latest instance is also interesting, and might help diagnose the problem.
I was watching a YouTube video, and this time only the Chromium browser froze,
and I got a 'page unresponsive' popup. For a while, I could still move the
mouse and interact with other windows. After about 30 seconds, everything froze
once again. dmesg output:

[ 7583.945899] nouveau E[     PGR][0000:01:00.0] TRAP ch 8 [0x007f2f2000
gnome-shell[1189]]
[ 7583.945909] nouveau E[     PGR][0000:01:00.0] GPC2/PROP trap: (unknown enum
0x00000002)
[ 7583.945912] nouveau E[     PGR][0000:01:00.0] x = 3488, y = 104, format = 0,
storage type = 0
[ 7588.249980] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT ]
[ 7588.249985] nouveau E[   PFIFO][0000:01:00.0] PGR engine fault on channel
10, recovering...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431773900.1Fa0A1.21707--

--===============0742449620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0742449620==--
