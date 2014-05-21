From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa-dev] [PATCH 04/12] nv50/ir/tgsi:
 TGSI_OPCODE_POW replicates its result
Date: Wed, 21 May 2014 20:01:11 +0100
Message-ID: <537CF7F7.1010504@gmail.com>
References: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>	<1400629206-4447-5-git-send-email-imirkin@alum.mit.edu>	<537CF597.4080406@gmail.com>
 <CAKb7Uvj1EomVeAwqFdguuP9xQ1dDkRGDVc9N7239b8O+aL-VrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvj1EomVeAwqFdguuP9xQ1dDkRGDVc9N7239b8O+aL-VrQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Christoph Bumiller <christoph.bumiller-D4IDLmZPRBc@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 21/05/14 19:53, Ilia Mirkin wrote:
> On Wed, May 21, 2014 at 2:51 PM, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 21/05/14 00:39, Ilia Mirkin wrote:
>>> From: Christoph Bumiller <christoph.bumiller-D4IDLmZPRBc@public.gmane.org>
>>>
>>> Reviewed-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
>>> Cc: "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
>>> ---
>>>  src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
>>> index 3e44bf9..e24be51 100644
>>> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
>>> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
>>> @@ -2199,7 +2199,6 @@ Converter::handleInstruction(const struct tgsi_full_instruction *insn)
>>>     case TGSI_OPCODE_IMUL_HI:
>>>     case TGSI_OPCODE_UMUL_HI:
>>>     case TGSI_OPCODE_OR:
>>> -   case TGSI_OPCODE_POW:
>>>     case TGSI_OPCODE_SHL:
>>>     case TGSI_OPCODE_ISHR:
>>>     case TGSI_OPCODE_USHR:
>>> @@ -2254,6 +2253,11 @@ Converter::handleInstruction(const struct tgsi_full_instruction *insn)
>>>        FOR_EACH_DST_ENABLED_CHANNEL(0, c, tgsi)
>>>           mkOp1(OP_MOV, TYPE_U32, dst0[c], fetchSrc(0, c));
>>>        break;
>>> +   case TGSI_OPCODE_POW:
>>> +      val0 = mkOp2v(op, TYPE_F32, getScratch(), fetchSrc(0, 0), fetchSrc(1, 0));
>>> +      FOR_EACH_DST_ENABLED_CHANNEL(0, c, tgsi)
>>> +         mkOp1(OP_MOV, TYPE_F32, dst0[c], val0);
>>> +      break;
>> Can you use mkMov ? Pretty please :)
> 
> The two are used fairly interchangeably, and a lot of the surrounding
> code uses this style (as you can see in the context lines). I'd rather
> keep it as-is.
> 
IMHO using mkMov makes the code easier to read for noobs like me. There are
only two cases of mkOp1(OP_MOV) and more than a dozen mkMov's. Either way it's
up-to you.

-Emil

>   -ilia
> 
