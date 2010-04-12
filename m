From: Didier Spaier <didier.spaier-GqzDj6/B2j8@public.gmane.org>
Subject: Re: Blank screen at startup (conflict with VESA VGA)
Date: Mon, 12 Apr 2010 13:17:11 +0200
Message-ID: <4BC30137.5070703@epsm.fr>
References: <4BBB8B8E.9050004@epsm.fr> <20100410220119.GA2949@joi.lan>
	<4BC1DF11.3000603@epsm.fr> <20100411153919.GA12618@joi.lan>
	<4BC1FA45.1050808@epsm.fr> <20100411170535.GA4016@joi.lan>
	<4BC2231C.2060509@epsm.fr> <4BC2BA76.8040509@epsm.fr>
	<20100412101413.GA2733@joi.lan> <4BC2F69E.6000905@epsm.fr>
	<20100412105013.GA2789@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100412105013.GA2789-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Marcin Slusarz wrote:
> Ok, let's CC nouveau list back.
> 
> On Mon, Apr 12, 2010 at 12:31:58PM +0200, Didier Spaier wrote:
>>>> One thing I didn't check before sending my last mail: can I go back
>>>> to console mode after having started X with say, the nv X module ?
>>>>
>>>> Unfortunately this doesn't work: be it from Fluxbox or KDE, when 
>>>> I logout or use Alt+Ctrl+Fn I see a black screen.
>>> nv or nouveau?
>>> running nv (X) with nouveau kernel module is unsupported
>> Running nv (X).
>>
>> I understand that running nv (X) with nouveau kernel module is unsupported,
>> but if a nVidia GPU is detected the nouveau kernel module is automatically
>> loaded during startup (unless blacklisted, of course).
>>
>> This don't prevent to run X with the nv module (in a distribution in which
>> nouveau (X) is not available, for instance), but going back to console mode
>> doen't work in that case.
>>
>> Is there any way to make it working, as some distributions do not include
>> (yet) all components needed for nouveau (mainly matching libdrm and X module) ?
> 
> I'm not aware of any trick to make both nv and nouveau working.
> Maybe there should be a way to prevent nv (and vesa, but not fbdev) from loading
> when KMS is in use?
> 
Anybody knows one way to do that ?
 >
>>  > nouveau kernel module works only with nouveau and fbdev X drivers
>>
>> I'll will try with fbdev then.
> 
Done, I confirm that there is no problem here to go back and forth (console mode vs X running) with nouveau kernel module and fbdev X module loaded. I tried with Fluxbox, KDE and XFCE.
> 
Didier
