From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89912] Sometimes Nouveau hangs kernel with PGRAPH
	engine fault
Date: Fri, 12 Jun 2015 11:10:36 +0000
Message-ID: <bug-89912-8800-5MZfG5AeYl@http.bugs.freedesktop.org/>
References: <bug-89912-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0099460658=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89912-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0099460658==
Content-Type: multipart/alternative; boundary="1434107436.e6b36b2c2.7791"; charset="UTF-8"


--1434107436.e6b36b2c2.7791
Date: Fri, 12 Jun 2015 11:10:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89912

--- Comment #2 from Argyris Megalios <argymeg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I'm having the same issue here. Same card (GTX 650 Ti) on Arch, presently on
kernel version 4.0.5. The last journal entries after each freeze are
consistently:

kernel: nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00002a0000 [PTE]
from GR/GPC0/PROP_0 on channel 0x007f96c000 [Xorg[383]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGR engine fault on channel 2,
recovering...

Except the channel number which is different every time.
Everything except the mouse cursor freezes, while sound also continues for a
few seconds before stopping. However, I can login from another machine via SSH
and restart SDDM just fine, although it takes about half a minute (from the
usual 2-3 seconds).
I'm using KDE and although it happens randomly, there seems to be a correlation
with having Kaffeine playing TV in the background. No consistency, though.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1434107436.e6b36b2c2.7791
Date: Fri, 12 Jun 2015 11:10:36 +0000
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
   title="NEW - Sometimes Nouveau hangs kernel with PGRAPH engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89912#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Sometimes Nouveau hangs kernel with PGRAPH engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89912">bug 89912</a>
              from <span class="vcard"><a class="email" href="mailto:argymeg&#64;gmail.com" title="Argyris Megalios &lt;argymeg&#64;gmail.com&gt;"> <span class="fn">Argyris Megalios</span></a>
</span></b>
        <pre>I'm having the same issue here. Same card (GTX 650 Ti) on Arch, presently on
kernel version 4.0.5. The last journal entries after each freeze are
consistently:

kernel: nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00002a0000 [PTE]
from GR/GPC0/PROP_0 on channel 0x007f96c000 [Xorg[383]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGR engine fault on channel 2,
recovering...

Except the channel number which is different every time.
Everything except the mouse cursor freezes, while sound also continues for a
few seconds before stopping. However, I can login from another machine via SSH
and restart SDDM just fine, although it takes about half a minute (from the
usual 2-3 seconds).
I'm using KDE and although it happens randomly, there seems to be a correlation
with having Kaffeine playing TV in the background. No consistency, though.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434107436.e6b36b2c2.7791--

--===============0099460658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0099460658==--
