From: Jasper Bryant-Greene <jasper-XrxwZhJB1KNIJsTUW+i+0g@public.gmane.org>
Subject: Re: NV86 (Quadro NVS 140M) errors in dmesg
Date: Sat, 02 Aug 2008 21:54:34 +1200
Message-ID: <1217670874.4622.4.camel@luna.unix.geek.nz>
References: <1217629252.3619.5.camel@luna.unix.geek.nz>
	<1217635362.10309.2.camel@araqiel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1217635362.10309.2.camel@araqiel>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, 2008-08-02 at 10:02 +1000, Ben Skeggs wrote:
> Am Samstag, den 02.08.2008, 10:20 +1200 schrieb Jasper Bryant-Greene:
> > Also, Xvideo does not work properly, with mplayer printing a large
> > number of these:
> > 
> > X11 error: BadMatch (invalid parameter attributes)
> Use a composite manager (not compiz, xcompmgr or something else that
> uses XRENDER for compositing) if you want to use Xv on G80 for the
> moment.

Xvideo plays in slow motion (very entertaining!)

mplayer -vo x11 plays fine, so it is definitely something to do with Xv.

I'm using xfce4's compositing manager.

What can I do to debug this?

Cheers,
-jasper
