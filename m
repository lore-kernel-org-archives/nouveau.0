From: Dirk Thierbach <dthierbach-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: TV-Out on a GeForce 2MX supported?
Date: Wed, 5 Mar 2014 23:08:50 +0100
Message-ID: <20140305220849.GA17470@feanor>
References: <CAKb7Uvi97Yn8MOfhMiXLs+=VAd0LWEnmnF7iHyR58eKA_Pk_jg@mail.gmail.com>
	<20140305195756.GA3045@reliance.ac-net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140305195756.GA3045-0i3IwDS6Bd4yxn3+5HPDWA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

> Meanwhile I fiddled about with nvtv and found out that it still works
> fine. The trick is that I have to switch the X-server to the desired
> TV-Out resolution before activating the TV-Out, otherwise the X-server
> freezes.

Hm, the freeze is new. :-) You can switch X modes from the command
line with -X, though, and from the GUI, too (if it still works).

> Doing the TV-Out via xrandr and Xinerama would be much more
> comfortable, 

You can use the second head, too, which is "sort of" Xinerama. Though nvtv
needs to do more initialization to do that, so it might clash with KMS.
You can also attach the video overlay hardware to the second head, if
you mainly want to watch videos on the TV.

And switching from the commandline isn't that much different from xrandr.

- Dirk
