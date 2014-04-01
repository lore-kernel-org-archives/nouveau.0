From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: CH7007A (AKA CH7006) TV OUT Support for NV11 (NVidia
 GeForce2 Go Dell I8K Laptop)
Date: Tue, 1 Apr 2014 18:37:21 -0400
Message-ID: <CAKb7UvjUBG5gqtGALVqmfXRFUqx=yn-c52Bh4ShOgFrf3DSu8A@mail.gmail.com>
References: <20140401035741.GA3535@localhost4.local>
 <CAKb7Uvj6EL60VY0wkvm_JGPh+VZYtU8J51gpvt8JsoQQq5qiDw@mail.gmail.com>
 <20140401223030.GA22211@localhost4.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140401223030.GA22211-bi+AKbBUZKbeRWJqFmQP6g@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Apr 1, 2014 at 6:30 PM, Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Tue, Apr 01, 2014 at 02:53:02PM -0400, Ilia Mirkin wrote:
>>I believe that ch7006 is the only external encoder that's supposed to
>>work, so you're in luck. It sounds like it passes the nv04_tv_identify
>>stage of nv04_tv_create -- perhaps it fails later? Although based on
>>the prints, it's even doing dpms stuff (but it hits _detect a second
>>time... odd). Try booting with
>>
>>nouveau.debug=debug drm.debug=0xe
>>
>>That should provide a bunch more output as to what's going on. Are you
>>sure that the output isn't there? Can you check in /sys/class/drm?
>>What precisely doesn't work?
>
> Exactly what I needed to know, if Nouveau was performing a second detection
> before & after ch7006 initialization, as the ch7006 debug output looked very
> bleak on information.
>
> Going from memory, the ch7006 is registered within /sys/class/drm, and roughly
> guessing as i2c-1 and nouveau is i2c-0.

I was thinking more in terms of outputs -- e.g. was there a TV-1 in there?

>
> I'll now go back and enable debugging including your additional advice on using
> drm.debug=0xe and read through the logging, as well as scanning some of the
> nouveau code.  If I find something interesting, I'll post back.

This should spit out all the nitty gritty details of connectors being
added, set up, etc. Hopefully something interesting.

  -ilia
