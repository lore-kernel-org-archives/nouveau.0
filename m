From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28095] X crash with PFIFO_CACHE_ERROR. (Nouveau on
	Riva TNT).
Date: Mon, 26 Jan 2015 01:11:29 +0000
Message-ID: <bug-28095-8800-btw0OMo90Q@http.bugs.freedesktop.org/>
References: <bug-28095-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1158768526=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28095-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1158768526==
Content-Type: multipart/alternative; boundary="1422234689.1D8451.2924"; charset="UTF-8"


--1422234689.1D8451.2924
Date: Mon, 26 Jan 2015 01:11:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=28095

--- Comment #3 from Brent <bzipitidoo-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> ---
Tested with Puppy Linux with kernel 3.14.20.  This is with Tahrpup 6.0, with an
updated kernel released by the maintainer of Tahrpup.

The Xserver has no mouse pointer, and displays only vertical stripes.  But
ctrl-alt-F2 worked and I can still use the text screen console.  Looked at
/var/log/messages and saw PROTECTION_FAULT errors.

Tahrpup 6.0 is here:
http://distro.ibiblio.org/puppylinux/puppy-tahr/iso/tahrpup%20-6.0-CE/tahr-6.0-CE_PAE.iso
And the update to kernel 3.14.20 is here:
http://distro.ibiblio.org/puppylinux/puppy-tahr/kernels/kernel-3.14.20_PAE_update.tar.xz

I see that there is an newer update to kernel 3.17, which I will try next.

Sample of the error messages:

Jan 26 16:04:59 puppypc29622 user.err kernel: nouveau E[  PGRAPH][0000:01:00.0]
 NOTIFY nsource: PROTECTION_ERROR nstatus: PROTECTION_FAULT
Jan 26 16:04:59 puppypc29622 user.err kernel: nouveau E[  PGRAPH][0000:01:00.0]
ch 1 [X[10566]] subc 2 class 0x0042 mthd 0x0180 data 0x00003a04

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422234689.1D8451.2924
Date: Mon, 26 Jan 2015 01:11:29 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO - X crash with PFIFO_CACHE_ERROR. (Nouveau on Riva TNT)."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=28095#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - X crash with PFIFO_CACHE_ERROR. (Nouveau on Riva TNT)."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=28095">bug 28095</a>
              from <span class="vcard"><a class="email" href="mailto:bzipitidoo&#64;hotmail.com" title="Brent &lt;bzipitidoo&#64;hotmail.com&gt;"> <span class="fn">Brent</span></a>
</span></b>
        <pre>Tested with Puppy Linux with kernel 3.14.20.  This is with Tahrpup 6.0, with an
updated kernel released by the maintainer of Tahrpup.

The Xserver has no mouse pointer, and displays only vertical stripes.  But
ctrl-alt-F2 worked and I can still use the text screen console.  Looked at
/var/log/messages and saw PROTECTION_FAULT errors.

Tahrpup 6.0 is here:
<a href="http://distro.ibiblio.org/puppylinux/puppy-tahr/iso/tahrpup%20-6.0-CE/tahr-6.0-CE_PAE.iso">http://distro.ibiblio.org/puppylinux/puppy-tahr/iso/tahrpup%20-6.0-CE/tahr-6.0-CE_PAE.iso</a>
And the update to kernel 3.14.20 is here:
<a href="http://distro.ibiblio.org/puppylinux/puppy-tahr/kernels/kernel-3.14.20_PAE_update.tar.xz">http://distro.ibiblio.org/puppylinux/puppy-tahr/kernels/kernel-3.14.20_PAE_update.tar.xz</a>

I see that there is an newer update to kernel 3.17, which I will try next.

Sample of the error messages:

Jan 26 16:04:59 puppypc29622 user.err kernel: nouveau E[  PGRAPH][0000:01:00.0]
 NOTIFY nsource: PROTECTION_ERROR nstatus: PROTECTION_FAULT
Jan 26 16:04:59 puppypc29622 user.err kernel: nouveau E[  PGRAPH][0000:01:00.0]
ch 1 [X[10566]] subc 2 class 0x0042 mthd 0x0180 data 0x00003a04</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422234689.1D8451.2924--

--===============1158768526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1158768526==--
