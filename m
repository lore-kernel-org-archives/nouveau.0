From: Benjamin Morris <bmorris-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: H.264 engine differences between fermi and tesla cards
Date: Thu, 21 Nov 2013 14:07:11 -0800
Message-ID: <20131121140711.7154f62a@bmorris-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: ibmirkin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, gpu-public-documentation-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 11/19/2013 08:16 PM, Ilia Mirkin wrote:
> Hello,
> 
> I hope this is an appropriate style of request for this forum. I added
> code to support video decoding on the tesla cards that have a
> similar-style video decoding engine to fermi cards (i.e. G98, GT21x,
> the IGP's -- the falcon-controlled decoding engines, rather than the
> xtensa-controlled ones), by using pretty much the same logic that we
> had for the fermi cards. This worked great for MPEG-2 and VC-1.
> However for H.264 videos, it appears to decode a few frames, and then
> the engine hangs.
> 
> In traces, I noticed that the nvidia driver reloads the BSP/VP/PPP
> engines every second or so. Is this done as a powersaving technique,
> or is it done as a workaround for some issue? Does nouveau need to do
> the same thing? If so, any specifics on the reload condition?
> 
> Any other ideas as to what might be going wrong? Are there some subtle
> differences between the fermi and pre-fermi engines? Or a difference
> when decoding H.264 files vs MPEG2/VC1 files? Perhaps there's other
> information I can provide. BTW, this is with using the firmware blobs
> from the NVIDIA proprietary driver.
> 
> Thanks,
> 
>   -ilia

As you observed, the nvidia driver unloads the video engines on certain GPUs when they go idle to save power.  You can disable this behavior by loading the nvidia kernel module with: modprobe nvidia NVreg_RegistryDwords="RMPowerFeature=64"

Regarding your H.264 hangs, the most likely cause is mis-programming the video engine.  I suggest double-checking that the nouveau driver sends the exact same parameters for each decode operation as the nvidia driver does.  In particular, check that buffer alignments match up, as those may vary between GPU generations.

Thanks,
Ben
