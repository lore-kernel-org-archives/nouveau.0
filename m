From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Help me, Nouveau list, you're my only hope...
Date: Tue, 25 Mar 2014 07:59:34 -0400
Message-ID: <CAKb7UviczBdDKZUmQ1PE1874SPnZQqS47VXYPj5jq2Le0u9ZCQ@mail.gmail.com>
References: <COL129-W93B6D8C2CCB3DCDD4E895DC8650@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <COL129-W93B6D8C2CCB3DCDD4E895DC8650-MsuGFMq8XAE@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: William Lewis <minutemaidpark-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Mar 24, 2014 at 10:50 PM, William Lewis
<minutemaidpark-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
> I hope I'm writing to people who can help me.  If not you, then I have a
> serious inconvenience and am going to be at a complete loss for where to
> turn.
>
> Let me explain my setup.  I have an HTPC with a GeForce GT620.  It is
> connected to a Denon AVR-1913 via HDMI, because that does all the switching
> for my entertainment system then out to an LG flat-panel 55-inch TV via
> HDMI.  Everything was working beautifully until it wasn't.  All of a sudden,
> I simply cannot get the receiver to recognize the video signal from the
> video card.  The display on the front does not switch to HDMI, and the audio
> will not switch away from analog.  And all that the display says is DENON.
>
> Now the video card works fine.  It is hooked up directly to the TV via
> DVI->HDMI, and the TV has no problem with that signal.  Tonight I bypassed
> the receiver altogether, and the video went out via HDMI to the TV fine as
> well, even though the TV's input list had the HDMI input grayed.  When I
> selected it, it worked fine.
>
> So that got me thinking it was the input on the receiver or something else
> on the receiver.  No such luck.  A Blu-Ray player works fine through the
> same input, and my MacBook Pro works fine through the same input.
>
> If I am diagnosing things properly, the receiver is not accepting the mode
> the HDMI out of the GeForce card is setting, even though xrandr shows the
> same mode being set on both the DVI out and the HDMI out.
>
> Can you help me debug the problem?

So... what changed? Kernel upgrade maybe? Have you tried the latest
and greatest? (3.13.x should be late and great enough for your needs.)
What _is_ a GT620? NVC1? NVD9? Something else? (Should be in your boot
logs.)
