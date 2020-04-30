From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: gp104: regression on Linux 5.6
Date: Thu, 30 Apr 2020 08:27:50 -0400
Message-ID: <CAKb7UvjP5NfMjvBqydQ3Q53OsLT_eQX3F+s1E4Ornr1LrG6b=Q@mail.gmail.com>
References: <20200401185621.GA24692@avx2>
 <CAKb7UvhLF7Qdx7W_0Ft4G8NujW6XbELcCP09DSkubj_duBXVkg@mail.gmail.com>
 <20200430073243.GA8620@avx2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200430073243.GA8620@avx2>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Apr 30, 2020 at 3:32 AM Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Thu, Apr 30, 2020 at 12:15:28AM -0400, Ilia Mirkin wrote:
> > Hi Alexey,
> >
> > On Fri, Apr 24, 2020 at 10:52 PM Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > >
> > > gp104 refuses to switch to "graphic" mode and show anything past
> > > this line:
> > >
> > >         fb0: switching to nouveaufb from EFI VGA
> > >
> > > Machine is fine, as it I can press Ctrl+Alt+Delete and reboot it
> > > normally.
> > >
> > > 5.5 is OK. 5.6 is broken.
> >
> > I've heard some issues relating to missing firmware lately. It should
> > work fine without firmware, but perhaps that got broken. Can you log
> > into the machine and check dmesg to see what's there? My guess is that
> > nouveau takes over from efifb, and then fails to load at some point in
> > the middle.
>
> I've fixed the issue by including all firmware until "failed to load"
> messages disappeared. X works and fbconsole on VT1-VT6 works too.
>
> CONFIG_EXTRA_FIRMWARE="nvidia/gp104/gr/sw_nonctx.bin nvidia/gp104/gr/sw_ctx.bin nvidia/gp104/gr/sw_bundle_init.bin nvidia/gp104/gr/sw_method_init.bin nvidia/gp104/gr/fecs_bl.bin nvidia/gp104/gr/fecs_inst.bin nvidia/gp104/gr/fecs_data.bin nvidia/gp104/gr/fecs_sig.bin nvidia/gp104/gr/gpccs_bl.bin nvidia/gp104/gr/gpccs_inst.bin nvidia/gp104/gr/gpccs_data.bin nvidia/gp104/gr/gpccs_sig.bin nvidia/gp104/sec2/image.bin nvidia/gp104/sec2/desc.bin nvidia/gp104/sec2/sig.bin nvidia/gp104/acr/ucode_load.bin nvidia/gp104/acr/ucode_unload.bin nvidia/gp104/acr/bl.bin nvidia/gp104/acr/unload_bl.bin nvidia/gp104/nvdec/scrubber.bin"

Ben -- another report of firmware-less load being broken on v5.6.

Alexey -- If you compile nouveau as a module, then these can live on
your filesystem or initrd, depending on your boot process.

Cheers,

  -ilia
