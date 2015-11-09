From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92863] Complete freeze even with NvGrUseFW=1
Date: Mon, 09 Nov 2015 23:57:50 +0000
Message-ID: <bug-92863-8800-J53fbOs5sM@http.bugs.freedesktop.org/>
References: <bug-92863-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2079901675=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92863-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2079901675==
Content-Type: multipart/alternative; boundary="1447113469.FA8e5E1.16852"; charset="UTF-8"


--1447113469.FA8e5E1.16852
Date: Mon, 9 Nov 2015 23:57:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92863

--- Comment #6 from xenith-bjxz+0elTSj2eFz/2MeuCQ@public.gmane.org ---
[52726.387384] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0002a10000
[PTE] from GR/GPC1/T1_0 on channel 0x023f55f000 [Xorg[2023]]
[52726.387388] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
9, recovering...
[52726.387398] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 9 [0x023f55f000
Xorg[2023]]
[52726.387404] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC0/TEX: 0x80000049
[52726.387409] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC0/TEX: 0x80000049
[52726.387413] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC1/TEX: 0x80000049
[52726.387419] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC0/TEX: 0x80000049
[52726.387423] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC1/TEX: 0x80000049


another at random today, while browsing with firefox 42.

About the same time-frame between lockups.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447113469.FA8e5E1.16852
Date: Mon, 9 Nov 2015 23:57:49 +0000
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
   title="NEW - Complete freeze even with NvGrUseFW=1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92863#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Complete freeze even with NvGrUseFW=1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92863">bug 92863</a>
              from <span class="vcard"><a class="email" href="mailto:xenith&#64;overtmind.com" title="xenith&#64;overtmind.com">xenith&#64;overtmind.com</a>
</span></b>
        <pre>[52726.387384] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0002a10000
[PTE] from GR/GPC1/T1_0 on channel 0x023f55f000 [Xorg[2023]]
[52726.387388] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
9, recovering...
[52726.387398] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 9 [0x023f55f000
Xorg[2023]]
[52726.387404] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC0/TEX: 0x80000049
[52726.387409] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC0/TEX: 0x80000049
[52726.387413] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC1/TEX: 0x80000049
[52726.387419] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC0/TEX: 0x80000049
[52726.387423] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC1/TEX: 0x80000049


another at random today, while browsing with firefox 42.

About the same time-frame between lockups.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447113469.FA8e5E1.16852--

--===============2079901675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2079901675==--
