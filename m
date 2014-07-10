From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Warnings in dmesg and results of mmiotrace 10de:1140
 Geforce620m Optimus Laptop Acer E1-531G
Date: Thu, 10 Jul 2014 13:07:07 -0400
Message-ID: <CAKb7UvjzjYrprtwX9DbrrVGwLt8guo5GjYsTaB5FG5sLBw2f9Q@mail.gmail.com>
References: <xtkilbmzwnncgxhnhzvu@hwkn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <xtkilbmzwnncgxhnhzvu@hwkn>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lampshade <lampshade-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Jul 10, 2014 at 11:01 AM, Lampshade <lampshade-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org> wrote:
> Hello
> in dmesg I always have these informations (I tested several kernels between 3.7 and 3.16-rc3):
>
> [   13.742006] nouveau E[     DRM] Pointer to TMDS table invalid
> [   13.742036] nouveau  [     DRM] DCB version 4.0
> [   13.742038] nouveau E[     DRM] Pointer to flat panel table invalid
> [   13.742079] nouveau  [     DRM] ACPI backlight interface available, not registering our own
> [   13.742082] nouveau W[     DRM] voltage table 0x50 unknown
>
> I have this laptop since early 2013. Since I have this laptop, I have also these error messages. On Linux I was using for a long time only Intel GPU.
>
> I generated mmio tracing with this kernel (from kernel.org, I disabled Symmetric multiprocessing) compiled on my own. I have used NVIDIA-Linux-x86_64-340.24 driver on 64 bit system with UEFI enabled.
> I followed this manual: https://wiki.ubuntu.com/X/MMIOTracing. Others used commands are contained in archive (I have run for first mmiotrace: xserver + openbox for second: xserver + openbox + glxgears).
> ubuntu@random:~$ uname -a
> Linux random 3.12.24 #1 Wed Jul 9 13:42:50 CEST 2014 x86_64 x86_64 x86_64 GNU/Linux
> Kernel is a clean, recent code from kernel.org. Other system components are from Ubuntu repository.
>
> Is there to be worried of? Maybe there something can be done for better support for that hardware

The errors are just some unexpected things in the vbios. I think
3.16-rc1+ should know about that voltage table? Maybe not. Either way,
it's important for reclocking, and we don't have support for that for
nvd7 (gf117).

Are you having any issues, or just reporting funny things in your dmesg?

  -ilia
