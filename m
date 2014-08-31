From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Mesa-stable] [PATCH 2/2] nv50: zero out unbound
	samplers
Date: Sat, 30 Aug 2014 20:13:01 -0400
Message-ID: <CAKb7UvicAYYzQpz2M=Yy7LPAG8ojPTjLzDs-ChhLY50NtbRvtw@mail.gmail.com>
References: <1409436150-5979-1-git-send-email-imirkin@alum.mit.edu>
 <1409436150-5979-2-git-send-email-imirkin@alum.mit.edu>
 <54025E9F.507@gmail.com>
 <CAKb7Uvj33_6ztqaHiW6ip5J9B93kCUGRw8-gdDzgSdvmc5JYcA@mail.gmail.com>
 <540267BB.8000309@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <540267BB.8000309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "10.2 10.3" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Aug 30, 2014 at 8:09 PM, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 31/08/14 00:34, Ilia Mirkin wrote:
>> On Sat, Aug 30, 2014 at 7:30 PM, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 30/08/14 23:02, Ilia Mirkin wrote:
>>>> Samplers are only defined up to num_samplers, so set all samplers above
>>>> nr to NULL so that we don't try to read them again later.
>>>>
>>> Would it be worth doing a similar thing with the unlocked samplers below the
>>> nr mark ? It seems to me that we might be leaking nv50->samplers[s][i], or
>>> perhaps I'm missing something ?
>>
>> Can you elaborate? sampler_state_create/delete deal with allocation
>> and deallocation. samplers starts out as NULL. I'm just making sure
>> that a subsequent call with a larger number of samplers doesn't try to
>> unlock potentially-deleted samplers.
>>
>
>    for (i = 0; i < nr; ++i) {
>       struct nv50_tsc_entry *old = nv50->samplers[s][i];
>
>       nv50->samplers[s][i] = nv50_tsc_entry(hwcso[i]);
>       if (old)
>          nv50_screen_tsc_unlock(nv50->screen, old);
>    }
>
> In the above hunk we get the old/current tsc, drop in on the floor and assign
> the new one in it's place. Does where does the ST keep track of the old one in
> order to nuke it via sampler_state_delete, or is it already deleted by the
> time we get here ?

It's the st's job to do this. It creates the samplers, and it deletes
them. Binding is merely setting which samplers map to which slots.

  -ilia
