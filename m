From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] nvfx: rework render temps code and fixes
Date: Tue, 17 Jan 2012 02:18:04 +0100
Message-ID: <CAAxE2A7p_f3tq+xfoESSo7DX1w89jm2H8KdMmUupj2noqZ5tdg@mail.gmail.com>
References: <1326195664-28384-1-git-send-email-dev@lynxeye.de>
	<20120114131404.3f742857.mandin.patrice@orange.fr>
	<1326672554.1672.39.camel@tellur> <1326731626.1659.12.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1326731626.1659.12.camel@tellur>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

HI everyone,

first, I am not subscribed to the nouveau mailing list, so please CC
me if you need anything.

I pushed the whole series because there was no feedback on mesa-dev
for like 5 days. If you want to revert it, just let me know and I'll
do it.

Marek

On Mon, Jan 16, 2012 at 5:33 PM, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> wrote:
> I seems Marek has just accidentally pushed the whole series. So we have
> a bit of a difficult situation here. I'm not sure if we should just
> revert or if we can leave the patches upstream.
>
> I'm aware that this patches haven't received much testing by others than
> me and that a review of the code is still oustanding, but I like to
> stress the point that these patches are rigorously tested by me and are
> relatively low risk.
>
> Patrice your report of this patchset not working did surprise me, so can
> you please make sure those patches are really the cause for your issues?
> I heard reports that nv3x is not working properly with mesa/master for
> some time. I tried to reproduce the problem on my nv49 setup and I don't
> see any issues besides the well known vertex corruption, which is most
> likely due to some missing reloc somewhere or the like.
>
> Regards,
> Lucas
>
> Am Montag, den 16.01.2012, 01:09 +0100 schrieb Lucas Stach:
>> Am Samstag, den 14.01.2012, 13:14 +0100 schrieb Patrice Mandin:
>> > Hello,
>> >
>> > I just tried on my NV34 the whole series. Here is what I noticed:
>>
>> Thanks for testing. Although now after some discussion it seems unlikely
>> that we will see much of this in nvfx it really helps me to decide if i
>> can go this way in the rewrite driver.
>> >
>> > - Seems rendering is a bit slower (in ioquake3, in the first map q3dm0,
>> > rendering the mirror and the portal causes more audio stuttering) but
>> > it it just my feeling.
>> Without the render temps we should actually do less work, rather than
>> more, so you shouldn't see any slowdown from this. Maybe we are hitting
>> a slow path elsewhere in the driver (like a cpu copy of a gpu only
>> surface).
>>
>> >
>> > - ut2004demo hangs at start (display just one frame in the nvidia
>> > licence plate part), but the system does not crash, and the game can be
>> > killed.
>> >
>> > Do you want me to check which of your patches makes ut2004 hanging?
>> >
>> No, please just check dmesg, to see if you get any errors there. I will
>> try to reproduce with my setup.
>>
>> Thanks,
>> Lucas
>>
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>
>
>
