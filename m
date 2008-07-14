From: Dirk Thierbach <dthierbach-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: tv-out on FX5700VE
Date: Mon, 14 Jul 2008 09:50:10 +0200
Message-ID: <20080714075010.GA3574@feanor>
References: <2bb4a8220807121258x38c9adf8vf123588e8ba17153@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2bb4a8220807121258x38c9adf8vf123588e8ba17153-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Sergej Pupykin <pupykin.s-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Jul 12, 2008 at 11:58:59PM +0400, Sergej Pupykin wrote:
> I am interested in nouveau tv-out support. I read
> http://nouveau.freedesktop.org/wiki/TestersWanted and make nvclock
> dump with working tv-out on nvidia drivers.
> 
> xorg.conf and nvclock output are in attachments.
> 
> I have free saturday evening every week, so feel free to instruct me,
> I like to help)
> 
> Also I have some expirience in C and generic knowledge about xorg
> video drivers, so you may ask me to experiment with the code...

I'm not really associated with nouveau, though I maintain nvtv, which is
an independent tool for tv-out on nvidia cards. The main problem is
that we do not know what most of the registers involved mean. If you 
do have access to an oscilloscope, most of them should be easy to find
out -- just hook up the scope, change some registers, and watch what
happens. "seventh guardian" contaced me some time ago and wanted to do
this, but somehow he disappeared :-)

So if you have a scope, if you're not afraid to possibly damage your
hardware, you can contact me off-list for details.

- Dirk
