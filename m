From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: PROM vbios fetching issues
Date: Tue, 25 Mar 2014 23:33:57 +0100
Message-ID: <53320455.2030608@free.fr>
References: <533080A2.6020501@free.fr>
 <20140325161720.GB8282@panther.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140325161720.GB8282-JA3VlGzg3tsMOYszX5p1ytBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Christian Zander <czander-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, gpu-public-documentation <gpu-public-documentation-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 25/03/2014 17:17, Christian Zander wrote:
> On Mon, Mar 24, 2014 at 11:59:46AM -0700, Martin Peres wrote:
>> Hello,
>>
>> One of my GPU (GK107/NVE7) fails to properly fetch its vbios from PROM
>> at boot time but, if I blacklist the module and load it myself later on,
>> it always succeeds. To make things weirder, the same card works great on
>> another computer.
>>
>> Here is the relevant code in Nouveau to fetch the vbios from PROM:
>> http://code.woboq.org/linux/linux/drivers/gpu/drm/nouveau/core/subdev/bios/base.c.html#nouveau_bios_shadow_prom
>>
>> The only solution I found to this problem is to try up to 16 times in a
>> row to fetch the vbios using PROM. If the 16 tries yield a bad signature
>> or checksum, I just give up and let it try other techniques. Here is the
>> patch[1].
>>
>> With this hack in place, the number of retries needed to be able to
>> correctly fetch the vbios ranges from 0 to 13. I see no consistency in
>> this. I tried reading the vbios 32 bits by 32 bits (instead of 8 by 8),
>> disabling local IRQs and generating more activity on the PCIe port
>> before fetching (and making sure the value read is always the same), all
>> solutions yielded no improvement.
>>
>> It could be a brownout problem but this would be the only manifestation
>> of this problem. Moreover, some cards are known to have problems with
>> PROM[2] so mine is definitely not the only one.
>>
>> I'm at a loss here, should we wait on anything before reading from PROM?
>> The mmiotrace I have doesn't seem to suggest we should :s I wonder if
>> you have had this issue before and what the nvkm does here.
>>
> Hi Martin,
>
> a functional regression in GK10x prevents your GK107 GPU
> from properly decoding 8-bit and 16-bit accesses to
> the PROM registers. While these unaligned accesses work on
> most GPUs, it is best not to rely on them. You can ensure
> reliable retrieval of the VBIOS via the PROM registers
> by using 32-bit register accesses across all GPUs.
>
> Thank you, Christian.

Hi Christian,

Thanks, that was what went wrong. I thought I had tested 32-bit accesses 
only but
Imust have forgotten to update the vbios size read...

Thanks again for this quick answer,

Martin
