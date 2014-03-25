From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH 4/4] vbios/prom: fetch the vbios using only
 aligned 32-bit accesses
Date: Tue, 25 Mar 2014 18:37:57 -0400
Message-ID: <CAKb7Uvhgz3SBHuUuCaBS=2OJjLB-5Yj2ZERd9jNqpBtvriQWsQ@mail.gmail.com>
References: <1395785480-2932-1-git-send-email-martin.peres@free.fr>
 <CAKb7Uvhahzo7S-B63V=tQQK=gbXhV4qv13qbF-ePBOP8d2Ce1g@mail.gmail.com>
 <53320379.7080604@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53320379.7080604-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Mar 25, 2014 at 6:30 PM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> wrote:
> On 25/03/2014 23:24, Ilia Mirkin wrote:
>>
>> On Tue, Mar 25, 2014 at 6:11 PM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
>> wrote:
>>>
>>> Other kind of accesses are unreliable on Maxwell cards. As advised by
>>> NVIDIA,
>>
>> Maxwell or Kepler?
>
>
> Damn, I meant Kepler.
>
> I updated the patch in my git tree:
> http://cgit.freedesktop.org/~mperes/nouveau/commit/?id=661a5c599565686f72e729600b0dd6aa6e472f0c
>
>>
>>> let's only use 32-bit accesses to fetch the vbios from PROM.
>>>
>>> This fixes vbios fetching on my nve7 which failed in certain specific
>>> conditions.
>>>
>>> I suggest we Cc stable, for all kernels they still maintain after the big
>>> rewrite.
>>
>> Just throw in the Cc :) Easier to just have it there than to have to
>> go in and edit the commit description to remove this comment and add
>> the Cc line...
>
>
> I don't want git send-email to send an email to stable, the patch won't
> apply on any kernel.
>

--suppress-cc=bodycc
