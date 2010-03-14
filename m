From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: gallium/nv50: get rid of the screen_init stateobj
Date: Sun, 14 Mar 2010 15:09:55 +0100
Message-ID: <6d4bc9fc1003140709h57a48301kfdc05e3f857b9aff@mail.gmail.com>
References: <4B9CBB24.60202@student.tuwien.ac.at>
	<6d4bc9fc1003140503v724e572t342136e72c8cc164@mail.gmail.com>
	<4B9CEA4E.3000508@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B9CEA4E.3000508-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

BEGIN_RING also does autobind, the rest seems ok.

Maarten.

On Sun, Mar 14, 2010 at 2:53 PM, Christoph Bumiller
<e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org> wrote:
> On 14.03.2010 13:03, Maarten Maathuis wrote:
>> On Sun, Mar 14, 2010 at 11:32 AM, Christoph Bumiller
>> <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org> wrote:
>>
>>> Hi.
>>> There's not much to say here, just replacing the screen_init
>>> stateobj with direct pushbuffer emission.
>>>
>>> We don't need to store all the usless state from init, and the
>>> constant buffer relocations which currently don't work if the
>>> addresses change (because the method CB_DEF_SET isn't
>>> among them (not an address)) become effective.
>>>
>>> Thoughts, ack / nack ?
>>> Thanks,
>>> =A0Christoph
>>>
>>>
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>>
>>>
>>>
>> Perhaps add a BEGIN_RING_RELOC to libdrm? To make it more obvious.
>>
>> Maarten.
>>
> Like the following (attached) ?:
>
