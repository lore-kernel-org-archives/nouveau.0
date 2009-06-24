From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Why was old TTM removed from drm.git?
Date: Wed, 24 Jun 2009 19:43:06 +0300
Message-ID: <20090624194306.0730cb2f@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi Thomas,

I meant to ask you this 24h ago:
why did you deliberately break Nouveau in drm.git?

The commit 9a33f62be1c478334572ea9384af60 "drm: Strip old ttm." not only
removes the old TTM, it explicitly removes Nouveau from Makefile. IMHO
this means you knew it broke Nouveau and you did not care. And there is
no explanation in the commit as to why. Did you ask any Nouveau developer
if it was ok?

It is true, that Nouveau is aiming for its own kernel tree for DRM
development, but it is not for all end users yet. Majority of our users
use the drm.git kernel modules for Nouveau, and now we get to explain
how it is not there anymore, and we have no guide to point them to.

2.6.31-rc1 is coming, bearing newTTM. If you had waited a week, we would
have had the kernel tree up and user documentation written on how to
build that, and breaking Nouveau in drm.git would not have mattered.

Well, rc1 is so near, that we probably won't bother fixing Nouveau in
drm.git. I just wish the transition would have been Nouveau developers'
decision.


Regards, pq

-- 
Pekka Paalanen
http://www.iki.fi/pq/
