From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92851] NV34: err: MEM_FAULT
Date: Sat, 07 Nov 2015 17:17:15 +0000
Message-ID: <bug-92851-8800-U5puCkvGZz@http.bugs.freedesktop.org/>
References: <bug-92851-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0192213362=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92851-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0192213362==
Content-Type: multipart/alternative; boundary="1446916635.eDaA581.2629"; charset="UTF-8"


--1446916635.eDaA581.2629
Date: Sat, 7 Nov 2015 17:17:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92851

--- Comment #6 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

DRI2:

dmesg:
[  422.359015] nouveau E[Xorg[500]] failed to idle channel 0xcccc0000
[Xorg[500]]
[  437.442018] nouveau E[Xorg[500]] failed to idle channel 0xcccc0000
[Xorg[500]]
[  439.360799] nouveau  [     DRM] 0xDBBA: Parsing digital output script table
[  541.599015] nouveau E[Xorg[1970]] failed to idle channel 0xcccc0000
[Xorg[1970]]
[  556.605016] nouveau E[Xorg[1970]] failed to idle channel 0xcccc0000
[Xorg[1970]]
[  556.865554] nouveau  [     DRM] 0xDBBA: Parsing digital output script table
[  558.644261] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DMA_W_PROTECTION nstatus: PROTECTION_FAULT
[  558.644283] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [Xorg[2277]] subc 0 class
0x0039 mthd 0x0100 data 0x00000000
[  656.669016] nouveau E[Xorg[2277]] failed to idle channel 0xcccc0001
[Xorg[2277]]
[  671.677018] nouveau E[Xorg[2277]] failed to idle channel 0xcccc0001
[Xorg[2277]]
[  686.685018] nouveau E[Xorg[2277]] failed to idle channel 0xcccc0000
[Xorg[2277]]
[  701.697016] nouveau E[Xorg[2277]] failed to idle channel 0xcccc0000
[Xorg[2277]]
[  701.964960] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 0 [DRM] get
0xff2c4784 put 0xff2c4784 state 0xdf2c4785 (err: MEM_FAULT) push 0x00001100
[  716.975018] nouveau E[lightdm-gtk-gre[2287]] failed to idle channel
0xcccc0000 [lightdm-gtk-gre[2287]]
[  731.997016] nouveau E[lightdm-gtk-gre[2287]] failed to idle channel
0xcccc0000 [lightdm-gtk-gre[2287]]
[  732.916448] nouveau  [     DRM] 0xDB7C: Parsing digital output script table
[  732.998946] nouveau E[     DRM] GPU lockup - switching to software fbcon
[  733.393017] nouveau E[  PGRAPH][0000:01:00.0] idle timed out with status
0x00022001
[  733.785006] nouveau E[  PGRAPH][0000:01:00.0] idle timed out with status
0x00022001
[  764.136053] nouveau  [     DRM] 0xDBBA: Parsing digital output script table

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446916635.eDaA581.2629
Date: Sat, 7 Nov 2015 17:17:15 +0000
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
   title="NEW - NV34: err: MEM_FAULT"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92851#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV34: err: MEM_FAULT"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92851">bug 92851</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
DRI2:

dmesg:
[  422.359015] nouveau E[Xorg[500]] failed to idle channel 0xcccc0000
[Xorg[500]]
[  437.442018] nouveau E[Xorg[500]] failed to idle channel 0xcccc0000
[Xorg[500]]
[  439.360799] nouveau  [     DRM] 0xDBBA: Parsing digital output script table
[  541.599015] nouveau E[Xorg[1970]] failed to idle channel 0xcccc0000
[Xorg[1970]]
[  556.605016] nouveau E[Xorg[1970]] failed to idle channel 0xcccc0000
[Xorg[1970]]
[  556.865554] nouveau  [     DRM] 0xDBBA: Parsing digital output script table
[  558.644261] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DMA_W_PROTECTION nstatus: PROTECTION_FAULT
[  558.644283] nouveau E[  PGRAPH][0000:01:00.0] ch 1 [Xorg[2277]] subc 0 class
0x0039 mthd 0x0100 data 0x00000000
[  656.669016] nouveau E[Xorg[2277]] failed to idle channel 0xcccc0001
[Xorg[2277]]
[  671.677018] nouveau E[Xorg[2277]] failed to idle channel 0xcccc0001
[Xorg[2277]]
[  686.685018] nouveau E[Xorg[2277]] failed to idle channel 0xcccc0000
[Xorg[2277]]
[  701.697016] nouveau E[Xorg[2277]] failed to idle channel 0xcccc0000
[Xorg[2277]]
[  701.964960] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 0 [DRM] get
0xff2c4784 put 0xff2c4784 state 0xdf2c4785 (err: MEM_FAULT) push 0x00001100
[  716.975018] nouveau E[lightdm-gtk-gre[2287]] failed to idle channel
0xcccc0000 [lightdm-gtk-gre[2287]]
[  731.997016] nouveau E[lightdm-gtk-gre[2287]] failed to idle channel
0xcccc0000 [lightdm-gtk-gre[2287]]
[  732.916448] nouveau  [     DRM] 0xDB7C: Parsing digital output script table
[  732.998946] nouveau E[     DRM] GPU lockup - switching to software fbcon
[  733.393017] nouveau E[  PGRAPH][0000:01:00.0] idle timed out with status
0x00022001
[  733.785006] nouveau E[  PGRAPH][0000:01:00.0] idle timed out with status
0x00022001
[  764.136053] nouveau  [     DRM] 0xDBBA: Parsing digital output script table</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446916635.eDaA581.2629--

--===============0192213362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0192213362==--
