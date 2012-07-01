From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: Re: NV34 on Fedora 17 with Mesa 8.1-devel
Date: Sun, 01 Jul 2012 22:58:01 +0200
Message-ID: <4FF0B9D9.402@student.tudelft.nl>
References: <4FF0A8B5.7010703@verizon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4FF0A8B5.7010703-H+0wwilmMs3R7s880joybQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Nouveau is in fairly good shape, just not for the card you're testing. 
This behaviour is known, but nobody had time to dive into it yet.

Op 01-07-12 21:44, mwesten schreef:
> Good day.  I'd like to inquire about the use of the latest 
> Nouveau+Mesa code on a recent distribution such as Fedora 17.  I've 
> pulled the source and built it, which appeared to go smoothly, but I 
> am having issues during use.
>
> glxinfo:
> OpenGL vendor string: nouveau
> OpenGL renderer string: Gallium 0.4 on NV34
> OpenGL version string: 1.5 Mesa 8.1-devel (git-db2b6ca)
>
> I see many of these messages:
> [ 2137.524453] [drm] nouveau 0000:01:04.0: PGRAPH - ERROR nsource: 
> DATA_ERROR nstatus: BAD_ARGUMENT
> [ 2137.524469] [drm] nouveau 0000:01:04.0: PGRAPH - ch 3/7 class 
> 0x0697 mthd 0x0208 data 0x04060348
>
> In GNOME-Shell, I'm seeing several things.  The most immediately 
> obvious is the lack of a background behind the date/calendar pop-down 
> and the entire user menu.  I also get a crash in gnome-control-center 
> every time I try to open System Settings.
>
> Please advise.  Thanks!
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
