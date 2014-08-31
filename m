From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH envytools] nvamemtiming: Handle target <
 initial case when iterating values
Date: Sun, 31 Aug 2014 17:20:39 +0200
Message-ID: <54033D47.40902@gmail.com>
References: <1409490042-8725-1-git-send-email-titan.costa@gmail.com>
 <1409490042-8725-4-git-send-email-titan.costa@gmail.com>
 <54031F56.4070906@free.fr> <54032AB3.3000508@gmail.com>
 <54032D11.1000601@free.fr> <54032F00.6000500@gmail.com>
 <54032FE2.7020602@free.fr> <54033CAC.7020001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <54033CAC.7020001-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Le 31/08/2014 17:18, Christian Costa a =E9crit :
> Le 31/08/2014 16:23, Martin Peres a =E9crit :
>> On 31/08/2014 16:19, Christian Costa wrote:
>>> Le 31/08/2014 16:11, Martin Peres a =E9crit :
>>>> On 31/08/2014 16:01, Christian Costa wrote:
>>>>> Le 31/08/2014 15:12, Martin Peres a =E9crit :
>>>>>> On 31/08/2014 15:00, Christian Costa wrote:
>>>>>>> Otherwise some values are not tested at all.
>>>>>> I would rather have a warning than the program doing stuff behind =

>>>>>> my back. This is a dev tool, dumb =3D=3D good ;)
>>>>>>
>>>>> But why didn't you call it Dumb mode rather that Deep mode. That =

>>>>> way, I wouldn't have tried to use it and figure out what it does. ;p
>>>>
>>>> Target is supposed to be higher than initial! Initial =3D=3D minimum =

>>>> safe timing.
>>>>
>>>> You just reversed the order, try:
>>>> sudo nvamemtiming pramin 0x6a22 5 0 -d 3
>>>>
>>> Ok. It's intended then. Thanks!
>>
>> I totally agree that this tool is a little confusing. If you have =

>> suggestions on how to improve the usage doc, feel free to propose me =

>> something better :)
>>
>> fprintf(stderr, "\t-d timing_entry_high: For each indexes, iterate =

>> between the timing_entry and the timing_entry_high value (Deep =

>> mode)\n");
>>
>> Speaking about this, this should be corrected to "For each index", no =

>> plural after each. I'll fix it right now.
>>
> Ok. I will think about it.
> Some comments in the source code can help also to know what it does =

> and what it is used for. Same for README.
Btw, the plural of index is indices.
