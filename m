From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80865] [NVE7] Hard hang (GPC0/TPC0/MP trap:
 MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS)
Date: Mon, 22 Jun 2015 19:07:19 +0000
Message-ID: <bug-80865-8800-dyzacxtquF@http.bugs.freedesktop.org/>
References: <bug-80865-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1124098603=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80865-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1124098603==
Content-Type: multipart/alternative; boundary="1435000039.EeDcef2.29960"; charset="UTF-8"


--1435000039.EeDcef2.29960
Date: Mon, 22 Jun 2015 19:07:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80865

--- Comment #7 from Mario Barrera <mbarrera-KK0ffGbhmjU@public.gmane.org> ---
This has been happening to me for a while, now it is more frequent, it happens
even twice a day.

Relevant parts of the log from my latest crash.

Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0] TRAP ch 6
[0x00bf556000 chromium[6894]]
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC0/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC0/TPC1/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC1/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC2/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC3/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0] TRAP ch 6
[0x00bf556000 chromium[6894]]
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC0/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC0/TPC1/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC1/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC2/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:44 localhost kernel: nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR
[ CTXSW_TIMEOUT ]
Jun 22 15:12:44 localhost kernel: nouveau E[   PFIFO][0000:01:00.0] PGR engine
fault on channel 5, recovering...
Jun 22 15:12:44 localhost kernel: nouveau E[     PGR][0000:01:00.0] TRAP ch 6
[0x00bf556000 chromium[6894]]
Jun 22 15:12:44 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC0/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:44 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC0/TPC1/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:44 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC1/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:44 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC2/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:44 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC3/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:13:19 localhost libvirtd[583]: No response from client 0x7faa4465af70
after 5 keepalive messages in 30 seconds
Jun 22 15:13:19 localhost libvirtd[1206]: No response from client
0x7f37e7faea50 after 5 keepalive messages in 30 seconds
-- Reboot --

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1435000039.EeDcef2.29960
Date: Mon, 22 Jun 2015 19:07:19 +0000
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
   title="NEW - [NVE7] Hard hang (GPC0/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80865#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] Hard hang (GPC0/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80865">bug 80865</a>
              from <span class="vcard"><a class="email" href="mailto:mbarrera&#64;gmx.com" title="Mario Barrera &lt;mbarrera&#64;gmx.com&gt;"> <span class="fn">Mario Barrera</span></a>
</span></b>
        <pre>This has been happening to me for a while, now it is more frequent, it happens
even twice a day.

Relevant parts of the log from my latest crash.

Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0] TRAP ch 6
[0x00bf556000 chromium[6894]]
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC0/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC0/TPC1/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC1/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC2/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC3/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0] TRAP ch 6
[0x00bf556000 chromium[6894]]
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC0/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC0/TPC1/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC1/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:40 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC2/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:44 localhost kernel: nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR
[ CTXSW_TIMEOUT ]
Jun 22 15:12:44 localhost kernel: nouveau E[   PFIFO][0000:01:00.0] PGR engine
fault on channel 5, recovering...
Jun 22 15:12:44 localhost kernel: nouveau E[     PGR][0000:01:00.0] TRAP ch 6
[0x00bf556000 chromium[6894]]
Jun 22 15:12:44 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC0/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:44 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC0/TPC1/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:44 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC1/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:44 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC2/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:12:44 localhost kernel: nouveau E[     PGR][0000:01:00.0]
GPC3/TPC0/MP trap: MULTIPLE_WARP_ERRORS MEM_OUT_OF_BOUNDS
Jun 22 15:13:19 localhost libvirtd[583]: No response from client 0x7faa4465af70
after 5 keepalive messages in 30 seconds
Jun 22 15:13:19 localhost libvirtd[1206]: No response from client
0x7f37e7faea50 after 5 keepalive messages in 30 seconds
-- Reboot --</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1435000039.EeDcef2.29960--

--===============1124098603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1124098603==--
