From: Marc MERLIN <marc_nouveau-xnduUnryOU1AfugRpC6u6w@public.gmane.org>
Subject: Re: 5.9.11 still hanging 2mn at each boot and looping on
 nvidia-gpu 0000:01:00.3: PME# enabled (Quadro RTX 4000 Mobile)
Date: Tue, 29 Dec 2020 09:47:50 -0800
Message-ID: <20201229174750.GI23389@merlins.org>
References: <20200908002935.GD20064@merlins.org>
 <20200529180315.GA18804@merlins.org>
 <20201229155159.GG23389@merlins.org>
 <CAKb7UviFP_YVxC4PO7MDNnw6NDrD=3BCGF37umwAfaimjbX9Pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKb7UviFP_YVxC4PO7MDNnw6NDrD=3BCGF37umwAfaimjbX9Pw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

(removed other lists, since it's likely not a linux-PCI problem)

On Tue, Dec 29, 2020 at 11:33:16AM -0500, Ilia Mirkin wrote:
> > Sounds like this would be a problem with all chips if userspace is able
> > to wake them up every second or two with a probe. Now I wonder what
> > broken userspace I have that could be doing this.
> 
> Well, it's a theory. Some userspace helpfully prevents the GPU from
> suspending entirely, unfortunately I don't remember its name though by
> messing with the attached audio device. It's very common and meant to
> help... oh well.

Are you thinking about tlp maybe?  https://linrunner.de/tlp/
I submitted a blacklist patch so that it works ok-ish on my laptop now.
(when the nvidia chip is unhappy, it happily uses 70W on batteries with
1.3h of runtime. When everything is ok, I can go down to about 12W/9H)

> > Do you think that could be a reason why the boot would hang for 2 full minutes at every
> > boot ever since I upgraded to 5.5?
> 
> I'd have to check, but I'm guessing TU104 acceleration became a thing
> in 5.5. I would also not be very surprised if the code didn't handle
> failure extremely gracefully - there definitely have been problems
> with that in the past.

Ah, then the timing checks out. That's exciting, at least now I have a
lead as to why I'm having problems. This was the same time a PCI PM
change went in, and I mistakenly thought it was to blame.

> > The kernel module is in my initrd:
> > sauron:/usr/local/bin# dd if=/boot/initrd.img-5.9.11-amd64-preempt-sysrq-20190817 bs=2966528  skip=1 | gunzip | cpio -tdv | grep nouveau
> > drwxr-xr-x   1 root     root            0 Nov 30 15:40 usr/lib/modules/5.9.11-amd64-preempt-sysrq-20190817/kernel/drivers/gpu/drm/nouveau
> > -rw-r--r--   1 root     root      3691385 Nov 30 15:35 usr/lib/modules/5.9.11-amd64-preempt-sysrq-20190817/kernel/drivers/gpu/drm/nouveau/nouveau.ko
> > 17+1 records in
> > 17+1 records out
> > 52566778 bytes (53 MB, 50 MiB) copied, 1.69708 s, 31.0 MB/s
> 
> I think that gets you out of "full newbie" land...

:)  (ok, I have been using linux since 1993, but stuff changes so much
all the time, that sometimes I feel like a newbie all over again)
In my days, we didn't complain about systemd vs sysvinit, we had rc.local
and it was good enough :-D

> > Note that ultimately I only need nouveau not to hang my boot 2mn and do
> > PM so that the nvidia chip goes to sleep since I don't use it.
> 
> I'm not extremely familiar with debian packaging, but the firmware is
> provided by NVIDIA and shipped as part of linux-firmware:
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/nvidia
 
Ah, it comes from outside just like intel firmware, thanks.
Also, I was looking for nouveau, not nvidia:
sauron:/usr/local/bin# dd if=/boot/initrd.img-5.9.11-amd64-preempt-sysrq-20190817 bs=2966528  skip=1 | gunzip | cpio -tdv | grep tu104
shows no match

Good news is that debian did package it (they have multiple firmware
packages)
sauron:~# dpkggrep firmware | awk '{print $1}' | xargs apt-get install -y
sauron:~# dpkg -S /lib/firmware/nvidia/tu104
firmware-misc-nonfree: /lib/firmware/nvidia/tu104

update-initramfs -v -c -k 5.9.11-amd64-preempt-sysrq-20190817

Ok, I should be in business after next reboot, thank you.

> Of course now that I read your email a bit more carefully, it seems
> your issue is with the "saving config space" messages. I'm not sure
> I've seen those before. Perhaps you have some sort of debug enabled.
> I'd find where in the kernel they are being produced, and what the
> conditions for it are. But the failure to load firmware isn't great --
> not 100% sure if it impacts runpm or not.
 
Yes, I have 'nouveau.debug=disp=trace'
Someone on this list asked me to add this a few months back.

> I just double-checked, TU10x accel came in via
> afa3b96b058d87c2c44d1c83dadb2ba6998d03ce, which was first in v5.6.
> Initial TU10x support came in v5.0. So that doesn't line up with your
> timeline.

You know, I said 5.5, maybe it was 5.6 now, it's been a little while
since those issues started.

Now we know I was missing the required firmware, it's a good place to
start, so I'll start there, thank you very much for the pointers.

Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
