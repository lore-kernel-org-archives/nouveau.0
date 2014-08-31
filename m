From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [Mesa-stable] [PATCH 2/2] nv50: zero out unbound
	samplers
Date: Sun, 31 Aug 2014 01:09:31 +0100
Message-ID: <540267BB.6060900@gmail.com>
References: <1409436150-5979-1-git-send-email-imirkin@alum.mit.edu>	<1409436150-5979-2-git-send-email-imirkin@alum.mit.edu>	<54025E9F.507@gmail.com>
 <CAKb7Uvj33_6ztqaHiW6ip5J9B93kCUGRw8-gdDzgSdvmc5JYcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7Uvj33_6ztqaHiW6ip5J9B93kCUGRw8-gdDzgSdvmc5JYcA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>, emil.l.velikov@gmail.com, "10.2 10.3" <mesa-stable@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On 31/08/14 00:34, Ilia Mirkin wrote:
> On Sat, Aug 30, 2014 at 7:30 PM, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>> On 30/08/14 23:02, Ilia Mirkin wrote:
>>> Samplers are only defined up to num_samplers, so set all samplers above
>>> nr to NULL so that we don't try to read them again later.
>>>
>> Would it be worth doing a similar thing with the unlocked samplers below the
>> nr mark ? It seems to me that we might be leaking nv50->samplers[s][i], or
>> perhaps I'm missing something ?
> 
> Can you elaborate? sampler_state_create/delete deal with allocation
> and deallocation. samplers starts out as NULL. I'm just making sure
> that a subsequent call with a larger number of samplers doesn't try to
> unlock potentially-deleted samplers.
> 

   for (i = 0; i < nr; ++i) {
      struct nv50_tsc_entry *old = nv50->samplers[s][i];

      nv50->samplers[s][i] = nv50_tsc_entry(hwcso[i]);
      if (old)
         nv50_screen_tsc_unlock(nv50->screen, old);
   }

In the above hunk we get the old/current tsc, drop in on the floor and assign
the new one in it's place. Does where does the ST keep track of the old one in
order to nuke it via sampler_state_delete, or is it already deleted by the
time we get here ?

-Emil

>   -ilia
> 
>>
>> -Emil
>>
>>> Tested-by: Christian Ruppert <idl0r@qasl.de>
>>> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
>>> Cc: "10.2 10.3" <mesa-stable@lists.freedesktop.org>
>>> ---
>>>  src/gallium/drivers/nouveau/nv50/nv50_state.c | 7 +++++--
>>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_state.c b/src/gallium/drivers/nouveau/nv50/nv50_state.c
>>> index 48bc079..cf84f88 100644
>>> --- a/src/gallium/drivers/nouveau/nv50/nv50_state.c
>>> +++ b/src/gallium/drivers/nouveau/nv50/nv50_state.c
>>> @@ -585,9 +585,12 @@ nv50_stage_sampler_states_bind(struct nv50_context *nv50, int s,
>>>           nv50_screen_tsc_unlock(nv50->screen, old);
>>>     }
>>>     assert(nv50->num_samplers[s] <= PIPE_MAX_SAMPLERS);
>>> -   for (; i < nv50->num_samplers[s]; ++i)
>>> -      if (nv50->samplers[s][i])
>>> +   for (; i < nv50->num_samplers[s]; ++i) {
>>> +      if (nv50->samplers[s][i]) {
>>>           nv50_screen_tsc_unlock(nv50->screen, nv50->samplers[s][i]);
>>> +         nv50->samplers[s][i] = NULL;
>>> +      }
>>> +   }
>>>
>>>     nv50->num_samplers[s] = nr;
>>>
>>>
>>
