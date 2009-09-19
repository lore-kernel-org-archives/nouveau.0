From: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
Subject: Re: Put acpi/backlight code into kernel
Date: Sat, 19 Sep 2009 20:54:00 +0100
Message-ID: <20090919195400.GA4320@srcf.ucam.org>
References: <200908222034.28782.schmirrwurst@googlemail.com>
	<200909132009.37494.schmirrwurst@googlemail.com>
	<20090913221350.GA31175@srcf.ucam.org>
	<200909140836.18074.schmirrwurst@googlemail.com>
	<6d4bc9fc0909140202q60a587c3pb22e3c2eb2ff2ff2@mail.gmail.com>
	<1caff7430909140300o775276ch890ff41b75181e50@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1caff7430909140300o775276ch890ff41b75181e50-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Renato Caldas <seventhguardian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Sep 14, 2009 at 11:00:59AM +0100, Renato Caldas wrote:

> This kind of code doesn't belong in the nouveau driver, as you
> probably already know.

Sure it does. It's common for nvidia-based machines to use the GPU's 
built-in backlight control, and when that's the case the appropriate 
place for the control code is in the driver that touches the rest of 
those registers - nouveau, in this case.

> But there are things called "platform drivers" that support all those
> non-standard features you may find on laptops, like radio switches,
> leds, ... and backlight. There is one such driver for my Asus laptop,
> which is called "asus-laptop".

When there's a platform interface, a platform driver is indeed the 
correct answer. But in some cases (nvidia-based Sonys, for instance) 
there's no platform interface to use.

-- 
Matthew Garrett | mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org
