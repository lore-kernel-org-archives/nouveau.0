From: Michael Kreitzer <mrgrim-ny2OW3TU9Nk@public.gmane.org>
Subject: Re: How to set a different resolution?
Date: Tue, 30 Sep 2008 17:35:51 -0400
Message-ID: <200809301735.51849.mrgrim@gr1m.org>
References: <48E297C8.3050803@wpkg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <48E297C8.3050803-Nem3ZqsbT/g@public.gmane.org>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Tomasz,

It sounds to me like what may be happening is the video card is doing the 
scaling instead of the monitor.  This is evidenced by the fact that the 
resolution does change, but the LCD still sees the native resolution coming 
in. This shouldn't affect dual head, however.

I'm not sure how to change this. It's also possible your monitor needs this. 
This should, however, give you a starting point on where to look for how to 
correct this.

- Michael

On Tuesday 30 September 2008 05:19:04 pm Tomasz Chmielewski wrote:
> I just gave nouveau a try and was surprised that it just works out of
> the box on Mandriva. Great work!
>
> However, I'm not sure how to set up a different resolution properly.
>
> With the closed nvidia driver, I usually just click on krandrtray in KDE
> and pick a different resolution.
>
> With nouveau driver, though, it works as well, but only partially.
>
> I can see the resolution is theoretically changed (fonts, windows are
> bigger when I change from 1280x1024 to 1024x768), but technically, in my
> LCD monitor info I can see the resolution is still 1280x1024. Why?
>
> Because of this issue, I can't use my beamer (dual-head), which only
> supports resolutions up to 1024x768.
