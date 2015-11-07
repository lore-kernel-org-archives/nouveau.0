From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72180] [NVE6] Random GPU Lockups,
	works with blob PGRAPH fw
Date: Sat, 07 Nov 2015 22:10:24 +0000
Message-ID: <bug-72180-8800-okjl0Jr2pQ@http.bugs.freedesktop.org/>
References: <bug-72180-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1518017873=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72180-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1518017873==
Content-Type: multipart/alternative; boundary="1446934224.2bbE334.30893"; charset="UTF-8"


--1446934224.2bbE334.30893
Date: Sat, 7 Nov 2015 22:10:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72180

--- Comment #48 from xenith-bjxz+0elTSj2eFz/2MeuCQ@public.gmane.org ---
[  877.299847] kactivitymanage[2375]: segfault at 7fbe3fdcb7d0 ip
00007fbe4c073731 sp 00007ffec63a7c48 error 4 in
libQt5Sql.so.5.5.0[7fbe4c05f000+3f000]
[ 1081.974756] kactivitymanage[4736]: segfault at 7f374fb897d0 ip
00007f374fdd2731 sp 00007fff901deeb8 error 4 in
libQt5Sql.so.5.5.0[7f374fdbe000+3f000]
[ 1181.195139] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nve6_fuc084 failed with error -2
[ 1181.195196] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nve6_fuc084d failed with error -2
[ 1181.195200] nouveau 0000:01:00.0: msvld: unable to load firmware data
[ 1181.195203] nouveau 0000:01:00.0: msvld: init failed, -19
[ 1261.448630] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 1261.448642] nouveau 0000:01:00.0: fifo: sw engine fault on channel 7,
recovering...
[ 1263.448760] nouveau 0000:01:00.0: fifo: runlist 0 update timeout
[ 1265.744229] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 1270.039568] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 1274.334908] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 1278.630248] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 1282.925589] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 1287.220929] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446934224.2bbE334.30893
Date: Sat, 7 Nov 2015 22:10:24 +0000
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
   title="NEW - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180#c48">Comment # 48</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180">bug 72180</a>
              from <span class="vcard"><a class="email" href="mailto:xenith&#64;overtmind.com" title="xenith&#64;overtmind.com">xenith&#64;overtmind.com</a>
</span></b>
        <pre>[  877.299847] kactivitymanage[2375]: segfault at 7fbe3fdcb7d0 ip
00007fbe4c073731 sp 00007ffec63a7c48 error 4 in
libQt5Sql.so.5.5.0[7fbe4c05f000+3f000]
[ 1081.974756] kactivitymanage[4736]: segfault at 7f374fb897d0 ip
00007f374fdd2731 sp 00007fff901deeb8 error 4 in
libQt5Sql.so.5.5.0[7f374fdbe000+3f000]
[ 1181.195139] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nve6_fuc084 failed with error -2
[ 1181.195196] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nve6_fuc084d failed with error -2
[ 1181.195200] nouveau 0000:01:00.0: msvld: unable to load firmware data
[ 1181.195203] nouveau 0000:01:00.0: msvld: init failed, -19
[ 1261.448630] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 1261.448642] nouveau 0000:01:00.0: fifo: sw engine fault on channel 7,
recovering...
[ 1263.448760] nouveau 0000:01:00.0: fifo: runlist 0 update timeout
[ 1265.744229] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 1270.039568] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 1274.334908] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 1278.630248] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 1282.925589] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 1287.220929] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446934224.2bbE334.30893--

--===============1518017873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1518017873==--
