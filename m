From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Dropping compat from master-compat
Date: Thu, 10 Sep 2009 21:43:10 +0300
Message-ID: <20090910214310.35761697@daedalus.pq.iki.fi>
References: <20090909205136.76d6d351@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090909205136.76d6d351-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, 9 Sep 2009 20:51:36 +0300
Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> wrote:

> Therefore, I will drop compatibility code from master-compat branch,
> and I will add a compile time check for the kernel version. The
> master-compat branch will be just like the master branch, except it
> contains the out-of-tree build scripts. This will force users to
> follow very closely the official RC and release kernels.

It is done. The snapshot is updated.

I did not put any deliberate kernel version checks in place yet.
That may follow later.

$ git diff --stat master..master-compat
 README-nouveau   |   17 +++++++++
 nouveau/DEPENDS  |   25 +++++++++++++
 nouveau/Makefile |  100 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+), 0 deletions(-)

-- 
Pekka Paalanen
http://www.iki.fi/pq/
