From: Renato Caldas <seventhguardian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Put acpi/backlight code into kernel
Date: Mon, 14 Sep 2009 11:00:59 +0100
Message-ID: <1caff7430909140300o775276ch890ff41b75181e50@mail.gmail.com>
References: <200908222034.28782.schmirrwurst@googlemail.com>
	<200909132009.37494.schmirrwurst@googlemail.com>
	<20090913221350.GA31175@srcf.ucam.org>
	<200909140836.18074.schmirrwurst@googlemail.com>
	<6d4bc9fc0909140202q60a587c3pb22e3c2eb2ff2ff2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0909140202q60a587c3pb22e3c2eb2ff2ff2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Sep 14, 2009 at 10:02 AM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Find someone who wants to create and maintain it.

This kind of code doesn't belong in the nouveau driver, as you
probably already know.

But there are things called "platform drivers" that support all those
non-standard features you may find on laptops, like radio switches,
leds, ... and backlight. There is one such driver for my Asus laptop,
which is called "asus-laptop".

So what you want is a platform driver for your hardware. Now you need
to either find someone who can code it, or do it yourself. It
shouldn't be that difficult if working code is already available.

Cheers,
  Renato
