From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Question on MME and Compute Subchannel in Kepler+
Date: Fri, 27 Mar 2020 22:11:55 -0400
Message-ID: <CAKb7UviFtJY4d8PFMowUaGEkbne3xke+zWJfYgauNt9v60KFgg@mail.gmail.com>
References: <CA+MSTo-4LDtfB_mQCU8ECi0BXCAazrdTiHm1BPObyHp=pUV9jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CA+MSTo-4LDtfB_mQCU8ECi0BXCAazrdTiHm1BPObyHp=pUV9jg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Fernando Sahmkow <fsahmkow27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

I believe that there's a single shared resource for MME in GRAPH, not
separate ones for separate classes. Ultimately, the classes just
provide frontends for the single internal GRAPH engine. (This is
probably also why setting some stuff on the compute class "unsets" it
on the 3d class, or sometimes is directly visible.)

For compute on Kepler+, you don't actually need to use macros for
indirect compute dispatch -- the launch descriptor which contains the
grid dimensions is in memory, and the technique used is to just use
UPLOAD_EXEC to overwrite the necessary bits. (Small aside - Pascal got
a new launch descriptor, I forget which gen switch is.) Check how
nouveau does it in nve4_compute_upload_input (look for the
info->indirect case).

But you can see an example of a compute macro for Fermi (where there
is no separate launch descriptor):

https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nvc0/mme/com90c0.mme

And it's installed the same way as all the "3d" macros are:

https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c#n1429

As an aside, you may find this MME emulator useful in demmt. It's
fully accurate, AFAIK:

https://github.com/envytools/envytools/blob/master/demmt/macro.c

Hope this helps!

  -ilia

On Fri, Mar 27, 2020 at 9:34 PM Fernando Sahmkow <fsahmkow27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Hello everyone,
>
> I've been trying to adapt a switch emulator to emulate nouveau's compute. We've been told some things like indirect dispatch use the MME in Nouveau, however, looking at NVIDIA's open gpu documentation there's no MME in compute engine since Kepler. https://github.com/NVIDIA/open-gpu-doc/blob/master/classes/compute/clb1c0.h MME for compute should still exist because of the presence of MME Shadow Memory Scratch registers.
>
> How does MME for Compute works on Kepler+ ? Does it use the 3D Subchannel? if so how do I know when its targeting the Compute Subchannel?
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
