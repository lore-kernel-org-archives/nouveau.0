From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72180] [NVE6] Random GPU Lockups,
	works with blob PGRAPH fw
Date: Tue, 17 Dec 2013 22:11:34 +0000
Message-ID: <bug-72180-8800-Ql9q19jKIL@http.bugs.freedesktop.org/>
References: <bug-72180-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0284967502=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72180-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0284967502==
Content-Type: multipart/alternative; boundary="1387318294.B13b763.5906"; charset="us-ascii"


--1387318294.B13b763.5906
Date: Tue, 17 Dec 2013 22:11:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72180

--- Comment #20 from Matthias Nagel <matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I suspected to have the same problem and tried to use the orginal firmware, but
failed to do so. I did not try to excract my "own" firmware but tried to use
the firmware from the zip file that was attached by Jordan as we have the same
card (both GTX 660).

But if I boot with the nouveau.config="NvGrUseFw=1" kernel option, the kernel
stops directly on the attemp to load the nouveau fb driver.

I must mention that I use UEFI boot and my kernel resides on the EFI partion
(/dev/sda1) at /boot/EFI/Boot/gentoo/bzImage-3.12.5.efi (the mount point is
/boot). On the other hand my firmware is at /lib/firmware/nouveau/ on partition
/dev/sda5, which is mounted at /.

Let me guess: I need an initrd file in order to make it work? :-( Then I must
figure out how to make this work together with UEFI boot. Until now, I tried to
avoid initrd and UEFI.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387318294.B13b763.5906
Date: Tue, 17 Dec 2013 22:11:34 +0000
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
   title="NEW --- - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180">bug 72180</a>
              from <span class="vcard"><a class="email" href="mailto:matthias.h.nagel&#64;gmail.com" title="Matthias Nagel &lt;matthias.h.nagel&#64;gmail.com&gt;"> <span class="fn">Matthias Nagel</span></a>
</span></b>
        <pre>I suspected to have the same problem and tried to use the orginal firmware, but
failed to do so. I did not try to excract my &quot;own&quot; firmware but tried to use
the firmware from the zip file that was attached by Jordan as we have the same
card (both GTX 660).

But if I boot with the nouveau.config=&quot;NvGrUseFw=1&quot; kernel option, the kernel
stops directly on the attemp to load the nouveau fb driver.

I must mention that I use UEFI boot and my kernel resides on the EFI partion
(/dev/sda1) at /boot/EFI/Boot/gentoo/bzImage-3.12.5.efi (the mount point is
/boot). On the other hand my firmware is at /lib/firmware/nouveau/ on partition
/dev/sda5, which is mounted at /.

Let me guess: I need an initrd file in order to make it work? :-( Then I must
figure out how to make this work together with UEFI boot. Until now, I tried to
avoid initrd and UEFI.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387318294.B13b763.5906--

--===============0284967502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0284967502==--
