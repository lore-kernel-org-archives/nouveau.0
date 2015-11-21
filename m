From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92761] [NVF0] dmesg full of nouveau E[
 PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301 (0x01024215)
Date: Sat, 21 Nov 2015 10:19:31 +0000
Message-ID: <bug-92761-8800-EQMAgUQKPK@http.bugs.freedesktop.org/>
References: <bug-92761-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1751655641=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92761-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1751655641==
Content-Type: multipart/alternative; boundary="1448101170.8acdAaf1.24198"; charset="UTF-8"


--1448101170.8acdAaf1.24198
Date: Sat, 21 Nov 2015 10:19:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92761

--- Comment #10 from ascanio.alba7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I'm trying to match Fedora 23 kernels approx 4.2.25 - 4.2.26 couldn't patch the
second diff:


# grep nvkm_rd32 drivers/gpu/drm/nouveau/nvkm/engine/gr/*.c
[root@localhost linux]# 



Any recommendation for kernel: 4.4rc?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1448101170.8acdAaf1.24198
Date: Sat, 21 Nov 2015 10:19:30 +0000
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
   title="NEW - [NVF0] dmesg full of nouveau E[ PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301 (0x01024215)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92761#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVF0] dmesg full of nouveau E[ PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301 (0x01024215)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92761">bug 92761</a>
              from <span class="vcard"><a class="email" href="mailto:ascanio.alba7&#64;gmail.com" title="ascanio.alba7&#64;gmail.com">ascanio.alba7&#64;gmail.com</a>
</span></b>
        <pre>I'm trying to match Fedora 23 kernels approx 4.2.25 - 4.2.26 couldn't patch the
second diff:


# grep nvkm_rd32 drivers/gpu/drm/nouveau/nvkm/engine/gr/*.c
[root&#64;localhost linux]# 



Any recommendation for kernel: 4.4rc?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1448101170.8acdAaf1.24198--

--===============1751655641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1751655641==--
