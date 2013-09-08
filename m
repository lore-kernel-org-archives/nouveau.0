From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/nouveau/bios/therm: handle vbioses
 with duplicate entries (mostly nva5)
Date: Mon, 09 Sep 2013 00:46:33 +0200
Message-ID: <522CFE49.8050603@labri.fr>
References: <1377907131-15099-1-git-send-email-martin.peres@free.fr>
	<CACAvsv5VTQvVcQhB0_=GY4Jjx=3-EAd+QMqzemR7qsDeh7KxzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv5VTQvVcQhB0_=GY4Jjx=3-EAd+QMqzemR7qsDeh7KxzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Martin Peres <martin.peres-/ze9ptdxDJdQFI55V6+gNQ@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 04/09/2013 03:55, Ben Skeggs wrote:
> On Sat, Aug 31, 2013 at 9:58 AM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> wrote:
>> From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
>>
>> Some vbioses have extra useless entries after "the end" of the table. This is
>> problematic since all of the vbios I found with this issue redefine the
>> pwm freq divider to insane levels (52750 Hz instead of 2500), thus breaking
>> fan management.
>>
>> The first solution to solve this mess would be to change the length of the
>> table. The solution I choose was simply to avoid setting the pwm freq twice
>> as the other redefinitions are harmless with our current parser.
> I'm still *really* not convinced we're using the thermal table correctly....
>
> However, this makes sense for our current handling, so, merged.
>
> Thanks,
> Ben.

Well, I do agree that the first versions of the vbios table really felt 
like a script but this isn't the case anymore (not sure how I tested 
this though as it was more than a year ago).
