From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/therm: ack any pending IRQ at
 init v2
Date: Mon, 09 Sep 2013 00:44:48 +0200
Message-ID: <522CFDE0.7000009@labri.fr>
References: <1377907131-15099-2-git-send-email-martin.peres@free.fr>
	<1377907571-15301-1-git-send-email-martin.peres@free.fr>
	<CACAvsv6+9TqeTjMeMPdAwDrxLbbZ1sBJDQFmE7Xum9ryebns7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv6+9TqeTjMeMPdAwDrxLbbZ1sBJDQFmE7Xum9ryebns7g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 04/09/2013 03:52, Ben Skeggs wrote:
> On Sat, Aug 31, 2013 at 10:06 AM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> wrote:
>> From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
>>
>> This is safe because ptherm hasn't been configured yet and will be a
>> little further down the initialization path. Ptherm should be safe
>> regarding to runtime reconfiguration.
> Any objections to instead sticking the ACK in a single fini() hook
> (along with additional code to disable all therm interrupts), and
> having the IRQ handle silently ignore any non-requested IRQs (see what
> the copy engine irq handler does, for example)?
>
> Ben.

Hi Ben,

Sorry for the late answer. This all perfectly make sense. Please have a 
look at the patches I've just sent.
