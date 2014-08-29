From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH envytools] Fix range end to the last value of
 timing table.
Date: Fri, 29 Aug 2014 04:25:04 +0200
Message-ID: <53FFE480.4030003@gmail.com>
References: <1408993207-19530-1-git-send-email-titan.costa@gmail.com>
 <53FEE808.3020807@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53FEE808.3020807-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Le 28/08/2014 10:27, Martin Peres a =E9crit :
> On 25/08/2014 21:00, Christian Costa wrote:
>> ---
>>   nva/set_timings.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/nva/set_timings.c b/nva/set_timings.c
>> index 7376486..985a707 100644
>> --- a/nva/set_timings.c
>> +++ b/nva/set_timings.c
>> @@ -506,7 +506,7 @@ shallow_dump(struct nvamemtiming_conf *conf)
>>       if (conf->range.start =3D=3D (unsigned char) -1)
>>           conf->range.start =3D 0;
>>       if (conf->range.end =3D=3D (unsigned char) -1)
>> -        conf->range.end =3D conf->vbios.timing_entry_length;
>> +        conf->range.end =3D conf->vbios.timing_entry_length-1;
>>         fprintf(stderr, "Shallow mode: Will iterate between %i and =

>> %i\n", conf->range.start, conf->range.end);
> Hey
>
> I don't like this patch because it would create an output difference =

> between the deep and the shallow test.
> Please check and propose another patch.
Hi Martin,

Yes. You're right. I didn't pay attention to deep_dump.
>
>
> What are you trying to fix by the way? You don't like that range.end =

> is not included?
>
I got confused with the message and tought there was an out of the bound =

access.
Looking more closely at the code says indeed that range.end is actually =

not included.
It doesn't seem straitforward. At least to me. I would change the code =

to make range.end included to avoid confusion. What do you think?

By the way, in deep_mode, crange.start and crange.end are calculated but =

not used at all. The loop iterates the whole entry:
for (i =3D 0; i < conf->vbios.timing_entry_length; i++)
Is it normal ?

While I am at it, I tried to understand what deep_mode does. Contrary to =

shallow_mode which tests the table value + 1, deep_mode tests
all values between values of 2 entries. The code is as follows:
     for (v =3D initial+1; v <=3D target; v++) {
         conf->vbios.data[conf->vbios.timing_entry_offset + index] =3D v;
         launch(conf, outf, index + 1 , COLOR);
     }
It works fine when initial value is lower than the target but does =

nothing in the other case. Looks like a bug, no?

Thanks
Christian
