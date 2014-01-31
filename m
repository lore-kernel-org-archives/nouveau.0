From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: videowall
Date: Fri, 31 Jan 2014 20:25:17 +1000
Message-ID: <CAPM=9tzYKN245Y0ucEXLn=ZukboLi+VVV52YM2oEyeqf9WScJg@mail.gmail.com>
References: <CAAstKWBDuS39wcEaFBey_keocpK5ATdRw6sA7E3xm6MTY6a74g@mail.gmail.com>
	<CAKb7Uvi1OGma3-vVzyh8DxuLgh5kiVR_Uwt-==NzAwJ6=6a6Bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvi1OGma3-vVzyh8DxuLgh5kiVR_Uwt-==NzAwJ6=6a6Bg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jan 31, 2014 at 7:24 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> On Wed, Jan 29, 2014 at 8:18 PM, Christian St=F6veken
> <christian.stoeveken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> So I had this crazy idea to put together a cheap video wall in my local
>> hackerspace using
>> a lot of screens suffering from planned obsolescence or at least a poor
>> choice in their used caps
>> and cheap - used Nvidia NVS 440 cards.
>>
>> During evaluation of Win 7/8 I noticed there was an 8 gpu OS limit that I
>> didn't know of before.
>> I also ran into that limt using the proprietary nvidia driver on Linux.
>>
>> So now I'm trying to see how far nouveau is in regards to "multiple" gpu=
's
>> and
>> after 3 evenigs of fiddling with mostly xorg.conf I just got the first 4
>> gpu's / 8 displays working.
>>
>> I'm stuck on the 3rd card / gpu 5+6 / monitors 9-12.
>>
>> Without spending another few evenings I thought I might check in with you
>> guys first whether
>> you think it's possible driving a 6400x4096 video wall with nouveau
>> and 5 Nvidia NVS 440 cards (NV43) (10 gpus with dual head) - if not I mi=
ght
>> be willing to donate
>> the cards for development if someone is interested.
>
> Admittedly I've never tried this, but I can't think of anything that
> would prevent you from doing this using the ZaphodHeads/Xinerama
> approach. Take a look at
> http://nouveau.freedesktop.org/wiki/MultiMonitorDesktop/ -- pay
> special attention to the highly-unintuitive Screen setting inside of
> the Device section -- it appears to be the index of the crtc to be
> used on that device, not the overall screen number (so it just repeats
> 0/1/0/1/etc). Note that ZaphodHeads was broken for some number of
> revisions of xf86-video-nouveau, but it should be all better now - if
> you're getting crashes, try upgrading to the latest.

You'll probably run out of PCI address space with too many cards,

Dave.
