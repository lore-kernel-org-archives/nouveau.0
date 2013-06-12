From: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: xserver-xorg-video-nouveau: Changes to
	'debian-experimental'
Date: Wed, 12 Jun 2013 22:38:59 +0200
Message-ID: <51B8DC63.10504@gmail.com>
References: <E1UmhQI-0000GI-74@vasks.debian.org> <877ghzxmqz.fsf@turtle.gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <877ghzxmqz.fsf-0+8NcsyEcYy4U5AIKzd8Wg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, debian-x-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hey,

Op 12-06-13 19:27, Sven Joachim schreef:
> Hi,
>
> it is currently not necessary to use the debian-experimental branch,
> especially since there has been a newer version in unstable.
>
> On 2013-06-12 11:32 +0200, Maarten Lankhorst wrote:
>
>>  .gitignore               |    2 
>>  ChangeLog                |16944 -----------------------------------------------
> FWIW, I don't agree with deleting this file - package contents now
> depend on whether you're building from git or from a tarball, and
> ChangeLog is also used by the 01-set-NV_DRIVER_DATE-from-ChangeLog.diff
> patch.
I don't see a point of keeping NV_DRIVER_DATE, it was useful in the 0.0.16 days where everything
was just a git snapshot, but I now regularly do xf86-video-nouveau, so there's never a big delta
between versions. Does anyone have any objections if I zap NV_DRIVER_DATE upstream?

~Maarten
