From: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: CH7007A (AKA CH7006) TV OUT Support for NV11 (NVidia
 GeForce2 Go Dell I8K Laptop)
Date: Tue, 1 Apr 2014 14:30:30 -0800
Message-ID: <20140401223030.GA22211@localhost4.local>
References: <20140401035741.GA3535@localhost4.local>
 <CAKb7Uvj6EL60VY0wkvm_JGPh+VZYtU8J51gpvt8JsoQQq5qiDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKb7Uvj6EL60VY0wkvm_JGPh+VZYtU8J51gpvt8JsoQQq5qiDw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

> On Tue, Apr 01, 2014 at 02:53:02PM -0400, Ilia Mirkin wrote:
>I believe that ch7006 is the only external encoder that's supposed to
>work, so you're in luck. It sounds like it passes the nv04_tv_identify
>stage of nv04_tv_create -- perhaps it fails later? Although based on
>the prints, it's even doing dpms stuff (but it hits _detect a second
>time... odd). Try booting with
>
>nouveau.debug=debug drm.debug=0xe
>
>That should provide a bunch more output as to what's going on. Are you
>sure that the output isn't there? Can you check in /sys/class/drm?
>What precisely doesn't work?

Exactly what I needed to know, if Nouveau was performing a second detection 
before & after ch7006 initialization, as the ch7006 debug output looked very 
bleak on information.

Going from memory, the ch7006 is registered within /sys/class/drm, and roughly 
guessing as i2c-1 and nouveau is i2c-0.

I'll now go back and enable debugging including your additional advice on using 
drm.debug=0xe and read through the logging, as well as scanning some of the 
nouveau code.  If I find something interesting, I'll post back.

I also have a VGA->SVIDEO/Composite on order; in the case the ch7006 is being 
successfully turned on (which I see no reason why it shouldn't be on at this 
point), but instead not the correct format.  (ie.  SVIDEO, Composite, ...)  I 
only have composite input for displays around here now, and the output on this 
Dell Laptop is a proprietary type of SVIDEO splitter to SVIDEO, Composite, 
S/PDIF Audio.  (I've heard some hearsay on the web, the TV tuner chip will also 
provide a modulated TV signal through VGA, but am not sure of this -- for the 
cost of a $2 connector and including having a more stable connector as well, 
might be worth it.)

Now that I think of it, I think I can still loop SVIDEO OUT into a SVIDEO port 
on a Canopus ADV-100 capture device I still own!  From the ch7006 chip specs, 
if the device is activated, but did not activate the correct format (ie.  
SVIDEO, Composite,...), then nothing at all will show on output.  But I would 
think there should be a format activated within the ch7006 /sys files. (ie.  
S-Video, Composite, ...)  Or could be the Dell proprietary splitter performs 
the SVIDEO/COMP conversion, as it does look big enough and I think it certainly 
does.

-- 
Roger
http://rogerx.freeshell.org/
