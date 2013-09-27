From: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Subject: Re: Resource map sanity check fails after GRUB
	"keeps"	the gfx mode
Date: Fri, 27 Sep 2013 15:40:31 -0400
Message-ID: <20130927154031.khkhbl17s0ow4sgc-cebfxv@webmail.spamcop.net>
References: <20130925200706.2e6f5947@IRBT4585>
	<20130926183743.0d2420c4@IRBT4585> <524550E6.6040909@gmail.com>
	<20130927113743.1383f9b5@IRBT4585>
	<CANq1E4STGCp8X+i-OOd1KYCZQEoUeYuEw8=tkWuXY8_8wcieuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="Yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CANq1E4STGCp8X+i-OOd1KYCZQEoUeYuEw8=tkWuXY8_8wcieuw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Quoting David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:

> I am aware of this and there is already a fix pending from 2 weeks
> ago. Unfortunately, I have been in the US for the last 2 weeks and
> haven't really been able to push on that. Anyhow, it should really be
> just a cosmetic issue. We need to mark the sysfb FB as busy to avoid
> the nasty warnings. Other than that, this shouldn't cause any issues.

OK, you are the one who must be better aware of the whole picture, so  
if the intention is to make the resource busy, that's my first patch  
and whatever you are trying to push.

You still may want to have a look at my second patch that widens the  
resource to match an appropriate PCI BAR.

I'm too puzzled why the resource conflict warning causes a GPU lockup  
for another user.  Maybe it's an unrelated issue.  Also, I don't use  
UEFI.  I plan to test it eventually if I figure out how to migrate to  
it without reinstalling everything.

-- 
Regards,
Pavel Roskin
