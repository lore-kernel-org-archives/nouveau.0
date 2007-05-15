From: Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: Re: NV43 (6600 Go) Report
Date: Tue, 15 May 2007 17:10:10 +0100
Message-ID: <20070515161010.GA8693@void.printf.net>
References: <438b0cc70705150323q2356c42flb70d4f0675bbc478@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <438b0cc70705150323q2356c42flb70d4f0675bbc478-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pascal Schoenhardt <stoanhart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi Pascal,

On Tue, May 15, 2007 at 11:23:50AM +0100, Pascal Schoenhardt wrote:
> Now, here is the real issue: My laptop has a VGA port and an svideo
> port. To start working on smooth multi-head support for gnome, I
> obviously need use of at least the VGA port. As it stands, nouveau
> does not detect any of these outputs. As I understand it, xrandr
> should be reporting something like this:

Have you tried "xrandr --auto"?  It's usually required to run this
command before xrandr picks up on a VGA port connection, because 
usually (at least, on Intel) we don't get an interrupt when a 
monitor is plugged in.

Which brings me to a question:  do we get one on nVidia?  Could nouveau
be able to kick off xrandr as soon as a monitor's connected?

(I don't know how well Xrandr actually works on nouveau, I'm afraid.)

- Chris.
-- 
Chris Ball   <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
