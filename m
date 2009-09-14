From: Renato Caldas <seventhguardian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Put acpi/backlight code into kernel
Date: Mon, 14 Sep 2009 14:09:57 +0100
Message-ID: <1caff7430909140609t2c4160b9q4728dc28db41a9a2@mail.gmail.com>
References: <200908222034.28782.schmirrwurst@googlemail.com>
	<6d4bc9fc0909140202q60a587c3pb22e3c2eb2ff2ff2@mail.gmail.com>
	<1caff7430909140300o775276ch890ff41b75181e50@mail.gmail.com>
	<200909141440.32260.schmirrwurst@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <200909141440.32260.schmirrwurst-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: schmirrwurst-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
Cc: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Sep 14, 2009 at 1:40 PM,  <schmirrwurst-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Thank you for your answer,
>
> You said this kind of code doesn't belong in the nouveau driver, but back=
light
> support have already been added in it, and it works well ...

You need to be aware that people aren't comfortable in including every
possible non-standard feature in the kernel. That would be
unmaintainable, and it's the reason for the negative answers you've
received so far, it's not that people are unwilling to help.

> So I need to find the person in charge of the sony platform driver, and a=
sk him
> to take the nouveau backlight code.. would that work ?
Possibly. IMHO that's the best place to put that kind of code.

> Where are the platform driver hosted, who do I need to ask then ?
That I have no idea. You can try to google for the project or check
the kernel logs..

Cheers,
  Renato
>
> Thanks
> Sebastien
>
> Le lundi 14 septembre 2009 12:00:59, Renato Caldas a =E9crit :
>> On Mon, Sep 14, 2009 at 10:02 AM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
>> > Find someone who wants to create and maintain it.
>>
>> This kind of code doesn't belong in the nouveau driver, as you
>> probably already know.
>>
>> But there are things called "platform drivers" that support all those
>> non-standard features you may find on laptops, like radio switches,
>> leds, ... and backlight. There is one such driver for my Asus laptop,
>> which is called "asus-laptop".
>>
>> So what you want is a platform driver for your hardware. Now you need
>> to either find someone who can code it, or do it yourself. It
>> shouldn't be that difficult if working code is already available.
>>
>> Cheers,
>> =A0 Renato
>>
>
