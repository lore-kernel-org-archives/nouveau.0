From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Mistake in Gallium how-to in wiki?
Date: Mon, 18 Jul 2011 16:57:40 -0400
Message-ID: <CAMVNhxRzFQrBVPeaoYkz7gB03nL=sVFRdrBKKnU4UdhPXvmYWw@mail.gmail.com>
References: <4E249AA8.5090703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4E249AA8.5090703-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Andrew Green <andrew.green.df-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Jul 18, 2011 at 4:42 PM, Andrew Green <andrew.green.df-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> I think I've found a mistake in the Gallium instructions in the Nouveau wiki
> (http://nouveau.freedesktop.org/wiki/GalliumHowto).
>
> According to that page, one should run ./configure like this:
>
> ./configure --enable-debug --enable-glx-tls --disable-asm \
> --with-dri-drivers= --enable-gallium-nouveau \
> --disable-gallium-i915 --disable-gallium-i965 \
> --disable-gallium-r300 --disable-gallium-r600 --disable-gallium-svga \
> --with-state-trackers=glx,dri
>
>
> But when I compiled using that configuration, nouveau_dri.so was not built.
> Also, a few of the configuration options were not recognized. However, this
> configure command did work, at least for me:
>
> ./configure --enable-debug --enable-glx-tls --disable-asm \
> --with-dri-drivers --enable-glx --enable-dri --enable-xorg \
> --with-state-trackers=glx,dri --with-gallium-drivers="nouveau
>
>
> Hope this is helpful. (I'm completely "new" to "nouveau", so I guess I may
> be completely off.) Thanks to the developers for their work on this,
> greetings,
> Andrew

The config options changed not too long ago and the wiki hasn't been
updated. Feel free to update it if you have an account.
