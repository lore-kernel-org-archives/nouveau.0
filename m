From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: git compile failure
Date: Fri, 30 Jan 2009 19:57:49 +0200
Message-ID: <20090130195749.4f03acb2@daedalus.pq.iki.fi>
References: <141d1c48884ed68f7e91236a287d48a9.squirrel@www.datavault.us>
	<20090129231559.302a708e@daedalus.pq.iki.fi>
	<49830BB2.2040602@seiner.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <49830BB2.2040602-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Yan Seiner <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org>
Cc: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 30 Jan 2009 06:16:18 -0800
Yan Seiner <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org> wrote:

> OK, I've tried that....  No joy.  The problem is that the autogen script 
> doesn't find any of the correct header files.  It's a debian dependency 
> issue.  Even when I edit the source by hand to put in the correct 
> locations, it still fails.  I think I'm wasting a lot of time trying to 
> reverse-engineer the debian deps rather than building nouveau.  Is there 
> a 'getting started' howto for building X?  I only need the very basics 
> for testing nouveau.  Is there some basic basic script that will pull 
> down the tarballs and allow me to install a minimal xorg for testing 
> nouveau?

Could you provide some basic information, like which Debian you are using
and which Xorg version you have?

I trust you already saw
http://nouveau.freedesktop.org/wiki/DebianTips
and it didn't help?

I asked on IRC, and two Debian users replied saying they don't have the
problem (unstable+experimental, and Lenny).

-- 
Pekka Paalanen
http://www.iki.fi/pq/
