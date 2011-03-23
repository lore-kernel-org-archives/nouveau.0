From: Jerome Glisse <j.glisse-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Getting bus address of GPU memory
Date: Wed, 23 Mar 2011 14:26:08 -0400
Message-ID: <AANLkTi=Q_kwHQ25F92_So4ocUoy0_UxfZjgEWXY3nkJv@mail.gmail.com>
References: <8739mwcdbw.fsf@inspiron.ap.columbia.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <8739mwcdbw.fsf-ki6eFfmvX+JNJvdX2p2jX/iOs8n+Ptt7@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nikolaus Rath <Nikolaus-BTH8mxji4b0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Mar 9, 2011 at 2:18 PM, Nikolaus Rath <Nikolaus-BTH8mxji4b0@public.gmane.org> wrote:
> Hello,
>
> This isn't directly nouveau related, but since I was welcome on the IRC
> channel I assume that I may post my question on the ML as well.
>
> We are trying to use an NVidia Tesla card for highly parallel real time
> computations. Our problem is to get the data from a custom PCIe device
> into the GPU fast enough (and back). We need to transfer ~200 bytes
> every ~10us, so the limiting factor is latency rather than bandwidth.
>
> So far, we have transferred the data via the host RAM, but I am trying
> to find a way to do direct peer-to-peer DMA transfer. The Tesla card
> supports peer-to-peer transfers to other GPUs, so in principle this
> should be possible.
>
> My idea (but I'm happy to hear others as well) is to determine the bus
> address of some GPU memory location, and then let the other PCIe card
> push and pull the data as needed.
>
> However, I am not sure how to determine the bus address. A brute force
> method would be to write a marker string somewhere into GPU memory and
> then search through all PCIe BARs. However, there is a chance that the
> marker string does not end up in the mapped memory area. I'm currently
> trying to figure that out by searching through the BARs with the CPU
> (see other posting).
>
> In case that fails: does anyone have a suggestion how else we might
> accomplish what we want? Is there a way to change the mapping from BARs
> to GPU memory? Could one of the nouveau debugging tools be used to
> figure out how the nvidia driver does the GPU-to-GPU transfer and tap of
> the bus address?
>
>
> Hackish solutions are quite welcome, we are already working with a
> patched kernel anyway to share the pinned host memory between drivers.
>
>
> Best,
>
> =A0 -Nikolaus
>

I don't think there is any proper solution to what you seek. You might
be able to do somethings if you use the nouveau driver by allocating
buffer at a given address and pinning it but when it comes to the
closed source driver (which is likely what you use) i don't think
there is any solution, nvidia driver likely don't communicate physical
addrss with userspace and your buffer might even end up in system ram
and be accessed by the gpu through pci.

Best would be to contact nvidia directly and see if they have
anythings to offer.

Cheers,
Jerome
