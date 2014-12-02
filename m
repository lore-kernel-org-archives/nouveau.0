From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72180] [NVE6] Random GPU Lockups,
	works with blob PGRAPH fw
Date: Tue, 02 Dec 2014 10:09:27 +0000
Message-ID: <bug-72180-8800-hFWOXXyOc0@http.bugs.freedesktop.org/>
References: <bug-72180-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1032990839=="
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


--===============1032990839==
Content-Type: multipart/alternative; boundary="1417514967.b2A76B4.31908"; charset="UTF-8"


--1417514967.b2A76B4.31908
Date: Tue, 2 Dec 2014 10:09:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72180

--- Comment #40 from Matthias Nagel <matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
@Cedric: Well this means, that the kernel could not find the firmware. There
are several ways how to do it and it depends on wether you have a initramfs or
not, if the kernel has access to /lib/fimware when it tries to load the fw, if
the the fw is directly included in the kernel or not, if you use an additional
boot manager, etc. With UEFI: Does your UEFI directly load the Linux kernel or
is there a boot manager in between. For example, I use "rEFInd" as boot
manager, but I guess Debian uses grub2 by default.

My setup is the following:
(a) Boot manager "rEFInd"
(b) No initramfs
(c) FW directly included in kernel. This requires "CONFIG_FIRMWARE_IN_KERNEL=y"
and "CONFIG_EXTRA_FIRMWARE=\"nouveau/...\"" to be set.

In my experience, putting the fw directly into the kernel is the easiest way,
because one does not need to bother with correct pathes and mount points during
boot. Unfortunately, I cannot give you more detailed advices, because I turned
my back to Debian long time ago.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1417514967.b2A76B4.31908
Date: Tue, 2 Dec 2014 10:09:27 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180#c40">Comment # 40</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180">bug 72180</a>
              from <span class="vcard"><a class="email" href="mailto:matthias.h.nagel&#64;gmail.com" title="Matthias Nagel &lt;matthias.h.nagel&#64;gmail.com&gt;"> <span class="fn">Matthias Nagel</span></a>
</span></b>
        <pre>&#64;Cedric: Well this means, that the kernel could not find the firmware. There
are several ways how to do it and it depends on wether you have a initramfs or
not, if the kernel has access to /lib/fimware when it tries to load the fw, if
the the fw is directly included in the kernel or not, if you use an additional
boot manager, etc. With UEFI: Does your UEFI directly load the Linux kernel or
is there a boot manager in between. For example, I use &quot;rEFInd&quot; as boot
manager, but I guess Debian uses grub2 by default.

My setup is the following:
(a) Boot manager &quot;rEFInd&quot;
(b) No initramfs
(c) FW directly included in kernel. This requires &quot;CONFIG_FIRMWARE_IN_KERNEL=y&quot;
and &quot;CONFIG_EXTRA_FIRMWARE=\&quot;nouveau/...\&quot;&quot; to be set.

In my experience, putting the fw directly into the kernel is the easiest way,
because one does not need to bother with correct pathes and mount points during
boot. Unfortunately, I cannot give you more detailed advices, because I turned
my back to Debian long time ago.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1417514967.b2A76B4.31908--

--===============1032990839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1032990839==--
