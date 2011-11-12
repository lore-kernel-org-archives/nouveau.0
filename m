From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: better way to test optimus laptop
Date: Sat, 12 Nov 2011 10:37:24 +0200
Message-ID: <20111112103724.1b278982@farn.lan>
References: <CAG2kNCz34=9y-sMGKEO=F4r-E2csBBQibB_jsWUFnnG_PHnhgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAG2kNCz34=9y-sMGKEO=F4r-E2csBBQibB_jsWUFnnG_PHnhgA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Gianluca Cecchi <gianluca.cecchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 11 Nov 2011 12:34:06 +0100
Gianluca Cecchi <gianluca.cecchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hello,
> I have an Asus laptop, model U36SD with Nvidia optimus technlogy.
> My system has now Fedora 16 with kernel 3.1.0-7.fc16.x86_64
> $ lspci -vnnn|grep VGA
> 00:02.0 VGA compatible controller [0300]: Intel Corporation 2nd
> Generation Core Processor Family Integrated Graphics Controller
> [8086:0126] (rev 09) (prog-if 00 [VGA controller])
> 01:00.0 VGA compatible controller [0300]: nVidia Corporation
> Device [10de:1050] (rev ff) (prog-if ff)
> 
> At the moment, not being able to use optimus technology I compiled
> acpi_call (from 24/06/11) for my kernel and set this in
> /etc/rc.d/rc.local
> /sbin/modprobe acpi_call
> echo '\_SB.PCI0.PEG0.GFX0.DOFF' > /proc/acpi/call
> 
> Also, due to some video problems for which I don't know if a
> possible con-cause could be both nouveau and i915 kernel modules
> loaded, I put in my grub.conf settings so that
> $ cat /proc/cmdline
> BOOT_IMAGE=/boot/vmlinuz-3.1.0-7.fc16.x86_64
> root=UUID=ce058d6c-d2ed-49e5-9869-965799f246a5 ro rd.md=0 rd.lvm=0
> rd.dm=0 KEYTABLE=us quiet SYSFONT=latarcyrheb-sun16 rhgb rd.luks=0
> LANG=en_US.UTF-8 i915.i915_enable_rc6=1 elevator=deadline
> nouveau.nomodeset=0
> 
> $ sudo lsmod|grep nouve
> $ sudo lsmod|grep i915
> i915                  389156  3
> drm_kms_helper         26490  1 i915
> drm                   194532  5 ttm,i915,drm_kms_helper
> i2c_algo_bit            4958  1 i915
> i2c_core               25728  6
> videodev,i2c_i801,i915,drm_kms_helper,drm,i2c_algo_bit
> video                  12388  1 i915
> 
> Is this correct approach at the moment? Anything to test in
> Optimus direction and to help nouveau?

Are you sure there is anything to test with Optimus?
I haven't heard of any huge progress.

Do you know how your outputs are wired, and do you have a hw mux?
http://nouveau.freedesktop.org/wiki/Optimus

-- 
Pekka Paalanen
http://www.iki.fi/pq/
