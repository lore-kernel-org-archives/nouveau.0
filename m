From: "Maarten Maathuis" <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: How to set a different resolution?
Date: Sat, 4 Oct 2008 20:15:34 +0200
Message-ID: <6d4bc9fc0810041115k4553087ayf594bb7761319252@mail.gmail.com>
References: <48E297C8.3050803@wpkg.org> <200809301735.51849.mrgrim@gr1m.org>
	<48E30BD3.8010505@wpkg.org>
	<6d4bc9fc0810010606s4e80d9bcv28f051614288daba@mail.gmail.com>
	<1223133423.1364.4.camel@trillian.PraeTOriaNdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1223133423.1364.4.camel-8FIgwK2HfyJXBbZVIddYnfySAhryLJCQ/z7RTEddyNg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Calvin Walton <calvin.walton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Oct 4, 2008 at 5:16 PM, Calvin Walton <calvin.walton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, 2008-10-01 at 15:06 +0200, Maarten Maathuis wrote:
>> On Wed, Oct 1, 2008 at 7:34 AM, Tomasz Chmielewski <mangoo-Nem3ZqsbT/g@public.gmane.org> wrote:
>> > Michael Kreitzer schrieb:
>> >> Tomasz,
>> >>
>> >> It sounds to me like what may be happening is the video card is doing the
>> >> scaling instead of the monitor.  This is evidenced by the fact that the
>> >> resolution does change, but the LCD still sees the native resolution coming
>> >> in. This shouldn't affect dual head, however.
>> There should be a SCALING_MODE property, which can be set to
>> "fullscreen", the default however (iirc) is "aspect" scaling which may
>> leave top or bottom bars (but not both).
>
> To tell the graphics card not to scale, and leave it to the monitor,
> you'll want to run the following command:
>
> xrandr --output DVI-I-0 --set SCALING_MODE panel
>
> (replace DVI-I-0 with your actual output name - run xrandr with no
> options if you're not sure)
>
> That will cause the card to output the actual resolution you requested,
> instead of scaling it to your monitor native resolution.
>
> I'm not sure if there is some way to set this as the default, perhaps an
> option in the xorg.conf?
>
> --
> Calvin Walton <calvin.walton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

From the manpage:

       Option "ScalingMode" "string"
              Only for the randr-1.2 driver, this allows to set the
DFP scaling mode.  The options are "fullscreen", "aspect",
              "noscale" and "panel". Default: "aspect".
