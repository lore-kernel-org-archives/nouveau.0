From: Dirk Thierbach <dthierbach-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: CH7007A (AKA CH7006) TV OUT Support for NV11 (NVidia
 GeForce2 Go Dell I8K Laptop)
Date: Thu, 3 Apr 2014 12:53:01 +0200
Message-ID: <20140403105301.GA30975@feanor>
References: <20140401035741.GA3535@localhost4.local>
 <CAKb7Uvj6EL60VY0wkvm_JGPh+VZYtU8J51gpvt8JsoQQq5qiDw@mail.gmail.com>
 <20140401223030.GA22211@localhost4.local>
 <20140402212448.GA3509@localhost4.local>
 <CAKb7Uvg3ogHq3rNXDkP0eukvY0J-accaQ0YZ=x8cCEhJBYQ7rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKb7Uvg3ogHq3rNXDkP0eukvY0J-accaQ0YZ=x8cCEhJBYQ7rQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Apr 02, 2014 at 06:12:40PM -0400, Ilia Mirkin wrote:

> But at no point does it see the TV-1 connector. I'm guessing something
> got busted in the nv04_tv stuff :( NV11 should have 2 CRTC's, 

It has in all instances I have seen.

> but even if it had only 1, it should still be exposing the TV-1
> connector...  I'll try to read the code more carefully, and compare
> it to the nv17_tv logic, to maybe see where it goes wrong.

I had a quick look at the code, and I see that in ch7006_encoder_detect
the routine returns "connector_status_disconnected" when it can't
find any matching pattern in the load detection. With nvtv, I had plenty
of experiences with a really weird connection status from Chrontel
chips, for whatever reason. I've also seen there are no delays between
the register writes to do the detections as recommended in the data
sheet, so the values might not have settled.

I didn't follow up on how the "connector_status_disconnected" value is used
in the callers, but if it causes suppression of the TV-1 connector, this
could be the problem. Maybe add a few debug statements to verify that?

Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> I only have composite input for displays around here now, and the output
> on this Dell Laptop is a proprietary type of SVIDEO splitter to SVIDEO,
> Composite, S/PDIF Audio.

Then you'll likely get all 3 DAC outputs, one in Composite, the other
two in SVIDEO. 

> (I've heard some hearsay on the web, the TV tuner chip will also provide
> a modulated TV signal through VGA, but am not sure of this -- for the
> cost of a $2 connector and including having a more stable connector as
> well, might be worth it.)

You can program the DACs to output RGB instead of Y/C/CVBS, but you'll 
still need to get at the CSYNC signal to make a SCART-RGB-connection to
a TV with a SCART-input. 
If you're lucky, it's in the proprietary Dell output somewhere.

Connecting it to a VGA-Monitor might be harder, the timing is still
PAL/NTSC, not anything VGA is used to, and the sync signals are wrong IIRC.

Or do you mean the VGA-connector on the Dell can also output the TV
signal? In this case, the Dell may have some extra hardware to switch
between signals, which will be difficult to find and program (and which also
may explain any weird connection status).

- Dirk
