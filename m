From: =?UTF-8?B?TWFyY2luIEtvxZtjaWVsbmlja2k=?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: Re: [envytools PATCH] nv50/pgraph: DATA_ERROR 0x24
Date: Sun, 06 May 2012 21:18:49 +0200
Message-ID: <4FA6CE99.2080809@0x04.net>
References: <20120506185103.GA4311@joi.lan> <4FA6CA9D.5070107@0x04.net>
	<20120506191456.GE4311@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120506191456.GE4311-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

>> Could we get a better name + description for that? The error happens
>> when there are no enabled inputs (VP_ATTR_EN is set, but is 0), not when
>> it's not set at all. VP_ZERO_INPUTS or VP_NO_INPUTS perhaps?
>
> Yes, that's correct.
>
>> Also, have you checked if that error happens on all submission methods,
>> or just VERTEX_DATA? I don't see why VERTEX_ELEMENT /
>> VERTEX_BUFFER_COUNT would have a problem with 0 inputs.
>
> It definitely has problems with VERTEX_BUFFER_COUNT, only later I discovered
> VERTEX_DATA have them too. I didn't check VB_ELEMENT_*, but I bet it's the same
> story.
>
> Marcin
>

Thanks, pushed.
