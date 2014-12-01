From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72180] [NVE6] Random GPU Lockups,
	works with blob PGRAPH fw
Date: Mon, 01 Dec 2014 20:21:26 +0000
Message-ID: <bug-72180-8800-567eg0yus7@http.bugs.freedesktop.org/>
References: <bug-72180-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1373322706=="
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


--===============1373322706==
Content-Type: multipart/alternative; boundary="1417465285.2cd83AA34.1054"; charset="UTF-8"


--1417465285.2cd83AA34.1054
Date: Mon, 1 Dec 2014 20:21:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72180

--- Comment #38 from Matthias Nagel <matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
And I am back. I had three GPU lockups during the last 30min. The first occured
while browsing the internet with Firefox, the second one happened during video
playback with KPlayer and the last one happened, when I tried to re-compiled my
kernel (3.17.4) with nvidia fw included. There was only a X terminal running
that showed the build output when nouveau crashed. So yes, the bug still exists
in 3.17.4. This is my dmesg output in reverse order:

Dec 01 21:10:22 matthias-pc kernel: nouveau E[   PFIFO][0000:01:00.0] read
fault at 0x0000013000 [PTE] from PBDMA0/HOST_CPU on channel 0x023f7b0000
[unknown]
Dec 01 21:10:22 matthias-pc kernel: nouveau E[kwin[571]] failed to idle channel
0xcccc0000 [kwin[571]]
Dec 01 21:10:07 matthias-pc kernel: nouveau E[kwin[571]] failed to idle channel
0xcccc0000 [kwin[571]]
Dec 01 21:09:52 matthias-pc org.kde.kuiserver[477]: kuiserver: Fatal IO error:
client killed
Dec 01 21:09:52 matthias-pc kdm[351]: X server for display :0 terminated
unexpectedly
Dec 01 21:09:52 matthias-pc kernel: nouveau E[  X[354]] failed to idle channel
0xcccc0000 [X[354]]
Dec 01 21:09:37 matthias-pc kernel: nouveau E[  X[354]] failed to idle channel
0xcccc0000 [X[354]]
Dec 01 21:09:22 matthias-pc kernel: nouveau E[     DRM] GPU lockup - switching
to software fbcon
Dec 01 21:07:40 matthias-pc kernel: nouveau E[   PIBUS][0000:01:00.0] GPC0:
0x504610 0x00000402 (0x0502020b)
Dec 01 21:07:40 matthias-pc kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH
engine fault on channel 2, recovering...
Dec 01 21:07:40 matthias-pc kernel: nouveau E[   PFIFO][0000:01:00.0] write
fault at 0x00002d2000 [PTE] from GR/GPC2/GPCCS on channel 0x023f94f000 [X[354]]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1417465285.2cd83AA34.1054
Date: Mon, 1 Dec 2014 20:21:25 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180#c38">Comment # 38</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180">bug 72180</a>
              from <span class="vcard"><a class="email" href="mailto:matthias.h.nagel&#64;gmail.com" title="Matthias Nagel &lt;matthias.h.nagel&#64;gmail.com&gt;"> <span class="fn">Matthias Nagel</span></a>
</span></b>
        <pre>And I am back. I had three GPU lockups during the last 30min. The first occured
while browsing the internet with Firefox, the second one happened during video
playback with KPlayer and the last one happened, when I tried to re-compiled my
kernel (3.17.4) with nvidia fw included. There was only a X terminal running
that showed the build output when nouveau crashed. So yes, the bug still exists
in 3.17.4. This is my dmesg output in reverse order:

Dec 01 21:10:22 matthias-pc kernel: nouveau E[   PFIFO][0000:01:00.0] read
fault at 0x0000013000 [PTE] from PBDMA0/HOST_CPU on channel 0x023f7b0000
[unknown]
Dec 01 21:10:22 matthias-pc kernel: nouveau E[kwin[571]] failed to idle channel
0xcccc0000 [kwin[571]]
Dec 01 21:10:07 matthias-pc kernel: nouveau E[kwin[571]] failed to idle channel
0xcccc0000 [kwin[571]]
Dec 01 21:09:52 matthias-pc org.kde.kuiserver[477]: kuiserver: Fatal IO error:
client killed
Dec 01 21:09:52 matthias-pc kdm[351]: X server for display :0 terminated
unexpectedly
Dec 01 21:09:52 matthias-pc kernel: nouveau E[  X[354]] failed to idle channel
0xcccc0000 [X[354]]
Dec 01 21:09:37 matthias-pc kernel: nouveau E[  X[354]] failed to idle channel
0xcccc0000 [X[354]]
Dec 01 21:09:22 matthias-pc kernel: nouveau E[     DRM] GPU lockup - switching
to software fbcon
Dec 01 21:07:40 matthias-pc kernel: nouveau E[   PIBUS][0000:01:00.0] GPC0:
0x504610 0x00000402 (0x0502020b)
Dec 01 21:07:40 matthias-pc kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH
engine fault on channel 2, recovering...
Dec 01 21:07:40 matthias-pc kernel: nouveau E[   PFIFO][0000:01:00.0] write
fault at 0x00002d2000 [PTE] from GR/GPC2/GPCCS on channel 0x023f94f000 [X[354]]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1417465285.2cd83AA34.1054--

--===============1373322706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1373322706==--
