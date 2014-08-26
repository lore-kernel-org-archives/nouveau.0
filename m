From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH envytools] demmio: Add decoding of some
 MEM_TIMINGS registers for NVC0.
Date: Tue, 26 Aug 2014 04:06:18 +0200
Message-ID: <53FBEB9A.9000702@gmail.com>
References: <1408993096-18883-1-git-send-email-titan.costa@gmail.com>
 <53FBB903.7060900@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53FBB903.7060900-GANU6spQydw@public.gmane.org>
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

Le 26/08/2014 00:30, Martin Peres a =E9crit :
> On 25/08/2014 20:58, Christian Costa wrote:
>> ---
>>   rnndb/memory/nvc0_pbfb.xml | 37 ++++++++++++++++++++++++++++++++++---
>>   1 file changed, 34 insertions(+), 3 deletions(-)
>>
>> diff --git a/rnndb/memory/nvc0_pbfb.xml b/rnndb/memory/nvc0_pbfb.xml
>> index 500cea9..e006dbe 100644
>> --- a/rnndb/memory/nvc0_pbfb.xml
>> +++ b/rnndb/memory/nvc0_pbfb.xml
>> @@ -49,23 +49,54 @@
>>               Most bitfields are unknown.
>>               </doc>
>>           <bitfield high=3D"7" low=3D"0" name=3D"RP">
>> -            <doc> RAS# precharge. </doc>
>> +            <doc> RAS# Precharge. </doc>
>>           </bitfield>
>>           <bitfield high=3D"15" low=3D"8" name=3D"RAS">
>> -            <doc>Activate to precharge delay. </doc>
>> +            <doc> Activate to precharge delay. </doc>
>>           </bitfield>
>>           <bitfield high=3D"23" low=3D"16" name=3D"RFC">
>>               <doc> Refresh to activate delay. </doc>
>>           </bitfield>
>>           <bitfield high=3D"31" low=3D"24" name=3D"RC">
>> -            <doc> Row cycle time. </doc>
>> +            <doc> Row Cycle time. </doc>
>> +        </bitfield>
>> +    </reg32>
>> +
>> +    <reg32 offset=3D"0x290" name=3D"MEM_TIMINGS_0" variants=3D"NVC0-">
>> +        <doc> This, and the next 6 regs, are all related to memtimings.
>> +            A good place to read might be =

>> http://www.tweakers.fr/timings.html .
>> +            Most bitfields are unknown.
>> +            </doc>
>> +        <bitfield high=3D"7" low=3D"0" name=3D"tRC">
>> +            <doc> Row Cycle time. </doc>
>> +        </bitfield>
>> +        <bitfield high=3D"15" low=3D"8" name=3D"tRFC">
>> +            <doc> Refresh to activate delay. </doc>
>> +        </bitfield>
>> +        <bitfield high=3D"23" low=3D"17" name=3D"tRAS">
>> +            <doc> Activate to precharge delay. </doc>
>> +        </bitfield>
>> +        <bitfield high=3D"31" low=3D"24" name=3D"tRCD">
>> +            <doc> RAS# to CAS# Delay. </doc>
>>           </bitfield>
>>       </reg32>
>>         <reg32 offset=3D"0x294" name=3D"MEM_TIMINGS_1" variants=3D"NVC0-=
">
>> +        <bitfield high=3D"3" low=3D"0" name=3D"tCL">
>> +            <doc> Row Cycle time. </doc>
>> +        </bitfield>
>> +        <bitfield high=3D"13" low=3D"7" name=3D"tCWL">
>> +            <doc> CAS# Write Latency. </doc>
>> +        </bitfield>
>>       </reg32>
>>         <reg32 offset=3D"0x298" name=3D"MEM_TIMINGS_2" variants=3D"NVC0-=
">
>> +        <bitfield high=3D"15" low=3D"8" name=3D"tWTR">
>> +            <doc> Write To Read delay. </doc>
>> +        </bitfield>
>> +        <bitfield high=3D"23" low=3D"15" name=3D"tWR">
>> +            <doc> Write Recovery time. </doc>
>> +        </bitfield>
>>       </reg32>
>>         <reg32 offset=3D"0x29c" name=3D"MEM_TIMINGS_3" variants=3D"NVC0-=
">
>
> Thanks for the patch but where did you get this knowledge? By =

> comparing with nv50 and the vbios table?

It's based on the code in nvbios.c:

                         reg_100220 =3D (tRCD << 24 | (tRAS&0x7f) << 17 | =

tRFC << 8 | tRC);
                         reg_100224 =3D 0x4c << 24 | (tUNK_11&0x0f) << 20 =

| (tCWL << 7) | (tCL & 0x0f);
                         reg_100228 =3D 0x44000011 | tWR << 16 | tWTR << 8;
                         reg_10022c =3D tUNK_20 << 9 | tUNK_13;
                         reg_100230 =3D 0x42e00069 | tUNK_12 << 15;

                         printf("Registers: 290: 0x%08x 0x%08x 0x%08x =

0x%08x\n",
                         reg_100220, reg_100224,
                         reg_100228, reg_10022c);
                         printf("           2a0: 0x%08x 0x%08x 0x%08x =

0x%08x\n",
                         reg_100230, reg_100234,
                         reg_100238, reg_10023c);
