From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93828] Xorg hangs randomly with nouveau driver
Date: Sun, 24 Jan 2016 07:53:52 +0000
Message-ID: <bug-93828-8800-eu0wQ8blVa@http.bugs.freedesktop.org/>
References: <bug-93828-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0398511066=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93828-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0398511066==
Content-Type: multipart/alternative; boundary="14536220320.a67f45F.498";
 charset="UTF-8"


--14536220320.a67f45F.498
Date: Sun, 24 Jan 2016 07:53:52 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93828

--- Comment #3 from Marek Greško <mgresko8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hardware:
01:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 210] (rev
a2) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. EN210 SILENT
        Flags: bus master, fast devsel, latency 0, IRQ 45
        Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Memory at c0000000 (64-bit, prefetchable) [size=256M]
        Memory at d0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at e000 [size=128]
        Expansion ROM at fe000000 [disabled] [size=512K]
        Capabilities: <access denied>
        Kernel driver in use: nouveau
        Kernel modules: nouveau


Kernel:
Linux marek.grepo.lan 4.3.3-301.fc23.x86_64 #1 SMP Fri Jan 15 14:03:17 UTC 2016
x86_64 x86_64 x86_64 GNU/Linux

Mesa:
mesa-dri-drivers-11.1.0-2.20151218.fc23.i686


It is the truth the problem arised after mesa or kernel update, not after Xorg
update. I am not sure but I give higher probability to mesa. Kernel updated on
Jan 12-th (to 4.3.3-300 which I was running when problem arised first time),
mesa on Jan 16-th. I am sure I had not this problem before Jan 12-th. I am not
sure whether I had it between Jan 12-th and Jan 16-th.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14536220320.a67f45F.498
Date: Sun, 24 Jan 2016 07:53:52 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Xorg hangs randomly with nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93828#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Xorg hangs randomly with nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93828">bug 93828</a>
              from <span class="vcard"><a class="email" href="mailto:mgresko8&#64;gmail.com" title="Marek Greško &lt;mgresko8&#64;gmail.com&gt;"> <span class="fn">Marek Greško</span></a>
</span></b>
        <pre>Hardware:
01:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 210] (rev
a2) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. EN210 SILENT
        Flags: bus master, fast devsel, latency 0, IRQ 45
        Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Memory at c0000000 (64-bit, prefetchable) [size=256M]
        Memory at d0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at e000 [size=128]
        Expansion ROM at fe000000 [disabled] [size=512K]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau


Kernel:
Linux marek.grepo.lan 4.3.3-301.fc23.x86_64 #1 SMP Fri Jan 15 14:03:17 UTC 2016
x86_64 x86_64 x86_64 GNU/Linux

Mesa:
mesa-dri-drivers-11.1.0-2.20151218.fc23.i686


It is the truth the problem arised after mesa or kernel update, not after Xorg
update. I am not sure but I give higher probability to mesa. Kernel updated on
Jan 12-th (to 4.3.3-300 which I was running when problem arised first time),
mesa on Jan 16-th. I am sure I had not this problem before Jan 12-th. I am not
sure whether I had it between Jan 12-th and Jan 16-th.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14536220320.a67f45F.498--

--===============0398511066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0398511066==--
