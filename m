From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NVIDIA Falcon Microprocessor Security
Date: Sat, 27 Sep 2014 10:13:43 +1000
Message-ID: <CACAvsv7WgxpE5qK=9tnebhj-JEt+epOfHzqoK+wx+_yGXV-jFw@mail.gmail.com>
References: <20140926171939.GE6384@parker.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140926171939.GE6384-4K9zQNqW3/fFT5IIyIEb6QC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Sep 27, 2014 at 3:19 AM, Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> Hi, all.
Hey Andy,

>
> Below is a link to a brief document describing some changes in NVIDIA
> Falcon processors ("fuc", in Nouveau-speak, IIUC)
We started trying to use your names where we know them a while back.
I personally think of "fuc" as short-hand for "falcon ucode" now.

> that happened in
> Maxwell: certain aspects of the chip will only be available to Falcon
> firmware images signed by NVIDIA.  So far, the set of restricted things
> is pretty small, but I expect this list will slowly grow over future
> hardware generations.
>
>     ftp://download.nvidia.com/open-gpu-doc/Falcon-Security/1/Falcon-Security.html
>
> I suspect this will not be the most popular decision, but it is the
> direction the hardware is taking.
Indeed, it's a rather inconvenient and frustrating change.  But it's
what we have to deal with now, so moving along :)

>
> On a slightly different note, we'd like to work out the best way to
> make NVIDIA firmware images separately (from the rest of the driver)
> available and officially redistributable for use by Nouveau.  At this
> point, it is mostly just a release engineering question, but I don't think
> we'll have a lot of influence over the content: the engineers working on
> Falcon microcode assume it changes in lock-step with NVIDIA's nvidia.ko,
> so there are no backwards compatibility guarantees.  How painful has
> the lack of backwards compatibility been for Nouveau thus far?
So far the use of your FECS/GPCCS ucode has been treated as a "last
resort" deal, with a strong preference of using our own when we
finally manage to get it working.  We haven't really changed the
process much over time, and it's probably luck that it's kept
"working" to an extent.  The simplest thing that could be done to ease
this and not enforce some kind of API, is to version the firmware
images in some way, and we can support multiple paths if/when we need
to.

One immediate question I have is that given that FECS/GPCCS pretty
much have zero permissions already outside of the NV_PGRAPH range,
what restrictions are in place there that would prevent us from
continuing to use our own ucode on these falcons?

>
> If NVIDIA just released firmware binaries along side each NVIDIA GPU driver
> release, would it be reasonable for Nouveau to pick and choose which
> firmware you'd like promoted to, e.g.,
>
>     http://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/tree/
>
> ?
That would be fine.  I'm somewhat concerned about the possibility we
may get "crippled" ucode compared to what you guys are using, has
there been any discussion on this?

>
> Anyway, this might be a good topic to discuss at XDC.  It looks I'll
> see a lot of you then; I'm looking forward to it!
Indeed it will!  Look forward to seeing you there :)

Thanks,
Ben.

>
> Thanks,
> - Andy
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
