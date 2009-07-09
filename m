From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: When will nouveau kernel tree be merged into master
Date: Thu, 9 Jul 2009 17:31:43 +0200
Message-ID: <6d4bc9fc0907090831n64ca31d1pf6d025ef290b3614@mail.gmail.com>
References: <4A55DBDD.6030703@Free.fr>
	<6d4bc9fc0907090806h6b0f7de3i9f7ec673e2cc0e7d@mail.gmail.com>
	<4A560B8C.7070809@Free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4A560B8C.7070809-rC/V9kRXU7Q@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Eric.Valette-GANU6spQydw@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, Jul 9, 2009 at 5:23 PM, Eric Valette<Eric.Valette-GANU6spQydw@public.gmane.org> wrote:
> Maarten Maathuis wrote:
>> This merging you probably read about, was merging 2.6.30-rc1 into the
>> nouveau tree, because that had upstream ttm support.
>>
> OK. I read it the other way round! I saw people complaining someone
> removed the support form drm fit without adding it anywhere else.
>> There were no plans (and there are still no plans) to merge nouveau,
>> simply because the code is still too untested and interfaces are still
>> changing.
>>
> And it will continue as long as it is difficult to compile it from
> source and it is not provided by distribution. So you are just hidding
> problem not solving them. There is a "staging" tree for unpolished
> drivers already in the kernel. The more people read the code and use,
> the more it will stabilize rapidly.
>> A merging tree would always be a personal tree, belonging to a single
>> person, not a public development tree like this.
>>
>> http://nouveau.freedesktop.org/wiki/InstallDRM lists several
>> installation options
>>
> Will try a soon as I get back home.
>> Also the frontpage was updated to reflect the changes. It also clearly
>> states the kernel tree is not upstreaming. Thanks to pq for all the
>> updating and the "compat" tree.
>>
>> I have and still am away, so i haven't tried it all, but it looks
>> quite ok from a distance.
>>
>> I know transations are not nice, but they had to be made for the sake
>> of the project. There is also no intent on rushing things into the
>> kernel before they are ready (i certainly hope not).
>>
> I beg to disagree on this point as the code is already used by people
> and some distrib maintainers.

Going into the kernel means having your interfaces frozen for many
many years. Don't forget that this new tree brings many changes
(memory manager and kms) and these need to be tested.

>> Maarten.
>>
>
>
