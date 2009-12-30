From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: Re: ddx/nv50: use drawable.bitsPerPixel to decide format
Date: Wed, 30 Dec 2009 18:52:40 +0100
Message-ID: <4B3B9368.3020602@student.tuwien.ac.at>
References: <20091228173717.GA10639@joi.lan>	<6d4bc9fc0912280955h348381der3ebae761e412ba5c@mail.gmail.com>	<20091229170634.GA2879@joi.lan>
	<4B3B8FD9.4070605@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B3B8FD9.4070605-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 12/30/2009 06:37 PM, Christoph Bumiller wrote:
> On 12/29/2009 06:06 PM, Marcin Slusarz wrote:
>> On Mon, Dec 28, 2009 at 06:55:23PM +0100, Maarten Maathuis wrote:
>>> On Mon, Dec 28, 2009 at 6:37 PM, Marcin Slusarz
>>> <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>
>>>> ---
>>>>  src/nv50_exa.c |  155 ++++++++++++++++++++++++++++++++++++--------------------
>>>>  1 files changed, 100 insertions(+), 55 deletions(-)
>>>>
>>>> diff --git a/src/nv50_exa.c b/src/nv50_exa.c
>>>> index 1f5a4ac..54968e8 100644
>>>> --- a/src/nv50_exa.c
>>>> +++ b/src/nv50_exa.c
>>>> @@ -79,15 +79,16 @@ NV50EXA2DSurfaceFormat(PixmapPtr ppix, uint32_t *fmt)
>>>>
>>>>        switch (ppix->drawable.depth) {
>>>>        case 8 : *fmt = NV50_2D_SRC_FORMAT_R8_UNORM; break;
>>>> -       case 15: *fmt = NV50_2D_SRC_FORMAT_X1R5G5B5_UNORM; break;
>>>> -       case 16: *fmt = NV50_2D_SRC_FORMAT_R5G6B5_UNORM; break;
>>>> +       case 15:
>>>> +       case 16:
>>>> +               *fmt = NV50_2D_SRC_FORMAT_R5G6B5_UNORM;
>>>> +               break;
>>>
>>> depth 15 is R5G5B5, why this change?
>>
>> it's the only value which passes rendercheck tests
>> (rendercheck -t blend -o Src -f x1r5g5b5,r5g5b5)
>>
> This is as far as I can tell because x1r5g5b5 (XRender direct format as
> queries by rendercheck) has depth set to 16, and therefore uses case 16
> here.
*queried
> If you use the same for depth 15, the rendercheck test check succeeds,
> but doing this is wrong.
> If you check bitsPerPixel instead, this will be 15 for both x1r5g5b5
> and r5g5b5, and all looks fine then.
> 
If we e.g. copy from 15bpp to 16bpp though, can the 16th bit be alpha
instead of green ? That would be problematic.
> See the attached patch. I'm not sure if I should have changed the xv
> stuff also.
>>>>        case 24: *fmt = NV50_2D_SRC_FORMAT_X8R8G8B8_UNORM; break;
>>>>        case 30: *fmt = NV50_2D_SRC_FORMAT_A2B10G10R10_UNORM; break;
>>>>        case 32: *fmt = NV50_2D_SRC_FORMAT_A8R8G8B8_UNORM; break;
>>>>        default:
>>>>                 NOUVEAU_FALLBACK("Unknown surface format for bpp=%d\n",
>>>>                                  ppix->drawable.depth);
>>>> -                return FALSE;
>>>
>>> Why did you remove this?
>>
>> because it's unreachable, NOUVEAU_FALLBACK returns FALSE
>>  
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
> 
> 
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
