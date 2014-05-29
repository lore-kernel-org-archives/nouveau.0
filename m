From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 2/4] nvc0/ir: Handle reverse subop for
 OP_EXTBF when folding constant expressions
Date: Thu, 29 May 2014 21:53:56 +0200
Message-ID: <53879054.9090405@mni.thm.de>
References: <53878DE4.4010005@mni.thm.de>	<1401392636-17704-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>	<1401392636-17704-2-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <CAKb7UvgLpfeM6HL7skM-OXCYjNz8=uD=1fhQb5xLndszw3u0zQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgLpfeM6HL7skM-OXCYjNz8=uD=1fhQb5xLndszw3u0zQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Tested with:
MESA_EXTENSION_OVERRIDE=GL_ARB_gpu_shader5 ./shader_runner 
../tests/spec/arb_gpu_shader5/execution/built-in-functions/fs-bitfieldReverse.shader_test 
-> green output, so this should be ok

the test was not change though...


On 29.05.2014 21:47, Ilia Mirkin wrote:
> Can you verify that you tested how the HW handles this, as well as
> exactly how you did it (i.e. how did you modify the code + piglit
> test, what the results were, etc)
>
> On Thu, May 29, 2014 at 3:43 PM, Tobias Klausmann
> <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> wrote:
>> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
>> ---
>>   src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
>> index 58092f4..93f7c2a 100644
>> --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
>> +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
>> @@ -529,8 +529,18 @@ ConstantFolding::expr(Instruction *i,
>>            lshift = 32 - width - offset;
>>         }
>>         switch (i->dType) {
>> -      case TYPE_S32: res.data.s32 = (a->data.s32 << lshift) >> rshift; break;
>> -      case TYPE_U32: res.data.u32 = (a->data.u32 << lshift) >> rshift; break;
>> +      case TYPE_S32: {
>> +         res.data.s32 = (res.data.s32 << lshift) >> rshift;
>> +         if (i->subOp == NV50_IR_SUBOP_EXTBF_REV)
>> +            res.data.s32 = util_bitreverse(res.data.s32);
>> +         break;
>> +      }
>> +      case TYPE_U32: {
>> +         res.data.u32 = (res.data.u32 << lshift) >> rshift;
>> +         if (i->subOp == NV50_IR_SUBOP_EXTBF_REV)
>> +            res.data.u32 = util_bitreverse(res.data.u32);
>> +         break;
>> +      }
>>         default:
>>            return;
>>         }
>> --
>> 1.8.4.5
>>
