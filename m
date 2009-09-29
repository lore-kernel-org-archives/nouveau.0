From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: master-compat branch in nouveau/linux-2.6
Date: Tue, 29 Sep 2009 19:46:32 +0300
Message-ID: <20090929194632.3c080336@daedalus.pq.iki.fi>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.orgnouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

I would like to abandon the master-compat branch nouveau/linux-2.6 kernel
tree. The difference to master branch is practically just the out-of-tree
build Makefile. I'll find a new place for the Makefile and docs, likely
in the wiki. Then I will break the build in master-compat, so that
everyone surely notices it is not updated anymore.

The reason for this is to reduce confusion, and that master-compat is
usually behind master for no good reason. InstallDRM page in the wiki
can be cleaned up about branches.

This should happen in few days, and I hope everyone will move to using
master if not already there. If you do not like the idea, let me know
why.


Thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
