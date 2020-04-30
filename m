From: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: gp104: regression on Linux 5.6
Date: Thu, 30 Apr 2020 10:32:43 +0300
Message-ID: <20200430073243.GA8620@avx2>
References: <20200401185621.GA24692@avx2>
 <CAKb7UvhLF7Qdx7W_0Ft4G8NujW6XbELcCP09DSkubj_duBXVkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKb7UvhLF7Qdx7W_0Ft4G8NujW6XbELcCP09DSkubj_duBXVkg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Apr 30, 2020 at 12:15:28AM -0400, Ilia Mirkin wrote:
> Hi Alexey,
> 
> On Fri, Apr 24, 2020 at 10:52 PM Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > gp104 refuses to switch to "graphic" mode and show anything past
> > this line:
> >
> >         fb0: switching to nouveaufb from EFI VGA
> >
> > Machine is fine, as it I can press Ctrl+Alt+Delete and reboot it
> > normally.
> >
> > 5.5 is OK. 5.6 is broken.
> 
> I've heard some issues relating to missing firmware lately. It should
> work fine without firmware, but perhaps that got broken. Can you log
> into the machine and check dmesg to see what's there? My guess is that
> nouveau takes over from efifb, and then fails to load at some point in
> the middle.

I've fixed the issue by including all firmware until "failed to load"
messages disappeared. X works and fbconsole on VT1-VT6 works too.

CONFIG_EXTRA_FIRMWARE="nvidia/gp104/gr/sw_nonctx.bin nvidia/gp104/gr/sw_ctx.bin nvidia/gp104/gr/sw_bundle_init.bin nvidia/gp104/gr/sw_method_init.bin nvidia/gp104/gr/fecs_bl.bin nvidia/gp104/gr/fecs_inst.bin nvidia/gp104/gr/fecs_data.bin nvidia/gp104/gr/fecs_sig.bin nvidia/gp104/gr/gpccs_bl.bin nvidia/gp104/gr/gpccs_inst.bin nvidia/gp104/gr/gpccs_data.bin nvidia/gp104/gr/gpccs_sig.bin nvidia/gp104/sec2/image.bin nvidia/gp104/sec2/desc.bin nvidia/gp104/sec2/sig.bin nvidia/gp104/acr/ucode_load.bin nvidia/gp104/acr/ucode_unload.bin nvidia/gp104/acr/bl.bin nvidia/gp104/acr/unload_bl.bin nvidia/gp104/nvdec/scrubber.bin"

> > Bisecting is kinda painful with miscompilation and init/main.c breakage.
> >
> > BTW do I need all those megabytes of firmware?
> >
> > [    0.923273] fb0: switching to nouveaufb from EFI VGA
> > [    0.923440] nouveau 0000:02:00.0: NVIDIA GP104 (134000a1)
> > [    1.026681] nouveau 0000:02:00.0: bios: version 86.04.1e.00.01
> > [    1.026930] nouveau 0000:02:00.0: gr: failed to load firmware "gr/sw_nonctx"
> > [    1.026934] nouveau 0000:02:00.0: gr: failed to load gr/sw_nonctx
> 
> This is necessary to provide any sort of acceleration. Otherwise this
> is just a dumb scanout engine. You only need the firmware for your
> chipset, not all of it.

OK, thanks!
