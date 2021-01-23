From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Request for help in adding a HDMI output
Date: Sat, 23 Jan 2021 13:52:33 -0500
Message-ID: <CAKb7UviywJgO_=8iOOf3akyJN7OtpuOFqMCmjpT704Kek7BhzA@mail.gmail.com>
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
 <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
 <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
 <CAKb7Uvh3UOKQ14MQwoDti0Lvsey5oLM4qk_GLze3s9qBFq+19Q@mail.gmail.com>
 <CAPpdf58rtMsE_vHK-i-nKkX5=3K6W4HieJ0+7mH5HhkuEZG+tg@mail.gmail.com>
 <CAKb7UvgUHnYt7Uhobu5Lxu1bfFV_Lc+R9fn-UGCMMcjKbcswHw@mail.gmail.com>
 <CAPpdf58uFaMzWYQTGj=XV9naHnO5LNL==S3v+N_yUv=MQwEmWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPpdf58uFaMzWYQTGj=XV9naHnO5LNL==S3v+N_yUv=MQwEmWA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: o1bigtenor <o1bigtenor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Jan 23, 2021 at 1:40 PM o1bigtenor <o1bigtenor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Sat, Jan 23, 2021 at 10:55 AM Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> >
> > On Fri, Jan 22, 2021 at 2:13 PM o1bigtenor <o1bigtenor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > >
> > > On Fri, Jan 22, 2021 at 12:26 PM Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> > > snip
>
> I've been doing a bunch of research and have a whole lot more input but still
> can't find any answers - - - - except holes where there 'should be' answers.
>
> I also understand you're trying to help but some of the stuff you've
> been stating
> - - - well - - - it just ain't so! - - - - so if you'd rather not
> continue - - - - fair enough
> - - - -

No one's perfect. I have to make do with guesses which are the
simplest explanations. Sometimes there's something else.

> >
> > Unfortunately it looks like you did this *after* messing with modelines.
> >
> Getting that information would have meant being able to go back in time some
> 24 hours or so. I can't find any way of removing mode lines from xrandr - - -
> or do you know of some?

A reboot is a great way to reset these things.

> > >
> > > $ xrandr --verbose
> >
> > [ ... snip ...]
> >
> > > HDMI-1-2 connected (normal left inverted right x axis y axis)
> > > Identifier: 0xf9
> > > Timestamp:  483290
> > > Subpixel:   unknown
> > > Clones:
> > > CRTCs:      4 5
> > > Transform:  1.000000 0.000000 0.000000
> > >             0.000000 1.000000 0.000000
> > >             0.000000 0.000000 1.000000
> > >            filter:
> > > EDID:
> > > 00ffffffffffff0020a32f0001000000
> > > 0c1a0103807341780acf74a3574cb023
> > > 09484c21080081c08140818001010101
> > > 01010101010104740030f2705a80b058
> > > 8a00501d7400001e023a801871382d40
> > > 582c4500501d7400001e000000fc0048
> > > 4953454e53450a2020202020000000fd
> > > 00184b0f511e000a202020202020017f
> > > 02034571525f5e5d0102040510111314
> > > 1f202122626364290907071507505506
> > > 0083010000e200f9e305ff016e030c00
> > > 1000383c20008001020304e50e60616a
> > > 6be3060d01011d8018711c1620582c25
> > > 00c48e2100009e011d80d0721c162010
> > > 2c2580c48e2100009e023a80d072382d
> > > 40102c4580c48e2100001e00000000d5
> >
> > OK, so this is your 4k monitor. It is plugged into the *secondary*
> > GPU, and does not report any 4k@60 modes in the EDID (well, it does
> > report 4k@60 YUV 4:2:0 modes, but we don't support those in nouveau at
> > this time). Whether that's because the monitor itself doesn't support
> > HDMI 2.0, or you plugged it into your old GPU which does not support
> > HDMI 2.0, I couldn't say from just this output. What I can say is that
> > no amount of modelines will get you 4k@60 in this setup with nouveau.
>
> Here comes the part where you're getting some very funky information
> and I wish I knew from where!
> Actually the code, in hex, is NOT EDID - - - - that was superseded in
> some 2017. Now that may be what nouveau is using but EDID2.0 was
> released some time in 2007 yet its EDID1.4 that is used. That's the first
> problem and it introduces the next problems. Using EDID means that
> nouveau 'thinks' it see  a : (taken from /var/log/Xorg.0.log)

EDID is very much a thing, and is basically the only thing. Things
like DisplayID are extension blocks to the EDID.

> So where are we at now - - - - -
> well there is NO HDMI port on the EVGA Nvidia 570 card

OK, that was a bad guess on my part to explain what I was seeing.

> HDMI cable IS plugged in and there is only only place for it to be plugged
>   in - - - - so the HDMI cable is plugged into the Nvidia 1050 Ti card

Cool. So then what you said was incorrect -- the GTX 570 is the
primary, and the 1050 is secondary. Please flip that around.

> EDID really is way beyond EOL
> Information provided by the EDID reading is most likely erroneous
> Nouveau at lest doesn't seem to have gotten to DisplayID where the current,
>    at least as of 2017, version is 2.0
> if DisplayID were used perhaps the information  listed as taken from my system
>    might be accurate

EDID is the only way for a monitor to provide information. DisplayID
is a block within the EDID. You can access a relatively full-featured
parser at https://people.freedesktop.org/~imirkin/edid-decode/ -- just
paste the hex there.

>
> >
> > >   3840x2160_60.00 (0x6ce) 712.750MHz -HSync +VSync
> > >         h: width  3840 start 4160 end 4576 total 5312 skew    0 clock 134.18KHz
> > >         v: height 2160 start 2163 end 2168 total 2237           clock  59.98Hz
> > >   3840x2160R (0x70c) 533.000MHz +HSync -VSync
> > >         h: width  3840 start 3888 end 3920 total 4000 skew    0 clock 133.25KHz
> > >         v: height 2160 start 2163 end 2168 total 2222           clock  59.97Hz
> >
> Curious as to where in the foregoing you see that this modeline is for
> card 1 (nvidia GTX570)?

Well, I knew it was for secondary GPU. Based on your comments, that
was the 570. I shouldn't have assumed that to be accurate, that's my
bad. I know it's the secondary because the output is named HDMI-1-2.
That means it's on a secondary device. If it were primary, it would
have been like HDMI-1 or HDMI-2.

Perhaps not all the HDMI ports on the device are HDMI 2.0-capable? Or
perhaps not all of them are on the GPU? What I'm seeing is the monitor
reporting a max TMDS of 300mhz, which is not enough for 4k@60. However
4k@30 should work just fine out of the box.

Cheers,

  -ilia
